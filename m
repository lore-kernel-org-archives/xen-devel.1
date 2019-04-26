From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 08/15] arch replumbing: make-flight: Fix
 $r{arch} comment
Date: Fri, 26 Apr 2019 17:39:55 +0100
Message-ID: <20190426164002.22381-9-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3ul-00087i-55
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:31 +0000
In-Reply-To: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBjb21tZW50IHdhcyBsYW1lbnRpbmcgdGhlIHZlcnkgcHJvYmxlbSB3ZSBhcmUgZml4aW5n
IG5vdy4gIEl0CndvdWxkIG5vdyBiZSBwb3NzaWJsZSB0byB0ZXN0IGkzODYtPmFtZDY0IHRvb2xz
IG1pZ3JhdGlvbiwgYnkgd3JpdGluZwphbiBhcHByb3ByaWF0ZSB0ZXN0IGpvYiB3aXRoIGRpZmZl
cmVudCBzcmNfaG9zdF9hcmNoIGFuZApkc3RfaG9zdF9hcmNoIGV0Yy4KClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1ha2UtZmxpZ2h0
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL21ha2UtZmxpZ2h0IGIvbWFrZS1mbGlnaHQKaW5kZXggYzU0MTE0MTIu
LjAyMGFkNWYxIDEwMDc1NQotLS0gYS9tYWtlLWZsaWdodAorKysgYi9tYWtlLWZsaWdodApAQCAt
ODMzLDggKzgzMyw4IEBAIHRlc3RfbWF0cml4X2RvX29uZSAoKSB7CiAgICAgICAgICAgICAgICAg
ICAgICAgYWxsX2hvc3RmbGFncz0iJGhmIgogICAgICAgZmkKICAgICAgICMgVE9ETyBpdCB3b3Vs
ZCBiZSBuaWNlIHRvIHRlc3QgaTM4Ni0+YW1kNjQgdG9vbHMgbWlncmF0aW9uIHRvbyAoZm9yCi0g
ICAgICAjIFhlbiA+PSA0LjYpLCBidXQgY3VycmVudGx5ICRye2FyY2h9IGlzIHVzZWQgaW4gc2V2
ZXJhbCBwbGFjZXMsCi0gICAgICAjIHdoaWNoIHdvdWxkIG5lZWQgbG9va2luZyBhdC4KKyAgICAg
ICMgWGVuID49IDQuNikuICBQcmV2aW91c2x5ICRye2FyY2h9IHdhcyB1c2VkIGluIHNldmVyYWwg
cGxhY2VzLAorICAgICAgIyB3aGljaCBtYWRlIHRoaXMgbW9yZSBjb21wbGljYXRlZCwgYnV0IHRo
aXMgaXMgbm93IGZpeGVkLgogICBmaQogCiAgIGlmIFsgeCR0ZXN0X3B2aCA9IHh5IC1hICR4ZW5h
cmNoID0gYW1kNjQgLWEgJGRvbTBhcmNoID0gYW1kNjQgXTsgdGhlbgotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
