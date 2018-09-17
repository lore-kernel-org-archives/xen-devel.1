From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] automation: skip some branches in gitlab CI
Date: Mon, 17 Sep 2018 09:33:41 +0100
Message-ID: <20180917083341.28003-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ktui=l7=citrix.com=prvs=791268a98=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g1oyW-0007g0-SD
 for xen-devel@lists.xenproject.org; Mon, 17 Sep 2018 08:33:44 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SWdub3JlIGJyYW5jaGVzIHdoaWNoIGFyZSBhbHdheXMgZmFzdC1mb3J3YXJkZWQgdG8gc3RhZ2lu
ZyogYnJhbmNoZXMuCkxpc3Qgb2YgZmlsdGVycyB0YWtlbiBmcm9tIFRyYXZpcyBDSSBzZXR1cC4K
ClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogLmdpdGxh
Yi1jaS55bWwgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwgYi8uZ2l0bGFiLWNpLnltbAppbmRleCBjMmQ2OTVmZjZm
Li5iZjZiZjdkODk1IDEwMDY0NAotLS0gYS8uZ2l0bGFiLWNpLnltbAorKysgYi8uZ2l0bGFiLWNp
LnltbApAQCAtMTEsNiArMTEsMTEgQEAgc3RhZ2VzOgogICAgICAgLSB4ZW4vLmNvbmZpZwogICAg
ICAgLSAnKi5sb2cnCiAgICAgd2hlbjogYWx3YXlzCisgIGV4Y2VwdDoKKyAgICAtIG1hc3Rlcgor
ICAgIC0gc21va2UKKyAgICAtIC9eY292ZXJpdHktdGVzdGVkXC8uKi8KKyAgICAtIC9ec3RhYmxl
LS4qLwogCiAuZ2NjLXRtcGw6CiAgIHZhcmlhYmVzOiAmZ2NjCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
