From: Jacob Wen <jian.w.wen@oracle.com>
Subject: [PATCH] xen/netfront: remove unnecessary wmb
Date: Fri,  9 Nov 2018 14:53:59 +0800
Message-ID: <20181109065359.14900-1-jian.w.wen__26003.3462931917$1541746572$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0eew=nu=oracle.com=jian.w.wen@srs-us1.protection.inumbo.net>)
 id 1gL0gi-00030Y-3Y
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 06:54:40 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: netdev@vger.kernel.org
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

UklOR19QVVNIX1JFUVVFU1RTX0FORF9DSEVDS19OT1RJRlkgaXMgYWxyZWFkeSBhYmxlIHRvIG1h
a2Ugc3VyZSBiYWNrZW5kIHNlZXMKcmVxdWVzdHMgYmVmb3JlIHJlcV9wcm9kIGlzIHVwZGF0ZWQu
CgpTaWduZWQtb2ZmLWJ5OiBKYWNvYiBXZW4gPGppYW4udy53ZW5Ab3JhY2xlLmNvbT4KLS0tCiBk
cml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jIGIvZHJpdmVy
cy9uZXQveGVuLW5ldGZyb250LmMKaW5kZXggZjE3ZjYwMmU2MTcxLi5hODMwM2FmYTE1ZjEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCisrKyBiL2RyaXZlcnMvbmV0L3hl
bi1uZXRmcm9udC5jCkBAIC0zMzcsOCArMzM3LDYgQEAgc3RhdGljIHZvaWQgeGVubmV0X2FsbG9j
X3J4X2J1ZmZlcnMoc3RydWN0IG5ldGZyb250X3F1ZXVlICpxdWV1ZSkKIAkJcmV0dXJuOwogCX0K
IAotCXdtYigpOwkJLyogYmFycmllciBzbyBiYWNrZW5kIHNlZW5zIHJlcXVlc3RzICovCi0KIAlS
SU5HX1BVU0hfUkVRVUVTVFNfQU5EX0NIRUNLX05PVElGWSgmcXVldWUtPnJ4LCBub3RpZnkpOwog
CWlmIChub3RpZnkpCiAJCW5vdGlmeV9yZW1vdGVfdmlhX2lycShxdWV1ZS0+cnhfaXJxKTsKLS0g
CjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
