From: "Chen, Farrah" <farrah.chen@intel.com>
Subject: Make grub error "too few arguments" with xen
Date: Mon, 26 Nov 2018 05:50:36 +0000
Message-ID: <1B925CC0CD9F3341B32D442251E7E1DC3D86E797__10869.0750007101$1543211383$gmane$org@shsmsx102.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6597470950671928681=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fe+t=of=intel.com=farrah.chen@srs-us1.protection.inumbo.net>)
 id 1gR9n9-0001XT-Ht
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 05:50:43 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "bug-grub@gnu.org" <bug-grub@gnu.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>
Cc: "'xen-devel@lists.xenproject.org'" <xen-devel@lists.xenproject.org>, "Hao,
 Xudong" <xudong.hao@intel.com>
List-Id: xen-devel@lists.xenproject.org

--===============6597470950671928681==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_1B925CC0CD9F3341B32D442251E7E1DC3D86E797shsmsx102ccrcor_"

--_000_1B925CC0CD9F3341B32D442251E7E1DC3D86E797shsmsx102ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

When I make grub with xen using the latest commit: e8b37e2c8de7570ca9a6c7ba=
874762d8c4ba9373,  I met error "too few arguments to function grub_create_l=
oader_cmdline()".
I saw the following commit tried to fix this error, but we still met such e=
rror with the latest commit e8b37e2c8de7:
commit 25e35377a84779ceeb350aa530e5adde287f6eb6
Author: Lee Jones <lee.jones@linaro.org>
Date:   Tue Nov 20 10:45:04 2018 +0000

    arm64/xen: Fix too few arguments to function grub_create_loader_cmdline=
()

    Without this fix, building xen_boot.c omits:

    loader/arm64/xen_boot.c: In function 'xen_boot_binary_load':
    loader/arm64/xen_boot.c:370:7: error: too few arguments to function 'gr=
ub_create_loader_cmdline'
           grub_create_loader_cmdline (argc - 1, argv + 1, binary->cmdline,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
    In file included from loader/arm64/xen_boot.c:36:0:
    ../include/grub/lib/cmdline.h:29:12: note: declared here
     grub_err_t grub_create_loader_cmdline (int argc, char *argv[], char *b=
uf,

    Signed-off-by: Lee Jones <lee.jones@linaro.org>
    Reviewed-by: Julien Grall <julien.grall@arm.com>
    Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>


Details as below:

.........
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
make[3]: Leaving directory `/home/build/xen_build/data/xen/xen-201811261316=
13/grub/grub-core'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/home/build/xen_build/data/xen/xen-201811261316=
13/grub/grub-core'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/build/xen_build/data/xen/xen-201811261316=
13/grub'
make: *** [all] Error 2


Thanks,
Fan


--_000_1B925CC0CD9F3341B32D442251E7E1DC3D86E797shsmsx102ccrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
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
	font-size:10.0pt;
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
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Intel Clear&quot;,s=
ans-serif">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Intel Clear&quot;,s=
ans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Intel Clear&quot;,s=
ans-serif">When I make grub with xen using the latest commit:
<span style=3D"color:black">e8b37e2c8de7570ca9a6c7ba874762d8c4ba9373,&nbsp;=
 I met error &#8220;too few arguments to function grub_create_loader_cmdlin=
e()&#8221;.<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Intel Clear&quot;,s=
ans-serif;color:black">I saw the following commit tried to fix this error, =
but we still met such error with the latest commit e8b37e2c8de7:<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">commit 25e35377a84779cee=
b350aa530e5adde287f6eb6<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Author: Lee Jones &lt;le=
e.jones@linaro.org&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Date:&nbsp;&nbsp; Tue No=
v 20 10:45:04 2018 &#43;0000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp; arm64=
/xen: Fix too few arguments to function grub_create_loader_cmdline()<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp; Witho=
ut this fix, building xen_boot.c omits:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp; loade=
r/arm64/xen_boot.c: In function &#8216;xen_boot_binary_load&#8217;:<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp; loade=
r/arm64/xen_boot.c:370:7: error: too few arguments to function &#8216;grub_=
create_loader_cmdline&#8217;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; grub_create_loader_cmdline (argc - 1, =
argv &#43; 1, binary-&gt;cmdline,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~~~~~~~~~~~<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp; In fi=
le included from loader/arm64/xen_boot.c:36:0:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp; ../in=
clude/grub/lib/cmdline.h:29:12: note: declared here<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;=
 grub_err_t grub_create_loader_cmdline (int argc, char *argv[], char *buf,<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp; Signe=
d-off-by: Lee Jones &lt;lee.jones@linaro.org&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp; Revie=
wed-by: Julien Grall &lt;julien.grall@arm.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp; Revie=
wed-by: Daniel Kiper &lt;daniel.kiper@oracle.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Intel Clear&quot;,s=
ans-serif;color:black">Details as below:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">&#8230;&#8230;&#8230;<o:=
p></o:p></span></p>
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
<p class=3D"MsoNormal">make[3]: Leaving directory `/home/build/xen_build/da=
ta/xen/xen-20181126131613/grub/grub-core'<o:p></o:p></p>
<p class=3D"MsoNormal">make[2]: *** [all] Error 2<o:p></o:p></p>
<p class=3D"MsoNormal">make[2]: Leaving directory `/home/build/xen_build/da=
ta/xen/xen-20181126131613/grub/grub-core'<o:p></o:p></p>
<p class=3D"MsoNormal">make[1]: *** [all-recursive] Error 1<o:p></o:p></p>
<p class=3D"MsoNormal">make[1]: Leaving directory `/home/build/xen_build/da=
ta/xen/xen-20181126131613/grub'<o:p></o:p></p>
<p class=3D"MsoNormal">make: *** [all] Error 2<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Intel Clear&quot;,s=
ans-serif">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Intel Clear&quot;,s=
ans-serif">Fan<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_1B925CC0CD9F3341B32D442251E7E1DC3D86E797shsmsx102ccrcor_--


--===============6597470950671928681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6597470950671928681==--
