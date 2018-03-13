From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [RFC PATCH 1/6] ci: add Dockerfile for CentOS 7.2
Date: Tue, 13 Mar 2018 10:48:38 -0500
Message-ID: <c8019016-1a14-2ba8-d189-d606afa3d811@cardoe.com>
References: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
 <ebb0926a801b494560f5305d8ceaa4d40934d301.1520911150.git-series.cardoe@cardoe.com>
 <f430f5e5-3c8d-f0b9-4f7b-f8f50f121005@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6850673829391200380=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f430f5e5-3c8d-f0b9-4f7b-f8f50f121005@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6850673829391200380==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="hwr3FcQDkzm08YWCxrggsNMNs4kUsQe7d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hwr3FcQDkzm08YWCxrggsNMNs4kUsQe7d
Content-Type: multipart/mixed; boundary="d13LXsiAZGcqdbYDWTrcpA8AbAMjmzAsQ";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Wei Liu <wei.liu2@citrix.com>
Message-ID: <c8019016-1a14-2ba8-d189-d606afa3d811@cardoe.com>
Subject: Re: [RFC PATCH 1/6] ci: add Dockerfile for CentOS 7.2
References: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
 <ebb0926a801b494560f5305d8ceaa4d40934d301.1520911150.git-series.cardoe@cardoe.com>
 <f430f5e5-3c8d-f0b9-4f7b-f8f50f121005@arm.com>
In-Reply-To: <f430f5e5-3c8d-f0b9-4f7b-f8f50f121005@arm.com>

--d13LXsiAZGcqdbYDWTrcpA8AbAMjmzAsQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/13/18 9:52 AM, Julien Grall wrote:
> Hi Doug,
>=20
> On 13/03/18 03:31, Doug Goldstein wrote:
>> +# work around https://github.com/moby/moby/issues/10180
>> +# and install Xen depends
>> +RUN rpm --rebuilddb && \
>> +=C2=A0=C2=A0=C2=A0 yum -y install \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 yum-plugin-ovl \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcc \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcc-c++ \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ncurses-devel \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zlib-devel \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 openssl-devel \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python-devel \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libuuid-devel \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgconfig \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gettext \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flex \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bison \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libaio-devel \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 glib2-devel \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 yajl-devel \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixman-devel \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 glibc-devel \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 glibc-devel.i686 \
>=20
> This looks fairly x86. Do you have any plan to add arm support?
>=20
> In any case, the README should explain what architectures are supported=
=2E
>=20
> Cheers,
>=20

Yes it definitely x86. I plan on adding ARM support I just haven't had
enough time to gather up what the dependencies need to be. Since its
going to be a cross compile environment I need to take the time to setup
one. Do you have a recommendation? I'm sure there are docs I just
haven't looked at them.

I'm hoping some people approve of this and we can potentially land this
for 4.11 so we can get some build testing for that branch.
--=20
Doug Goldstein


--d13LXsiAZGcqdbYDWTrcpA8AbAMjmzAsQ--

--hwr3FcQDkzm08YWCxrggsNMNs4kUsQe7d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlqn8tZfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl3LNg/7B/ozbKdwWRziTNoXJK8QMHClZkSbLKQAs00CV1E13uvwbhhIi1X2XMuv
QHtSzC7azCBih+kIECbKXlUyNYVLh9A/dupvjPTv7i5K0Wdflt/Nlyob8OA7KlGr
kexZ9HJKst3A1BlK6sLT99dbHX4wvI/WJmF2QyfTj1x4iEyqa56gFYaIKkcmpq+M
QCTYHfukCiOA2ib6hCGUvNJl5CKc9CrNlUZjhBZlXGxDZVzxA+y3cx05oAxtr86P
/q7mwoFNDBA3PPsQMcZLTplqQy6Ua7PBrfUuQnEZdhK7UbbAmHYyzDrl/6CfYBbO
74N7dst+taQ4GB193McleX2ui2HbFhBntTEpwtj4CAGVkVonBabgt8tk8XZPg1bp
QZ8NMfWphiODy4x4MKYb40HdfvguDWMdj6sMWWSU08I4+ou/k8xBzwy6AxODZ0yw
dHaJ9xd3DlraXaSbqFaGomeAz6kjmIIdj9ll3CgiRT1G/IONzE28qwLGYD2YqSXS
/MzKLDipvRmUTCl0EGdVxBqkUG0eUD5jEBNGE9zs4Fd+K+CETGjqtyssDcopJRTa
OEge8kiEoV+Y2ZFoEBrgb254iZjgt41O04b2WI5V8SxWXlQC9aVMGD3fgcTYA8yL
JBHhivZa7s3HKaZ4/a/jjX+5f427Fv1su47M0y7n00ujMO3nNgE=
=zwzq
-----END PGP SIGNATURE-----

--hwr3FcQDkzm08YWCxrggsNMNs4kUsQe7d--


--===============6850673829391200380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6850673829391200380==--
