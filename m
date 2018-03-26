From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC 0/4] libxl: Enable save/restore/migration of a
 restricted QEMU
Date: Mon, 26 Mar 2018 19:33:57 +0100
Message-ID: <20180326183401.17249-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nchf=gq=citrix.com=prvs=61694493c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1f0X0Y-00010f-0Z
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 18:38:14 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGZpcnN0IHR3byBwYXRjaHMgZml4IHNhdmUgb2YgYSBWTSB3aXRoIGEgcmVzdHJpY3RlZCBR
RU1VLCBhbmQgdGhlIGxhdGVyIHR3bwpwYXRjaHMgdHJ5IHRvIGZpeCB0aGUgcmVzdG9yZSBwYXRo
LCBidXQgaXQgaXMgc3RpbGwgV0lQLgoKQ2hlY2tvdXQgdGhlIGxhc3QgcGF0Y2ggY29tbWVudHMg
Zm9yIG1vcmUgaW5mb3JtYXRpb24uCgpBbnRob255IFBFUkFSRCAoNCk6CiAgbGlieGw6IExlYXJu
ZWQgdG8gc2VuZCBGRCB0aHJvdWdoIFFNUCB0byBRRU1VCiAgbGlieGw6IEhhdmUgUUVNVSBzYXZl
IGl0cyBzdGF0ZSB0byBhIGZpbGUgZGVzY3JpcHRvcgogIGxpYnhsX3FtcDogSW1wbGVtZW50IHF1
ZXJ5LXN0YXR1cyBjb21tYW5kCiAgSEFDSyBsaWJ4bF9leGVjOiBDaGVjayBRRU1VIHN0YXR1cyB2
aWEgUU1QIGluc3RlYWQgb2YgeGVuc3RvcmUKCiB0b29scy9saWJ4bC9saWJ4bF9kbS5jICAgICAg
IHwgIDMgKysKIHRvb2xzL2xpYnhsL2xpYnhsX2V4ZWMuYyAgICAgfCA5NSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJu
YWwuaCB8IDE3ICsrKysrKysrCiB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyAgICAgIHwgOTUgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KIDQgZmlsZXMgY2hhbmdl
ZCwgMTk5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKLS0gCkFudGhvbnkgUEVSQVJE
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
