class ListsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list = List.new
  end

  #2章 保存機能を追加
  def create
    #データを受け取り、新規登録するためのインスタンス作成
    list = List.new(list_params)
    #データをデータベースに保存するためのsaveメソッド実行
    list.save
    #トップ画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit

  end

  #2章 private ここから下は、このcontrollerの中でしか呼び出せない
  private
  #2章 ストロングパラメータ(フォームからデータを送信する際の脆弱性を防ぐ)
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
