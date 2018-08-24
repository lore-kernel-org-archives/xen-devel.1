From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2] automation: enable building rombios with
 clang
Date: Fri, 24 Aug 2018 16:22:47 +0100
Message-ID: <20180824152247.9166-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8yf=lh=citrix.com=prvs=76773b150=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftDvR-0006SB-Tj
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 15:23:01 +0000
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

UHJldmlvdXNseSBpdCBpcyBkaXNhYmxlZCBiZWNhdXNlIHRoZSBlbWJlZGRlZCBpcHhlIGNhbid0
IGJlIGJ1aWx0CndpdGggY2xhbmcuIE5vdyB0aGF0IGlweGUgaXMgc3BsaXQgb3V0IHdlIGNhbiB1
c2UgLS13aXRoLXN5c3RlbS1pcHhlCnRvIHdvcmsgYXJvdW5kIHRoZSBpc3N1ZS4KClNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogYXV0b21hdGlvbi9zY3Jp
cHRzL2J1aWxkIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZCBiL2F1dG9t
YXRpb24vc2NyaXB0cy9idWlsZAppbmRleCAwNTQyMjZiZDczLi4zMzJjM2ZiNjE5IDEwMDc1NQot
LS0gYS9hdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQKKysrIGIvYXV0b21hdGlvbi9zY3JpcHRzL2J1
aWxkCkBAIC0xNiw4ICsxNiw4IEBAIGNmZ2FyZ3MrPSgiLS1lbmFibGUtZG9jcyIpCiBpZiBbWyAi
JHtDQ30iID09ICJjbGFuZyIgXV07IHRoZW4KICAgICAjIFNlYUJJT1MgY2Fubm90IGJlIGJ1aWx0
IHdpdGggY2xhbmcKICAgICBjZmdhcmdzKz0oIi0td2l0aC1zeXN0ZW0tc2VhYmlvcz0vdXNyL3No
YXJlL3NlYWJpb3MvYmlvcy5iaW4iKQotICAgICMgaVBYRSBjYW5ub3QgYmUgYnVpbHQgd2l0aCBj
bGFuZyBzbyB3ZSBjYW5ub3QgYnVpbGQgcm9tYmlvcwotICAgIGNmZ2FyZ3MrPSgiLS1kaXNhYmxl
LXJvbWJpb3MiKQorICAgICMgaVBYRSBjYW5ub3QgYmUgYnVpbHQgd2l0aCBjbGFuZworICAgIGNm
Z2FyZ3MrPSgiLS13aXRoLXN5c3RlbS1pcHhlPS91c3IvbGliL2lweGUvaXB4ZS5weGUiKQogICAg
ICMgbmV3bGliIGNhbm5vdCBiZSBidWlsdCB3aXRoIGNsYW5nIHNvIHdlIGNhbm5vdCBidWlsZCBz
dHViZG9tcwogICAgIGNmZ2FyZ3MrPSgiLS1kaXNhYmxlLXN0dWJkb20iKQogZmkKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
