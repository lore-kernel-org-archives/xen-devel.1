From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] xen: fix xen-bus state model to allow
 frontend re-connection
Date: Fri, 25 Jan 2019 18:31:08 +0000
Message-ID: <20190125183108.GQ1271@perard.uk.xensource.com>
References: <20190122155346.26388-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Bsp=QB=citrix.com=prvs=921b93e8d=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gn6G2-0004zd-8H
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 18:31:14 +0000
Content-Disposition: inline
In-Reply-To: <20190122155346.26388-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMjIsIDIwMTkgYXQgMDM6NTM6NDZQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZXJlIGlzIGEgZmxhdyBpbiB0aGUgeGVuLWJ1cyBzdGF0ZSBtb2RlbC4gVG8gYWxs
b3cgYSBmcm9udGVuZCB0byByZS0KPiBjb25uZWN0IHRoZSBiYWNrZW5kIHN0YXRlIG9mIGFuIG9u
bGluZSBYZW5EZXZpY2UgaXMgdHJhbnNpdGlvbmVkIGZyb20KPiBDbG9zZWQgdG8gSW5pdFdhaXQs
IGJ1dCB0aGlzIGlzIGN1cnJlbnRseSBkb25lIHVuaWxhdGVyYWxseSB3aGljaCBpcwo+IGluY29y
cmVjdC4gVGhlIGJhY2tlbmQgc3RhdGUgc2hvdWxkIHJlbWFpbiBDbG9zZWQgdW50aWwgdGhlIGZy
b250ZW5kIHN0YXRlCj4gdHJhbnNpdGlvbnMgdG8gSW5pdGlhbGlzaW5nLgo+IAo+IFRoaXMgcGF0
Y2ggcmVtb3ZlcyB0aGUgYXV0b21hdGljIGJhY2tlbmQgc3RhdGUgdHJhbnNpdGlvbiBmcm9tCj4g
eGVuX2RldmljZV9iYWNrZW5kX3N0YXRlX2NoYW5nZWQoKSBhbmQsIGluc3RlYWQsIGFkZHMgYW4g
ZXh0cmEgY2hlY2sgaW4KPiB4ZW5fZGV2aWNlX2Zyb250ZW5kX3N0YXRlX2NoYW5nZWQoKSB0byBk
ZXRlcm1pbmUgd2hldGhlciBhIGZyb250ZW5kIGlzCj4gdHJ5aW5nIHRvIHJlLWNvbm5lY3QgdG8g
YSBwcmV2aW91c2x5IENsb3NlZCBYZW5EZXZpY2UuIE9ubHkgaWYgdGhpcyBpcwo+IGZvdW5kIHRv
IGJlIHRoZSBjYXNlIGlzIHRoZSBiYWNrZW5kIHN0YXRlIHRyYW5zaXRpb25lZCBmcm9tIENsb3Nl
ZCB0bwo+IEluaXRXYWl0LiBOb3RlIHRoYXQgdGhpcyB0cmFuc2l0aW9uIHdpbGwgYmUgY29tbW9u
IGFtb25nc3QgYWxsIFhlbkRldmljZQo+IGNsYXNzZXMgYW5kIGhlbmNlIHhlbl9kZXZpY2VfZnJv
bnRlbmRfc3RhdGVfY2hhbmdlZCgpIHJldHVybnMgaW1tZWRpYXRlbHkKPiBhZnRlcndhcmRzIHdp
dGhvdXQgY2FsbGluZyBpbnRvIHRoZSBYZW5EZXZpY2VDbGFzcyBmcm9udGVuZF9jaGFuZ2VkKCkK
PiBtZXRob2QuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRA
Y2l0cml4LmNvbT4KCkkndmUgdGVzdGVkIE9WTUYgd2l0aCB0aGF0IHBhdGNoLCBhbmQgc3RhdGVz
IHRyYW5zaXRpb25zIGxvb2tzIGJldHRlcgp3aGVuIHRyYW5zaXRpb25uaW5nIGZyb20gb3ZtZiB0
byBsaW51eC4KKExlc3MgQ2xvc2VkLT5Jbml0V2FpdC0+Q2xvc2VkLi4uLCBhbmQgb3ZtZiB0cnlp
bmcgdG8gd2luIGEgcmFjZSBhdApyZWFkaW5nIHRoZSBiYWNrZW5kIHN0YXRlIGF0IHRoZSByaWdo
dCB0aW1lKS4KCkFja2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
