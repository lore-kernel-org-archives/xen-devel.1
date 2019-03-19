From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3] xen-mapcache: use MAP_FIXED flag so the
 mmap address hint is always honored
Date: Tue, 19 Mar 2019 14:16:44 +0000
Message-ID: <20190319141644.GK11621@perard.uk.xensource.com>
References: <20190318173731.14494-1-roger.pau@citrix.com>
 <20190318214312.GB2014@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o1AC=RW=citrix.com=prvs=9742ee4c2=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1h6FZ6-0006j0-JA
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 14:18:04 +0000
Content-Disposition: inline
In-Reply-To: <20190318214312.GB2014@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMTA6NDM6MTJQTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIE1vbiwgTWFyIDE4LCAyMDE5IGF0IDA2OjM3OjMxUE0g
KzAxMDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+IE9yIGlmIGl0J3Mgbm90IHBvc3NpYmxl
IHRvIGhvbm9yIHRoZSBoaW50ZWQgYWRkcmVzcyBhbiBlcnJvciBpcyByZXR1cm5lZAo+ID4gaW5z
dGVhZC4gCj4gCj4gSnVzdCB0byBiZSBzdXJlOiBNQVBfRklYRUQgd2lsbCBjYXVzZSB0byBtYXAg
YXQgc3BlY2lmaWVkIGFkZHJlc3MsIGV2ZW4KPiBpZiBzb21ldGhpbmcgaXMgbWFwcGVkIHRoZXJl
IGFscmVhZHkuIEZyb20gbW1hcCgyKToKClRoYXQgc2hvdWxkIGJlIGZpbmUuIFdlIGRvIHdhbnQg
dG8gcmVwbGFjZSBhbiBleGl0aW5nIG1hcHBpbmcgKHdoaWNoIGlzCm11bm1hcCBiZWZvcmUgdGhl
IG1tYXAgY2FsbCksIGJ1dCBpdCB3b3VsZCBoYXZlIGJlZW4gbmljZSB0byBrbm93IHdoZW4Kc29t
ZXRoaW5nIGlzIGFscmVhZHkgbWFwcGVkLCB0byBkZXRlY3QgcHJvZ3JhbW1pbmcgZXJyb3IuCgo+
ICAgICBJZiB0aGUgbWVtb3J5IHJlZ2lvbiBzcGVjaWZpZWQgYnkgYWRkciBhbmQgbGVuIG92ZXJs
YXBzIHBhZ2VzIG9mIGFueQo+ICAgICBleGlzdGluZyBtYXBwaW5nKHMpLCB0aGVuIHRoZSBvdmVy
bGFwcGVkIHBhcnQgb2YgdGhlIGV4aXN0aW5nIG1hcOKAkAo+ICAgICBwaW5nKHMpIHdpbGwgYmUg
ZGlzY2FyZGVkLiAgSWYgdGhlIHNwZWNpZmllZCBhZGRyZXNzIGNhbm5vdCBiZSB1c2VkLAo+ICAg
ICBtbWFwKCkgd2lsbCBmYWlsLgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
