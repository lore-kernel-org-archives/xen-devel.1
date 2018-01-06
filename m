From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] x86/efi: fix build with linkers that
 support both coff-x86-64 and pe-x86-64
Date: Fri, 5 Jan 2018 20:20:35 -0600
Message-ID: <559abe9e-4f0f-a51e-6309-700540cd2deb@cardoe.com>
References: <20180105164346.15068-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5630744641219583816=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=8teh=eb=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1eXe6E-0001bf-Qp
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2018 02:20:43 +0000
Received: by mail-yw0-x236.google.com with SMTP id y126so165013ywy.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2018 18:20:40 -0800 (PST)
In-Reply-To: <20180105164346.15068-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5630744641219583816==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Y5m7JxLFywmUFXVeF9gK4kR6eZI6MreBY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Y5m7JxLFywmUFXVeF9gK4kR6eZI6MreBY
Content-Type: multipart/mixed; boundary="x7wPg8czdqBi3muhruQ2YZctaBaz5I6Kr";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Message-ID: <559abe9e-4f0f-a51e-6309-700540cd2deb@cardoe.com>
Subject: Re: [Xen-devel] [PATCH] x86/efi: fix build with linkers that support
 both coff-x86-64 and pe-x86-64
References: <20180105164346.15068-1-roger.pau@citrix.com>
In-Reply-To: <20180105164346.15068-1-roger.pau@citrix.com>

--x7wPg8czdqBi3muhruQ2YZctaBaz5I6Kr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/5/18 10:43 AM, Roger Pau Monne wrote:
> When using a linker that supports both formats the following error
> will be triggered:
>=20
> efi/buildid.o: file not recognized: File format is ambiguous
> efi/buildid.o: matching formats: coff-x86-64 pe-x86-64
>=20
> Solve this by specifying the buildid.o format to pe-x86-64.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Yes. Please let's do this.

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
Tested-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--x7wPg8czdqBi3muhruQ2YZctaBaz5I6Kr--

--Y5m7JxLFywmUFXVeF9gK4kR6eZI6MreBY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpQMnRfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl37fw//WREDnVHLLuCQ3tUzfkPV59qnTcddGqpVjeKocamw1JWsMdeQq+u2VWyt
9w+2JO9bgYlCOVMUcpYR5QPlrErXP0d/67WO7XIdKc7HGHfthrZf2JUpDOBy5A1s
glbqpoiiAnvZRuedjHLRRXkD71ku0ahfO5PfbBRz4k4kJW1WBnkFm6tPlcZa3cC8
fXE5rB2nSv5JPOZlLMa0jqEY2lbwYIh1MKM6iF2bbStgk773gu9eCySndoh+UiZo
STun1M9TwLTq3g6sNTMsBoxL91CcUJrkUFrTJ4iESwXDNFyciarEtKTO+vI1O25C
0FFyDG2fsulc4kvzYTAoC0VGd26OmqX3WAz5CBD4MG8iBSOJbUbGneQ0rbOyRr7O
7sPLnfZ8tU0cNqTKXfErluboYw1luAGtTIJPDY0GvDce/BUqaSzwPkDgvQPn7uBM
7WPMVgnUh6A0nq/IUOh/icOlXm9LJpuZFcE0bbvVrDgMii0F78xBxbYrqupXW/2M
+a0nAyMWvt7ibdzTqX2qKm47s97tzaWA0QyYEtXlPFNbwx+4y96AK/kyZIK9S0CY
ZwJTZnlz0F8hiZkGEp6owSe6acKBztaWw1V99kWwzzOVKLwiMoZHi0RedyQerNQg
v8CC524BVWzRW9dOvD7QshrbreyW7KN6fsr2/hZTTeU1jI8WP8k=
=o3d4
-----END PGP SIGNATURE-----

--Y5m7JxLFywmUFXVeF9gK4kR6eZI6MreBY--


--===============5630744641219583816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5630744641219583816==--
