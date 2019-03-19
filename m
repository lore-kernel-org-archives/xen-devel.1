From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH] xen/memory: Fix typo in the comment on top of
 check_get_page_from_gfn
Date: Tue, 19 Mar 2019 23:20:05 +0000
Message-ID: <20190319232005.23813-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vbZj=RW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h6O1m-0001DX-PR
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 23:20:14 +0000
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
ZW4vY29tbW9uL21lbW9yeS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9tZW1vcnkuYyBiL3hlbi9j
b21tb24vbWVtb3J5LmMKaW5kZXggNTM4Nzc2OTk4Ny4uODY1NjdlNjExNyAxMDA2NDQKLS0tIGEv
eGVuL2NvbW1vbi9tZW1vcnkuYworKysgYi94ZW4vY29tbW9uL21lbW9yeS5jCkBAIC0xNjQ4LDcg
KzE2NDgsNyBAQCB2b2lkIGRlc3Ryb3lfcmluZ19mb3JfaGVscGVyKAogfQogCiAvKgotICogQWNx
dWlyZSBhIHBvaW50ZXIgdG8gc3RydWN0IHBhZ2VfaW5mbyBmb3IgYSBzcGVjaWZpZWQgZG9tYW4g
YW5kIEdGTiwKKyAqIEFjcXVpcmUgYSBwb2ludGVyIHRvIHN0cnVjdCBwYWdlX2luZm8gZm9yIGEg
c3BlY2lmaWVkIGRvbWFpbiBhbmQgR0ZOLAogICogY2hlY2tpbmcgd2hldGhlciB0aGUgcGFnZSBo
YXMgYmVlbiBwYWdlZCBvdXQsIG9yIG5lZWRzIHVuc2hhcmluZy4KICAqIElmIHRoZSBmdW5jdGlv
biBzdWNjZWVkcyB0aGVuIHplcm8gaXMgcmV0dXJuZWQsIHBhZ2VfcCBpcyB3cml0dGVuCiAgKiB3
aXRoIGEgcG9pbnRlciB0byB0aGUgc3RydWN0IHBhZ2VfaW5mbyB3aXRoIGEgcmVmZXJlbmNlIHRh
a2VuLCBhbmQKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
