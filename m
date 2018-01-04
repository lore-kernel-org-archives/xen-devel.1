From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 19/74] x86: introduce ELFNOTE macro
Date: Thu, 4 Jan 2018 13:05:30 +0000
Message-ID: <20180104130625.28605-20-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5ZQ-0003g1-V9
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:28:32 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

SXQgaXMgbmVlZGVkIGxhdGVyIGZvciBpbnRyb2R1Y2luZyBQVkggZW50cnkgcG9pbnQuCgpTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9pbmNsdWRl
L2FzbS14ODYvYXNtX2RlZm5zLmggfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVm
bnMuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYXNtX2RlZm5zLmgKaW5kZXggMzg4ZmM5M2I5ZC4u
MjQ5M2U5Nzg4MyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaAor
KysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2FzbV9kZWZucy5oCkBAIC00MDksNCArNDA5LDE2IEBA
IHN0YXRpYyBhbHdheXNfaW5saW5lIHZvaWQgc3RhYyh2b2lkKQogI2RlZmluZSBSRVg2NF9QUkVG
SVggInJleDY0LyIKICNlbmRpZgogCisjZGVmaW5lIEVMRk5PVEUobmFtZSwgdHlwZSwgZGVzYykg
ICAgICAgICAgIFwKKyAgICAucHVzaHNlY3Rpb24gLm5vdGUubmFtZSAgICAgICAgICAgICAgIDsg
XAorICAgIC5hbGlnbiA0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOyBcCisgICAgLmxv
bmcgMmYgLSAxZiAgICAgICAvKiBuYW1lc3ogKi8gICAgICA7IFwKKyAgICAubG9uZyA0ZiAtIDNm
ICAgICAgIC8qIGRlc2NzeiAqLyAgICAgIDsgXAorICAgIC5sb25nIHR5cGUgICAgICAgICAgLyog
dHlwZSAgICovICAgICAgOyBcCisxOi5hc2NpeiAjbmFtZSAgICAgICAgICAvKiBuYW1lICAgKi8g
ICAgICA7IFwKKzI6LmFsaWduIDQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDsgXAor
MzpkZXNjICAgICAgICAgICAgICAgICAgLyogZGVzYyAgICovICAgICAgOyBcCis0Oi5hbGlnbiA0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA7IFwKKyAgICAucG9wc2VjdGlvbgorCiAj
ZW5kaWYgLyogX19YODZfQVNNX0RFRk5TX0hfXyAqLwotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
