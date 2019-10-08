<?php

namespace Admin\Controller;

class CacheController extends AdminController {
	// 清空缓存
	public function del() {
		$cahce_dirs = RUNTIME_PATH;
		$this->rmdirr ( $cahce_dirs );
		
		@mkdir ( $cahce_dirs, 0777, true );
		$this->meta_title = '清除缓存';
		$this->display ();
	}

	private function rmdirr($dirname) {
		if (! file_exists ( $dirname )) {
			return false;
		}
		if (is_file ( $dirname ) || is_link ( $dirname )) {
			return unlink ( $dirname );
		}
		$dir = dir ( $dirname );
		if ($dir) {
			while ( false !== $entry = $dir->read () ) {
				if ($entry == '.' || $entry == '..') {
					continue;
				}
				$this->rmdirr ( $dirname . DIRECTORY_SEPARATOR . $entry );
			}
		}
		$dir->close ();
		return rmdir ( $dirname );
	}
}
