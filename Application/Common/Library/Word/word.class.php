<?php
namespace Common\Library\Word;

class word
{ 
	public function start()
	{
		ob_start();
		echo '<html xmlns:o="urn:schemas-microsoft-com:office:office"
		xmlns:w="urn:schemas-microsoft-com:office:word"
		xmlns="http://www.w3.org/TR/REC-html40"><head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/></head>';
	}
	public function save($path)
	{
		echo "</html>";
		$data = ob_get_contents();
		ob_end_clean();
		$this->wirtefile ($path,$data);
	}

	public function wirtefile ($fn,$data)
	{
		$fp=fopen($fn,"wb");
		fwrite($fp,$data);
		fclose($fp);
	}
}

?>