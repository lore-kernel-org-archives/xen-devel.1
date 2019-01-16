From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 3/3] ts-livepatch-run: Fix erroneous $$
 in double-check
Date: Wed, 16 Jan 2019 11:36:37 +0000
Message-ID: <20190116113637.10819-3-ian.jackson@eu.citrix.com>
References: <20190116113637.10819-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2owm=PY=citrix.com=prvs=912d934db=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gjjVD-0002jB-33
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 11:36:59 +0000
In-Reply-To: <20190116113637.10819-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGRvdWJsZWQgJHMgaGVyZSBhcmUgc2ltcGx5IGEgbWlzdGFrZS4gIFRoZSByZXN1bHQgaXMg
dG8gbWFrZSB0aGlzCnRlc3QgaW5lZmZlY3RpdmUsIHNpbmNlIGAkJGZpbGUnIG1lYW5zIGB0aGUg
dmFsdWUgb2YgdGhlIHZhcmlhYmxlCndob3NlIG5hbWUgaXMgaW4gdGhlIHZhcmlhYmxlICRmaWxl
Jywgd2hpY2ggaGVyZSB3aWxsIG5ldmVyIGV4aXN0LgpUaGlzIHByb2R1Y2VzIGEgYFVzZSBvZiB1
bmluaXRpYWxpemVkIHZhbHVlJyB3YXJuaW5nIGFuZCBzdWJzdGl0dXRlcwp0aGUgZW1wdHkgc3Ry
aW5nLCBzbyBvdmVyYWxsIHdlIHRlc3QgdGhlIGV4aXN0ZW5jZSBvZiB0aGUgZGlyZWN0b3J5LgoK
VGhlIG1pc3NpbmcgY2hlY2sgaXMgbm90IG9mIG11Y2ggY29uc2VxdWVuY2Ugc2luY2UgdGhpcyBj
aGVjayBpcyBub3QKcmVhbGx5IGV4cGVjdGVkIGV2ZXIgdG8gZmFpbCwgYW5kIGlmIGl0IGRvZXMs
IHNvbWUgYWN0dWFsIHRlc3QKZXhlY3V0aW9uIHdvdWxkIGZhaWwgZHVlIHRvIHRoZSBtaXNzaW5n
IGZpbGUuCgpTbyBvdmVyYWxsIEkgdGhpbmsgdGhlIG9ubHkgY2hhbmdlIGlzIHRvIGxvZyBvdXRw
dXQuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KLS0t
CiB0cy1saXZlcGF0Y2gtcnVuIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdHMtbGl2ZXBhdGNoLXJ1biBiL3RzLWxpdmVw
YXRjaC1ydW4KaW5kZXggZjAxMWU2NGUuLjg2YTc5NzkxIDEwMDc1NQotLS0gYS90cy1saXZlcGF0
Y2gtcnVuCisrKyBiL3RzLWxpdmVwYXRjaC1ydW4KQEAgLTE2MSw3ICsxNjEsNyBAQCBzdWIgbGl2
ZXBhdGNoX3Rlc3QgKCkgewogCiBzdWIgbGl2ZXBhdGNoX2NoZWNrICgpIHsKICAgICBmb3JlYWNo
IG15ICRmaWxlIChAbGl2ZXBhdGNoX2ZpbGVzKSB7Ci0gICAgICAgIGlmICghdGFyZ2V0X2ZpbGVf
ZXhpc3RzKCRobywgIi91c3IvbGliL2RlYnVnL3hlbi1saXZlcGF0Y2gvJCRmaWxlIikpIHsKKyAg
ICAgICAgaWYgKCF0YXJnZXRfZmlsZV9leGlzdHMoJGhvLCAiL3Vzci9saWIvZGVidWcveGVuLWxp
dmVwYXRjaC8kZmlsZSIpKSB7CiAgICAgICAgICAgICBkaWUgIiRmaWxlIGlzIG1pc3NpbmchXG4i
OwogICAgICAgICB9CiAgICAgfQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
