From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/6] x86/xpti: don't flush TLB twice when
	switching to 64-bit pv context
Date: Fri,  2 Mar 2018 09:13:59 +0100
Message-ID: <20180302081403.16953-3-jgross@suse.com>
References: <20180302081403.16953-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wrb9=fy=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1erfpS-0004HY-Ll
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 08:14:10 +0000
In-Reply-To: <20180302081403.16953-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, andrew.cooper3@citrix.com, wei.liu2@citrix.com, jbeulich@suse.com, dfaggioli@suse.com
List-Id: xen-devel@lists.xenproject.org

V2hlbiBzd2l0Y2hpbmcgdG8gYSA2NC1iaXQgcHYgY29udGV4dCB0aGUgVExCIGlzIGZsdXNoZWQg
dHdpY2UgdG9kYXk6CnRoZSBmaXJzdCB0aW1lIHdoZW4gc3dpdGNoaW5nIHRvIHRoZSBuZXcgYWRk
cmVzcyBzcGFjZSBpbgp3cml0ZV9wdGJhc2UoKSwgdGhlIHNlY29uZCB0aW1lIHdoZW4gc3dpdGNo
aW5nIHRvIGd1ZXN0IG1vZGUgaW4KcmVzdG9yZV90b19ndWVzdC4KCkF2b2lkIHRoZSBmaXJzdCBU
TEIgZmx1c2ggaW4gdGhhdCBjYXNlLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgMTQgKysrKysrKysrKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggZmRjMTYz
NjgxNy4uY2Y1MTJlZTMwNiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVu
L2FyY2gveDg2L21tLmMKQEAgLTEyMyw2ICsxMjMsNyBAQAogI2luY2x1ZGUgPGFzbS9pb19hcGlj
Lmg+CiAjaW5jbHVkZSA8YXNtL3BjaS5oPgogI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgorI2luY2x1
ZGUgPGFzbS9wcm9jZXNzb3IuaD4KIAogI2luY2x1ZGUgPGFzbS9odm0vZ3JhbnRfdGFibGUuaD4K
ICNpbmNsdWRlIDxhc20vcHYvZ3JhbnRfdGFibGUuaD4KQEAgLTUwOSw5ICs1MTAsMTYgQEAgdm9p
ZCBtYWtlX2NyMyhzdHJ1Y3QgdmNwdSAqdiwgbWZuX3QgbWZuKQogCiB2b2lkIHdyaXRlX3B0YmFz
ZShzdHJ1Y3QgdmNwdSAqdikKIHsKLSAgICBnZXRfY3B1X2luZm8oKS0+cm9vdF9wZ3RfY2hhbmdl
ZCA9IHRoaXNfY3B1KHJvb3RfcGd0KSAmJiBpc19wdl92Y3B1KHYpICYmCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAhaXNfcHZfMzJiaXRfdmNwdSh2KTsKLSAgICB3cml0
ZV9jcjModi0+YXJjaC5jcjMpOworICAgIGlmICggdGhpc19jcHUocm9vdF9wZ3QpICYmIGlzX3B2
X3ZjcHUodikgJiYgIWlzX3B2XzMyYml0X3ZjcHUodikgKQorICAgIHsKKyAgICAgICAgZ2V0X2Nw
dV9pbmZvKCktPnJvb3RfcGd0X2NoYW5nZWQgPSB0cnVlOworICAgICAgICBhc20gdm9sYXRpbGUg
KCAibW92ICUwLCAlJWNyMyIgOiA6ICJyIiAodi0+YXJjaC5jcjMpIDogIm1lbW9yeSIgKTsKKyAg
ICB9CisgICAgZWxzZQorICAgIHsKKyAgICAgICAgZ2V0X2NwdV9pbmZvKCktPnJvb3RfcGd0X2No
YW5nZWQgPSBmYWxzZTsKKyAgICAgICAgd3JpdGVfY3IzKHYtPmFyY2guY3IzKTsKKyAgICB9CiB9
CiAKIC8qCi0tIAoyLjEzLjYKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
