From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 08/18] xen: duplicate xen_disk.c as basis of
 dataplane/xen-qdisk.c
Date: Mon, 3 Dec 2018 16:42:04 +0000
Message-ID: <20181203164204.GO14786@perard.uk.xensource.com>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-9-paul.durrant@citrix.com>
 <20181203163539.GN14786@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hLDM=OM=citrix.com=prvs=86815d540=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gTrIV-0007oH-8i
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 16:42:15 +0000
Content-Disposition: inline
In-Reply-To: <20181203163539.GN14786@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMDMsIDIwMTggYXQgMDQ6MzU6MzlQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMDM6MTI6MDFQTSArMDAwMCwgUGF1bCBE
dXJyYW50IHdyb3RlOgo+ID4gVGhlIG5ldyB4ZW4tcWRpc2sgWGVuRGV2aWNlIGltcGxlbWVudGF0
aW9uIHJlcXVpcmVzIHRoZSBzYW1lIGNvcmUgZGF0YXBsYW5lCj4gPiBhcyB0aGUgbGVnYWN5IHhl
bl9kaXNrIGltcGxlbWVudGF0aW9uIGl0IHdpbGwgZXZlbnR1YWxseSByZXBsYWNlLiBUaGlzCj4g
PiBwYXRjaCB0aGVyZWZvcmUgY29waWVzIHRoZSBsZWdhY3kgeGVuX2Rpc2suYyBzb3VyY2UgbW9k
dWxlIGludG8gYSBuZXcKPiA+IGRhdGFwbGFuZS94ZW4tcWRpc2suYyBzb3VyY2UgbW9kdWxlIGFz
IHRoZSBiYXNpcyBmb3IgdGhlIG5ldyBkYXRhcGxhbmUgYW5kCj4gPiBhZGp1c3RzIHRoZSBNQUlO
VEFJTkVSUyBmaWxlIGFjY29yZGluZ2x5Lgo+ID4gCj4gPiBOT1RFOiBUaGUgZHVwbGljYXRlZCBj
b2RlIGlzIG5vdCB5ZXQgYnVpbHQuIEl0IGlzIHNpbXBseSBwdXQgaW50byBwbGFjZSBieQo+ID4g
ICAgICAgdGhpcyBwYXRjaCAoanVzdCBmaXhpbmcgc3R5bGUgdmlvbGF0aW9ucykgc3VjaCB0aGF0
IHRoZQo+ID4gICAgICAgbW9kaWZpY2F0aW9ucyB0aGF0IHdpbGwgbmVlZCB0byBiZSBtYWRlIHRv
IHRoZSBjb2RlIGFyZSBub3QKPiA+ICAgICAgIGNvbmZsYXRlZCB3aXRoIGNvZGUgbW92ZW1lbnQs
IHRodXMgbWFraW5nIHJldmlldyBoYXJkZXIuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gCj4gQWNrZWQtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKRllJLCBZb3UgY2FuIHVzZSAtLWZp
bmQtY29waWVzLWhhcmRlciB3aGVuIHNlbmRpbmcgdGhpcyBraW5kIG9mIHBhdGNoLAppdCB3aWxs
IHNob3cgdGhlIGRpZmYgYmV0d2VlbiB0aGUgb2xkIGZpbGUgYW5kIHRoZSBuZXcgZmlsZSwgZXZl
biBpZiB0aGUKb2xkIGZpbGUgaXMgc3RpbGwgYXJvdW5kIDstKS4KCi0tIApBbnRob255IFBFUkFS
RAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
