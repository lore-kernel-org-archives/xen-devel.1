From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH 3/6] xen/pvshim: identity pin shim vCPUs to
	pCPUs
Date: Wed, 24 Jan 2018 18:03:28 +0000
Message-ID: <CAFLBxZaU48jzDX91CByN4jBShmB_fAXi=rYVLWsm3cwz8=6uHQ@mail.gmail.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="001a114b4eda1141c00563897b7b"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=kyrb=et=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1eePOV-0006B2-V6
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 18:03:32 +0000
Received: by mail-qt0-x22b.google.com with SMTP id d54so12619289qtd.4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2018 10:03:30 -0800 (PST)
In-Reply-To: <20180117094814.32772-4-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--001a114b4eda1141c00563897b7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2018 at 9:48 AM, Roger Pau Monne <roger.pau@citrix.com> wro=
te:
> Since VCPUOP_{up/down} already identity pins vCPU hotplug to pCPU
> hotplug also pin the vCPUs to the pCPUs in the scheduler. This prevent
> vCPU migration and should improve performance.
>
> While there also use __cpumask_set_cpu instead of cpumask_set_cpu,
> there's no need to use the locked variant.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Sorry, I just realized this -- we already have a way to pin a VM 1:1
-- d->is_pinned should do what you want here without having to
special-case the pvshim.

It seems like something like the attached might be better (compile-tested o=
nly).

 -George

--001a114b4eda1141c00563897b7b
Content-Type: text/x-patch; charset="US-ASCII";
	name="0001-x86-shim-Use-d-is_pinned-to-pin-the-shim.patch"
Content-Disposition: attachment;
	filename="0001-x86-shim-Use-d-is_pinned-to-pin-the-shim.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jctdof910

RnJvbSBlNjA5NGI5ZDYxYjk5YTNmZGJkNjQ4ZDljZWZiNzE5NDM2OTcyZjg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+CkRhdGU6IFdlZCwgMjQgSmFuIDIwMTggMTc6NTg6MzkgKzAwMDAKU3ViamVjdDogW1BBVENI
XSB4ODYvc2hpbTogVXNlIGQtPmlzX3Bpbm5lZCB0byBwaW4gdGhlIHNoaW0KClJhdGhlciB0aGFu
IHNwZWNpYWwtY2FzaW5nIGl0IGluc2lkZSBkb20wX3NldHVwX3ZjcHUoKQoKU2lnbmVkLW9mZi1i
eTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNo
L3g4Ni9kb20wX2J1aWxkLmMgfCAxNCArKystLS0tLS0tLS0tLQogeGVuL2NvbW1vbi9kb21haW4u
YyAgICAgICB8ICA2ICsrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgYi94
ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCmluZGV4IDU1NTY2MGI4NTMuLjQ4M2NiNmNlZTkgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gveDg2L2Rv
bTBfYnVpbGQuYwpAQCAtMTM4LDE3ICsxMzgsOSBAQCBzdHJ1Y3QgdmNwdSAqX19pbml0IGRvbTBf
c2V0dXBfdmNwdShzdHJ1Y3QgZG9tYWluICpkLAogCiAgICAgaWYgKCB2ICkKICAgICB7Ci0gICAg
ICAgIGlmICggcHZfc2hpbSApCi0gICAgICAgIHsKLSAgICAgICAgICAgIF9fY3B1bWFza19zZXRf
Y3B1KHZjcHVfaWQsIHYtPmNwdV9oYXJkX2FmZmluaXR5KTsKLSAgICAgICAgICAgIF9fY3B1bWFz
a19zZXRfY3B1KHZjcHVfaWQsIHYtPmNwdV9zb2Z0X2FmZmluaXR5KTsKLSAgICAgICAgfQotICAg
ICAgICBlbHNlCi0gICAgICAgIHsKLSAgICAgICAgICAgIGlmICggIWQtPmlzX3Bpbm5lZCAmJiAh
ZG9tMF9hZmZpbml0eV9yZWxheGVkICkKLSAgICAgICAgICAgICAgICBjcHVtYXNrX2NvcHkodi0+
Y3B1X2hhcmRfYWZmaW5pdHksICZkb20wX2NwdXMpOwotICAgICAgICAgICAgY3B1bWFza19jb3B5
KHYtPmNwdV9zb2Z0X2FmZmluaXR5LCAmZG9tMF9jcHVzKTsKLSAgICAgICAgfQorICAgICAgICBp
ZiAoICFkLT5pc19waW5uZWQgJiYgIWRvbTBfYWZmaW5pdHlfcmVsYXhlZCApCisgICAgICAgICAg
ICBjcHVtYXNrX2NvcHkodi0+Y3B1X2hhcmRfYWZmaW5pdHksICZkb20wX2NwdXMpOworICAgICAg
ICBjcHVtYXNrX2NvcHkodi0+Y3B1X3NvZnRfYWZmaW5pdHksICZkb20wX2NwdXMpOwogICAgIH0K
IAogICAgIHJldHVybiB2OwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9j
b21tb24vZG9tYWluLmMKaW5kZXggNTU4MzE4ZTg1Mi4uNGNlNzk4MDU1MCAxMDA2NDQKLS0tIGEv
eGVuL2NvbW1vbi9kb21haW4uYworKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCkBAIC0zMTgsNyAr
MzE4LDExIEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9taWRfdCBkb21pZCwgdW5z
aWduZWQgaW50IGRvbWNyX2ZsYWdzLAogICAgIHsKICAgICAgICAgaWYgKCBoYXJkd2FyZV9kb21p
ZCA8IDAgfHwgaGFyZHdhcmVfZG9taWQgPj0gRE9NSURfRklSU1RfUkVTRVJWRUQgKQogICAgICAg
ICAgICAgcGFuaWMoIlRoZSB2YWx1ZSBvZiBoYXJkd2FyZV9kb20gbXVzdCBiZSBhIHZhbGlkIGRv
bWFpbiBJRCIpOwotICAgICAgICBkLT5pc19waW5uZWQgPSBvcHRfZG9tMF92Y3B1c19waW47Cisg
ICAgICAgIGQtPmlzX3Bpbm5lZCA9CisjaWZkZWYgQ09ORklHX1g4NgorICAgICAgICAgICAgcHZf
c2hpbSA/IHRydWUgOgorI2VuZGlmCisgICAgICAgICAgICBvcHRfZG9tMF92Y3B1c19waW47CiAg
ICAgICAgIGQtPmRpc2FibGVfbWlncmF0ZSA9IDE7CiAgICAgICAgIG9sZF9od2RvbSA9IGhhcmR3
YXJlX2RvbWFpbjsKICAgICAgICAgaGFyZHdhcmVfZG9tYWluID0gZDsKLS0gCjIuMTUuMQoK
--001a114b4eda1141c00563897b7b
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--001a114b4eda1141c00563897b7b--
