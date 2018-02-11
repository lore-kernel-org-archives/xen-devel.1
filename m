From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH 2/2] xen: xenbus: WARN_ON
 XS_TRANSACTION_{START, END} misuse
Date: Sun, 11 Feb 2018 01:27:00 +0000
Message-ID: <66103cca-321e-6950-2083-6f5d068e12e6__3871.3812748485$1518312419$gmane$org@invisiblethingslab.com>
References: <20180207222236.7434-1-simon@invisiblethingslab.com>
 <20180207222236.7434-2-simon@invisiblethingslab.com>
 <8a0fd059-7acf-3279-10f9-649c19522e2a@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1899978102981651084=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ea6j=ff=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1ekgQb-0002pH-Uw
 for xen-devel@lists.xenproject.org; Sun, 11 Feb 2018 01:27:38 +0000
In-Reply-To: <8a0fd059-7acf-3279-10f9-649c19522e2a@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1899978102981651084==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="9rPfl8OoqZyfBMI7dNy5ZXuWTBYfmxUvO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9rPfl8OoqZyfBMI7dNy5ZXuWTBYfmxUvO
Content-Type: multipart/mixed; boundary="Hv6kReX5iZ2wI86tLY4w7ImxxWyPXgif0";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
Message-ID: <66103cca-321e-6950-2083-6f5d068e12e6@invisiblethingslab.com>
Subject: Re: [PATCH 2/2] xen: xenbus: WARN_ON XS_TRANSACTION_{START,END}
 misuse
References: <20180207222236.7434-1-simon@invisiblethingslab.com>
 <20180207222236.7434-2-simon@invisiblethingslab.com>
 <8a0fd059-7acf-3279-10f9-649c19522e2a@oracle.com>
In-Reply-To: <8a0fd059-7acf-3279-10f9-649c19522e2a@oracle.com>

--Hv6kReX5iZ2wI86tLY4w7ImxxWyPXgif0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Boris Ostrovsky:
> On 02/07/2018 05:22 PM, Simon Gaiser wrote:
>> +    users_old =3D xs_state_users;
>>       xs_state_users--;
>>       if ((req->type =3D=3D XS_TRANSACTION_START && req->msg.type =3D=3D=
 XS_ERROR) ||
>>           req->type =3D=3D XS_TRANSACTION_END)
>>           xs_state_users--;
>> +    if (WARN_ON(xs_state_users > users_old))
>=20
>=20
> WARN_ON_ONCE()?

Since we "fix" the wrong decrement by clamping at zero it should not
happen immediately again. But if you prefer _ONCE I can change it.


--Hv6kReX5iZ2wI86tLY4w7ImxxWyPXgif0--

--9rPfl8OoqZyfBMI7dNy5ZXuWTBYfmxUvO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlp/nBUACgkQkO9xfO/x
ly/4DQ//ZclF18bi9X9ZZudZ7joijJeZE8YajQ86050+SiSXFdcuH37KbC46cT74
RSrpP0pQ8g7smsS/vICut2ojZbMgxvGdAD+czGwaRYHcup+RzKRWmHwlS4QkHsXN
L7lM/Q8gIRgJNdciKy4ax4Az7//1yHcEkvyTQz9GEsKa66RCbLaY0NKKjVN0yt0L
aoVed0ABJelrUakSepOVSu12M0ovm35Nc3B1ffZYhqZ0NvApJBszJAf8S2y+8bCr
MpdJlgOQw7A5LCfY7ZVd/6K45Yzr3r5tfhzO7yg448V+aSDzEHYryamJZ6mzFGL5
Uhgk/7ZW/tji1Dl06A2Bjaku+XeUDzUyN6MBEXCQutf/BRiDonCqotZix8CPgRho
Tp+6bLm0xm3L5KQASeYyATinLkceVJSobNeYdRn9geLetwHcpIf/4WS1oJnTA/BW
1Bz5b/CwHNP+xIreOihh6luBELbQfWL3EyYQf/0u/c0A/x0zOSuzzdrhEVlxdXWO
IOkvl4WO1jtXM2OP3Q029PvlxAbivHBL/UxMb2rqB4qK3jLRQbx97opdfQ+Tp987
q4MVcUwyQg7K/i/Fo1ZSs9cQpjLq2R0lAngm+dzKFBFDqhtDn+EE4FD/hG7Kd5DU
Q6vNMzn29h+uPGHl6iBnq3pLJq7X4e25cexG0c2+tE3xfZcSLMk=
=2gDu
-----END PGP SIGNATURE-----

--9rPfl8OoqZyfBMI7dNy5ZXuWTBYfmxUvO--


--===============1899978102981651084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1899978102981651084==--
