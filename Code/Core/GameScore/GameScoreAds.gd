extends Node
class_name GameScoreAds

var _gs

signal start()
signal close(success)
signal preloader_start()
signal preloader_close(success)
signal fullscreen_start()
signal fullscreen_close(success)
signal rewarded_start()
signal rewarded_close(success)
signal rewarded_reward()
signal sticky_start()
signal sticky_render()
signal sticky_refresh()
signal sticky_close()

var _cb_start = JavaScript.create_callback(self, "_start")
var _cb_close = JavaScript.create_callback(self, "_close")
var _cb_preloader_start = JavaScript.create_callback(self, "_preloader_start")
var _cb_preloader_close = JavaScript.create_callback(self, "_preloader_close")
var _cb_fullscreen_start = JavaScript.create_callback(self, "_fullscreen_start")
var _cb_fullscreen_close = JavaScript.create_callback(self, "_fullscreen_close")
var _cb_rewarded_start = JavaScript.create_callback(self, "_rewarded_start")
var _cb_rewarded_close = JavaScript.create_callback(self, "_rewarded_close")
var _cb_rewarded_reward = JavaScript.create_callback(self, "_rewarded_reward")
var _cb_sticky_start = JavaScript.create_callback(self, "_sticky_start")
var _cb_sticky_render = JavaScript.create_callback(self, "_sticky_render")
var _cb_sticky_refresh = JavaScript.create_callback(self, "_sticky_refresh")
var _cb_sticky_close = JavaScript.create_callback(self, "_sticky_close")

func _start() -> void:
	emit_signal("start")

func _close(args) -> void:
	var success = bool(args[0])
	emit_signal("close", success)

func _preloader_start() -> void:
	emit_signal("preloader_start")

func _preloader_close(args) -> void:
	var success = bool(args[0])
	emit_signal("preloader_close", success)

func _fullscreen_start() -> void:
	emit_signal("fullscreen_start")

func _fullscreen_close(args) -> void:
	var success = bool(args[0])
	emit_signal("fullscreen_close", success)

func _rewarded_start() -> void:
	emit_signal("rewarded_start")

func _rewarded_close(args) -> void:
	var success = bool(args[0])
	emit_signal("rewarded_close", success)

func _rewarded_reward() -> void:
	emit_signal("rewarded_reward")

func _sticky_start() -> void:
	emit_signal("sticky_start")

func _sticky_render() -> void:
	emit_signal("sticky_render")

func _sticky_refresh() -> void:
	emit_signal("sticky_refresh")

func _sticky_close() -> void:
	emit_signal("sticky_close")



var is_adblock_enabled setget , is_adblock_enabled_getter
func is_adblock_enabled_getter() -> bool:
	if _gs == null: return false
	return _gs.ads.isAdblockEnabled

var is_sticky_available setget , is_sticky_available_getter
func is_sticky_available_getter() -> bool:
	if _gs == null: return false
	return _gs.ads.isStickyAvailable

var is_fullscreen_available setget , is_fullscreen_available_getter
func is_fullscreen_available_getter() -> bool:
	if _gs == null: return false
	return _gs.ads.isFullscreenAvailable

var is_rewarded_available setget , is_rewarded_available_getter
func is_rewarded_available_getter() -> bool:
	if _gs == null: return false
	return _gs.ads.isRewardedAvailable

var is_preloader_available setget , is_preloader_available_getter
func is_preloader_available_getter() -> bool:
	if _gs == null: return false
	return _gs.ads.isPreloaderAvailable

var is_sticky_playing setget , is_sticky_playing_getter
func is_sticky_playing_getter() -> bool:
	if _gs == null: return false
	return _gs.ads.isStickyPlaying

var is_fullscreen_playing setget , is_fullscreen_playing_getter
func is_fullscreen_playing_getter() -> bool:
	if _gs == null: return false
	return _gs.ads.isFullscreenPlaying

var is_rewarded_playing setget , is_rewarded_playing_getter
func is_rewarded_playing_getter() -> bool:
	if _gs == null: return false
	return _gs.ads.isRewardedPlaying

var is_preloader_playing setget , is_preloader_playing_getter
func is_preloader_playing_getter() -> bool:
	if _gs == null: return false
	return _gs.ads.isPreloaderPlaying



func init(sdk) -> void:
	_gs = sdk
	_gs.ads.on('start', _cb_start)
	_gs.ads.on('close', _cb_close)
	_gs.ads.on('preloader:start', _cb_preloader_start)
	_gs.ads.on('preloader:close', _cb_preloader_close)
	_gs.ads.on('fullscreen:start', _cb_fullscreen_start)
	_gs.ads.on('fullscreen:close', _cb_fullscreen_close)
	_gs.ads.on('rewarded:start', _cb_rewarded_start)
	_gs.ads.on('rewarded:close', _cb_rewarded_close)
	_gs.ads.on('rewarded:reward', _cb_rewarded_reward)
	_gs.ads.on('sticky:start', _cb_sticky_start)
	_gs.ads.on('sticky:render', _cb_sticky_render)
	_gs.ads.on('sticky:refresh', _cb_sticky_refresh)
	_gs.ads.on('sticky:close', _cb_sticky_close)


func show_fullscreen():
	if _gs == null: return
	return _gs.ads.showFullscreen()

func show_preloader():
	if _gs == null: return
	return _gs.ads.showPreloader()

func show_rewarded_video():
	if _gs == null: return
	return _gs.ads.showRewardedVideo()

func show_sticky():
	if _gs == null: return
	return _gs.ads.showSticky()

func refresh_sticky():
	if _gs == null: return
	return _gs.ads.refreshSticky()

func close_sticky():
	if _gs == null: return
	return _gs.ads.closeSticky()
