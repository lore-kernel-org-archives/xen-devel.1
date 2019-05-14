From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH MM-PART3 v2 04/12] xen/arm: mm: Only increment
 mfn when valid in xen_pt_update
Date: Tue, 14 May 2019 13:31:17 +0100
Message-ID: <20190514123125.29086-5-julien.grall@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWao-0005Le-0o
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:31:38 +0000
In-Reply-To: <20190514123125.29086-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudGx5LCB0aGUgTUZOIHdpbGwgYmUgaW5jcmVtZW50ZWQgZXZlbiBpZiBpdCBpcyBpbnZh
bGlkLiBUaGlzIHdpbGwKcmVzdWx0IHRvIGhhdmUgYSB2YWxpZCBNRk4gYWZ0ZXIgdGhlIGZpcnN0
IGl0ZXJhdGlvbi4KCldoaWxlIHRoaXMgaXMgbm90IGEgbWFqb3IgcHJvYmxlbSB0b2RheSwgdGhp
cyB3aWxsIGJlIGluIHRoZSBmdXR1cmUgaWYKdGhlIGNvZGUgZXhwZWN0IGFuIGludmFsaWQgTUZO
IGF0IGV2ZXJ5IGl0ZXJhdGlvbi4KClN1Y2ggYmVoYXZpb3IgaXMgcHJldmVudGVkIGJ5IGF2b2lk
aW5nIHRvIGluY3JlbWVudCBhbiBpbnZhbGlkIE1GTi4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxh
bmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0g
TW92ZSB0aGUgcGF0Y2ggZWFybGllciBvbiBpbiB0aGUgc2VyaWVzCiAgICAgICAgLSBBZGQgQW5k
cmlpJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4vYXJjaC9hcm0vbW0uYyB8IDUgKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCmluZGV4IGY5NTZhYTYzOTkuLjlk
ZTJhMTE1MGYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCisrKyBiL3hlbi9hcmNoL2Fy
bS9tbS5jCkBAIC0xMDUxLDExICsxMDUxLDE0IEBAIHN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZShl
bnVtIHhlbm1hcF9vcGVyYXRpb24gb3AsCiAKICAgICBzcGluX2xvY2soJnhlbl9wdF9sb2NrKTsK
IAotICAgIGZvcig7IGFkZHIgPCBhZGRyX2VuZDsgYWRkciArPSBQQUdFX1NJWkUsIG1mbiA9IG1m
bl9hZGQobWZuLCAxKSkKKyAgICBmb3IoIDsgYWRkciA8IGFkZHJfZW5kOyBhZGRyICs9IFBBR0Vf
U0laRSApCiAgICAgewogICAgICAgICByYyA9IHhlbl9wdF91cGRhdGVfZW50cnkob3AsIGFkZHIs
IG1mbiwgZmxhZ3MpOwogICAgICAgICBpZiAoIHJjICkKICAgICAgICAgICAgIGJyZWFrOworCisg
ICAgICAgIGlmICggIW1mbl9lcShtZm4sIElOVkFMSURfTUZOKSApCisgICAgICAgICAgICBtZm4g
PSBtZm5fYWRkKG1mbiwgMSk7CiAgICAgfQogCiAgICAgLyoKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
