From: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH 02/18] xen:
 introduce new 'XenBus' and 'XenDevice' object hierarchy
Date: Wed, 28 Nov 2018 11:01:06 -0600
Message-ID: <f4800b8b-1443-1bbf-8bcd-92b66e8d2631@redhat.com>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-3-paul.durrant@citrix.com>
 <20181128161917.GE4222@dhcp-200-186.str.redhat.com>
 <48596f1fe100419c8b28ed54bda0117b@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bgkq=oh=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1gS3DQ-0003Tt-Ot
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 17:01:32 +0000
In-Reply-To: <48596f1fe100419c8b28ed54bda0117b@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Kevin Wolf' <kwolf@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjgvMTggMTA6MjYgQU0sIFBhdWwgRHVycmFudCB3cm90ZToKCj4+PiArKysgYi9ody94
ZW4veGVuLWJ1cy5jCj4+PiBAQCAtMCwwICsxLDEyNSBAQAo+Pj4gKy8qCj4+PiArICogQ29weXJp
Z2h0IChjKSBDaXRyaXggU3lzdGVtcyBJbmMuCj4+PiArICogQWxsIHJpZ2h0cyByZXNlcnZlZC4K
Pj4+ICsgKi8KPj4KPj4gVGhpcyBkb2Vzbid0IGxvb2sgdmVyeSBjb21wYXRpYmxlIHdpdGggdGhl
IEdQTC4gSW4gZmFjdCBpdCBtaWdodCBldmVuCj4+IG1ha2UgaXQgaWxsZWdhbCBmb3IgdGhlIFFF
TVUgcHJvamVjdCB0byBkaXN0cmlidXRlIHRoaXMgY29kZS4gOi0pCj4+Cj4+IE90aGVyIGZpbGVz
IHlvdSBhZGQgdGhyb3VnaG91dCB0aGUgc2VyaWVzIHNlZW0gdG8gaGF2ZSB0aGUgc2FtZSBwcm9i
bGVtLgo+Pgo+IAo+IEkgd2FzIHdvcmtpbmcgb24gdGhlIGFzc3VtcHRpb24gdGhhdCBhIGxhY2sg
b2YgZXhwbGljaXQgbGljZW5zZSBtZWFudCB0aGF0IHRoZSBvdmVyYWxsIHByb2plY3QgbGljZW5z
ZSBhcyBkZXNjcmliZWQgaW4gaXRlbSAyIGluIExJQ0VOU0UuIERpZCBJIG1pc2ludGVycHJldCB0
aGF0IHRleHQ/CgpObywgYnV0IHlvdSBtaXNzZWQgdGhlIGZhY3QgdGhhdCAiQWxsIHJpZ2h0cyBy
ZXNlcnZlZCIgaXMgYW4gZXhwbGljaXQgCmxpY2Vuc2UgKG9yIHJhdGhlciwgYW4gZXhwbGljaXQg
YW50aS1saWNlbnNlIHRoYXQgc3RhdGVzIHlvdSBhcmUgbm90IApncmFudGluZyByaWdodHMgdGhh
dCB0aGUgR1BMIHdvdWxkIG5vcm1hbGx5IGdyYW50KSwgYW5kIGFuIGltcGxpY2l0IApsaWNlbnNl
IGRvZXMgbm90IGFwcGx5IHdoZW4gYW4gZXhwbGljaXQgKGFudGktKWxpY2Vuc2UgaXMgcHJlc2Vu
dC4KCldoYXQncyBtb3JlLCByZWx5aW5nIG9uIGltcGxpY2l0IGxpY2Vuc2VzIGlzIHByb25lIHRv
IG1pc2ludGVycHJldGF0aW9uLCAKc28gZXZlbiB0aG91Z2ggdGhlIG92ZXJhbGwgcHJvamVjdCBk
b2N1bWVudGF0aW9uIHRyaWVzIHRvIGNvdmVyIHdoYXQgCndpbGwgaGFwcGVuLCBpdCdzIG11Y2gg
bmljZXIgaWYgeW91IERPIHVzZSBhbiBleHBsaWNpdCBsaWNlbnNlIG1lbnRpb24gCmluIHlvdXIg
ZmlsZSBzbyB0aGF0IHdlIGRvbid0IEhBVkUgdG8gcmVseSBvbiB0aGUgaW1wbGljaXQgbGljZW5z
ZS4KClllcywgdGhlIHBocmFzZSAiQWxsIHJpZ2h0cyByZXNlcnZlZCIgZXhpc3RzIGluIHNldmVy
YWwgZXhpc3RpbmcgZmlsZXM6CgokIGdpdCBncmVwIC1pbCAnYWxsIHJpZ2h0cyByZXNlcnZlZCcg
fHdjCiAgICAgMTM4ICAgICAxMzggICAgMzU1NwoKYnV0IHdlIHNob3VsZCBiZSBzdHJpdmluZyB0
byBjbGVhbiB0aG9zZSB1cCwgbm90IGFkZGluZyB0byB0aGUgbWVzcy4KCi0tIApFcmljIEJsYWtl
LCBQcmluY2lwYWwgU29mdHdhcmUgRW5naW5lZXIKUmVkIEhhdCwgSW5jLiAgICAgICAgICAgKzEt
OTE5LTMwMS0zMjY2ClZpcnR1YWxpemF0aW9uOiAgcWVtdS5vcmcgfCBsaWJ2aXJ0Lm9yZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
