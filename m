From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 1/2] automation: add a qemu smoke test for clang
 build
Date: Thu, 22 Nov 2018 15:49:02 +0000
Message-ID: <20181122154903.27414-2-wei.liu2@citrix.com>
References: <20181122154903.27414-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nkve=ob=citrix.com=prvs=857cca76a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gPrE2-0008CS-Ri
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 15:49:06 +0000
In-Reply-To: <20181122154903.27414-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

QWxzbyByZW5hbWUgdGhlIG9sZCB0ZXN0IHRvIGhhdmUgLWdjYyBzdWZmaXguCgpTaWduZWQtb2Zm
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KVGhpcyBjYW4gb25seSBhcHBs
eSBhZnRlciBSb2dlcidzIHBhdGNoIHRvIGZpeCBjbGFuZyBoYXMgYmVlbiBhcHBsaWVkLgotLS0K
IC5naXRsYWItY2kueW1sIHwgMTkgKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS8uZ2l0bGFiLWNp
LnltbCBiLy5naXRsYWItY2kueW1sCmluZGV4IGIzY2E3NzllMjEuLjU3ZjVkYzcwMTMgMTAwNjQ0
Ci0tLSBhLy5naXRsYWItY2kueW1sCisrKyBiLy5naXRsYWItY2kueW1sCkBAIC0zODMsNyArMzgz
LDcgQEAgZGViaWFuLXVuc3RhYmxlLWdjYy1kZWJ1Zy1hcm02NC1yYW5kY29uZmlnOgogCiAKICMg
VGVzdCBqb2JzCi1xZW11LXNtb2tlLXg4Ni02NDoKK3FlbXUtc21va2UteDg2LTY0LWdjYzoKICAg
c3RhZ2U6IHRlc3QKICAgaW1hZ2U6IHJlZ2lzdHJ5LmdpdGxhYi5jb20veGVuLXByb2plY3QveGVu
LyR7Q09OVEFJTkVSfQogICB2YXJpYWJsZXM6CkBAIC0zOTksMyArMzk5LDIwIEBAIHFlbXUtc21v
a2UteDg2LTY0OgogICAgIC0gZGViaWFuLXN0cmV0Y2gtZ2NjLWRlYnVnCiAgIHRhZ3M6CiAgICAg
LSB4ODZfNjQKKworcWVtdS1zbW9rZS14ODYtNjQtY2xhbmc6CisgIHN0YWdlOiB0ZXN0CisgIGlt
YWdlOiByZWdpc3RyeS5naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hlbi8ke0NPTlRBSU5FUn0KKyAg
dmFyaWFibGVzOgorICAgIENPTlRBSU5FUjogZGViaWFuOnN0cmV0Y2gKKyAgc2NyaXB0OgorICAg
IC0gLi9hdXRvbWF0aW9uL3NjcmlwdHMvcWVtdS1zbW9rZS14ODYtNjQuc2ggMj4mMSB8IHRlZSBx
ZW11LXNtb2tlLXg4Ni02NC5sb2cKKyAgYXJ0aWZhY3RzOgorICAgIHBhdGhzOgorICAgICAgLSBz
bW9rZS5zZXJpYWwKKyAgICAgIC0gJyoubG9nJworICAgIHdoZW46IGFsd2F5cworICBkZXBlbmRl
bmNpZXM6CisgICAgLSBkZWJpYW4tdW5zdGFibGUtY2xhbmctZGVidWcKKyAgdGFnczoKKyAgICAt
IHg4Nl82NAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
