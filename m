From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 16/34] x86/hvm: enclose hvm_enabled and
 hvm_funcs in CONFIG_HVM
Date: Fri, 17 Aug 2018 16:12:34 +0100
Message-ID: <f0815f2aea320a634f63f503534d0e8abdc2c1ee.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqggP-0001wE-Tc
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:29:01 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBoZWxwcyB0byB0YWtlIGFkdmFudGFnZSBvZiBkZWFkIGNvZGUgZWxpbWluYXRpb24uIFR1
cm4KaHZtX2VuYWJsZWQgaW50byBwcm9wZXIgYm9vbCB3aGlsZSBhdCBpdC4KClByb3ZpZGluZyBh
biBlbXB0eSBodm1fZnVuY3MgcmVzb2x2ZXMgYSBsb3Qgb2YgdW5kZWZpbmVkIHJlZmVyZW5jZXMg
dG8KaXQgaW4gdGhlIGhlYWRlci4gSXQgaXMgc2FmZSB0byBkbyBzbyBiZWNhdXNlIHRob3NlIGZ1
bmN0aW9ucyAvIG1hY3JvcwphcmUgbm90IGV4cGVjdGVkIHRvIGJlIHVzZWQuCgpTaWduZWQtb2Zm
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9pbmNsdWRlL2FzbS14
ODYvaHZtL2h2bS5oIHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2
bS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKaW5kZXggMTQ2NzIwYy4uYjNiYzhk
MiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKQEAgLTIzNCw4ICsyMzQsMTQgQEAgc3RydWN0IGh2bV9m
dW5jdGlvbl90YWJsZSB7CiAgICAgfSB0c2Nfc2NhbGluZzsKIH07CiAKKyNpZiBDT05GSUdfSFZN
CitleHRlcm4gYm9vbCBodm1fZW5hYmxlZDsKIGV4dGVybiBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3Rh
YmxlIGh2bV9mdW5jczsKLWV4dGVybiBib29sX3QgaHZtX2VuYWJsZWQ7CisjZWxzZQorI2RlZmlu
ZSBodm1fZW5hYmxlZCBmYWxzZQorc3RhdGljIHN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgaHZt
X2Z1bmNzID0ge307CisjZW5kaWYKKwogZXh0ZXJuIHM4IGh2bV9wb3J0ODBfYWxsb3dlZDsKIAog
ZXh0ZXJuIGNvbnN0IHN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgKnN0YXJ0X3N2bSh2b2lkKTsK
LS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
