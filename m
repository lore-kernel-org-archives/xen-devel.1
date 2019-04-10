From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 3/3] xen-bus / xen-block: add support for
 event channel polling
Date: Wed, 10 Apr 2019 16:09:18 +0100
Message-ID: <20190410150918.GF1435@perard.uk.xensource.com>
References: <20190408151617.13025-1-paul.durrant@citrix.com>
 <20190408151617.13025-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Da5p=SM=citrix.com=prvs=9966e4c82=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hEErn-00008I-L1
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:10:23 +0000
Content-Disposition: inline
In-Reply-To: <20190408151617.13025-4-paul.durrant@citrix.com>
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

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDQ6MTY6MTdQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIHBvbGwgY2FsbGJhY2sgZm9yIGV2ZW50IGNo
YW5uZWwgZmQtcyBhbmQgdXNlcwo+IHRoaXMgdG8gaW52b2tlIHRoZSBjaGFubmVsIGNhbGxiYWNr
IGZ1bmN0aW9uLgo+IAo+IFRvIHByb3Blcmx5IHN1cHBvcnQgcG9sbGluZywgaXQgaXMgbmVjZXNz
YXJ5IGZvciB0aGUgZXZlbnQgY2hhbm5lbCBjYWxsYmFjawo+IGZ1bmN0aW9uIHRvIHJldHVybiBh
IGJvb2xlYW4gc2F5aW5nIHdoZXRoZXIgaXQgaGFzIGRvbmUgYW55IHVzZWZ1bCB3b3JrIG9yCj4g
bm90LiBUaHVzIHhlbl9ibG9ja19kYXRhcGxhbmVfZXZlbnQoKSBpcyBtb2RpZmllZCB0byBkaXJl
Y3RseSBpbnZva2UKPiB4ZW5fYmxvY2tfaGFuZGxlX3JlcXVlc3RzKCkgYW5kIHRoZSBsYXR0ZXIg
b25seSByZXR1cm5zIHRydWUgaWYgaXQgYWN0dWFsbHkKPiBwcm9jZXNzZXMgYW55IHJlcXVlc3Rz
LiBUaGlzIGFsc28gbWVhbnMgdGhhdCB0aGUgY2FsbCB0byBxZW11X2JoX3NjaGVkdWxlKCkKPiBp
cyBtb3ZlZCBpbnRvIHhlbl9ibG9ja19jb21wbGV0ZV9haW8oKSwgd2hpY2ggaXMgbW9yZSBpbnR1
aXRpdmUgc2luY2UgdGhlCj4gb25seSByZWFzb24gZm9yIGRvaW5nIGEgZGVmZXJyZWQgcG9sbCBv
ZiB0aGUgc2hhcmVkIHJpbmcgc2hvdWxkIGJlIGJlY2F1c2UKPiB0aGVyZSB3ZXJlIHByZXZpb3Vz
bHkgaW5zdWZmaWNpZW50IHJlc291cmNlcyB0byBmdWxseSBjb21wbGV0ZSBhIHByZXZpb3VzCj4g
cG9sbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
