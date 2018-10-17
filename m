From: code@schulzalex.de
Subject: Re: [PATCH] Reservation of PCI device range
 0xc200-0xc2ff to XCP-ng Project
Date: Wed, 17 Oct 2018 18:36:45 +0200
Message-ID: <3EB1AA1D-AA84-404C-B5C7-21C59BC4FA82@schulzalex.de>
References: <0d7eee26-529d-a900-92d4-9414bfd43eb4@schulzalex.de>
 <20181017163345.n3iitpa3nb4s56rm@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6111650058234268617=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7bb9=m5=schulzalex.de=code@srs-us1.protection.inumbo.net>)
 id 1gCooT-00016X-NI
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 16:36:49 +0000
In-Reply-To: <20181017163345.n3iitpa3nb4s56rm@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============6111650058234268617==
Content-Type: multipart/alternative; boundary="----O2817Y8IZL522VJRPH5Z93EV9G0RFO"
Content-Transfer-Encoding: 7bit

------O2817Y8IZL522VJRPH5Z93EV9G0RFO
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for all your support!

Alex


Am 17=2E Oktober 2018 18:33:45 MESZ schrieb Wei Liu <wei=2Eliu2@citrix=2Ec=
om>:
>On Tue, Oct 16, 2018 at 10:28:04PM +0200, Alexander Schulz - XCP-ng
>Project Member wrote:
>> We are the XCP-ng project (https://xcp-ng=2Eorg) and want to distribute
>our
>> own PV-Tools (maybe also per windows updates) so we need an extra
>range=2E
>>=20
>> We also registered a PCI-Device:
>>=20
>> "XCP-ng Project PCI Device for Windows Update" ->
>> https://pci-ids=2Eucw=2Ecz/read/PC/5853/c200
>>=20
>> Signed-off-by: Alexander Schulz <code@schulzalex=2Ede>
>
>I think your email client / server has mangled this patch badly=2E As Ian
>observed, it wouldn't apply=2E
>
>Anyway, in the interest of avoiding another round of posting, I have
>fixed up the patch and commit it for you=2E
>
>Wei=2E
>
>> ---
>>  docs/man/xen-pci-device-reservations=2Epod=2E7 | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/docs/man/xen-pci-device-reservations=2Epod=2E7
>> b/docs/man/xen-pci-device-reservations=2Epod=2E7
>> index 049e47410f=2E=2E1cd5a3e115 100644
>> --- a/docs/man/xen-pci-device-reservations=2Epod=2E7
>> +++ b/docs/man/xen-pci-device-reservations=2Epod=2E7
>> @@ -41,6 +41,7 @@ multiple Xen vendors using conflicting IDs=2E
>>      0x0002        | Citrix XenServer (grandfathered allocation for
>> XenServer 6=2E1)
>>      0xc000-0xc0ff | Citrix XenServer
>>      0xc100-0xc1ff | Citrix XenClient
>> +     0xc200-0xc2ff | XCP-ng Project (https://xcp-ng=2Eorg)
>>   =3Dhead1 Notes
>>  -- 2=2E17=2E1=2Ewindows=2E2
>>=20
>>=20

------O2817Y8IZL522VJRPH5Z93EV9G0RFO
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Thanks for all your support!<br><br>Alex<br><br><b=
r><div class=3D"gmail_quote">Am 17=2E Oktober 2018 18:33:45 MESZ schrieb We=
i Liu &lt;wei=2Eliu2@citrix=2Ecom&gt;:<blockquote class=3D"gmail_quote" sty=
le=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204, 204=
); padding-left: 1ex;">
<pre class=3D"k9mail">On Tue, Oct 16, 2018 at 10:28:04PM +0200, Alexander =
Schulz - XCP-ng Project Member wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; paddi=
ng-left: 1ex;">We are the XCP-ng project (<a href=3D"https://xcp-ng=2Eorg">=
https://xcp-ng=2Eorg</a>) and want to distribute our<br>own PV-Tools (maybe=
 also per windows updates) so we need an extra range=2E<br><br>We also regi=
stered a PCI-Device:<br><br>"XCP-ng Project PCI Device for Windows Update" =
-&gt;<br><a href=3D"https://pci-ids=2Eucw=2Ecz/read/PC/5853/c200">https://p=
ci-ids=2Eucw=2Ecz/read/PC/5853/c200</a><br><br>Signed-off-by: Alexander Sch=
ulz &lt;code@schulzalex=2Ede&gt;<br></blockquote><br>I think your email cli=
ent / server has mangled this patch badly=2E As Ian<br>observed, it wouldn'=
t apply=2E<br><br>Anyway, in the interest of avoiding another round of post=
ing, I have<br>fixed up the patch and commit it for you=2E<br><br>Wei=2E<br=
><br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0=2E8ex=
; border-left: 1px solid #729fcf; padding-left: 1ex;"><hr> docs/man/xen-pci=
-device-reservations=2Epod=2E7 | 1 +<br> 1 file changed, 1 insertion(+)<br>=
<br>diff --git a/docs/man/xen-pci-device-reservations=2Epod=2E7<br>b/docs/m=
an/xen-pci-device-reservations=2Epod=2E7<br>index 049e47410f=2E=2E1cd5a3e11=
5 100644<br>--- a/docs/man/xen-pci-device-reservations=2Epod=2E7<br>+++ b/d=
ocs/man/xen-pci-device-reservations=2Epod=2E7<br>@@ -41,6 +41,7 @@ multiple=
 Xen vendors using conflicting IDs=2E<br>     0x0002        | Citrix XenSer=
ver (grandfathered allocation for<br>XenServer 6=2E1)<br>     0xc000-0xc0ff=
 | Citrix XenServer<br>     0xc100-0xc1ff | Citrix XenClient<br>+     0xc20=
0-0xc2ff | XCP-ng Project (<a href=3D"https://xcp-ng=2Eorg">https://xcp-ng=
=2Eorg</a>)<br>  =3Dhead1 Notes<br> -- 2=2E17=2E1=2Ewindows=2E2<br><br><br>=
</blockquote></pre></blockquote></div></body></html>
------O2817Y8IZL522VJRPH5Z93EV9G0RFO--


--===============6111650058234268617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6111650058234268617==--
