From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [Minios-devel] Excited for Xen Project in Outreachy
Date: Fri, 23 Feb 2018 10:01:40 +0100
Message-ID: <723A9DC0-1134-4637-9B80-E15ADF026EC3@xenproject.org>
References: <4C7AE15B-6A38-4D0B-8E31-2A13DAD04D71@citrix.com>
 <alpine.DEB.2.10.1802141036260.5392@sstabellini-ThinkPad-X260>
 <CAFSf9ho6SwiPw8jDzzy3O+MhjY23MdwWvSNQDwJcr5Y56rjTTA@mail.gmail.com>
 <CAFSf9hqHcZ=9KEb2R=psTy5ou1L6Kh_AE-Tr2HZNWW-qtuw_9g@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: multipart/mixed; boundary="===============7583770250144774285=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=d8wp=fr=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1ep9Eg-0004eY-1T
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 09:01:46 +0000
In-Reply-To: <CAFSf9hqHcZ=9KEb2R=psTy5ou1L6Kh_AE-Tr2HZNWW-qtuw_9g@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: KANIKA SAINI <kanika16047@iiitd.ac.in>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Simon Kuenzer <simon.kuenzer@neclab.eu>
List-Id: xen-devel@lists.xenproject.org


--===============7583770250144774285==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_7BBD86DD-0D7B-4AB1-B0DA-FDF44218810B"


--Apple-Mail=_7BBD86DD-0D7B-4AB1-B0DA-FDF44218810B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Kanika,

> On 22 Feb 2018, at 20:34, KANIKA SAINI <kanika16047@iiitd.ac.in> =
wrote:
>=20
>=20
> Issue suggested by Simon
> In Unikraft - whenever compiler flags are changed due to an addition =
of a library or something else according to the build rules, the make =
command doesn't force recompilation of those files affected by the flag =
change unless the files are altered too. The only way out is to "make =
clean" and "make" again all the files which can be redundantly =
time-consuming.
>=20
> Solution
> One way is to create flag files for objects and add those as their =
dependency in the Makefile.


> Apart from this, I'm wondering if rules are passed on to the Makefile =
and changes are depicted in the Makefile itself, can we add Makefile as =
the dependency of objects to solve this issue?

I think the answer is in the documentation, which explains the UI (if =
you to call it that way) for the build system (see =
http://unikraft.neclab.eu/developers-app.html =
<http://unikraft.neclab.eu/developers-app.html>)

You can also usually figure out which parameters are passed to make via =
the command line by searching for the origin function, in particular for =
"command line" return values =
(https://www.gnu.org/software/make/manual/html_node/Origin-Function.html =
<https://www.gnu.org/software/make/manual/html_node/Origin-Function.html>)=
. This will give you a sense of the values that can be passed to the =
build system from outside of a makefile.

Now, you do need to make sure that you don't change the UI interface, as =
this would break everyone who uses Unikraft.

Assuming that all the flags we care about are already encoded in a =
Makefile (and don't come through the command line or through any other =
means), then adding a dependency may be sufficient. There is the =
question how granular you want this to be:=20
a) Is it OK for everything to be rebuilt when say you change a -Dfoo=20
b) Do you want this to be more fine grained

Have a google for something like "rebuilding when makefile flags change" =
and you will find a few example patterns with different trade-offs to =
solve this problem in general

The second challenge is that most substantial build rules get created =
dynamically via [unikraft/unikraft.git] =
<http://xenbits.xen.org/gitweb/?p=3Dunikraft/unikraft.git;a=3Dtree;hb=3DHE=
AD> / support =
<http://xenbits.xen.org/gitweb/?p=3Dunikraft/unikraft.git;a=3Dtree;f=3Dsup=
port;hb=3DHEAD> / build =
<http://xenbits.xen.org/gitweb/?p=3Dunikraft/unikraft.git;a=3Dtree;f=3Dsup=
port/build;hb=3DHEAD> / *=20
Thus, adding a dependency on a makefile may not be as simple as it =
sounds

Lars=20=

--Apple-Mail=_7BBD86DD-0D7B-4AB1-B0DA-FDF44218810B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Kanika,<br class=3D""><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On 22 Feb 2018, at 20:34, KANIKA SAINI &lt;<a =
href=3D"mailto:kanika16047@iiitd.ac.in" =
class=3D"">kanika16047@iiitd.ac.in</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><img width=3D"0" height=3D"0" class=3D"mailtrack-img" alt=3D"" =
src=3D"https://mailtrack.io/trace/mail/750bfa19bb7abf84dc2f39e7fbd69190513=
eae6e.png?u=3D1498883" style=3D"display: flex;"><div class=3D""></div><div=
 class=3D""></div><div class=3D""></div><b class=3D"">Issue suggested by =
