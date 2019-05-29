From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/3] xen/swiotlb: fix an issue and improve
 swiotlb-xen
Date: Wed, 29 May 2019 11:04:04 +0200
Message-ID: <20190529090407.1225-1-jgross__10578.5357927502$1559120718$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=krOM=T5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVuVK-0005VD-BA
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 09:04:14 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, stable@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgaHVudGluZyBhbiBpc3N1ZSBpbiBzd2lvdGxiLXhlbiBJIHN0dW1ibGVkIG92ZXIgYSB3
cm9uZyB0ZXN0CmFuZCBmb3VuZCBzb21lIGFyZWFzIGZvciBpbXByb3ZlbWVudC4KCkp1ZXJnZW4g
R3Jvc3MgKDMpOgogIHhlbi9zd2lvdGxiOiBmaXggY29uZGl0aW9uIGZvciBjYWxsaW5nIHhlbl9k
ZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKCkKICB4ZW4vc3dpb3RsYjogc2ltcGxpZnkgcmFuZ2Vf
c3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkoKQogIHhlbi9zd2lvdGxiOiByZW1lbWJlciBoYXZpbmcg
Y2FsbGVkIHhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24oKQoKIGRyaXZlcnMveGVuL3N3aW90
bGIteGVuLmMgIHwgMzYgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBpbmNs
dWRlL2xpbnV4L3BhZ2UtZmxhZ3MuaCB8ICAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
