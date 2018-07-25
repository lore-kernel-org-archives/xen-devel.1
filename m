From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Xen 4.12 release planning
Date: Wed, 25 Jul 2018 12:39:50 +0100
Message-ID: <29C1840E-1993-4A15-B724-908B8BDEDDD7@xenproject.org>
References: <6a766b09-d5fe-a9ce-cacf-546c998ab803@suse.com>
 <0c25205b-b237-a7cd-aedf-45e7f86b3492@arm.com>
 <b8f9bd2e-46bb-1a31-e9ac-dbc42841f31f@citrix.com>
 <3563543c-c5c9-cb80-8d3e-c34e731118c8@suse.com>
 <CAFLBxZZNzww-8=VqbuaGY4bHpFwxHXtC5J13PKM458yu7VerPg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: multipart/mixed; boundary="===============8406175124264256925=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=h8kl=kj=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1fiI95-00073U-KY
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 11:39:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id a3-v6so7098660wrt.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jul 2018 04:39:53 -0700 (PDT)
In-Reply-To: <CAFLBxZZNzww-8=VqbuaGY4bHpFwxHXtC5J13PKM458yu7VerPg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============8406175124264256925==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6DD86429-DA1E-400F-860E-5DFC6B8255EC"


--Apple-Mail=_6DD86429-DA1E-400F-860E-5DFC6B8255EC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 25 Jul 2018, at 12:24, George Dunlap <dunlapg@umich.edu> wrote:
>=20
> On Wed, Jul 25, 2018 at 10:22 AM, Juergen Gross <jgross@suse.com =
<mailto:jgross@suse.com>> wrote:
>>=20
>> fFFFFFFR.......ffFFFFFFR.......ffFFFFFFR.......f
>>=20
>> We can rule out several variants with release dates just before or in =
a
>> holiday season:
>>=20
>> Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
>> Xx.XXXXX...xxxx...........xxXXXXx..............X      holidays
>> ffFFFFFFR.......ffFFFFFFR.......ffFFFFFFR.......
>> .ffFFFFFFR.......ffFFFFFFR.......ffFFFFFFR......
>>=20
>> Best fit seems to be releasing in first half of March/July/November. =
The
>> main clash seems to be Chinese new year in the freeze period, but
>> avoiding that would mean we'd have to either move into Christmas or
>> Eastern, or to use a schedule with varying periods.
>>=20
>> Please remember that Chinese new year is only 2 weeks long (at =
varying
>> dates) so only 2 weeks of the freeze period are hit. Next year the
>> Chinese new year will be at February 5th.
>>=20
>> For my 4.12 plan I've added some extra weeks between last posting =
date
>> and release date to accommodate for the holiday seasons, resulting in
>> my suggestion.
>=20
> Thanks for the detailed analysis Juregen.  This seems good to me.
>=20
> -George

This looks good to me also. To address Julien's concerns, we could also =
consider an earlier Last posting date/Hard code freeze date for Arm =
related code to work around Julien's holiday plans. I think this would =
be entirely OK and set expectations of contributors accordingly. But =
maybe this is not necessary if Julien and Stefano can agree a work split =
somehow.=20

Alternatively we could communicate absences of key reviewers say in =
November to set expectations of contributors for the final stretch of =
the release cycle. In other words, if a key reviewer is away, then =
contributors will need to get series into good shape before their =
reviewers go on vacation.=20

Regards
Lars


--Apple-Mail=_6DD86429-DA1E-400F-860E-5DFC6B8255EC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 25 Jul 2018, at 12:24, George Dunlap &lt;<a =
href=3D"mailto:dunlapg@umich.edu" class=3D"">dunlapg@umich.edu</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On Wed, Jul =
25, 2018 at 10:22 AM, Juergen Gross &lt;</span><a =
href=3D"mailto:jgross@suse.com" style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">jgross@suse.com</a><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">&gt; =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D"">fFFFFFFR.......ffFFFFFFR.......ffFFFFFFR.......f<br =
class=3D""><br class=3D"">We can rule out several variants with release =
dates just before or in a<br class=3D"">holiday season:<br class=3D""><br =
class=3D"">Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec<br =
class=3D"">Xx.XXXXX...xxxx...........xxXXXXx..............X =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;holidays<br =
class=3D"">ffFFFFFFR.......ffFFFFFFR.......ffFFFFFFR.......<br =
class=3D"">.ffFFFFFFR.......ffFFFFFFR.......ffFFFFFFR......<br =
class=3D""><br class=3D"">Best fit seems to be releasing in first half =
of March/July/November. The<br class=3D"">main clash seems to be Chinese =
new year in the freeze period, but<br class=3D"">avoiding that would =
mean we'd have to either move into Christmas or<br class=3D"">Eastern, =
or to use a schedule with varying periods.<br class=3D""><br =
class=3D"">Please remember that Chinese new year is only 2 weeks long =
(at varying<br class=3D"">dates) so only 2 weeks of the freeze period =
are hit. Next year the<br class=3D"">Chinese new year will be at =
February 5th.<br class=3D""><br class=3D"">For my 4.12 plan I've added =
some extra weeks between last posting date<br class=3D"">and release =
date to accommodate for the holiday seasons, resulting in<br class=3D"">my=
 suggestion.<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Thanks for the detailed analysis Juregen. &nbsp;This seems =
good to me.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">-George</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><br =
class=3D""></div><div>This looks good to me also. To address Julien's =
concerns, we could also consider an earlier Last posting date/Hard code =
freeze date for Arm related code to work around Julien's holiday plans. =
I think this would be entirely OK and set expectations of contributors =
accordingly. But maybe this is not necessary if Julien and Stefano can =
agree a work split somehow.&nbsp;</div><div><br =
class=3D""></div><div>Alternatively we could communicate absences of key =
reviewers say in November to set expectations of contributors for the =
final stretch of the release cycle. In other words, if a key reviewer is =
away, then contributors will need to get series into good shape before =
their reviewers go on vacation.&nbsp;</div><div><br =
class=3D""></div><div>Regards</div><div>Lars</div><br =
class=3D""></body></html>=

--Apple-Mail=_6DD86429-DA1E-400F-860E-5DFC6B8255EC--


--===============8406175124264256925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8406175124264256925==--
