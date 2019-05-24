From: Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] gitignore: Ignore xen.lds and asm-offsets.s for
 all archs
Date: Thu, 23 May 2019 17:56:21 -0700
Message-ID: <20190524005621.12618-1-alistair.francis@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zWpd=TY=wdc.com=prvs=040baf4f1=alistair.francis@srs-us1.protection.inumbo.net>)
 id 1hTyXk-0006N9-QH
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 00:58:45 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, Alistair Francis <alistair.francis@wdc.com>, jbeulich@suse.com, andrew.cooper3@citrix.com, alistair23@gmail.com
List-Id: xen-devel@lists.xenproject.org

SW5zdGVhZCBvZiBpZ25vcmluZyB4ZW4ubGRzIGFuZCBhc20tb2Zmc2V0cy5zIGZvciBldmVyeSBz
cGVjaWZpYyBhcmNoLApsZXQncyBpbnN0ZWFkIGp1c3QgdXNlIGdpdGlnbm9yZSdzIHdpbGRjYXJk
IGZlYXR1cmUgdG8gaWdub3JlIHRoZW0gZm9yCmFsbCBhcmNocy4KClNpZ25lZC1vZmYtYnk6IEFs
aXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4KLS0tCiAuZ2l0aWdub3Jl
IHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvLmdpdGlnbm9yZSBiLy5naXRpZ25vcmUKaW5kZXggMDQ5Y2NiODdl
MS4uYTc3Y2JmZjAyYyAxMDA2NDQKLS0tIGEvLmdpdGlnbm9yZQorKysgYi8uZ2l0aWdub3JlCkBA
IC0yNzksMTIgKzI3OSw4IEBAIHhlbi8uYmFubmVyCiB4ZW4vLmNvbmZpZwogeGVuLy5jb25maWcu
b2xkCiB4ZW4vU3lzdGVtLm1hcAoteGVuL2FyY2gvYXJtL2FzbS1vZmZzZXRzLnMKLXhlbi9hcmNo
L2FybS94ZW4ubGRzCiB4ZW4vYXJjaC94ODYvYXNtLW1hY3Jvcy5pCi14ZW4vYXJjaC94ODYvYXNt
LW9mZnNldHMucwogeGVuL2FyY2gveDg2L2Jvb3QvbWtlbGYzMgoteGVuL2FyY2gveDg2L3hlbi5s
ZHMKIHhlbi9hcmNoL3g4Ni9ib290L2NtZGxpbmUuUwogeGVuL2FyY2gveDg2L2Jvb3QvcmVsb2Mu
UwogeGVuL2FyY2gveDg2L2Jvb3QvKi5iaW4KQEAgLTI5Miw2ICsyODgsOCBAQCB4ZW4vYXJjaC94
ODYvYm9vdC8qLmxuawogeGVuL2FyY2gveDg2L2VmaS5sZHMKIHhlbi9hcmNoL3g4Ni9lZmkvY2hl
Y2suZWZpCiB4ZW4vYXJjaC94ODYvZWZpL21rcmVsb2MKK3hlbi9hcmNoLyoveGVuLmxkcworeGVu
L2FyY2gvKi9hc20tb2Zmc2V0cy5zCiB4ZW4vYXJjaC8qL2VmaS9ib290LmMKIHhlbi9hcmNoLyov
ZWZpL2NvbXBhdC5jCiB4ZW4vYXJjaC8qL2VmaS9lZmkuaAotLSAKMi4yMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
