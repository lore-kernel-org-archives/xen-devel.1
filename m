From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v3 13/16] xen: connect guest creation with
 CONFIG_{HVM, PV}
Date: Tue, 4 Sep 2018 17:15:30 +0100
Message-ID: <20180904161533.11575-14-wei.liu2@citrix.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6dpj=ls=citrix.com=prvs=77871bf46=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fxECM-0005Ir-0l
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 16:29:02 +0000
In-Reply-To: <20180904161533.11575-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jIHwg
MTUgKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jCmluZGV4
IDc4YzQ1MGU0YjQuLjFmOTViZDE2OWMgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMK
KysrIGIveGVuL2NvbW1vbi9kb21haW4uYwpAQCAtMzE4LDkgKzMxOCwyNCBAQCBzdHJ1Y3QgZG9t
YWluICpkb21haW5fY3JlYXRlKGRvbWlkX3QgZG9taWQsCiAKICAgICAvKiBTb3J0IG91dCBvdXIg
aWRlYSBvZiBpc197cHYsaHZtfV9kb21haW4oKS4gKi8KICAgICBpZiAoIGNvbmZpZyAmJiAoY29u
ZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2h2bV9ndWVzdCkgKQorICAgIHsKKyNpZmRlZiBD
T05GSUdfSFZNCiAgICAgICAgIGQtPmd1ZXN0X3R5cGUgPSBndWVzdF90eXBlX2h2bTsKKyNlbHNl
CisgICAgICAgIGVyciA9IC1FSU5WQUw7CisgICAgICAgIGdvdG8gZmFpbDsKKyNlbmRpZgorICAg
IH0KICAgICBlbHNlCisgICAgeworI2lmZGVmIENPTkZJR19QVgogICAgICAgICBkLT5ndWVzdF90
eXBlID0gZ3Vlc3RfdHlwZV9wdjsKKyNlbHNlCisgICAgICAgIGVyciA9IC1FSU5WQUw7CisgICAg
ICAgIGdvdG8gZmFpbDsKKyNlbmRpZgorICAgIH0KKwogCiAgICAgVFJBQ0VfMUQoVFJDX0RPTTBf
RE9NX0FERCwgZC0+ZG9tYWluX2lkKTsKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
