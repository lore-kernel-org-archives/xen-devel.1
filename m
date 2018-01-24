From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [PATCH 1/5] xen/arm: Introduce enable callback to
 enable a capabilities on each online CPU
Date: Wed, 24 Jan 2018 17:05:32 +0000
Message-ID: <24B6C00C-5114-48D8-A21A-C7FE1E11328F@gmail.com>
References: <20180116142337.24942-1-julien.grall@linaro.org>
 <20180116142337.24942-2-julien.grall@linaro.org>
 <alpine.DEB.2.10.1801161554390.6440@sstabellini-ThinkPad-X260>
 <3f287ea5-f122-b375-4d98-e33733516816@linaro.org>
 <7F2FA84A-2CBA-45EC-9073-7FC86205BE5A@gmail.com>
 <fbca8a32-b800-dfdc-d3cf-27740d98c9cf@linaro.org>
 <D1C765BC-DE91-439E-B7DE-27EEA33EBD12@gmail.com>
 <ea0f07b2-c4b1-b2c1-0566-cb1b4154680e@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: multipart/mixed; boundary="===============4218876180508032089=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ea0f07b2-c4b1-b2c1-0566-cb1b4154680e@linaro.org>
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


--===============4218876180508032089==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_3E584181-A7C2-4ED2-8738-F20DFCD3344A"


--Apple-Mail=_3E584181-A7C2-4ED2-8738-F20DFCD3344A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Julien,

> On 18 Jan 2018, at 10:56, Julien Grall <julien.grall@linaro.org> =
wrote:
>=20
> On 17/01/18 14:31, Lars Kurth wrote:
>> Hi Julien,
>=20
> Hi Lars,
>=20
...=20
>> Normally this isn't a problem: only if we ever have to relicense the =
code or if someone does code archeology
>> When we relicensed the ACPI builder, it created all sorts of problems =
as outlined in =
https://www.slideshare.net/xen_com_mgr/ossa17-mixed-license-foss-projects =
<https://www.slideshare.net/xen_com_mgr/ossa17-mixed-license-foss-projects=
>
>>> Lastly, we do have quite a bit of code in Xen coming from Linux (or =
other project). A lot of them are not listed in =
README.source/CONTRIBUTING. But only mention in the commit message (not =
necessarily with Signed-off-by tag).
>> That is true: which is why I have started fixing these, whenever I =
found them and moved such information to README.source.
>>> So I am quite interested to know what is the normal procedure here.
>> I think:
>> * Doing this via Signed-off-by tag is sufficient for a one-off-import
>> * I would prefer if people added import related info README.source =
files (and also in the commit message)
>> Does this make sense?
>=20
> I think it makes sense. Do you expect to see the README.source =
per-directory? Or one at top level?

I think one somewhere at the top level of the ARM tree is sufficient. It =
depends on how often you import code. It shouldn't block the series. =
Just something to do at some point
Lars


--Apple-Mail=_3E584181-A7C2-4ED2-8738-F20DFCD3344A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Julien,<br class=3D""><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On 18 Jan 2018, at 10:56, Julien Grall &lt;<a =
href=3D"mailto:julien.grall@linaro.org" =
class=3D"">julien.grall@linaro.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">On 17/01/18 14:31, =
Lars Kurth wrote:</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">Hi Julien,<br =
class=3D""></blockquote><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">Hi Lars,</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote>...&nbsp;<br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">Normally this isn't a problem: only if we ever have to =
relicense the code or if someone does code archeology<br class=3D"">When =
we relicensed the ACPI builder, it created all sorts of problems as =
outlined in<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://www.slideshare.net/xen_com_mgr/ossa17-mixed-license-foss-p=
rojects" =
class=3D"">https://www.slideshare.net/xen_com_mgr/ossa17-mixed-license-fos=
s-projects</a><br class=3D""><blockquote type=3D"cite" class=3D"">Lastly, =
we do have quite a bit of code in Xen coming from Linux (or other =
project). A lot of them are not listed in README.source/CONTRIBUTING. =
But only mention in the commit message (not necessarily with =
Signed-off-by tag).<br class=3D""></blockquote>That is true: which is =
why I have started fixing these, whenever I found them and moved such =
information to&nbsp;README.source.<br class=3D""><blockquote type=3D"cite"=
 class=3D"">So I am quite interested to know what is the normal =
procedure here.<br class=3D""></blockquote>I think:<br class=3D"">* =
Doing this via Signed-off-by tag is sufficient for a one-off-import<br =
class=3D"">* I would prefer if people added import related info =
README.source files (and also in the commit message)<br class=3D"">Does =
this make sense?<br class=3D""></blockquote><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">I think it makes =
sense. Do you expect to see the README.source per-directory? Or one at =
top level?</span><br style=3D"font-family: Menlo-Regular; font-size: =
11px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""></div></blockquote><br =
class=3D""></div><div>I think one somewhere at the top level of the ARM =
tree is sufficient. It depends on how often you import code. It =
shouldn't block the series. Just something to do at some =
point</div><div>Lars</div><br class=3D""></body></html>=

--Apple-Mail=_3E584181-A7C2-4ED2-8738-F20DFCD3344A--


--===============4218876180508032089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4218876180508032089==--
