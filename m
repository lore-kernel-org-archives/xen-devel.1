From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 3/5] x86/pv: Break
 handle_ldt_mapping_fault() out of handle_gdt_ldt_mapping_fault()
Date: Fri, 12 Jan 2018 14:22:28 -0600
Message-ID: <26b55bc8-d234-f496-c5f6-5cd3a8ba11d5@cardoe.com>
References: <1515782244-6412-1-git-send-email-andrew.cooper3@citrix.com>
 <1515782244-6412-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6677570516614338910=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515782244-6412-4-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6677570516614338910==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="aL7p9QejPY76JueJcEGIudUvFt0sUphFf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aL7p9QejPY76JueJcEGIudUvFt0sUphFf
Content-Type: multipart/mixed; boundary="b64ZHFFH4l413ewc8FeQUTLYQbR72T3Vd";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <JBeulich@suse.com>
Message-ID: <26b55bc8-d234-f496-c5f6-5cd3a8ba11d5@cardoe.com>
Subject: Re: [Xen-devel] [PATCH 3/5] x86/pv: Break handle_ldt_mapping_fault()
 out of handle_gdt_ldt_mapping_fault()
References: <1515782244-6412-1-git-send-email-andrew.cooper3@citrix.com>
 <1515782244-6412-4-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1515782244-6412-4-git-send-email-andrew.cooper3@citrix.com>

--b64ZHFFH4l413ewc8FeQUTLYQbR72T3Vd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/12/18 12:37 PM, Andrew Cooper wrote:
> Adjust handle_ldt_mapping_fault() exclude the use of this fixup path fo=
r
> non-PV guests.  Well-formed code shouldn't reference the LDT while in H=
VM vcpu
> context, but currently on a context switch from PV to HVM context, ther=
e may
> be a stale LDT selector loaded, over an unmapped region.
>=20
> By explicitly excluding HVM context at this point, we avoid erroneous
> hypervisor execution resulting in a cascade failure, by falling into
> pv_map_ldt_shadow_page().
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Obviously a behavior change here but the rationale behind it seems clear
to me and well worth doing for the net positive result:

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--b64ZHFFH4l413ewc8FeQUTLYQbR72T3Vd--

--aL7p9QejPY76JueJcEGIudUvFt0sUphFf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpZGQRfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl3m3A//Q2QiuFQw52QJ5Fm77XoscPdyjmIECW9gmJ8IBClLv0goQacTagWlfq7Q
o6bAS7OEjBfpLPT1O8yb2ejKrmCfTnreYHHKXKZGHncgVAfsTeXLlBActuQxz7++
KTOegMUQy4wypRSZi0BkU6+U+EtVznmK7WEKTfiDY7H2GqOUJ3Vu8s/l0P8p5HcI
Au05ttdSYuycQ1fqr4IFYwvI5J14Osrurth/LCf5dlZSdjB7aVvxr+Niqg+Dmb/1
EaEWGw4+9NGrWcuEXHmVJxBsAyfrD+3G+nD7sHfGQkTc1yk1yH3BRJB7BT/bDQP3
bievEsK86SCupzRE78YoC2K+bb9Vx6DqeGZbs6wfS52BHsIuFNl1woQsu5aN6M+m
R1/a5iFUbvXvOYU3wYDumI6QuYLWZ6wLLdragQ5LB/622DUESseQUtJziZmJa9O5
v/ie7U4GRsmB6MZwdPHt+YCUKmXusDOgYkWkFkRimTTVybOCfjbX9E+xSIdCXl1g
/gNhs2/dnwRqBPBzgFNdfHQVCXUVIs/I92xCgD57QJWYdjD3IpOOqxQRucPerEbv
S2uv4l9gF8VbtHSUcJIah8NvpykvmdaXRY+ZldtpfyfR1iFTzmMrrnP97d1k5lD2
dTNmffqkf0YxgtiDqWI+gyBiZSRFs88J7Oju4iflHw7EEPVd2vc=
=kB7k
-----END PGP SIGNATURE-----

--aL7p9QejPY76JueJcEGIudUvFt0sUphFf--


--===============6677570516614338910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6677570516614338910==--
