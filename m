From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [PATCH 1/5] xen/arm: Introduce enable callback to
 enable a capabilities on each online CPU
Date: Wed, 17 Jan 2018 14:31:08 +0000
Message-ID: <D1C765BC-DE91-439E-B7DE-27EEA33EBD12@gmail.com>
References: <20180116142337.24942-1-julien.grall@linaro.org>
 <20180116142337.24942-2-julien.grall@linaro.org>
 <alpine.DEB.2.10.1801161554390.6440@sstabellini-ThinkPad-X260>
 <3f287ea5-f122-b375-4d98-e33733516816@linaro.org>
 <7F2FA84A-2CBA-45EC-9073-7FC86205BE5A@gmail.com>
 <fbca8a32-b800-dfdc-d3cf-27740d98c9cf@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: multipart/mixed; boundary="===============3997193690374563596=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <fbca8a32-b800-dfdc-d3cf-27740d98c9cf@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andre.przywara@linaro.org, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============3997193690374563596==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_7CD8552A-B5A8-47CB-9EC4-2ED7F5B1A9C7"


--Apple-Mail=_7CD8552A-B5A8-47CB-9EC4-2ED7F5B1A9C7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Julien,

> On 17 Jan 2018, at 12:31, Julien Grall <julien.grall@linaro.org> =
wrote:
>=20
>>>>>=20
>>>> If you took the code from Linux, you need to add the original
>>>> Signed-off-by from the Linux commit. Aside from that:
>>>=20
>>> There are multiple commits touching this function. So I followed =
what we did in similar situation. By that I mean, mentioning the code =
was taken from Linux and not gathered the signed-off-by.
>>>=20
>>> If you really want, I can gather all the signed-off-by of the commit =
touching this function.
>> If there are a lot of then, you may want to consider adding a =
README.source file instead. There are a few examples in tree and they =
are also mentioned in CONTRIBUTING files
>=20
> I am not sure to understand your suggestion here. I spotted only one =
CONTRIBUTING file and it only list the license.

I was suggesting to create a README.source in the xen arm tree seomwhere =
where you can list imports.

> Regarding README.source, this is covering file and contain the same =
mention as in the commit message. As this is a single function. Isn't =
the commit message enough?

=46rom a legal viewpoint it is enough.
The reason why we created the README.source file is because it is very =
easy to miss code imports when they are mentioned in commit messages.

Normally this isn't a problem: only if we ever have to relicense the =
code or if someone does code archeology=20
When we relicensed the ACPI builder, it created all sorts of problems as =
outlined in =
https://www.slideshare.net/xen_com_mgr/ossa17-mixed-license-foss-projects =
<https://www.slideshare.net/xen_com_mgr/ossa17-mixed-license-foss-projects=
>

> Lastly, we do have quite a bit of code in Xen coming from Linux (or =
other project). A lot of them are not listed in =
README.source/CONTRIBUTING. But only mention in the commit message (not =
necessarily with Signed-off-by tag).

That is true: which is why I have started fixing these, whenever I found =
them and moved such information to README.source.=20

> So I am quite interested to know what is the normal procedure here.

I think:
* Doing this via Signed-off-by tag is sufficient for a one-off-import
* I would prefer if people added import related info README.source files =
(and also in the commit message)

Does this make sense?

Lars=

--Apple-Mail=_7CD8552A-B5A8-47CB-9EC4-2ED7F5B1A9C7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Julien,<br class=3D""><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On 17 Jan 2018, at 12:31, Julien Grall &lt;<a =
href=3D"mailto:julien.grall@linaro.org" =
class=3D"">julien.grall@linaro.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D""><br class=3D""></blockquote>If you took the code from Linux, =
you need to add the original<br class=3D"">Signed-off-by from the Linux =
commit. Aside from that:<br class=3D""></blockquote><br class=3D"">There =
are multiple commits touching this function. So I followed what we did =
in similar situation. By that I mean, mentioning the code was taken from =
Linux and not gathered the signed-off-by.<br class=3D""><br class=3D"">If =
you really want, I can gather all the signed-off-by of the commit =
touching this function.<br class=3D""></blockquote>If there are a lot of =
then, you may want to consider adding a&nbsp;README.source file instead. =
There are a few examples in tree and they are also mentioned =
in&nbsp;CONTRIBUTING files<br class=3D""></blockquote><br class=3D"">I =
am not sure to understand your suggestion here. I spotted only one =
CONTRIBUTING file and it only list the license.<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>I was =
suggesting to create a README.source in the xen arm tree seomwhere where =
you can list imports.</div><div><br class=3D""></div><blockquote =
type=3D"cite" class=3D""><div class=3D""><div class=3D"">Regarding =
README.source, this is covering file and contain the same mention as in =
the commit message. As this is a single function. Isn't the commit =
message enough?<br class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>=46rom a legal viewpoint it is =
enough.</div><div>The reason why we created the README.source file is =
because it is very easy to miss code imports when they are mentioned in =
commit messages.</div><div><br class=3D""></div><div>Normally this isn't =
a problem: only if we ever have to relicense the code or if someone does =
code archeology&nbsp;</div><div>When we relicensed the ACPI builder, it =
created all sorts of problems as outlined in&nbsp;<a =
href=3D"https://www.slideshare.net/xen_com_mgr/ossa17-mixed-license-foss-p=
rojects" =
class=3D"">https://www.slideshare.net/xen_com_mgr/ossa17-mixed-license-fos=
s-projects</a></div><div><br class=3D""></div><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D"">Lastly, we do have quite a =
bit of code in Xen coming from Linux (or other project). A lot of them =
are not listed in README.source/CONTRIBUTING. But only mention in the =
commit message (not necessarily with Signed-off-by tag).<br =
class=3D""></div></div></blockquote><div><br class=3D""></div>That is =
true: which is why I have started fixing these, whenever I found them =
and moved such information to&nbsp;README.source.&nbsp;</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D"">So I am quite interested to know what is the normal procedure =
here.<br class=3D""></div></div></blockquote><div><br class=3D""></div>I =
think:</div><div>* Doing this via Signed-off-by tag is sufficient for a =
one-off-import</div><div>* I would prefer if people added import related =
info README.source files (and also in the commit message)</div><div><br =
class=3D""></div>Does this make sense?<div class=3D""><br =
class=3D""></div><div class=3D"">Lars</div></body></html>=

--Apple-Mail=_7CD8552A-B5A8-47CB-9EC4-2ED7F5B1A9C7--


--===============3997193690374563596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3997193690374563596==--
