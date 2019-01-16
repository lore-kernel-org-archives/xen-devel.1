From: Dongli Zhang <dongli.zhang@oracle.com>
Subject: [PATCH 1/1] xen-blkback: do not wake up shutdown_wq
 after xen_blkif_schedule() is stopped
Date: Wed, 16 Jan 2019 21:47:41 +0800
Message-ID: <1547646461-29803-1-git-send-email-dongli.zhang__23474.6560025544$1547646311$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IQaj=PY=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1gjlWb-0007Fz-MS
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 13:46:33 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: axboe@kernel.dk, roger.pau@citrix.com, konrad.wilk@oracle.com
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgaXMgbm8gbmVlZCB0byB3YWtlIHVwIHhlbl9ibGtpZl9zY2hlZHVsZSgpIGFzIGt0aHJl
YWRfc3RvcCgpIGlzIGFibGUKdG8gYWxyZWFkeSB3YWtlIHVwIHRoZSBrZXJuZWwgdGhyZWFkLgoK
U2lnbmVkLW9mZi1ieTogRG9uZ2xpIFpoYW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KLS0t
CiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIHwgNCArLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sv
eGVuYnVzLmMKaW5kZXggYTRiYzc0ZS4uMzdhYzU5ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9j
ay94ZW4tYmxrYmFjay94ZW5idXMuYworKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hl
bmJ1cy5jCkBAIC0yNTQsMTAgKzI1NCw4IEBAIHN0YXRpYyBpbnQgeGVuX2Jsa2lmX2Rpc2Nvbm5l
Y3Qoc3RydWN0IHhlbl9ibGtpZiAqYmxraWYpCiAJCWlmICghcmluZy0+YWN0aXZlKQogCQkJY29u
dGludWU7CiAKLQkJaWYgKHJpbmctPnhlbmJsa2QpIHsKKwkJaWYgKHJpbmctPnhlbmJsa2QpCiAJ
CQlrdGhyZWFkX3N0b3AocmluZy0+eGVuYmxrZCk7Ci0JCQl3YWtlX3VwKCZyaW5nLT5zaHV0ZG93
bl93cSk7Ci0JCX0KIAogCQkvKiBUaGUgYWJvdmUga3RocmVhZF9zdG9wKCkgZ3VhcmFudGVlcyB0
aGF0IGF0IHRoaXMgcG9pbnQgd2UKIAkJICogZG9uJ3QgaGF2ZSBhbnkgZGlzY2FyZF9pbyBvciBv
dGhlcl9pbyByZXF1ZXN0cy4gU28sIGNoZWNraW5nCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
