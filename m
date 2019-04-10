From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 32/62] ts-kernel-build: Enable some
 additional drivers for Thunder-X
Date: Wed, 10 Apr 2019 15:23:38 +0100
Message-ID: <20190410142408.22848-33-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAL-0006U4-R5
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:29 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
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

V2l0aG91dCB0aGlzLCBvdXIga2VybmVscyBkbyBub3QgZmluZCB0aGUgc3RvcmFnZS4KClN1Z2dl
c3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KU2lnbmVkLW9mZi1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMta2VybmVs
LWJ1aWxkIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvdHMta2VybmVsLWJ1aWxkIGIvdHMta2VybmVsLWJ1aWxkCmluZGV4IDBi
YzQ0M2RlLi4zZGFkN2QzNiAxMDA3NTUKLS0tIGEvdHMta2VybmVsLWJ1aWxkCisrKyBiL3RzLWtl
cm5lbC1idWlsZApAQCAtMjQyLDYgKzI0MiwxNyBAQCBzZXRvcHQgQ09ORklHX01NQ19EVyBtCiBz
ZXRvcHQgQ09ORklHX01NQ19EV19FWFlOT1MgbQogc2V0b3B0IENPTkZJR19SRUdVTEFUT1JfUzVN
ODc2NyBtCiAKKyMgRW5hYmxlIHNvbWUgYWRkaXRvbmFsIGRyaXZlcnMgZm9yIFRodW5kZXItWAor
c2V0b3B0IENPTkZJR19QQ0lfSE9TVF9USFVOREVSX1BFTT15CitzZXRvcHQgQ09ORklHX1BDSV9I
T1NUX1RIVU5ERVJfRUNBTT15CitzZXRvcHQgQ09ORklHX1RIVU5ERVJfTklDX1BGPW0KK3NldG9w
dCBDT05GSUdfVEhVTkRFUl9OSUNfVkY9bQorc2V0b3B0IENPTkZJR19USFVOREVSX05JQ19CR1g9
bQorc2V0b3B0IENPTkZJR19USFVOREVSX05JQ19SR1g9bQorc2V0b3B0IENPTkZJR19NRElPX1RI
VU5ERVI9bQorc2V0b3B0IENPTkZJR19JMkNfVEhVTkRFUlg9bQorc2V0b3B0IENPTkZJR19TUElf
VEhVTkRFUlg9bQorCiAjIyMjCiAKIEVORAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
