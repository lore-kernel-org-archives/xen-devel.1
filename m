From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 15/18] xen: add a mechanism to
 automatically create XenDevice-s...
Date: Fri, 7 Dec 2018 18:30:31 +0000
Message-ID: <20181207183031.GN18875__19981.0758735568$1544207365$gmane$org@perard.uk.xensource.com>
References: <1544108924-10841-1-git-send-email-paul.durrant@citrix.com>
 <1544108924-10841-16-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zRRO=OQ=citrix.com=prvs=87219212e=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gVKta-0002GX-P3
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 18:30:38 +0000
Content-Disposition: inline
In-Reply-To: <1544108924-10841-16-git-send-email-paul.durrant@citrix.com>
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

T24gVGh1LCBEZWMgMDYsIDIwMTggYXQgMDM6MDg6NDFQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLnRoYXQgbWFpbnRhaW5zIGNvbXBhdGliaWxpdHkgd2l0aCBleGlzdGluZyBYZW4g
dG9vbHN0YWNrcy4KPiAKPiBYZW4gdG9vbHN0YWNrcyBpbnN0YW50aWF0ZSBQViBiYWNrZW5kcyBi
eSBzaW1wbHkgd3JpdGluZyBpbmZvcm1hdGlvbiBpbnRvCj4geGVuc3RvcmUgYW5kIGV4cGVjdGlu
ZyBhIGJhY2tlbmQgaW1wbGVtZW50YXRpb24gdG8gYmUgd2F0Y2hpbmcgZm9yIHRoaXMuCj4gCj4g
VGhpcyBwYXRjaCBhZGRzIGEgbmV3ICd4ZW4tYmFja2VuZCcgbW9kdWxlIHRvIGFsbG93IGluZGl2
aWR1YWwgWGVuRGV2aWNlCj4gaW1wbGVtZW50YXRpb25zIHRvIHJlZ2lzdGVyIGEgY3JlYXRvciBm
dW5jdGlvbiB0byBiZSBjYWxsZWQgd2hlbiBhIHRvb2wtCj4gc3RhY2sgaW5zdGFudGlhdGVzIGEg
bmV3IGJhY2tlbmQgaW4gdGhpcyB3YXkuCj4gCj4gVG8gc3VwcG9ydCB0aGlzIGl0IGlzIGFsc28g
bmVjZXNzYXJ5IHRvIGFkZCBuZXcgd2F0Y2hlcnMgaW50byB0aGUgWGVuQnVzCj4gaW1wbGVtZW50
YXRpb24gdG8gaGFuZGxlIGVudW1lcmF0aW9uIG9mIG5ldyBiYWNrZW5kcyBhbmQgYWxzbyBkZXN0
cnVjdGlvbgo+IG9mIFhlbkRldmljZS1zIHdoZW4gdGhlIHRvb2xzdGFjayBzZXRzIHRoZSBiYWNr
ZW5kICdvbmxpbmUnIGtleSB0byAwLgo+IAo+IE5PVEU6IFRoaXMgcGF0Y2ggb25seSBhZGRzIHRo
ZSBmcmFtZXdvcmsuIEEgc3Vic2VxdWVudCBwYXRjaCB3aWxsIGFkZCBhCj4gICAgICAgY3JlYXRv
ciBmdW5jdGlvbiBmb3IgeGVuLWJsb2NrIGRldmljZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1
bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBBbnRob255
IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClRoYW5rcywKCi0tIApBbnRob255
IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
