From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 1/2] xen/gntdev: Fix off-by-one error when
	unmapping with holes
Date: Tue, 9 Jan 2018 12:10:21 +0000
Message-ID: <20180109121022.11467-1-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=s//u=ee=citrix.com=prvs=540754ccc=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1eYsjf-0006FR-R5
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 12:10:31 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

SWYgdGhlIHJlcXVlc3RlZCByYW5nZSBoYXMgYSBob2xlLCB0aGUgY2FsY3VsYXRpb24gb2YgdGhl
IG51bWJlciBvZgpwYWdlcyB0byB1bm1hcCBpcyBvZmYgYnkgb25lLiBGaXggaXQuCgpTaWduZWQt
b2ZmLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KLS0tCiBk
cml2ZXJzL3hlbi9nbnRkZXYuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2dudGRldi5jIGIv
ZHJpdmVycy94ZW4vZ250ZGV2LmMKaW5kZXggNTdlZmJkMy4uZDMzOTFhMSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy94ZW4vZ250ZGV2LmMKKysrIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKQEAgLTM4MCwx
MCArMzgwLDggQEAgc3RhdGljIGludCB1bm1hcF9ncmFudF9wYWdlcyhzdHJ1Y3QgZ3JhbnRfbWFw
ICptYXAsIGludCBvZmZzZXQsIGludCBwYWdlcykKIAkJfQogCQlyYW5nZSA9IDA7CiAJCXdoaWxl
IChyYW5nZSA8IHBhZ2VzKSB7Ci0JCQlpZiAobWFwLT51bm1hcF9vcHNbb2Zmc2V0K3JhbmdlXS5o
YW5kbGUgPT0gLTEpIHsKLQkJCQlyYW5nZS0tOworCQkJaWYgKG1hcC0+dW5tYXBfb3BzW29mZnNl
dCtyYW5nZV0uaGFuZGxlID09IC0xKQogCQkJCWJyZWFrOwotCQkJfQogCQkJcmFuZ2UrKzsKIAkJ
fQogCQllcnIgPSBfX3VubWFwX2dyYW50X3BhZ2VzKG1hcCwgb2Zmc2V0LCByYW5nZSk7Ci0tIAoy
LjkuNQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
