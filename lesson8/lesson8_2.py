import streamlit as st
import psycopg2
from dotenv import load_dotenv
import os
load_dotenv()

conn = psycopg2.connect(host=os.environ['HOST'], database = os.environ['DATABASE'], user = os.environ['USER'], password =os.environ['PASSWORD'])
with conn:
    with conn.cursor() as cursor:
        sql = '''
        SELECT * FROM 市場
        '''
        cursor.execute(sql)
        all_country = cursor.fetchall()
conn.close()

def user_select():
    print('使用者選擇了')
    print(st.session_state.stocks)

st.title('世界大盤分析')
with st.sidebar:
    st.title('請選擇股票市場:')
    input_dict = dict(all_country)
    options = st.multiselect("請選擇",input_dict.values(),
                             default='台灣',
                             placeholder="請選擇市場",
                             label_visibility='hidden',
                             key='stocks',
                             on_change=user_select)
    print(type(options))
    st.write(options)