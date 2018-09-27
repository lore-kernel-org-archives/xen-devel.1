From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: null scheduler bug
Date: Thu, 27 Sep 2018 11:50:47 +0200
Message-ID: <39666f3710ae7adfbb43c9dc0efac0d60245c411.camel@suse.com>
References: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
 <a938e477609ae123ae61aec515daa34ccaf0b8f3.camel@suse.com>
 <CADJ6SV2G=51BK2p-bouNGfiS5sP2tiV6ztZZ7PFGjiptRw_P3w@mail.gmail.com>
 <44174941bcd8f250a6ecd42ea10a78bf12453134.camel@suse.com>
 <CADJ6SV2wis2kOz9j4OGTzRLd+2O2f_SuxktFWRq2A_tbng_3Ug@mail.gmail.com>
 <529d38d04b140d90d33e424a064d401cf06f14cf.camel@suse.com>
 <CADJ6SV09MS1x+qGJOu71W8M6cVhRaVuODBYDReHWmOm4c1NEfQ@mail.gmail.com>
 <CADJ6SV0+O5c52_qwOUEakuX82C2+8Z-M4mKj0x+13GXjaiJjvw@mail.gmail.com>
 <a468e3dfc55bb6a421d47b908f89d9112075cc04.camel@suse.com>
 <CADJ6SV0=p3efMNmdx5ud8BAPscOZpSBqBZ2LJieE3M+Rq3phNQ@mail.gmail.com>
 <b9c1a71c455e8a1682bb13527503c7c0f0135887.camel@suse.com>
 <2ec1f6c5-df53-fce3-9062-123832ae8e6a@arm.com>
 <2bb4df76339b020351720927d05f2d1e565cebbc.camel@suse.com>
 <04bed226-f787-e86f-4373-d05186ab03cf@arm.com>
 <d8d276a20e4567e427ad48d5dd494366dde4f963.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6943916081995822387=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=r25c=mj=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g5Sx4-00067P-DP
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 09:51:18 +0000
In-Reply-To: <d8d276a20e4567e427ad48d5dd494366dde4f963.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Milan Boberic <milanboberic94@gmail.com>
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>, stefano@stabellini.net, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6943916081995822387==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-0elG4nmXMvnT5JX+QZx5"


--=-0elG4nmXMvnT5JX+QZx5
Content-Type: multipart/mixed; boundary="=-N0mEO6TRaJS/+lDFI5FZ"


--=-N0mEO6TRaJS/+lDFI5FZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-09-25 at 19:49 +0200, Dario Faggioli wrote:
> [Adding a few people to the Cc-list. See below...]
> On Tue, 2018-09-25 at 12:15 +0100, Julien Grall wrote:
> > On 09/25/2018 10:02 AM, Dario Faggioli wrote:
> > > On Mon, 2018-09-24 at 22:46 +0100, Julien Grall wrote:
> > > >=20
> My knowledge of RCU themselves would need refreshing, though. I
> managed
> to getbecome reasonably familiar with how the implementation we
> imported works back then, when working on the said issue, but I guess
> I
> better go check the code again.
>=20
> I'm Cc-ing the people that have reviewed the patches and helping with
> the idle timer problem, in case anyone has bright ideas out of the
> top
> of his head.
>=20
> Perhaps we should "just" get away from using RCU for domain
> destruction
> (but I'm just tossing the idea around, without much consideration
> about
> whether it's the right solution, or about how hard/feasible it really
> is).
>=20
> Or maybe we can still use the timer, in some special way, if we have
> wfi=3Dnative (or equivalent)...
>=20
So, I've had a look (but only a quick one).

If we want to do something specific within the domain destruction path,
we can add an rcu_barrier() there (I mean in domain_destroy()).
However, that does not feel right either. Also, how can we be sure that
the CPU never going through idle (as far as Xen knows, at least), isn't
going to be problem for other RCU calls as well?

