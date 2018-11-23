From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v7 04/14] libxl: Add wrapper around
 libxl__json_object_to_json JSON
Date: Fri, 23 Nov 2018 13:53:45 +0000
Message-ID: <20181123135355.6001-5-anthony.perard@citrix.com>
References: <20181123135355.6001-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wcvb=oc=citrix.com=prvs=85824b8b3=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gQBuD-0003S5-45
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 13:54:01 +0000
In-Reply-To: <20181123135355.6001-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhhdCB3cmFwcGVyIGlzIGdvaW5nIHRvIGJlIHVzZWQgdG8gc2FmZWx5IGxvZyBhIGpzb25fb2Jq
ZWN0LCBhcwpsaWJ4bF9fanNvbl9vYmplY3RfdG9fanNvbiByZXR1cm4gTlVMTCBvbiBlcnJvci4g
SW4gdGhlIGVycm9yIGNhc2UsCkpTT04oKSB3aWxsIHJldHVybiBhbiBpbnZhbGlkIGpzb24gc3Ry
aW5nLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2NzoKICAgICAgICBuZXcgcGF0Y2gKICAgICAgICBUaGVy
ZSBhcmUgbm8gdXNlciB5ZXQgYmVjYXVzZSB0aGUgZmlyc3QgdXNlcnMgaXMgZ29pbmcgdG8gYmUg
aW4KICAgICAgICAibGlieGxfcW1wOiBJbXBsZW1lbnRhdGlvbiBvZiBsaWJ4bF9fZXZfcW1wXyoi
IHdoaWNoIGlzIGFscmVhZHkgYQogICAgICAgIGh1Z2UgcGF0Y2gsIHRoYXQgMyBsaW5lcyBtaWdo
dCBnZXQgbG9zdC4KCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgMyArKysKIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCBkOTZjNWI3
Zjg5Li4zOGM4YzNhNTlkIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5o
CisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTIwMzQsNiArMjAzNCw5IEBA
IF9oaWRkZW4gbGlieGxfX2pzb25fb2JqZWN0ICpsaWJ4bF9fanNvbl9wYXJzZShsaWJ4bF9fZ2Mg
KmdjX29wdCwgY29uc3QgY2hhciAqcyk7CiAKIF9oaWRkZW4gY2hhciAqbGlieGxfX2pzb25fb2Jq
ZWN0X3RvX2pzb24obGlieGxfX2djICpnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgbGlieGxfX2pzb25fb2JqZWN0ICphcmdzKTsKKy8qIEFsd2F5cyBy
ZXR1cm4gYSB2YWxpZCBzdHJpbmcsIGJ1dCBpbnZhbGlkIGpzb24gb24gZXJyb3IuICovCisjZGVm
aW5lIEpTT04obykgXAorICAgIChsaWJ4bF9fanNvbl9vYmplY3RfdG9fanNvbihnYywgKG8pKSA/
IDogIjxpbnZhbGlkLWpzb24tb2JqZWN0PiIpCiAKICAgLyogQmFzZWQgb24gL2xvY2FsL2RvbWFp
bi8kZG9taWQvZG0tdmVyc2lvbiB4ZW5zdG9yZSBrZXkKICAgICogZGVmYXVsdCBpcyBxZW11IHhl
biB0cmFkaXRpb25hbCAqLwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
