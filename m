From: "Chen, Farrah" <farrah.chen@intel.com>
Subject: Xen make grub error
Date: Tue, 20 Nov 2018 06:45:19 +0000
Message-ID: <1B925CC0CD9F3341B32D442251E7E1DC3D86D718@shsmsx102.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4209648467042661586=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kvi+=n7=intel.com=farrah.chen@srs-us1.protection.inumbo.net>)
 id 1gOzmo-0004Sx-Ol
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 06:45:26 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "bug-grub@gnu.org" <bug-grub@gnu.org>, "Hao, Xudong" <xudong.hao@intel.com>
List-Id: xen-devel@lists.xenproject.org

--===============4209648467042661586==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_1B925CC0CD9F3341B32D442251E7E1DC3D86D718shsmsx102ccrcor_"

--_000_1B925CC0CD9F3341B32D442251E7E1DC3D86D718shsmsx102ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

When we make grub with xen, we met below error, do you have any advice?

cd grub
./autogen.sh
./configure --target=3Damd64 --with-platform=3Dxen --prefix=3D${PWD}/../pvg=
rub2
make

.........
loader/i386/xen.c: In function 'grub_cmd_xen':
loader/i386/xen.c:650:10: error: too few arguments to function 'grub_create=
_loader_cmdline'
          sizeof (xen_state.next_start.cmd_line) - 1);
          ^
In file included from loader/i386/xen.c:38:0:
../include/grub/lib/cmdline.h:29:12: note: declared here
grub_err_t grub_create_loader_cmdline (int argc, char *argv[], char *buf,
            ^
loader/i386/xen.c:651:3: error: pointer targets in passing argument 1 of 'g=
rub_verify_string' differ in signedness [-Werror=3Dpointer-sign]
   err =3D grub_verify_string (xen_state.next_start.cmd_line, GRUB_VERIFY_M=
ODULE_CMDLINE);
   ^
In file included from ../include/grub/lib/cmdline.h:24:0,
                 from loader/i386/xen.c:38:
../include/grub/verify.h:81:1: note: expected 'char *' but argument is of t=
ype 'int8_t *'
grub_verify_string (char *str, enum grub_verify_string_type type);
^
loader/i386/xen.c: In function 'grub_cmd_module':
loader/i386/xen.c:914:10: error: too few arguments to function 'grub_create=
_loader_cmdline'
          get_virtual_current_address (ch), cmdline_len);
          ^
