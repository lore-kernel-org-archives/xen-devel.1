From: Colin King <colin.king@canonical.com>
Subject: [PATCH] xen/pvcalls: fix null pointer dereference on
	map->sock
Date: Thu, 22 Feb 2018 17:22:59 +0000
Message-ID: <20180222172259.10381-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bvze=fq=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1eouaN-0004ng-3F
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 17:23:11 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkN1cnJlbnRs
eSBpZiBtYXAgaXMgbnVsbCB0aGVuIGEgcG90ZW50aWFsIG51bGwgcG9pbnRlciBkZWZlcmVuY2UK
b2NjdXJzIHdoZW4gY2FsbGluZyBzb2NrX3JlbGVhc2Ugb24gbWFwLT5zb2NrLiAgSSBiZWxpZXZl
IHRoZQphY3R1YWwgaW50ZW50aW9uIHdhcyB0byBjYWxsIHNvY2tfcmVsZWFzZSBvbiBzb2NrIGlu
c3RlYWQuIEZpeAp0aGlzLgoKRml4ZXM6IDVkYjRkMjg2YThlZiAoInhlbi9wdmNhbGxzOiBpbXBs
ZW1lbnQgY29ubmVjdCBjb21tYW5kIikKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNv
bGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9wdmNhbGxzLWJhY2suYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMveGVuL3B2Y2FsbHMtYmFjay5jIGIvZHJpdmVycy94ZW4vcHZjYWxs
cy1iYWNrLmMKaW5kZXggMTU2ZTVhZWEzNmRiLi5iMTA5MmZiZWZhNjMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMveGVuL3B2Y2FsbHMtYmFjay5jCisrKyBiL2RyaXZlcnMveGVuL3B2Y2FsbHMtYmFjay5j
CkBAIC00MTYsNyArNDE2LDcgQEAgc3RhdGljIGludCBwdmNhbGxzX2JhY2tfY29ubmVjdChzdHJ1
Y3QgeGVuYnVzX2RldmljZSAqZGV2LAogCQkJCQlzb2NrKTsKIAlpZiAoIW1hcCkgewogCQlyZXQg
PSAtRUZBVUxUOwotCQlzb2NrX3JlbGVhc2UobWFwLT5zb2NrKTsKKwkJc29ja19yZWxlYXNlKHNv
Y2spOwogCX0KIAogb3V0OgotLSAKMi4xNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
