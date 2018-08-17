From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 14/34] x86/pt: add HVM check to
 XEN_DOMCTL_unbind_pt_irq
Date: Fri, 17 Aug 2018 16:12:32 +0100
Message-ID: <8dbf18b054300318c8e74dac8c43fadb5895c16c.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqggI-0001j5-WE
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:28:55 +0000
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

SXRzIGNvdW50ZXJwYXJ0IGlzIEhWTSBvbmx5LiBBZGQgdGhlIGNoZWNrIHRvIGhlbHAgZGVhZCBj
b2RlCmVsaW1pbmF0aW9uIHRvIGZpZ3VyZSBvdXQgdGhlIGNhbGwgdG8gcHRfaXJxX2Rlc3Ryb3lf
YmluZCBpcyBub3QKbmVlZGVkIHdoZW4gSFZNIGlzIG5vdCBlbmFibGVkLgoKU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZG9tY3Rs
LmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvZG9tY3RsLmMgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKaW5kZXggYTgz
MjVmNS4uNDg2OWU4OCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbWN0bC5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9kb21jdGwuYwpAQCAtNzE1LDYgKzcxNSwxMCBAQCBsb25nIGFyY2hfZG9fZG9t
Y3RsKAogICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9iaW5kX3B0X2lycSAqYmluZCA9ICZkb21j
dGwtPnUuYmluZF9wdF9pcnE7CiAgICAgICAgIGludCBpcnEgPSBkb21haW5fcGlycV90b19pcnEo
ZCwgYmluZC0+bWFjaGluZV9pcnEpOwogCisgICAgICAgIHJldCA9IC1FSU5WQUw7CisgICAgICAg
IGlmICggIWlzX2h2bV9kb21haW4oZCkgKQorICAgICAgICAgICAgYnJlYWs7CisKICAgICAgICAg
cmV0ID0gLUVQRVJNOwogICAgICAgICBpZiAoIGlycSA8PSAwIHx8ICFpcnFfYWNjZXNzX3Blcm1p
dHRlZChjdXJyZCwgaXJxKSApCiAgICAgICAgICAgICBicmVhazsKLS0gCmdpdC1zZXJpZXMgMC45
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
