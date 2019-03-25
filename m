From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v1] install pkgconfig files into libdir
Date: Mon, 25 Mar 2019 17:00:10 +0100
Message-ID: <20190325160010.24584-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Z+ij=R4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h8S1R-0001zL-V2
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 16:00:26 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

TW9zdCBwa2djb25maWcgZmlsZXMgY29udGFpbiBhIExpYnM6IHZhcmlhYmxlLCB3aGljaCBpcyBl
aXRoZXIgL3Vzci9saWIKb3IgL3Vzci9saWI2NC4gSWYgYSAzMmJpdCBhbmQgYSA2NGJpdCB2YXJp
YW50IG9mIHhlbiBsaWJyYXJpZXMgaXMKaW5zdGFsbGVkLCB0aGUgbGFzdCBvbmUgd2lucy4gQXMg
YSByZXN1bHQgY29tcGlsaW5nIGZvciB0aGUgb3RoZXIKYml0c2l6ZSB3aWxsIGZhaWwuCgpJbnN0
ZWFkIG9mIHNoYXJlZGlyIHVzZSBsaWJkaXIgYXMgaW5zdGFsbCB0YXJnZXQuIFRoaXMgbWF0Y2hl
cyBib3RoIHRoZQpkb2N1bWVudGF0aW9uIGFuZCB0aGUgZXhwZWN0ZWQgcmVzdWx0LgoKU2lnbmVk
LW9mZi1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgotLS0KCkkgdGhpbmsgdGhpcyBk
ZXNlcnZlcyBhIGJhY2twb3J0IHRvIHJlbGVzZWQgdmVyc2lvbnMuCgoKIGNvbmZpZy9QYXRocy5t
ay5pbiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2NvbmZpZy9QYXRocy5tay5pbiBiL2NvbmZpZy9QYXRocy5tay5pbgpp
bmRleCA4YTUxOGQ1YTVkLi5kYzlkMGMwMzUzIDEwMDY0NAotLS0gYS9jb25maWcvUGF0aHMubWsu
aW4KKysrIGIvY29uZmlnL1BhdGhzLm1rLmluCkBAIC01OCw0ICs1OCw0IEBAIFhFTkZJUk1XQVJF
RElSICAgICAgICAgICA6PSBAWEVORklSTVdBUkVESVJACiBYRU5fQ09ORklHX0RJUiAgICAgICAg
ICAgOj0gQFhFTl9DT05GSUdfRElSQAogWEVOX1NDUklQVF9ESVIgICAgICAgICAgIDo9IEBYRU5f
U0NSSVBUX0RJUkAKIAotUEtHX0lOU1RBTExESVIgICAgICAgICAgIDo9ICR7U0hBUkVESVJ9L3Br
Z2NvbmZpZworUEtHX0lOU1RBTExESVIgICAgICAgICAgIDo9ICR7bGliZGlyfS9wa2djb25maWcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
