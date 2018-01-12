From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 4/5] x86/pv: Drop support for paging out the
 LDT
Date: Fri, 12 Jan 2018 15:53:13 -0600
Message-ID: <81859510-5bae-4742-c044-caabc6d85121@cardoe.com>
References: <1515782244-6412-1-git-send-email-andrew.cooper3@citrix.com>
 <1515782244-6412-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0950158625153629200=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515782244-6412-5-git-send-email-andrew.cooper3@citrix.com>
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
--===============0950158625153629200==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="uGqi60R2KM6i2vFNVF78wYEiP5M4i8e9T"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uGqi60R2KM6i2vFNVF78wYEiP5M4i8e9T
Content-Type: multipart/mixed; boundary="5ymQsrXGhufkicVq8pRgoeuuBjaglxcUP";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <JBeulich@suse.com>
Message-ID: <81859510-5bae-4742-c044-caabc6d85121@cardoe.com>
Subject: Re: [Xen-devel] [PATCH 4/5] x86/pv: Drop support for paging out the
 LDT
References: <1515782244-6412-1-git-send-email-andrew.cooper3@citrix.com>
 <1515782244-6412-5-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1515782244-6412-5-git-send-email-andrew.cooper3@citrix.com>

--5ymQsrXGhufkicVq8pRgoeuuBjaglxcUP
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/12/18 12:37 PM, Andrew Cooper wrote:
> Windows is the only OS which pages out kernel datastructures, so chance=
s are
> good that this is a vestigial remnant of the PV Windows XP experiment.
> Furthermore the implementation is incomplete; it only functions for a p=
resent
> =3D> not-present transition, rather than a present =3D> read/write tran=
sition.
>=20
> The for_each_vcpu() is one scalability limitation for PV guests, which =
can't
> reasonably be altered to be continuable.
>=20
> One side effects of dropping paging out support is that now, the LDT (l=
ike the
> GDT) is only ever modified in current context, allowing us to drop
> shadow_ldt_mapcnt and shadow_ldt_lock from struct vcpu.
>=20
> Another side effect is that the LDT no longer automatically cleans itse=
lf up
> on domain destruction.  Cover this by explicitly releasing the LDT fram=
es at
> the same time as the GDT frames.
>=20
> Finally, leave some asserts around to confirm the expected behaviour of=
 all
> the functions playing with PGT_seg_desc_page references.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Makes sense to me and the code looks good.

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--5ymQsrXGhufkicVq8pRgoeuuBjaglxcUP--

--uGqi60R2KM6i2vFNVF78wYEiP5M4i8e9T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpZLklfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl2DDg/8CsCbjrq38KBXXLf/OVry+bY9NA6bPKGYRvdW0y1Dvj36JD0ss6qQClQv
k/oXHXoSVHFk9ZwUqB2WAu13lntUSS4d+wVqlRxI5w2Rm5DV8dimbOYRDvHWIfxo
9zyOEQHPVCCWRCt9ETy/ta5r22MlQgyC3ff4YoLaJhZ0TXK2zggUaZf87bDbXKv5
hgOAk9vwiFMhkDGIvF0H6OqbCKiJlW+nq7+0JuKpxDhQxfzfxiSJ5SmadLafWEhc
nhpiKcOKfJVjatX0L5JjQQ5M00gcgcxoDjKE95jfitwVwWOw9TTrRQbl8MlkgrKh
42CDa41Y5Kb4PtS0PatBxmVoEMSltc3i5ywW2Ipw78FinnpKZJ25JqMlCGD7Xp/C
UJXOms6ygdywgUUeRukqJQhBhBSbdhBzV/s7u8cXJCEfN5BMV3C53GfwancA0hWb
C8wmeJS9MSeHN32Xrih44CznaqXkg+3acqiz3LHwr8MFhcznpyMqgQA+5cxJ/KBZ
wYnHaJJmNZYJbPOwb938bCAYpqNPgsyNgpSRRKWEiX5sgv9FjVaNoHW8laup1OQ/
XzZKnuV5gSS896iHI1gpq2S7efVWx4U/aSaTOUmgXgoRp3iOUzh88xI/c7KcPht7
O/9JlOGZLFE6xMKG/zDB3uy5WNIACXh7MqxOIEgBgNhBM7uDIaI=
=OfeU
-----END PGP SIGNATURE-----

--uGqi60R2KM6i2vFNVF78wYEiP5M4i8e9T--


--===============0950158625153629200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0950158625153629200==--
