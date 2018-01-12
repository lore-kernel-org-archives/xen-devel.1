From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/5] x86/pv: Rename invalidate_shadow_ldt()
 to pv_destroy_ldt()
Date: Fri, 12 Jan 2018 14:15:34 -0600
Message-ID: <71cee33e-f326-4a22-f62a-1fa345f63a74@cardoe.com>
References: <1515782244-6412-1-git-send-email-andrew.cooper3@citrix.com>
 <1515782244-6412-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7121888336933894826=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515782244-6412-3-git-send-email-andrew.cooper3@citrix.com>
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
--===============7121888336933894826==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="COt2uTLNMehyIaoJBY6nahmz8SmJ44opU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--COt2uTLNMehyIaoJBY6nahmz8SmJ44opU
Content-Type: multipart/mixed; boundary="OajzhwSF1aSezyO4tci4apjxigSEXGClZ";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <JBeulich@suse.com>
Message-ID: <71cee33e-f326-4a22-f62a-1fa345f63a74@cardoe.com>
Subject: Re: [Xen-devel] [PATCH 2/5] x86/pv: Rename invalidate_shadow_ldt() to
 pv_destroy_ldt()
References: <1515782244-6412-1-git-send-email-andrew.cooper3@citrix.com>
 <1515782244-6412-3-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1515782244-6412-3-git-send-email-andrew.cooper3@citrix.com>

--OajzhwSF1aSezyO4tci4apjxigSEXGClZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/12/18 12:37 PM, Andrew Cooper wrote:
> and move it into pv/descriptor-tables.c beside its GDT counterpart.  Re=
duce
> the !in_irq() check from a BUG_ON() to ASSERT().
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--OajzhwSF1aSezyO4tci4apjxigSEXGClZ--

--COt2uTLNMehyIaoJBY6nahmz8SmJ44opU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpZF2dfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl2GmhAAp/cvS2s9SCK4jtTIJIiJyE8+fPPnLDV8Rx5fcwFJxEI+ZUj+X/173xfZ
yxqdXnP57OhIpqeqR1Ooa30kZcl6BlxxWyQaxA74EHn3Wyt0dBEZXdvW36/odcPf
ZRfNjW7jeQ0YXQjUhaYOFSZpvZYjJ0KFVTlL+BhPrcLkITLtg9maIv3qIHI/85um
FU6dZp01QyBc2dlP68xcry/E4WQAuypI0rEZr3LlC8jOCSNkJub1De/N5cgxK4GF
9ccUM4bQkFPI9jJfe0m56XU+zhqaKDvUj5jXz3shM2WfxjZA4FnUtn/DWhrmmQqx
3pwntkjnlZ5ig4g2OgnKn0m17xmuSwyv4EollEQtxdyIbeDMz3fD7WCbKrqn2NCb
EakBd9idKvV5uHo8TUCM4L4RVlpPwxXqmhcHp+oe7jfYTZ1T0Q8YMUURrCqTCpe2
kNuANpAeVPoFtXJ3YeXRHrzd/CSb9ivbCey/MvSFjZ5fAC/4xKKMw3ShtXZnmD6j
aXUpD6Vgkj4U3RDOwxOlfiYc442rJv6dX7XpjX+IQ3mzywVwUgZf7MJHB0tGJtVM
PKEfFcl28vuT/E3boBn86Zkx5bFUqKrvKO8kjq/MVIk9YKK8ArpOx8dCeW2YzjQ3
d40zrTdEWw273Rq74Eos6Rr0si51jf9e8sX7wPoUGRJ0EGxRLVU=
=RWwk
-----END PGP SIGNATURE-----

--COt2uTLNMehyIaoJBY6nahmz8SmJ44opU--


--===============7121888336933894826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7121888336933894826==--
