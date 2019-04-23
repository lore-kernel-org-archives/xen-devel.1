From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/3] xen/swiotlb: fix an issue and improve
 swiotlb-xen
Date: Tue, 23 Apr 2019 12:54:54 +0200
Message-ID: <20190423105457.17502-1-jgross__42040.7298881159$1556016960$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jhle=SZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hIt4q-000892-9x
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 10:55:04 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org, konrad.wilk@oracle.com
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgaHVudGluZyBhbiBpc3N1ZSBpbiBzd2lvdGxiLXhlbiBJIHN0dW1ibGVkIG92ZXIgYSB3
cm9uZyB0ZXN0CmFuZCBmb3VuZCBzb21lIGFyZWFzIGZvciBpbXByb3ZlbWVudC4KCkp1ZXJnZW4g
R3Jvc3MgKDMpOgogIHhlbi9zd2lvdGxiOiBmaXggY29uZGl0aW9uIGZvciBjYWxsaW5nIHhlbl9k
ZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKCkKICB4ZW4vc3dpb3RsYjogc2ltcGxpZnkgcmFuZ2Vf
c3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkoKQogIHhlbi9zd2lvdGxiOiByZW1lbWJlciBoYXZpbmcg
Y2FsbGVkIHhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24oKQoKIGRyaXZlcnMveGVuL3N3aW90
bGIteGVuLmMgfCAzNyArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCgotLSAKMi4xNi40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
