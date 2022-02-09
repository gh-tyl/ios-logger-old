import UIKit
import GoogleSignIn
import GoogleAPIClientForREST
import GTMSessionFetcher

class GoogleLink {
    // (1) GTLRDriveServiceを作成する
    let googleDriveService = GTLRDriveService()
    // (2) GIDGoogleUserを準備しておく
    var googleUser: GIDGoogleUser?


    func getFiles() {
        guard let user = googleUser else { return }

        // (3) authorizerを設定
        googleDriveService.authorizer = user.authentication.fetcherAuthorizer()

        // (4) queryを作成する
        let query = GTLRDriveQuery_FilesList.query()

        // (5) パラメータを設定する
        // (5-1) ルートディレクトリ直下のファイル/フォルダを取得対象にする (ルートディレクトリ以外を指定する場合は、rootではなく対象ディレクトリのIDを指定する)
        query.q = "'root' in parents"

        // (5-2) ドライブのファイルを取得対象にする (指定可能な値: drive, appDataFolder, photosが指定可能)
        query.spaces = "drive"

        // (5-3) 所有しているファイル(または他ユーザーから共有されたファイル)を取得対象にする (指定可能な値: user, domain, drive, allDrivesが指定可能)
        query.corpora = "user"

        // (5-4) ソート方法を指定する (指定可能な値: createdTime, folder, modifiedByMeTime, modifiedTime, name, name_natural, quotaBytesUsed, recency, sharedWithMeTime, starred, and 'viewedByMeTime)
        query.orderBy = "folder,name"

        // (6) クエリを実行する
        googleDriveService.executeQuery(query) { (_, result, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            // (7) ファイル一覧を使用する
            let folderList = result as! GTLRDrive_FileList
            guard let files = folderList.files else { return }
            for file in files {
                print("file.name: \(file.name ?? ""), file.mimeType: \(file.mimeType ?? ""), file.fileExtension: \(file.fileExtension ?? "")")
            }
        }
    }
}
