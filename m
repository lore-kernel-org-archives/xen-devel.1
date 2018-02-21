From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 10/10] x86: check hvm domain before calling
	pt_irq_destroy_bind
Date: Wed, 21 Feb 2018 21:47:01 +0000
Message-ID: <20180221214701.1646-11-wei.liu2@citrix.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=igdh=fp=citrix.com=prvs=5836394aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eocPJ-0003Wt-JX
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2018 21:58:33 +0000
In-Reply-To: <20180221214701.1646-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

Li4uIGp1c3QgbGlrZSBpdHMgY291bnRlciBwYXJ0IGJlY2F1c2UgdGhhdCBmdW5jdGlvbiBpcyBI
Vk0gb25seS4KClRoZXJlIGlzIG5vIHJpc2sgb2YgY29ycnVwdGlvbiBiZWNhdXNlIHB0X2lycV9k
ZXN0cm95X2JpbmQgYWxyZWFkeSBoYXMKcHJvcGVyIGNoZWNrIGluIHBsYWNlLCBidXQgaXQgd291
bGQgYmUgbmljZSB0byBiZSBtb3JlIGV4cGxpY2l0IGJlZm9yZQpjYWxsaW5nIHRoZSBzYWlkIGZ1
bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0t
CiB4ZW4vYXJjaC94ODYvZG9tY3RsLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMgYi94ZW4vYXJjaC94
ODYvZG9tY3RsLmMKaW5kZXggOGZiYmYzYWViMy4uMDdiN2Q0MWI2NiAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2RvbWN0bC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwpAQCAtNzA3LDYg
KzcwNywxMCBAQCBsb25nIGFyY2hfZG9fZG9tY3RsKAogICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0
bF9iaW5kX3B0X2lycSAqYmluZCA9ICZkb21jdGwtPnUuYmluZF9wdF9pcnE7CiAgICAgICAgIGlu
dCBpcnEgPSBkb21haW5fcGlycV90b19pcnEoZCwgYmluZC0+bWFjaGluZV9pcnEpOwogCisgICAg
ICAgIHJldCA9IC1FSU5WQUw7CisgICAgICAgIGlmICggIWlzX2h2bV9kb21haW4oZCkgKQorICAg
ICAgICAgICAgYnJlYWs7CisKICAgICAgICAgcmV0ID0gLUVQRVJNOwogICAgICAgICBpZiAoIGly
cSA8PSAwIHx8ICFpcnFfYWNjZXNzX3Blcm1pdHRlZChjdXJyZCwgaXJxKSApCiAgICAgICAgICAg
ICBicmVhazsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
