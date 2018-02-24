From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH RFC 00/10] x86 passthrough code cleanup
Date: Fri, 23 Feb 2018 22:39:20 -0600
Message-ID: <a4d4900e-ba01-bde2-b2a4-79dcf0d8bebb@cardoe.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1910153C5@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0037332687902701925=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=i3pk=fs=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1epRcO-0001Lj-CR
 for xen-devel@lists.xenproject.org; Sat, 24 Feb 2018 04:39:28 +0000
Received: by mail-yb0-x234.google.com with SMTP id t18-v6so457706ybt.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2018 20:39:26 -0800 (PST)
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D1910153C5@SHSMSX101.ccr.corp.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0037332687902701925==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="rUMHi62mKnR5raR36wLcaXLxBilr32YhT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rUMHi62mKnR5raR36wLcaXLxBilr32YhT
Content-Type: multipart/mixed; boundary="MzwukLtxS5nN7WnHrgituSzzJPfS7MsTv";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <a4d4900e-ba01-bde2-b2a4-79dcf0d8bebb@cardoe.com>
Subject: Re: [Xen-devel] [PATCH RFC 00/10] x86 passthrough code cleanup
References: <20180221214701.1646-1-wei.liu2@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1910153C5@SHSMSX101.ccr.corp.intel.com>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D1910153C5@SHSMSX101.ccr.corp.intel.com>

--MzwukLtxS5nN7WnHrgituSzzJPfS7MsTv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/22/18 11:12 PM, Tian, Kevin wrote:
>> From: Wei Liu
>> Sent: Thursday, February 22, 2018 5:47 AM
>>
>> Hi all
>>
>> At some point I would like to make CONFIG_HVM and CONFIG_PV work.
>> The
>> passthrough code is one of the road blocks for that work.
>=20
> Can you elaborate the motivation of this change? why does someone
> want to disable HVM or PV logic completely from hypervisor?

I can say I recall advocating for this at Xen Summit in Cambridge. I
believe I talked about it in Toronto as well. There are a number of
users of Xen that would certainly want to ship without all the code
associated with PV compiled in. Given the nature of design "compromises"
in many parts of x86 systems there is certainly a non-zero sum of people
that would likely utilize the ability to remove code that doesn't need
to be there. I think every individual on this list who has been involved
in the security has been in a room of @intel.com folks has seen features
vs security win out many times.

I don't think its a hard stretch of the imagination to see people
disabling PV in data centers running newer workloads on PVH and HVM
only. I can see the real question being why HVM? That I would say lies
with the direction of discretionary access controls in Xen vs mandatory
access controls. To solve for the lack of functionality we've grown
things like "dmops" and I could certainly see a product like Qubes
running only PVH domains in the future.

Since I picked on Qubes I've CC'd Marek.

--=20
Doug Goldstein


--MzwukLtxS5nN7WnHrgituSzzJPfS7MsTv--

--rUMHi62mKnR5raR36wLcaXLxBilr32YhT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlqQ7HhfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl3CJA//VB6vEPQRGNZ8317e2eLTzvmSddPbJTJuLLsb7CJRBqYIMPmTMohxMWtJ
2PD+wYA+560kwlTYYan6C5c410roHBOH4PpeprMFbgtFlK6uJgA78pJXRF2zErAE
h+zmiidDdTQHu7LRAaEs/ZEzOvWrV5SPqGibG3jLTFUhaHsSEP6ioC0LNiLukQYL
J5WBaVfAbEDubyO30P+H6Jbg6LscqYe1yL23pMBHoOWZLwcCXvfaiwYeyxPSaYUF
YioR2I/ri1MP8qoTTNjDxmY0zRO4FKahoZK8udrW4x+YpeGoy3D5OpcUBzu2/elQ
W55YRk4cE4D7z1Gzt5au/GwictD9XSK4yyzU+ZSP5dugipv7OF/Oz4mlbMtI1RSp
q7A2BuMb5Oe/utpk7bMXou4r7rDjrNgoJoA4kc8L61ns5dc8TIU+MvHzmxbICNtl
sk20vw55onwkGmVfBrsfVvXYCtV/KKNxGLGHtjzmqkWbmyPKima0m278SIYt+8Eu
lYFVsfQANzp1+C0sUBKtVv4bKhYy4755ApJaVxzjAnTDdmm5pLxMaGiviFjb3H07
hkZKPTzZ9X453nt5WKj4h5SguP2q56Tk9uE2CopJ99tNqKY5uU1jnYKJ4fVjIEf2
YVsQWsSp/j7lW1DaKrb3hQjymYSVHzcBE6tQVkXT/BWG8ll+xHk=
=M0Op
-----END PGP SIGNATURE-----

--rUMHi62mKnR5raR36wLcaXLxBilr32YhT--


--===============0037332687902701925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0037332687902701925==--