Another thing that we can do is to act on the parameters that control
the threshold which decides when a quiescent state is forced. This was
basically what Julien was suggesting, but I still would avoid to do
that always.

So, basically, in this hackish patch attached, I added a new boot
command line argument, called rcu_force_quiesc. If set to true,
thresholds are set so that quiescence is always forced at each
invocation of call_rcu(). And even if the new param is not explicitly
specified, I do tweak the threshold when "wfi=3Dnative" is.

Milan, can you apply this patch, add "wfi=3Dnative" again, and re-test?
If it works, we'll decide what to do next.

E.g., we can expose the RCU threshold via the appropriate set of boot
time parameters --like Linux, from where this code comes, did/does--
and document how they should be set, if one wants to use "wfi=3Dnative".

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-N0mEO6TRaJS/+lDFI5FZ
Content-Disposition: attachment; filename="rcu-quiesc-patch.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="rcu-quiesc-patch.patch"; charset="UTF-8"

Y29tbWl0IDBkMmJlYjNkNDEyNWQ2NWM0MTU4NjBkNjY5NzRkYjlhNTUzMmFjODQKQXV0aG9yOiBE
YXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgpEYXRlOiAgIFdlZCBTZXAgMjYgMTE6
NDc6MDYgMjAxOCArMDIwMAoKICAgIHhlbjogUkNVOiBib290cGFyYW0gdG8gZm9yY2UgcXVpZXNj
ZW5jZSBhdCBldmVyeSBjYWxsLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBGYWdnaW9s
aSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5j
IGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKaW5kZXggMGY0YjFmMmE1ZC4uNTM2ZWIxNzAxNyAxMDA2
NDQKLS0tIGEveGVuL2FyY2gvYXJtL3RyYXBzLmMKKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMK
QEAgLTExMCw3ICsxMTAsMTAgQEAgc3RhdGljIGVudW0gewogc3RhdGljIGludCBfX2luaXQgcGFy
c2VfdndmaShjb25zdCBjaGFyICpzKQogewogCWlmICggIXN0cmNtcChzLCAibmF0aXZlIikgKQor
CXsKKwkJcmN1X2Fsd2F5c19xdWllc2MgPSB0cnVlOwogCQl2d2ZpID0gTkFUSVZFOworCX0KIAll
bHNlCiAJCXZ3ZmkgPSBUUkFQOwogCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3JjdXBkYXRlLmMg
Yi94ZW4vY29tbW9uL3JjdXBkYXRlLmMKaW5kZXggMzUxNzc5MDkxMy4uMjE5ZGQyODg0ZiAxMDA2
NDQKLS0tIGEveGVuL2NvbW1vbi9yY3VwZGF0ZS5jCisrKyBiL3hlbi9jb21tb24vcmN1cGRhdGUu
YwpAQCAtMTQwLDYgKzE0MCw5IEBAIHN0YXRpYyBpbnQgcWhpbWFyayA9IDEwMDAwOwogc3RhdGlj
IGludCBxbG93bWFyayA9IDEwMDsKIHN0YXRpYyBpbnQgcnNpbnRlcnZhbCA9IDEwMDA7CiAKK2Jv
b2wgcmN1X2Fsd2F5c19xdWllc2MgPSBmYWxzZTsKK2Jvb2xlYW5fcGFyYW0oInJjdV9mb3JjZV9x
dWllc2MiLCByY3VfYWx3YXlzX3F1aWVzYyk7CisKIHN0cnVjdCByY3VfYmFycmllcl9kYXRhIHsK
ICAgICBzdHJ1Y3QgcmN1X2hlYWQgaGVhZDsKICAgICBhdG9taWNfdCAqY3B1X2NvdW50OwpAQCAt
NTYyLDYgKzU2NSwxMyBAQCBzdGF0aWMgdm9pZCByY3VfaW5pdF9wZXJjcHVfZGF0YShpbnQgY3B1
LCBzdHJ1Y3QgcmN1X2N0cmxibGsgKnJjcCwKICAgICByZHAtPnF1aWVzY2JhdGNoID0gcmNwLT5j
b21wbGV0ZWQ7CiAgICAgcmRwLT5xc19wZW5kaW5nID0gMDsKICAgICByZHAtPmNwdSA9IGNwdTsK
KyAgICBpZiAoIHJjdV9hbHdheXNfcXVpZXNjICkKKyAgICB7CisgICAgICAgIGJsaW1pdCA9IElO
VF9NQVg7CisgICAgICAgIHFoaW1hcmsgPSAwOworICAgICAgICBxbG93bWFyayA9IDA7CisgICAg
ICAgIC8vcnNpbnRlcnZhbCA9IDA7CisgICAgfQogICAgIHJkcC0+YmxpbWl0ID0gYmxpbWl0Owog
ICAgIGluaXRfdGltZXIoJnJkcC0+aWRsZV90aW1lciwgcmN1X2lkbGVfdGltZXJfaGFuZGxlciwg
cmRwLCBjcHUpOwogfQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmggYi94
ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaAppbmRleCAzNDAyZWI1Y2FmLi4yNzRhMDFhY2Y2IDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaAorKysgYi94ZW4vaW5jbHVkZS94
ZW4vcmN1cGRhdGUuaApAQCAtNTYsNiArNTYsOCBAQCBzdHJ1Y3QgcmN1X2hlYWQgewogfSB3aGls
ZSAoMCkKIAogCitleHRlcm4gYm9vbCByY3VfYWx3YXlzX3F1aWVzYzsKKwogaW50IHJjdV9wZW5k
aW5nKGludCBjcHUpOwogaW50IHJjdV9uZWVkc19jcHUoaW50IGNwdSk7CiAK


