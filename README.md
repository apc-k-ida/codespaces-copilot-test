# Codespaces と GitHub Copilot が利用できることを確認する

## 全体の流れ

1. 本リポジトリを複製
2. 複製先で Codespaces を起動
3. Codespaces 内の Visual Studio Code で GitHub Copilot が動作するか確認
4. (Copilot CLIを利用する場合)devcontainer の起動
5. Codespaces の削除

### 1. 本リポジトリを複製

**「Use this template」** の **「Create a new repository」** を選択

<img width="2304" height="1272" alt="Screenshot 07-07-2026 at 19 06" src="https://github.com/user-attachments/assets/979c8bd6-00b1-4efb-9529-59b131fed469" />

Owner をご自身のアカウント、任意のリポジトリ名を入力し、リポジトリの可視性は Private を選択してください。<br>
最後に **「Create repository」** でリポジトリを複製します。

<img width="1149" height="955" alt="Screenshot 07-07-2026 at 19 10" src="https://github.com/user-attachments/assets/3ed74332-2c8d-4885-a9cc-28d7dfe1561b" />

### 2. 複製先で Codespaces を起動

**「Code」** の **「Create codespace on main」** を選択し、Codespaces を起動します。

<img width="2304" height="1272" alt="Screenshot 07-07-2026 at 19 14" src="https://github.com/user-attachments/assets/6d264a40-3b53-4da4-9522-484c40a221bb" />

### 3. Codespaces 内の Visual Studio Code で GitHub Copilot が動作するか確認

Codespaces を起動すると、その環境内で Visual Studio Code が立ち上がります（数分かかる可能性があります）。<br>
右下の Copilot アイコン部分でサインインをした後に、右側のチャットウィンドウに何かを入力し、Copilot から応答があれば動作確認は完了です。

<img width="2304" height="1272" alt="Screenshot 07-07-2026 at 19 17" src="https://github.com/user-attachments/assets/401fdf18-f28b-4118-97e2-bd9fab692540" />

### 4. (Copilot CLIを利用する場合)devcontainer の起動

このリポジトリは devcontainer を使うと、Visual Studio Code の Copilot に加えて GitHub Copilot CLI も使えるようにしています。

1. リポジトリを Codespaces か Visual Studio Code で開く
2. 「Reopen in Container」を選ぶ
3. 起動後、ターミナルで `copilot` を実行する
4. 初回は `/login` で GitHub にサインインする

### 5. Codespaces の削除

Codespaces は時間単位の従量課金のため、不要となった場合は削除を推奨いたします。
詳細は[公式ドキュメント](https://docs.github.com/en/billing/concepts/product-billing/github-codespaces)をご確認ください。

左上のハンバーガーメニューから、**「Codespaces」** を選択。

<img width="2304" height="1272" alt="Screenshot 07-07-2026 at 19 55" src="https://github.com/user-attachments/assets/95231933-a96d-4291-abff-9a287a838df8" />

削除したい Codespace の「…」から「Delete」で削除します。

<img width="2304" height="1272" alt="Screenshot 07-07-2026 at 19 56" src="https://github.com/user-attachments/assets/04f3a7c3-e7ac-4eaa-a243-ca2b457b1b1b" />
