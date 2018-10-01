import Swift
import Foundation

class Zeller {
    var lang: String? = "en"
    var day: Int
    var month: Int
    var year: Int

    let days = [
        ["diumenge", "dilluns", "dimarts", "dimecres", "dijous", "divendres", "dissabte"],
        ["Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"],
        ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
        ["dimanche", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"],
        ["domenica", "lunedì", "martedì", "mercoledì", "giovedì", "venerdì", "sabato"],
        ["domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado"],
        ["duminică", "luni", "marți", "miercuri", "joi", "vineri", "sâmbătă"]
    ]

    init(day: Int, month: Int, year: Int, lang: String) {
        self.day = day
        self.month = month
        self.year = year
        self.lang = lang
    }

    private func validate() -> Bool {
        if (self.day <= 31) && (self.month <= 12) && (self.year <= 10000) {
            return true
        } else {
            return false
        }
    }

    private func selectLang() -> Int {
        var position: Int? = 2

        switch self.lang {
            case "ca":
                position = 0
            case "es":
                position = 1
            case "en":
                position = 2
            case "fr":
                position = 3
            case "it":
                position = 4
            case "pt":
                position = 5
            case "ro":
                position = 6
                
            default:
                position = 2
        }

        return position ?? 2
    }

    public func congruence() -> String {

        if self.validate() == true {

            let a = Int((14 - self.month) / 12)
            let y = self.year - a
            let m = self.month + (12 * a) - 2
            let d = Int(((self.day + y + Int(y / 4)) - Int(y / 100) + Int(y / 400) + (31 * m) / 12) % 7)

            return self.days[self.selectLang()][d]

        } else {

            return "Error in sent parameters"   
        }
    }
}

class App {
    
    var day: Int? = 1
    var month: Int? = 1
    var year: Int? = 2018
    var lang: String? = "en"

    func start(){
        print("//////////////////////////////////////")
        print("Wellcome to zeller's congruence")
        print("This algorithm gives him the \"day name\" of your date.")

        print("Please put the day.")
        day = Int(readLine()!)
        print("Please put the month.")
        month = Int(readLine()!)
        print("Please put the year or actual year ")
        year = Int(readLine()!)
        print("Plese put the lang for show the name: ca, es, en, fr, it, pt, ro")
        lang = readLine()

        let dayName = Zeller(day: day ?? 1, month: month ?? 1, year: year ?? 2018, lang: lang ?? "en")
     
        print(dayName.congruence())
       
    }
}

var app = App()
    app.start()

