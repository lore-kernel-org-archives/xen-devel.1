From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [PATCH 1/5] xen/arm: Introduce enable callback to
 enable a capabilities on each online CPU
Date: Wed, 17 Jan 2018 12:23:33 +0000
Message-ID: <7F2FA84A-2CBA-45EC-9073-7FC86205BE5A@gmail.com>
References: <20180116142337.24942-1-julien.grall@linaro.org>
 <20180116142337.24942-2-julien.grall@linaro.org>
 <alpine.DEB.2.10.1801161554390.6440@sstabellini-ThinkPad-X260>
 <3f287ea5-f122-b375-4d98-e33733516816@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: multipart/mixed; boundary="===============2619264010388236959=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3f287ea5-f122-b375-4d98-e33733516816@linaro.org>
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


--===============2619264010388236959==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_B66324FC-9B36-4557-B9E1-47A20503A4A1"


--Apple-Mail=_B66324FC-9B36-4557-B9E1-47A20503A4A1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 17 Jan 2018, at 10:31, Julien Grall <julien.grall@linaro.org> =
wrote:
>=20
> Hi Stefano,
>=20
> On 16/01/18 23:55, Stefano Stabellini wrote:
>> On Tue, 16 Jan 2018, Julien Grall wrote:
>>> Once Xen knows what features/workarounds present on the platform, it
>>> might be necessary to configure each online CPU.
>>>=20
>>> Introduce a new callback "enable" that will be called on each online =
CPU to
>>> configure the "capability".
>>>=20
>>> The code is based on Linux v4.14 (where cpufeature.c comes from), =
the
>>> explanation of why using stop_machine_run is kept as we have similar
>>> problem in the future.
>>>=20
>>> Lastly introduce enable_errata_workaround that will be called once =
CPUs
>>> have booted and before the hardware domain is created.
>>>=20
>>> This is part of XSA-254.
>>>=20
>>> Signed-of-by: Julien Grall <julien.grall@linaro.org>
>> If you took the code from Linux, you need to add the original
>> Signed-off-by from the Linux commit. Aside from that:
>=20
> There are multiple commits touching this function. So I followed what =
we did in similar situation. By that I mean, mentioning the code was =
taken from Linux and not gathered the signed-off-by.
>=20
> If you really want, I can gather all the signed-off-by of the commit =
touching this function.

If there are a lot of then, you may want to consider adding a =
README.source file instead. There are a few examples in tree and they =
are also mentioned in CONTRIBUTING files
Lars


--Apple-Mail=_B66324FC-9B36-4557-B9E1-47A20503A4A1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 17 Jan 2018, at 10:31, Julien Grall &lt;<a =
href=3D"mailto:julien.grall@linaro.org" =
class=3D"">julien.grall@linaro.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">Hi =
Stefano,</span><br style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">On 16/01/18 23:55, =
Stefano Stabellini wrote:</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">On Tue, 16 Jan 2018, Julien =
Grall wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">Once Xen =
knows what features/workarounds present on the platform, it<br =
class=3D"">might be necessary to configure each online CPU.<br =
class=3D""><br class=3D"">Introduce a new callback "enable" that will be =
called on each online CPU to<br class=3D"">configure the =
"capability".<br class=3D""><br class=3D"">The code is based on Linux =
v4.14 (where cpufeature.c comes from), the<br class=3D"">explanation of =
why using stop_machine_run is kept as we have similar<br =
class=3D"">problem in the future.<br class=3D""><br class=3D"">Lastly =
introduce enable_errata_workaround that will be called once CPUs<br =
class=3D"">have booted and before the hardware domain is created.<br =
class=3D""><br class=3D"">This is part of XSA-254.<br class=3D""><br =
class=3D"">Signed-of-by: Julien Grall &lt;<a =
href=3D"mailto:julien.grall@linaro.org" =
class=3D"">julien.grall@linaro.org</a>&gt;<br class=3D""></blockquote>If =
you took the code from Linux, you need to add the original<br =
class=3D"">Signed-off-by from the Linux commit. Aside from that:<br =
class=3D""></blockquote><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">There are multiple =
commits touching this function. So I followed what we did in similar =
situation. By that I mean, mentioning the code was taken from Linux and =
not gathered the signed-off-by.</span><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">If you really want, I can gather all the =
signed-off-by of the commit touching this function.</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><br class=3D""></div><div>If there are a =
lot of then, you may want to consider adding a&nbsp;README.source file =
instead. There are a few examples in tree and they are also mentioned =
in&nbsp;CONTRIBUTING files</div><div>Lars</div><br =
class=3D""></body></html>=

--Apple-Mail=_B66324FC-9B36-4557-B9E1-47A20503A4A1--


--===============2619264010388236959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2619264010388236959==--