In file included from loader/i386/xen.c:38:0:
../include/grub/lib/cmdline.h:29:12: note: declared here
grub_err_t grub_create_loader_cmdline (int argc, char *argv[], char *buf,
            ^
cc1: all warnings being treated as errors
make[3]: *** [loader/i386/linux_module-xen.o] Error 1
make[3]: Leaving directory `/home/build/xen_build/nightly/xen_dom0/xen-mast=
er-20181120091929-6d8ffac1/grub/grub-core'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/home/build/xen_build/nightly/xen_dom0/xen-mast=
er-20181120091929-6d8ffac1/grub/grub-core'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/build/xen_build/nightly/xen_dom0/xen-mast=
er-20181120091929-6d8ffac1/grub'
make: *** [all] Error 2


Thanks,
Fan


--_000_1B925CC0CD9F3341B32D442251E7E1DC3D86D718shsmsx102ccrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Intel Clear";
	panose-1:2 11 6 4 2 2 3 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When we make grub with xen, we met below error, do y=
ou have any advice?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">cd grub<o:p></o:p></p>
<p class=3D"MsoNormal">./autogen.sh<o:p></o:p></p>
<p class=3D"MsoNormal">./configure --target=3Damd64 --with-platform=3Dxen -=
-prefix=3D${PWD}/../pvgrub2<o:p></o:p></p>
<p class=3D"MsoNormal">make<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&#8230;&#8230;&#8230;<o:p></o:p></p>
<p class=3D"MsoNormal">loader/i386/xen.c: In function &#8216;grub_cmd_xen&#=
8217;:<o:p></o:p></p>
<p class=3D"MsoNormal">loader/i386/xen.c:650:10: error: too few arguments t=
o function &#8216;grub_create_loader_cmdline&#8217;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; sizeof (xen_state.next_start.cmd_line) - 1);<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ^<o:p></o:p></p>
<p class=3D"MsoNormal">In file included from loader/i386/xen.c:38:0:<o:p></=
o:p></p>
<p class=3D"MsoNormal">../include/grub/lib/cmdline.h:29:12: note: declared =
here<o:p></o:p></p>
<p class=3D"MsoNormal">grub_err_t grub_create_loader_cmdline (int argc, cha=
r *argv[], char *buf,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ^<o:p></o:p></p>
<p class=3D"MsoNormal">loader/i386/xen.c:651:3: error: pointer targets in p=
assing argument 1 of &#8216;grub_verify_string&#8217; differ in signedness =
[-Werror=3Dpointer-sign]<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; err =3D grub_verify_string (xen_state.n=
ext_start.cmd_line, GRUB_VERIFY_MODULE_CMDLINE);<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; ^<o:p></o:p></p>
<p class=3D"MsoNormal">In file included from ../include/grub/lib/cmdline.h:=
24:0,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from loader/i386/xen.c:38:<o:p=
></o:p></p>
<p class=3D"MsoNormal">../include/grub/verify.h:81:1: note: expected &#8216=
;char *&#8217; but argument is of type &#8216;int8_t *&#8217;<o:p></o:p></p=
>
<p class=3D"MsoNormal">grub_verify_string (char *str, enum grub_verify_stri=
ng_type type);<o:p></o:p></p>
<p class=3D"MsoNormal">^<o:p></o:p></p>
<p class=3D"MsoNormal">loader/i386/xen.c: In function &#8216;grub_cmd_modul=
e&#8217;:<o:p></o:p></p>
<p class=3D"MsoNormal">loader/i386/xen.c:914:10: error: too few arguments t=
o function &#8216;grub_create_loader_cmdline&#8217;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; get_virtual_current_address (ch), cmdline_len);<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ^<o:p></o:p></p>
<p class=3D"MsoNormal">In file included from loader/i386/xen.c:38:0:<o:p></=
o:p></p>
<p class=3D"MsoNormal">../include/grub/lib/cmdline.h:29:12: note: declared =
here<o:p></o:p></p>
<p class=3D"MsoNormal">grub_err_t grub_create_loader_cmdline (int argc, cha=
r *argv[], char *buf,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ^<o:p></o:p></p>
<p class=3D"MsoNormal">cc1: all warnings being treated as errors<o:p></o:p>=
</p>
<p class=3D"MsoNormal">make[3]: *** [loader/i386/linux_module-xen.o] Error =
1<o:p></o:p></p>
<p class=3D"MsoNormal">make[3]: Leaving directory `/home/build/xen_build/ni=
ghtly/xen_dom0/xen-master-20181120091929-6d8ffac1/grub/grub-core'<o:p></o:p=
></p>
<p class=3D"MsoNormal">make[2]: *** [all] Error 2<o:p></o:p></p>
<p class=3D"MsoNormal">make[2]: Leaving directory `/home/build/xen_build/ni=
ghtly/xen_dom0/xen-master-20181120091929-6d8ffac1/grub/grub-core'<o:p></o:p=
></p>
<p class=3D"MsoNormal">make[1]: *** [all-recursive] Error 1<o:p></o:p></p>
<p class=3D"MsoNormal">make[1]: Leaving directory `/home/build/xen_build/ni=
ghtly/xen_dom0/xen-master-20181120091929-6d8ffac1/grub'<o:p></o:p></p>
<p class=3D"MsoNormal">make: *** [all] Error 2<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Fan<span style=3D"font-family:&quot;Intel Clear&quot=
;,sans-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_1B925CC0CD9F3341B32D442251E7E1DC3D86D718shsmsx102ccrcor_--


--===============4209648467042661586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4209648467042661586==--
