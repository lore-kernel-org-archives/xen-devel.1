From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v8 04/17] libxl: Add wrapper around
 libxl__json_object_to_json JSON
Date: Fri, 4 Jan 2019 15:30:43 +0000
Message-ID: <20190104153056.19138-5-anthony.perard@citrix.com>
References: <20190104153056.19138-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OewZ=PM=citrix.com=prvs=90051d582=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gfRR8-0008Jq-Ts
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 15:31:02 +0000
In-Reply-To: <20190104153056.19138-1-anthony.perard@citrix.com>
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
eC5jb20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
LS0tCgpOb3RlczoKICAgIHY4OgogICAgICAgIEFja2VkCiAgICB2NzoKICAgICAgICBuZXcgcGF0
Y2gKICAgICAgICBUaGVyZSBhcmUgbm8gdXNlciB5ZXQgYmVjYXVzZSB0aGUgZmlyc3QgdXNlcnMg
aXMgZ29pbmcgdG8gYmUgaW4KICAgICAgICAibGlieGxfcW1wOiBJbXBsZW1lbnRhdGlvbiBvZiBs
aWJ4bF9fZXZfcW1wXyoiIHdoaWNoIGlzIGFscmVhZHkgYQogICAgICAgIGh1Z2UgcGF0Y2gsIHRo
YXQgMyBsaW5lcyBtaWdodCBnZXQgbG9zdC4KCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5o
IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwu
aAppbmRleCBhYTkwNTlmZmVjLi4xNmU2ZWI2YzVlIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9s
aWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTIw
NDYsNiArMjA0Niw5IEBAIF9oaWRkZW4gbGlieGxfX2pzb25fb2JqZWN0ICpsaWJ4bF9fanNvbl9w
YXJzZShsaWJ4bF9fZ2MgKmdjX29wdCwgY29uc3QgY2hhciAqcyk7CiAKIF9oaWRkZW4gY2hhciAq
bGlieGxfX2pzb25fb2JqZWN0X3RvX2pzb24obGlieGxfX2djICpnYywKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgbGlieGxfX2pzb25fb2JqZWN0ICphcmdz
KTsKKy8qIEFsd2F5cyByZXR1cm4gYSB2YWxpZCBzdHJpbmcsIGJ1dCBpbnZhbGlkIGpzb24gb24g
ZXJyb3IuICovCisjZGVmaW5lIEpTT04obykgXAorICAgIChsaWJ4bF9fanNvbl9vYmplY3RfdG9f
anNvbihnYywgKG8pKSA/IDogIjxpbnZhbGlkLWpzb24tb2JqZWN0PiIpCiAKICAgLyogQmFzZWQg
b24gL2xvY2FsL2RvbWFpbi8kZG9taWQvZG0tdmVyc2lvbiB4ZW5zdG9yZSBrZXkKICAgICogZGVm
YXVsdCBpcyBxZW11IHhlbiB0cmFkaXRpb25hbCAqLwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
