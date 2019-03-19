From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3] xen-mapcache: use MAP_FIXED flag so the
 mmap address hint is always honored
Date: Tue, 19 Mar 2019 15:06:40 +0000
Message-ID: <20190319150640.GM11621@perard.uk.xensource.com>
References: <20190318173731.14494-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o1AC=RW=citrix.com=prvs=9742ee4c2=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1h6GNk-00035V-L3
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 15:10:24 +0000
Content-Disposition: inline
In-Reply-To: <20190318173731.14494-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDY6Mzc6MzFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IE9yIGlmIGl0J3Mgbm90IHBvc3NpYmxlIHRvIGhvbm9yIHRoZSBoaW50ZWQgYWRk
cmVzcyBhbiBlcnJvciBpcyByZXR1cm5lZAo+IGluc3RlYWQuIFRoaXMgbWFrZXMgaXQgZWFzaWVy
IHRvIHNwb3QgdGhlIGFjdHVhbCBmYWlsdXJlLCBpbnN0ZWFkIG9mCj4gZmFpbGluZyBsYXRlciBv
biB3aGVuIHRoZSBjYWxsZXIgb2YgeGVuX3JlbWFwX2J1Y2tldCByZWFsaXplcyB0aGUKPiBtYXBw
aW5nIGhhcyBub3QgYmVlbiBjcmVhdGVkIGF0IHRoZSByZXF1ZXN0ZWQgYWRkcmVzcy4KPiAKPiBB
bHNvIG5vdGUgdGhhdCBhdCBsZWFzdCBvbiBGcmVlQlNEIHVzaW5nIE1BUF9GSVhFRCB3aWxsIGNh
dXNlIG1tYXAgdG8KPiB0cnkgaGFyZGVyIHRvIGhvbm9yIHRoZSBwYXNzZWQgYWRkcmVzcy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
PiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCkFj
a2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCi0tIApB
bnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
