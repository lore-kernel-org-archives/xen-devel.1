From: "Hao, Xudong" <xudong.hao@intel.com>
Subject: Re: Xen 4.11.0 RC5 test result
Date: Thu, 7 Jun 2018 06:25:45 +0000
Message-ID: <B8376D2DEA074F45BA033984477C453E3BA373D8@shsmsx102.ccr.corp.intel.com>
References: <B8376D2DEA074F45BA033984477C453E3BA35846@shsmsx102.ccr.corp.intel.com>
 <b8a780c2-8c9f-29ea-f76b-a2e9beb9c8d5@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7114097624760857614=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b8a780c2-8c9f-29ea-f76b-a2e9beb9c8d5@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Lars Kurth <lars.kurth.xen@gmail.com>, Juergen Gross <jgross@suse.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

--===============7114097624760857614==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B8376D2DEA074F45BA033984477C453E3BA373D8shsmsx102ccrcor_"

--_000_B8376D2DEA074F45BA033984477C453E3BA373D8shsmsx102ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Nested Xen on Xen, KVM on Xen, VMware on Xen, and hyperv on Xen all failed.
Already updated the result: https://wiki.xenproject.org/wiki/Nested_Virtual=
ization_in_Xen


Thanks,
-Xudong

From: Andrew Cooper [mailto:andrew.cooper3@citrix.com]
Sent: Tuesday, June 5, 2018 6:28 PM
To: Hao, Xudong <xudong.hao@intel.com>; xen-devel@lists.xen.org
Cc: Lars Kurth <lars.kurth.xen@gmail.com>; Juergen Gross <jgross@suse.com>;=
 Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] Xen 4.11.0 RC5 test result

On 05/06/18 09:49, Hao, Xudong wrote:

Except Nested, other feature all passed of testing.
https://wiki.xenproject.org/wiki/Nested_Virtualization_in_Xen

Do you have any further information?

~Andrew

--_000_B8376D2DEA074F45BA033984477C453E3BA373D8shsmsx102ccrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:dt=3D"uuid:C2F4101=
0-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://schemas.microsoft.com/offi=
ce/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><a name=3D"_MailEndCompose"><span style=3D"color:#1F=
497D">Nested Xen on Xen, KVM on Xen, VMware on Xen, and hyperv on Xen all f=
ailed.<o:p></o:p></span></a></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Already updated the re=
sult: </span>
<a href=3D"https://wiki.xenproject.org/wiki/Nested_Virtualization_in_Xen">h=
ttps://wiki.xenproject.org/wiki/Nested_Virtualization_in_Xen</a><o:p></o:p>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-Xudong<o:p></o:p></sp=
an></p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b><span style=
=3D"color:windowtext">From:</span></b><span style=3D"color:windowtext"> And=
rew Cooper [mailto:andrew.cooper3@citrix.com]
<br>
<b>Sent:</b> Tuesday, June 5, 2018 6:28 PM<br>
<b>To:</b> Hao, Xudong &lt;xudong.hao@intel.com&gt;; xen-devel@lists.xen.or=
g<br>
<b>Cc:</b> Lars Kurth &lt;lars.kurth.xen@gmail.com&gt;; Juergen Gross &lt;j=
gross@suse.com&gt;; Julien Grall &lt;julien.grall@arm.com&gt;<br>
<b>Subject:</b> Re: [Xen-devel] Xen 4.11.0 RC5 test result<o:p></o:p></span=
></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On 05/06/18 09:49, Hao, Xudong wrote:<span style=3D"=
font-size:12.0pt"><o:p></o:p></span></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Except Nested, other feature all passed of testing.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://wiki.xenproject.org/wiki/Nested_V=
irtualization_in_Xen">https://wiki.xenproject.org/wiki/Nested_Virtualizatio=
n_in_Xen</a><o:p></o:p></p>
</div>
</blockquote>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><br>
Do you have any further information?<br>
<br>
~Andrew<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_B8376D2DEA074F45BA033984477C453E3BA373D8shsmsx102ccrcor_--


--===============7114097624760857614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7114097624760857614==--
