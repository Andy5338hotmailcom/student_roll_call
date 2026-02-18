print("正在导入库，请稍后")
from flask import Flask, render_template, send_file


print("正在设置")
# Initialize Flask application
app = Flask(__name__)

# Route for the homepage
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/file-manager.html')
def file_managerhtml():
    return render_template('file-manager.html')

@app.route('/index.html')
def indexhtml():
    return render_template('index.html')

@app.route('/学生点名程序实验版本安装包.exe')
def dowload_pakage_unweb():
    return send_file('学生点名程序实验版本安装包.exe')


# Error handlers
@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

@app.errorhandler(500)
def internal_server_error(e):
    return render_template('500.html'), 500

# Run the application if this file is executed directly
if __name__ == '__main__':
    print("正在启动……")
    print("启动完成！")
    app.run(host='0.0.0.0', port=5000, debug=True)
    