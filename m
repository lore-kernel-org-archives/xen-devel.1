From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 2/2] x86: use invpcid to do global flushing
Date: Mon, 5 Mar 2018 09:50:32 +0000
Message-ID: <20180305095032.30062-3-wei.liu2@citrix.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yt/y=f3=citrix.com=prvs=595ca3bc4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1esmlW-0006Ha-QI
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 09:50:42 +0000
In-Reply-To: <20180305095032.30062-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvZmx1c2h0bGIuYyB8IDIyICsrKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9mbHVzaHRsYi5jIGIveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMKaW5kZXggOGE3YTc2
YjhmZi4uZTRlYTRmMzI5NyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMKKysr
IGIveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMKQEAgLTksNiArOSw3IEBACiAKICNpbmNsdWRlIDx4
ZW4vc2NoZWQuaD4KICNpbmNsdWRlIDx4ZW4vc29mdGlycS5oPgorI2luY2x1ZGUgPGFzbS9pbnZw
Y2lkLmg+CiAjaW5jbHVkZSA8YXNtL2ZsdXNodGxiLmg+CiAjaW5jbHVkZSA8YXNtL3BhZ2UuaD4K
IApAQCAtMTIwLDExICsxMjEsMjQgQEAgdW5zaWduZWQgaW50IGZsdXNoX2FyZWFfbG9jYWwoY29u
c3Qgdm9pZCAqdmEsIHVuc2lnbmVkIGludCBmbGFncykKICAgICAgICAgZWxzZQogICAgICAgICB7
CiAgICAgICAgICAgICB1MzIgdCA9IHByZV9mbHVzaCgpOwotICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBjcjQgPSByZWFkX2NyNCgpOwogCi0gICAgICAgICAgICB3cml0ZV9jcjQoY3I0ICYgflg4
Nl9DUjRfUEdFKTsKLSAgICAgICAgICAgIGJhcnJpZXIoKTsKLSAgICAgICAgICAgIHdyaXRlX2Ny
NChjcjQpOworICAgICAgICAgICAgaWYgKCAhY3B1X2hhc19pbnZwY2lkICkKKyAgICAgICAgICAg
IHsKKyAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGNyNCA9IHJlYWRfY3I0KCk7CisKKyAg
ICAgICAgICAgICAgICB3cml0ZV9jcjQoY3I0ICYgflg4Nl9DUjRfUEdFKTsKKyAgICAgICAgICAg
ICAgICBiYXJyaWVyKCk7CisgICAgICAgICAgICAgICAgd3JpdGVfY3I0KGNyNCk7CisgICAgICAg
ICAgICB9CisgICAgICAgICAgICBlbHNlCisgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAg
LyoKKyAgICAgICAgICAgICAgICAgKiBVc2luZyBpbnZwY2lkIHRvIGZsdXNoIGFsbCBtYXBwaW5n
cyB3b3JrcworICAgICAgICAgICAgICAgICAqIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBQQ0lEIGlz
IGVuYWJsZWQgb3Igbm90LgorICAgICAgICAgICAgICAgICAqIEl0IGlzIGZhc3RlciB0aGFuIHJl
YWQtbW9kaWZ5LXdyaXRlIENSNC4KKyAgICAgICAgICAgICAgICAgKi8KKyAgICAgICAgICAgICAg
ICBpbnZwY2lkX2ZsdXNoX2FsbCgpOworICAgICAgICAgICAgfQogCiAgICAgICAgICAgICBwb3N0
X2ZsdXNoKHQpOwogICAgICAgICB9Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
