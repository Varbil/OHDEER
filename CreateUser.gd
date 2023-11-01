extends Node2D

var database := PostgreSQLClient.new()
onready var show_data = $show_id


const USER = "bpqcvyyz"
const PASSWORD = "f_Dx-8UdAzp6WSRJdjPRhWhse_uPNsf2"
const HOST = "flora.db.elephantsql.com"
const PORT = 5432 # Default postgres port
const DATABASE = "bpqcvyyz" # Database name

enum sql_types {
	INSERT,
	SELECT,
	UPDATE,
	DELETE,
}

var sql_type = -1


func connectDB():
	var _error := database.connect("connection_established", self, "_execAll")
	_error = database.connect("authentication_error", self, "_authentication_error")
	_error = database.connect("connection_closed", self, "_close")	
	#Connection to the database
	_error = database.connect_to_host("postgresql://%s:%s@%s:%d/%s" % [USER, PASSWORD, HOST, PORT, DATABASE])


func _authentication_error(error_object: Dictionary) -> void:
	prints("Error connection to database:", error_object["message"])
	
func _close(clean_closure := true) -> void:
	prints("DB CLOSE,", "Clean closure:", clean_closure)
	
func _physics_process(_delta: float) -> void:
	database.poll()

func _exit_tree() -> void:
	database.close()

#Call database function
func _execAll():
	
	match sql_type:
		sql_types.INSERT:
			_execInsert()
		sql_types.SELECT:
			_execSelect()
		sql_types.UPDATE:
			_execUpdate()
		sql_types.DELETE:
			_execDelete()
			

#Insert, Select, Update & Delete : setup data & SQL
func _execInsert():
	#print("testINsert")
	var data = [[str($LineEditName.get_text()), $LineEdit2Password.get_text()]]
	insertToDB("BEGIN; INSERT INTO players (player_name, password) VALUES ('%s','%s'); COMMIT;", data)

func _execSelect():
	
	var data = selectFromDB("BEGIN; SELECT * FROM players; COMMIT;")
	#var data = selectFromDB("SELECT * FROM players;")
	var return_data = ""
	
	for d in data:
		for n in d.size():
			return_data += str(d[n]) + "\t"
			print(d[n])
		return_data += "\n"
		
	show_data.set_text(return_data)

func _execUpdate():
	var data = [[str($PlayerName.get_text()), $Score.get_text(), $IDPlayer.get_text()]]
	updateToDB("BEGIN; UPDATE players SET player_name = '%s', score = %s WHERE id = %s; COMMIT;", data)
	
func _execDelete():
	var data = [[$IDPlayer.get_text()]]
	deleteFromDB("BEGIN; DELETE FROM players WHERE id = %s; COMMIT;", data)


#Insert, Select, Update & Delete executes
func insertToDB(sql: String, data: Array):
	var _sql
	
	for d in data:
		_sql = sql % d
		database.execute(_sql)
		print(_sql)

	database.close()

func selectFromDB(sql:String) -> Array:
	
	var datas = database.execute(sql)
	var rows = datas[1].data_row
	
	database.close()
	
	return rows

func updateToDB(sql: String, data: Array):
	var _sql
	
	for d in data:
		_sql = sql % d
		database.execute(_sql)
		print(_sql)

	database.close()

func deleteFromDB(sql: String, data: Array):
	#var datas
	var _sql
	
	for d in data:
		_sql = sql % d
		database.execute(_sql)
		print(_sql)

	database.close()

#Button event handlers
func _on_ButtonCreateNewUser_pressed():
	sql_type = sql_types.INSERT
	connectDB()

func _on_ShowData_pressed():
	sql_type = sql_types.SELECT
	connectDB()
	
