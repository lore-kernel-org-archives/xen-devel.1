From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.11 2/3] vpci/msix: fix incorrect usage of
 bitmask
Date: Mon, 26 Mar 2018 12:21:03 +0100
Message-ID: <20180326112104.80041-3-roger.pau@citrix.com>
References: <20180326112104.80041-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mjw3=gq=citrix.com=prvs=616e7aceb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f0QBn-0005xI-7k
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 11:21:23 +0000
In-Reply-To: <20180326112104.80041-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGJpdG1hc2sgdG8gY2xlYXIgdGhlIGxvdyBiaXRzIG9mIHRoZSBhZGRyZXNzIGZpZWxkIHNo
b3VsZCBiZQp+MHhmZmZmZmZmZnVsbCwgdGhlIGN1cnJlbnQgbWFzayBjbGVhcnMgYm90aCB0aGUg
bG93IGFuZCB0aGUgaGlnaCBiaXRzCm9mIHRoZSBhZGRyZXNzIGZpZWxkLCB3aGljaCBpcyBhIGJ1
Zy4KClJlcG9ydGVkLWJ5OiBDb3Zlcml0eQpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vZHJpdmVycy92cGNpL21zaXguYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jIGIveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMK
aW5kZXggM2IzNzhjMmU1MS4uYmNmNjMyNTZmNiAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvdnBj
aS9tc2l4LmMKKysrIGIveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMKQEAgLTMyOCw3ICszMjgsNyBA
QCBzdGF0aWMgaW50IG1zaXhfd3JpdGUoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGxvbmcgYWRk
ciwgdW5zaWduZWQgaW50IGxlbiwKICAgICAgICAgICAgIGVudHJ5LT5hZGRyID0gZGF0YTsKICAg
ICAgICAgICAgIGJyZWFrOwogICAgICAgICB9Ci0gICAgICAgIGVudHJ5LT5hZGRyICY9IH4weGZm
ZmZmZmZmOworICAgICAgICBlbnRyeS0+YWRkciAmPSB+MHhmZmZmZmZmZnVsbDsKICAgICAgICAg
ZW50cnktPmFkZHIgfD0gZGF0YTsKICAgICAgICAgYnJlYWs7CiAKLS0gCjIuMTYuMgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
