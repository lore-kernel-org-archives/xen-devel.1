From: Pan Bian <bianpan2016@163.com>
Subject: [PATCH] pvcalls-front: fixes incorrect error handling
Date: Thu, 22 Nov 2018 10:07:12 +0800
Message-ID: <1542852432-30019-1-git-send-email-bianpan2016__38559.2157756493$1542852403$gmane$org@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1qXf=OB=163.com=bianpan2016@srs-us1.protection.inumbo.net>)
 id 1gPeP5-0001CJ-VB
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 02:07:40 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

a2ZyZWUoKSBpcyBpbmNvcnJlY3RseSB1c2VkIHRvIHJlbGVhc2UgdGhlIHBhZ2VzIGFsbG9jYXRl
ZCBieQpfX2dldF9mcmVlX3BhZ2UoKSBhbmQgX19nZXRfZnJlZV9wYWdlcygpLiBVc2UgdGhlIG1h
dGNoaW5nIGRlYWxsb2NhdG9ycwppLmUuLCBmcmVlX3BhZ2UoKSBhbmQgZnJlZV9wYWdlcygpLCBy
ZXNwZWN0aXZlbHkuCgpTaWduZWQtb2ZmLWJ5OiBQYW4gQmlhbiA8YmlhbnBhbjIwMTZAMTYzLmNv
bT4KLS0tCiBkcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy94ZW4vcHZjYWxscy1mcm9udC5jIGIvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jCmluZGV4
IDJmMTFjYTcuLjc3MjI0ZDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQu
YworKysgYi9kcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMKQEAgLTM4NSw4ICszODUsOCBAQCBz
dGF0aWMgaW50IGNyZWF0ZV9hY3RpdmUoc3RydWN0IHNvY2tfbWFwcGluZyAqbWFwLCBpbnQgKmV2
dGNobikKIG91dF9lcnJvcjoKIAlpZiAoKmV2dGNobiA+PSAwKQogCQl4ZW5idXNfZnJlZV9ldnRj
aG4ocHZjYWxsc19mcm9udF9kZXYsICpldnRjaG4pOwotCWtmcmVlKG1hcC0+YWN0aXZlLmRhdGEu
aW4pOwotCWtmcmVlKG1hcC0+YWN0aXZlLnJpbmcpOworCWZyZWVfcGFnZXMoKHVuc2lnbmVkIGxv
bmcpbWFwLT5hY3RpdmUuZGF0YS5pbiwgUFZDQUxMU19SSU5HX09SREVSKTsKKwlmcmVlX3BhZ2Uo
KHVuc2lnbmVkIGxvbmcpbWFwLT5hY3RpdmUucmluZyk7CiAJcmV0dXJuIHJldDsKIH0KIAotLSAK
Mi43LjQKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
