From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 12/17] x86: connect guest creation with CONFIG_PV
Date: Thu, 4 Oct 2018 16:43:31 +0100
Message-ID: <634275404c9298c745b46553cea911cc4b29f853.1538667753.git-series.wei.liu2@citrix.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a7fh=mq=citrix.com=prvs=808c92aaa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g861O-0007KN-NJ
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:58:38 +0000
In-Reply-To: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBhIGJpdCBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gdGhlIEhWTSBjYXNlIGJlY2F1c2Ug
c3lzdGVtCmRvbWFpbnMgaGF2ZSBQViBndWVzdCB0eXBlLgoKSW5zdGVhZCBvZiBpbnZlbnRpbmcg
YSBuZXcgZ3Vlc3QgdHlwZSwgd2Ugc3RpbGwgc2V0IHN5c3RlbSBkb21haW5zJwp0eXBlIHRvIFBW
LiBUaGlzIHNob3VsZG4ndCByZWFsbHkgbWF0dGVyIGluIHByYWN0aWNlLgoKU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5j
IHwgMjEgKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5jIGIv
eGVuL2NvbW1vbi9kb21haW4uYwppbmRleCA2NTE1MWUyLi44YTQ2OThmIDEwMDY0NAotLS0gYS94
ZW4vY29tbW9uL2RvbWFpbi5jCisrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKQEAgLTMyMiwxNyAr
MzIyLDM0IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9taWRfdCBkb21pZCwKICAg
ICB9CiAKICAgICAvKiBTb3J0IG91dCBvdXIgaWRlYSBvZiBpc197cHYsaHZtfV9kb21haW4oKS4g
Ki8KLSAgICBpZiAoIGNvbmZpZyAmJiAoY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2h2
bV9ndWVzdCkgKQorICAgIGlmICggY29uZmlnICkKICAgICB7CisgICAgICAgIEFTU0VSVCghaXNf
c3lzdGVtX2RvbWFpbihkKSk7CisgICAgICAgIGlmICggY29uZmlnLT5mbGFncyAmIFhFTl9ET01D
VExfQ0RGX2h2bV9ndWVzdCkKKyAgICAgICAgewogI2lmZGVmIENPTkZJR19IVk0KLSAgICAgICAg
ZC0+Z3Vlc3RfdHlwZSA9IGd1ZXN0X3R5cGVfaHZtOworICAgICAgICAgICAgZC0+Z3Vlc3RfdHlw
ZSA9IGd1ZXN0X3R5cGVfaHZtOworI2Vsc2UKKyAgICAgICAgICAgIGVyciA9IC1FSU5WQUw7Cisg
ICAgICAgICAgICBnb3RvIGZhaWw7CisjZW5kaWYKKyAgICAgICAgfQorICAgICAgICBlbHNlCisg
ICAgICAgIHsKKyNpZmRlZiBDT05GSUdfUFYKKyAgICAgICAgZC0+Z3Vlc3RfdHlwZSA9IGd1ZXN0
X3R5cGVfcHY7CiAjZWxzZQogICAgICAgICBlcnIgPSAtRUlOVkFMOwogICAgICAgICBnb3RvIGZh
aWw7CiAjZW5kaWYKKyAgICAgICAgfQogICAgIH0KICAgICBlbHNlCisgICAgeworICAgICAgICAv
KiBUaGUgdHlwZSBvZiBzeXN0ZW0gZG9tYWluIHNob3VsZG4ndCBtYXR0ZXIuICovCisgICAgICAg
IEFTU0VSVChpc19zeXN0ZW1fZG9tYWluKGQpKTsKICAgICAgICAgZC0+Z3Vlc3RfdHlwZSA9IGd1
ZXN0X3R5cGVfcHY7CisgICAgfQogCiAgICAgVFJBQ0VfMUQoVFJDX0RPTTBfRE9NX0FERCwgZC0+
ZG9tYWluX2lkKTsKIAotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
