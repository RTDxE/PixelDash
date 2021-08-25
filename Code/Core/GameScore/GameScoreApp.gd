extends Node
class_name GameScoreApp

var _gs

var title setget , title_getter
func title_getter() -> String:
    if _gs == null: return ""
    return _gs.app.title

var description setget , description_getter
func description_getter() -> String:
    if _gs == null: return ""
    return _gs.app.description

var image setget , image_getter
func image_getter() -> String:
    if _gs == null: return ""
    return _gs.app.image

var url setget , url_getter
func url_getter() -> String:
    if _gs == null: return ""
    return _gs.app.url


func init(sdk) -> void:
	_gs = sdk