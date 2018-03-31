From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: seabios regression in staging
Date: Fri, 30 Mar 2018 20:40:50 -0500
Message-ID: <e3cceee3-35d5-e976-7eb9-28a08414f586@cardoe.com>
References: <20180329114243.GN30726@aepfle.de>
 <20180329142901.wuso5qz647kkmqhp@citrix.com>
 <20180329145341.GO30726@aepfle.de>
 <059c1674-9b79-d5c5-012d-94de3439c546@cardoe.com>
 <20180329200016.GA5388@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6685487731430391225=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180329200016.GA5388@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6685487731430391225==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="cIKp9gnUgoNdTyasL1ed4kV37nd7wYVGW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cIKp9gnUgoNdTyasL1ed4kV37nd7wYVGW
Content-Type: multipart/mixed; boundary="FY1nDwKQo337W6m95YoPKxWl9tYSR2hU4";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
Message-ID: <e3cceee3-35d5-e976-7eb9-28a08414f586@cardoe.com>
Subject: Re: [Xen-devel] seabios regression in staging
References: <20180329114243.GN30726@aepfle.de>
 <20180329142901.wuso5qz647kkmqhp@citrix.com>
 <20180329145341.GO30726@aepfle.de>
 <059c1674-9b79-d5c5-012d-94de3439c546@cardoe.com>
 <20180329200016.GA5388@aepfle.de>
In-Reply-To: <20180329200016.GA5388@aepfle.de>

--FY1nDwKQo337W6m95YoPKxWl9tYSR2hU4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/29/18 3:00 PM, Olaf Hering wrote:
> On Thu, Mar 29, Doug Goldstein wrote:
>=20
>> If you'd be willing to create a SLE11 Docker container, we can add tha=
t
>> to the tree and start doing builds against it.
>=20
> I do not know how to do that. Any pointers?
>=20
> Olaf
>=20

Find the base image for SLE11. I've for the openSUSE ones at
https://hub.docker.com/r/library/opensuse/ so using those you would get
the line:

FROM opensuse:42.3

Then take one of the existing ones in the tree under automation/build
and change the FROM line and then update the commands that are
installing dependencies.

--=20
Doug Goldstein


--FY1nDwKQo337W6m95YoPKxWl9tYSR2hU4--

--cIKp9gnUgoNdTyasL1ed4kV37nd7wYVGW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlq+5yJfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl19FxAAocF5Xtb4TgjgZf0i0mG6nbPOwxt2WIGF71WN9VRmDc+LF3F6UHj/rgX2
udOYqyMQfKR9JwhI/+ALlMwLlqLdhs+ZCq70bNAANj6D5mRINcvrJNw9/TCeBUd/
9MgHqNg/EL//gx+HNn3VH0OH30WbSupnzde4GfdSE4GYhRz4Je+xzjA6hNTz09xp
TF7NCoRaEQ1VcAVRR9oEQyXRmJ6jE6VmRYXOMW7raF6IiDf9+hEQ1ElS7Op1g1ha
xMP57fIkGBCJJvbeHhJIyETqEVolosTQSpCBLYgzd6vH4f384Y9Sn2NMQWxf7UPE
j0I3lX6eUZQ/b+uiA6zCetFqZNkj1+gTr4GWy/9gVJA/XoO//PQQah2I4sTQ1xfa
Bir5xmMHmSzoo3pVmSkRs8IQVbdQZSi+vFPxlt2WfiHZEbaHB56J/jpd6neRhTGn
u0be0jhtYCSiElw5faiLUPQW1ZYM9nOZ3U1XCXGoa22c02WNDwjSy93CNBN3aRZb
QY3eBQqZG08vCIP0fuoe7yVU4UIuIMr1cZDOL8UXAwBiT43kQ4Al61RLzF1DKT3b
dqn4rcX2Rgx/xgR5fY9CP/W/rAR5JMpWL2cohBe666EeLj6gQU9dF7dW7txvvM7t
LDEW0JAt3rEXblkUnFprnS0Y6e0Obf1aYx6l7XyOWhgLz8E2Krc=
=R1Vk
-----END PGP SIGNATURE-----

--cIKp9gnUgoNdTyasL1ed4kV37nd7wYVGW--


--===============6685487731430391225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6685487731430391225==--