--=-N0mEO6TRaJS/+lDFI5FZ--

--=-0elG4nmXMvnT5JX+QZx5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlusp/gACgkQFkJ4iaW4
c+6R1hAAkJA+8QcUHYu1QVpmpD/5hpxEQ0P8AI8xrIy4kTbnETHWKbpN3IFn21jp
zmJNpXnSJHIpxNaRnB4rXWLW/7ALp7umeHRYP5dg9g2Aay2QEDr6i4sd1/FxUfA9
ByD6kbiICqxnQ0SVDh0RJIHJvHcMHALucaSVy+ZnTQ6s/3kxYNWNJToykf91cm5d
p+g6qSw+ZReBheco6NAVPULieCnVq8KLQa5GB8IxwKwX7bK0WTwXrEuWzGYAyaXC
SEAkTNDyBkzxrH1uysOFt7ilwT+gcbK+rY0DV5NpoC2FJrYCDhJ4qXXKYsRjaotj
W27ueijs6pVhtW0EfdbNAxxJlusLQ7sttQmcvDFwpqkaStHtqaT3rQAfIMxon5fq
4SsJYpZQB3MbBtpdYRDZrh2Wkz+KYRzuBycJF1vgeuG90z/vG8132LluX31ndbmQ
1zZjKAgUT0xazIxi1yrOGACYDKmHQXPNgx9GCZ5QlIMucMZljVsew/lwKj4i94lZ
TRXChl/bRGtsG/j5LurqAC8udzZBD09GTV7VeBRYpSO0kWKB9Nwct9UkurDRsqrf
UYUs2n9QvoSjF4BBzA+AdQzpGYzZGkQzhNNzJTyyLrvW+fbTwQM0Mfy9v+DdJV8z
7h8+US75xEXxPUeBXOLnrVfTvzYkw8dc07Ci2HgY0PnNy9VIR58=
=K8M8
-----END PGP SIGNATURE-----

--=-0elG4nmXMvnT5JX+QZx5--



--===============6943916081995822387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6943916081995822387==--
