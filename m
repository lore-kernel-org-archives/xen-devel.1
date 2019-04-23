From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/3] xen/swiotlb: fix condition for calling
 xen_destroy_contiguous_region()
Date: Tue, 23 Apr 2019 12:54:55 +0200
Message-ID: <20190423105457.17502-2-jgross__12665.6836642482$1556016959$gmane$org@suse.com>
References: <20190423105457.17502-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jhle=SZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hIt4r-00089E-B5
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 10:55:05 +0000
In-Reply-To: <20190423105457.17502-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org, stable@vger.kernel.org, konrad.wilk@oracle.com
List-Id: xen-devel@lists.xenproject.org

VGhlIGNvbmRpdGlvbiBpbiB4ZW5fc3dpb3RsYl9mcmVlX2NvaGVyZW50KCkgZm9yIGRlY2lkaW5n
IHdoZXRoZXIgdG8KY2FsbCB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGlzIHdyb25n
OiBpbiBjYXNlIHRoZSByZWdpb24gdG8KYmUgZnJlZWQgaXMgbm90IGNvbnRpZ3VvdXMgY2FsbGlu
ZyB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGlzCnRoZSB3cm9uZyB0aGluZyB0byBk
bzogaXQgd291bGQgcmVzdWx0IGluIGluY29uc2lzdGVudCBtYXBwaW5ncyBvZgptdWx0aXBsZSBQ
Rk5zIHRvIHRoZSBzYW1lIE1GTi4gVGhpcyB3aWxsIGxlYWQgdG8gdmFyaW91cyBzdHJhbmdlCmNy
YXNoZXMgb3IgZGF0YSBjb3JydXB0aW9uLgoKSW5zdGVhZCBvZiBjYWxsaW5nIHhlbl9kZXN0cm95
X2NvbnRpZ3VvdXNfcmVnaW9uKCkgaW4gdGhhdCBjYXNlIGEKd2FybmluZyBzaG91bGQgYmUgaXNz
dWVkIGFzIHRoYXQgc2l0dWF0aW9uIHNob3VsZCBuZXZlciBvY2N1ci4KCkNjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KLS0tCiBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
eGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCmluZGV4IDg3N2Jh
ZjJhOTRmNC4uNDJhMzkyNGU2ZDkxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhl
bi5jCisrKyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKQEAgLTM2MCw4ICszNjAsOCBAQCB4
ZW5fc3dpb3RsYl9mcmVlX2NvaGVyZW50KHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzaXplX3Qgc2l6
ZSwgdm9pZCAqdmFkZHIsCiAJLyogQ29udmVydCB0aGUgc2l6ZSB0byBhY3R1YWxseSBhbGxvY2F0
ZWQuICovCiAJc2l6ZSA9IDFVTCA8PCAob3JkZXIgKyBYRU5fUEFHRV9TSElGVCk7CiAKLQlpZiAo
KChkZXZfYWRkciArIHNpemUgLSAxIDw9IGRtYV9tYXNrKSkgfHwKLQkgICAgcmFuZ2Vfc3RyYWRk
bGVzX3BhZ2VfYm91bmRhcnkocGh5cywgc2l6ZSkpCisJaWYgKChkZXZfYWRkciArIHNpemUgLSAx
IDw9IGRtYV9tYXNrKSAmJgorCSAgICAhV0FSTl9PTihyYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3Vu
ZGFyeShwaHlzLCBzaXplKSkpCiAJCXhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXMs
IG9yZGVyKTsKIAogCXhlbl9mcmVlX2NvaGVyZW50X3BhZ2VzKGh3ZGV2LCBzaXplLCB2YWRkciwg
KGRtYV9hZGRyX3QpcGh5cywgYXR0cnMpOwotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
