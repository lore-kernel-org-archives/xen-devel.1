From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 20/23] xen: connect guest creation with
 CONFIG_{HVM, PV}
Date: Sun, 26 Aug 2018 13:19:53 +0100
Message-ID: <ca3fb129b9e4707d268df561cb32b50cae902982.1535285866.git-series.wei.liu2@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gpvm=lj=citrix.com=prvs=769521655=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftu9s-0000Zy-QS
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 12:28:44 +0000
In-Reply-To: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
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

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vY29t
bW9uL2RvbWFpbi5jIHwgMTQgKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24v
ZG9tYWluLmMKaW5kZXggMTcxZDI1ZS4uNzNiNTQ4NSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9k
b21haW4uYworKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCkBAIC0zMTgsOSArMzE4LDIzIEBAIHN0
cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9taWRfdCBkb21pZCwKICAgICBpZiAoICFpc19p
ZGxlX2RvbWFpbihkKSApCiAgICAgewogICAgICAgICBpZiAoIGNvbmZpZy0+ZmxhZ3MgJiBYRU5f
RE9NQ1RMX0NERl9odm1fZ3Vlc3QgKQorICAgICAgICB7CisjaWZkZWYgQ09ORklHX0hWTQogICAg
ICAgICAgICAgZC0+Z3Vlc3RfdHlwZSA9IGd1ZXN0X3R5cGVfaHZtOworI2Vsc2UKKyAgICAgICAg
ICAgIGVyciA9IC1FSU5WQUw7CisgICAgICAgICAgICBnb3RvIGZhaWw7CisjZW5kaWYKKyAgICAg
ICAgfQogICAgICAgICBlbHNlCisgICAgICAgIHsKKyNpZmRlZiBDT05GSUdfUFYKICAgICAgICAg
ICAgIGQtPmd1ZXN0X3R5cGUgPSBndWVzdF90eXBlX3B2OworI2Vsc2UKKyAgICAgICAgICAgIGVy
ciA9IC1FSU5WQUw7CisgICAgICAgICAgICBnb3RvIGZhaWw7CisjZW5kaWYKKyAgICAgICAgfQog
CiAgICAgICAgIHdhdGNoZG9nX2RvbWFpbl9pbml0KGQpOwogICAgICAgICBpbml0X3N0YXR1cyB8
PSBJTklUX3dhdGNoZG9nOwotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
