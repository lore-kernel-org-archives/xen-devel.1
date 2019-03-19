From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH] xen/drivers: char: Match #if DEBUG_TRACE_DUMP
 and #endif comment
Date: Tue, 19 Mar 2019 23:19:14 +0000
Message-ID: <20190319231915.23634-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vbZj=RW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h6O10-0000Zf-QH
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 23:19:26 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4
ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIvY29u
c29sZS5jIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKaW5kZXggZjQxYjY4OTg0Ny4uNjE2
OTVkOTY3ZSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKKysrIGIveGVu
L2RyaXZlcnMvY2hhci9jb25zb2xlLmMKQEAgLTEzMjAsNyArMTMyMCw3IEBAIHN0YXRpYyBpbnQg
X19pbml0IGRlYnVndHJhY2VfaW5pdCh2b2lkKQogfQogX19pbml0Y2FsbChkZWJ1Z3RyYWNlX2lu
aXQpOwogCi0jZW5kaWYgLyogIU5ERUJVRyAqLworI2VuZGlmIC8qICFERUJVR19UUkFDRV9EVU1Q
ICovCiAKIAogLyoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
