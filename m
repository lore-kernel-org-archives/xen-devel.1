From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 31/34] xen: refuse to create HVM guests when
 !CONFIG_HVM
Date: Fri, 17 Aug 2018 16:12:49 +0100
Message-ID: <71cdcc5fbe6d8e6e1801270f6ef7fc1563957447.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqgg3-0001TV-8C
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:28:39 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vY29t
bW9uL2RvbWFpbi5jIHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4v
Y29tbW9uL2RvbWFpbi5jCmluZGV4IDE3MWQyNWUuLmEyMmRmMTIgMTAwNjQ0Ci0tLSBhL3hlbi9j
b21tb24vZG9tYWluLmMKKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwpAQCAtMzE4LDggKzMxOCwx
NCBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlkX3QgZG9taWQsCiAgICAgaWYg
KCAhaXNfaWRsZV9kb21haW4oZCkgKQogICAgIHsKICAgICAgICAgaWYgKCBjb25maWctPmZsYWdz
ICYgWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0ICkKKyAgICAgICAgeworI2lmIENPTkZJR19IVk0K
ICAgICAgICAgICAgIGQtPmd1ZXN0X3R5cGUgPSBndWVzdF90eXBlX2h2bTsKLSAgICAgICAgZWxz
ZQorI2Vsc2UKKyAgICAgICAgICAgIGVyciA9IC1FSU5WQUw7CisgICAgICAgICAgICBnb3RvIGZh
aWw7CisjZW5kaWYKKyAgICAgICAgfSBlbHNlCiAgICAgICAgICAgICBkLT5ndWVzdF90eXBlID0g
Z3Vlc3RfdHlwZV9wdjsKIAogICAgICAgICB3YXRjaGRvZ19kb21haW5faW5pdChkKTsKLS0gCmdp
dC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
