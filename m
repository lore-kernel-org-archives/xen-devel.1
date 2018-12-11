From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 15/18] xen: add a mechanism to
 automatically create XenDevice-s...
Date: Tue, 11 Dec 2018 16:50:30 +0000
Message-ID: <20181211165030.GW18875@perard.uk.xensource.com>
References: <1544543862-9997-1-git-send-email-paul.durrant@citrix.com>
 <1544543862-9997-16-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P5G6=OU=citrix.com=prvs=8761f1f8f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gWlF4-0006LZ-C6
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 16:50:42 +0000
Content-Disposition: inline
In-Reply-To: <1544543862-9997-16-git-send-email-paul.durrant@citrix.com>
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

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMDM6NTc6MzlQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
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
IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCi0tIApBbnRob255IFBFUkFSRAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
