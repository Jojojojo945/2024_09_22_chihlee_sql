import streamlit as st
import psycopg2
from dotenv import load_dotenv
import os
load_dotenv()

conn = psycopg2.connect(host=os.environ['HOST'], database = os.environ['DATABASE'], user = os.environ['USER'], password =os.environ['PASSWORD'] )
with conn:
    with conn.cursor() as cursor:
        sql = '''
        SELECT * FROM 市場
        '''
        cursor.execute(sql)
        all_country = cursor.fetchall()
conn.close()

#st.title('世界大盤分析')
#st.sidebar.title('請選擇股票市場：')
#st.sidebar.write('## 台灣')
#跟下面寫法一樣

st.title('世界大盤分析')
with st.sidebar:
    st.title('請選擇股票市場:')
    st.write('## 台灣')
    st.write(all_country)