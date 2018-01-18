From: Saumya Rajesh <saumyarajesh93@gmail.com>
Subject: Re: Access I2C bus from guest/DomU on ARM board
Date: Thu, 18 Jan 2018 13:20:05 +0530
Message-ID: <CAONE6OAUJ+SjvYkiAaT-0Y_8av4T0dX60R8o2OZum6g8Ucg+1w@mail.gmail.com>
References: <CAONE6OA9h6omWptvGQE6EdD+s0geCbUcGUwX1NKPj16PF7_TNA@mail.gmail.com>
 <37217807-7f20-bdbf-f852-033fcae1bd01@epam.com>
 <CAONE6OCM9wEd6zJCH5147vTMWyt4CGH9uXbBX0y29di9cC3QaQ@mail.gmail.com>
 <bc345300-7e46-367f-4e16-db1ffa4e56d0@epam.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3771281395672305528=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=czxr=en=gmail.com=saumyarajesh93@srs-us1.protection.inumbo.net>)
 id 1ec4xb-0004FF-Fk
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 07:50:07 +0000
In-Reply-To: <bc345300-7e46-367f-4e16-db1ffa4e56d0@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>, xen-users@lists.xenproject.org
Cc: xen-devel@lists.xenproject.org, embedded-pv-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============3771281395672305528==
Content-Type: multipart/alternative; boundary="001a113e410c4d6053056308368b"

--001a113e410c4d6053056308368b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2018 at 9:06 PM, Andrii Anisov <andrii_anisov@epam.com>
wrote:

> Rajesh,
>
> On 17.01.18 16:03, Saumya Rajesh wrote:
>
>> Just out of curiosity, is it possible to split the Driver for the Renesa=
s
>> RCar I2C unit [1] into frontend and backend to use the i2c bus from gues=
t?
>> Or to do something similar to PCI passthrough? Please forgive me if I so=
und
>> illogical. I'm just curious.
>>
> I guess you could implement PV I2C using FE/BE scheme. With enormous
> efforts and unpredictable results.
> But I'm sure it is not what you really need.
>
> --
>
> *Andrii Anisov*
>
>
>
=E2=80=8BHi Andrii

Actually I am planning to set up Android as guest in Xen. In order to
enable sound in the Android guest, I need to passthrough the audio codec
device which communicates through the I2C bus. For BE/FE scheme, I think
sharing the internal DMA and clock would pose problems. So I'm going to go
ahead with the device passthrough way.

Any thoughts or inputs you can possibly give regarding this use case will
be very helpful and valuable.

Regards
Saumya=E2=80=8B

--001a113e410c4d6053056308368b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif"><span style=3D"font-family:arial,sans-serif">On Wed, Jan 17, 201=
8 at 9:06 PM, Andrii Anisov </span><span dir=3D"ltr" style=3D"font-family:a=
rial,sans-serif">&lt;<a href=3D"mailto:andrii_anisov@epam.com" target=3D"_b=
lank">andrii_anisov@epam.com</a>&gt;</span><span style=3D"font-family:arial=
,sans-serif"> wrote:</span><br></div><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Rajesh,<=
span class=3D"gmail-"><br>
<br>
On 17.01.18 16:03, Saumya Rajesh wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Just out of curiosity, is it possible to split the Driver for the Renesas R=
Car I2C unit [1] into frontend and backend to use the i2c bus from guest? O=
r to do something similar to PCI passthrough? Please forgive me if I sound =
illogical. I&#39;m just curious.<br>
</blockquote></span>
I guess you could implement PV I2C using FE/BE scheme. With enormous effort=
s and unpredictable results.<br>
But I&#39;m sure it is not what you really need.<span class=3D"gmail-HOEnZb=
"><font color=3D"#888888"><br>
<br>
-- <br>
<br>
*Andrii Anisov*<br>
<br>
<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra"><div =
class=3D"gmail_default"><span style=3D"font-family:tahoma,sans-serif">=E2=
=80=8B</span><font face=3D"tahoma, sans-serif">Hi Andrii</font></div><div c=
lass=3D"gmail_default"><font face=3D"tahoma, sans-serif"><br></font></div><=
div class=3D"gmail_default"><font face=3D"tahoma, sans-serif">Actually I am=
 planning to set up Android as guest in Xen. In order to enable sound in th=
e Android guest, I need to passthrough the audio codec device which communi=
cates through the I2C bus. For BE/FE scheme, I think sharing the internal D=
MA and clock would pose problems. So I&#39;m going to go ahead with the dev=
ice passthrough way.=C2=A0</font></div><div class=3D"gmail_default"><font f=
ace=3D"tahoma, sans-serif"><br></font></div><div class=3D"gmail_default"><f=
ont face=3D"tahoma, sans-serif">Any thoughts or inputs you can possibly giv=
e regarding this use case will be very helpful and valuable.</font></div><d=
iv class=3D"gmail_default"><font face=3D"tahoma, sans-serif"><br></font></d=
iv><div class=3D"gmail_default"><font face=3D"tahoma, sans-serif">Regards</=
font></div><div class=3D"gmail_default"><font face=3D"tahoma, sans-serif">S=
aumya</font><span style=3D"font-family:tahoma,sans-serif">=E2=80=8B</span><=
/div><br></div></div>

--001a113e410c4d6053056308368b--


--===============3771281395672305528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3771281395672305528==--