Simon</b><div class=3D"">In Unikraft - whenever compiler flags are =
changed due to an addition of a library or something else according to =
the build rules, the make command doesn't force recompilation of those =
files affected by the flag change unless the files are altered too. The =
only way out is to "make clean" and "make" again all the files which can =
be redundantly time-consuming.<br class=3D""><br class=3D""><b =
class=3D"">Solution<br class=3D""></b>One way is to create flag files =
for objects and add those as their dependency in the Makefile.<br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div></div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><div =
class=3D"">Apart from this, I'm wondering if rules are passed on to the =
Makefile and changes are depicted in the Makefile itself, can we add =
Makefile as the dependency of objects to solve this issue?<br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div></div>I think the answer is in the documentation, which =
explains the UI (if you to call it that way) for the build system =
(see&nbsp;<a href=3D"http://unikraft.neclab.eu/developers-app.html" =
class=3D"">http://unikraft.neclab.eu/developers-app.html</a>)<div =
class=3D""><br class=3D""><div class=3D"">You can also usually figure =
out which parameters are passed to make via the command line by =
searching for the origin function, in particular for "command line" =
return values (<a =
href=3D"https://www.gnu.org/software/make/manual/html_node/Origin-Function=
.html" =
class=3D"">https://www.gnu.org/software/make/manual/html_node/Origin-Funct=
ion.html</a>). This will give you a sense of the values that can be =
passed to the build system from outside of a makefile.</div><div =
class=3D""><br class=3D""></div><div class=3D"">Now, you do need to make =
sure that you don't change the UI interface, as this would break =
everyone who uses Unikraft.</div></div><div class=3D""><br =
class=3D""></div><div class=3D"">Assuming that all the flags we care =
about are already encoded in a Makefile (and don't come through the =
command line or through any other means), then adding a dependency may =
be sufficient. There is the question how granular you want this to =
be:&nbsp;</div><div class=3D"">a) Is it OK for everything to be rebuilt =
when say you change a -Dfoo&nbsp;</div><div class=3D"">b) Do you want =
this to be more fine grained</div><div class=3D""><br =
class=3D""></div><div class=3D"">Have a google for something like =
"rebuilding when makefile flags change" and you will find a few example =
patterns with different trade-offs to solve this problem in =
general</div><div class=3D""><br class=3D""></div><div class=3D"">The =
second challenge is that most substantial build rules get created =
dynamically via<b class=3D"">&nbsp;<a =
href=3D"http://xenbits.xen.org/gitweb/?p=3Dunikraft/unikraft.git;a=3Dtree;=
hb=3DHEAD" title=3D"tree root" style=3D"color: rgb(136, 0, 0); =
font-family: sans-serif; font-variant-ligatures: normal; orphans: 2; =
widows: 2; background-color: rgb(255, 255, 255);" =
class=3D"">[unikraft/unikraft.git]</a><span style=3D"font-family: =
sans-serif; font-variant-ligatures: normal; orphans: 2; widows: 2; =
background-color: rgb(255, 255, 255);" class=3D"">&nbsp;/&nbsp;</span><a =
href=3D"http://xenbits.xen.org/gitweb/?p=3Dunikraft/unikraft.git;a=3Dtree;=
f=3Dsupport;hb=3DHEAD" title=3D"support" style=3D"color: rgb(136, 0, 0); =
font-family: sans-serif; font-variant-ligatures: normal; orphans: 2; =
widows: 2; background-color: rgb(255, 255, 255);" =
class=3D"">support</a><span style=3D"font-family: sans-serif; =
font-variant-ligatures: normal; orphans: 2; widows: 2; background-color: =
rgb(255, 255, 255);" class=3D"">&nbsp;/&nbsp;</span><a =
href=3D"http://xenbits.xen.org/gitweb/?p=3Dunikraft/unikraft.git;a=3Dtree;=
f=3Dsupport/build;hb=3DHEAD" title=3D"support/build" style=3D"color: =
rgb(136, 0, 0); font-family: sans-serif; font-variant-ligatures: normal; =
orphans: 2; widows: 2; background-color: rgb(255, 255, 255);" =
class=3D"">build</a><span style=3D"font-family: sans-serif; =
font-variant-ligatures: normal; orphans: 2; widows: 2; background-color: =
rgb(255, 255, 255);" class=3D"">&nbsp;/ *&nbsp;</span></b></div><div =
class=3D""><span style=3D"font-family: sans-serif; =
font-variant-ligatures: normal; orphans: 2; widows: 2; background-color: =
rgb(255, 255, 255);" class=3D"">Thus, adding a dependency on a makefile =
may not be as simple as it sounds</span></div><div class=3D""><span =
style=3D"font-family: sans-serif; font-variant-ligatures: normal; =
orphans: 2; widows: 2; background-color: rgb(255, 255, 255);" =
class=3D""><br class=3D""></span></div><div class=3D""><span =
style=3D"font-family: sans-serif; font-variant-ligatures: normal; =
orphans: 2; widows: 2; background-color: rgb(255, 255, 255);" =
class=3D"">Lars&nbsp;</span></div></body></html>=

--Apple-Mail=_7BBD86DD-0D7B-4AB1-B0DA-FDF44218810B--


--===============7583770250144774285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7583770250144774285==--
