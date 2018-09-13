From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v4 6/7] xen: connect guest creation with
 CONFIG_HVM
Date: Thu, 13 Sep 2018 17:38:08 +0100
Message-ID: <52a6b8e0990de78a66f59b65b55e187c5c7a9657.1536856592.git-series.wei.liu2@citrix.com>
References: <cover.f883694550a3da3b95e2bf2a6f6777297b851b43.1536856592.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p4g3=l3=citrix.com=prvs=78776abe6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g0UdD-0008CU-9o
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 16:38:15 +0000
In-Reply-To: <cover.f883694550a3da3b95e2bf2a6f6777297b851b43.1536856592.git-series.wei.liu2@citrix.com>
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

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCnY0OiBkcm9w
IFBWIHBhcnQgdG8gYXZvaWQgYnJlYWtpbmcgQXJtCi0tLQogeGVuL2NvbW1vbi9kb21haW4uYyB8
IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jCmluZGV4IGEwNDM4MTIu
LjZkZmNlYTQgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMKKysrIGIveGVuL2NvbW1v
bi9kb21haW4uYwpAQCAtMzE1LDcgKzMxNSwxNCBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3Jl
YXRlKGRvbWlkX3QgZG9taWQsCiAKICAgICAvKiBTb3J0IG91dCBvdXIgaWRlYSBvZiBpc197cHYs
aHZtfV9kb21haW4oKS4gKi8KICAgICBpZiAoIGNvbmZpZyAmJiAoY29uZmlnLT5mbGFncyAmIFhF
Tl9ET01DVExfQ0RGX2h2bV9ndWVzdCkgKQorICAgIHsKKyNpZmRlZiBDT05GSUdfSFZNCiAgICAg
ICAgIGQtPmd1ZXN0X3R5cGUgPSBndWVzdF90eXBlX2h2bTsKKyNlbHNlCisgICAgICAgIGVyciA9
IC1FSU5WQUw7CisgICAgICAgIGdvdG8gZmFpbDsKKyNlbmRpZgorICAgIH0KICAgICBlbHNlCiAg
ICAgICAgIGQtPmd1ZXN0X3R5cGUgPSBndWVzdF90eXBlX3B2OwogCi0tIApnaXQtc2VyaWVzIDAu
OS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
