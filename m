From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/3] xen-bus: use a separate fd for each
 event channel
Date: Wed, 10 Apr 2019 12:37:42 +0100
Message-ID: <20190410113742.GD1435__842.177488242157$1554896334$gmane$org@perard.uk.xensource.com>
References: <20190408151617.13025-1-paul.durrant@citrix.com>
 <20190408151617.13025-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Da5p=SM=citrix.com=prvs=9966e4c82=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hEBY2-0007UM-PO
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 11:37:46 +0000
Content-Disposition: inline
In-Reply-To: <20190408151617.13025-2-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, qemu-block@nongnu.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDQ6MTY6MTVQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRvIGJldHRlciBzdXBwb3J0IHVzZSBvZiBJT1RocmVhZC1zIGl0IHdpbGwgYmUgbmVj
ZXNzYXJ5IHRvIGJlIGFibGUgdG8gc2V0Cj4gdGhlIEFpb0NvbnRleHQgZm9yIGVhY2ggWGVuRXZl
bnRDaGFubmVsIGFuZCBoZW5jZSBpdCBpcyBuZWNlc3NhcnkgdG8gb3BlbiBhCj4gc2VwYXJhdGUg
aGFuZGxlIHRvIGxpYnhlbmV2dGNoYW4gZm9yIGVhY2ggY2hhbm5lbC4KPiAKPiBUaGlzIHBhdGNo
IHN0b3BzIHVzaW5nIE5vdGlmaWVyTGlzdCBmb3IgZXZlbnQgY2hhbm5lbCBjYWxsYmFja3MsIHJl
cGxhY2luZwo+IHRoYXQgY29uc3RydWN0IGJ5IGEgbGlzdCBvZiBjb21wbGV0ZSBYZW5FdmVudENo
YW5uZWwgc3RydWN0dXJlcy4gRWFjaCBvZgo+IHRoZXNlIG5vdyBoYXMgYSB4ZW5ldnRjaG5faGFu
ZGxlIHBvaW50ZXIgaW4gcGxhY2Ugb2YgdGhlIHNpbmdsZSBwb2ludGVyCj4gcHJldmlvdXNseSBo
ZWxkIGluIHRoZSBYZW5EZXZpY2Ugc3RydWN0dXJlLiBUaGUgaW5kaXZpZHVhbCBoYW5kbGVzIGFy
ZQo+IG9wZW5lZC9jbG9zZWQgaW4geGVuX2RldmljZV9iaW5kL3VuYmluZF9ldmVudF9jaGFubmVs
KCksIHJlcGxhY2luZyB0aGUKPiBzaW5nbGUgb3Blbi9jbG9zZSBpbiB4ZW5fZGV2aWNlX3JlYWxp
emUvdW5yZWFsaXplKCkuCj4gCj4gTk9URTogVGhpcyBwYXRjaCBkb2VzIG5vdCBhZGQgYW4gQWlv
Q29udGV4dCBwYXJhbWV0ZXIgdG8KPiAgICAgICB4ZW5fZGV2aWNlX2JpbmRfZXZlbnRfY2hhbm5l
bCgpLiBUaGF0IHdpbGwgYmUgZG9uZSBpbiBhIHN1YnNlcXVlbnQKPiAgICAgICBwYXRjaC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoK
UmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoK
VGhlcmUgYXJlIGEgZmV3IHBsYWNlcyB3ZXJlIEkgd291bGQgaGF2ZSBsaWtlIHRvIGFkZCBhbiBh
c3NlcnQsIGJ1dCB0aGV5CmNhbid0IGJlIGNvbXBpbGVkLW91dCBpbiBRRU1VIDotKC4KClRoYW5r
cywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
