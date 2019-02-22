From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 02/25] chardev: Assert IOCanReadHandler
 can not be negative
Date: Fri, 22 Feb 2019 01:39:04 +0100
Message-ID: <74dc80bc-d2cd-c79d-4787-6870b450a505__21843.3597636007$1550796093$gmane$org@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-3-philmd@redhat.com>
 <CAMxuvaw_Hgbtxu79NEUAoaKaEnmKRCgorJ_r5mXQQTbrHEMtbQ@mail.gmail.com>
 <68f7233c-8b95-8782-27a7-106fc2997646@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NsmV=Q5=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwyss-0006cH-0p
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 00:40:10 +0000
Received: by mail-wm1-f66.google.com with SMTP id y185so7790250wmd.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Feb 2019 16:40:07 -0800 (PST)
In-Reply-To: <68f7233c-8b95-8782-27a7-106fc2997646@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMC8xOSAxMjoxMyBQTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4gT24g
Mi8yMC8xOSAxMTowMyBBTSwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOgo+PiBIaQo+Pgo+PiBP
biBXZWQsIEZlYiAyMCwgMjAxOSBhdCAyOjAzIEFNIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpCj4+
IDxwaGlsbWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gVGhlIGJhY2tlbmQgc2hvdWxkIG5v
dCByZXR1cm4gYSBuZWdhdGl2ZSBsZW5ndGggdG8gcmVhZC4KPj4+IFdlIHdpbGwgbGF0ZXIgY2hh
bmdlIHRoZSBwcm90b3R5cGUgb2YgSU9DYW5SZWFkSGFuZGxlciB0byByZXR1cm4gYW4KPj4+IHVu
c2lnbmVkIGxlbmd0aC4gTWVhbndoaWxlIG1ha2Ugc3VyZSB0aGUgcmV0dXJuIGxlbmd0aCBpcyBw
b3NpdGl2ZS4KPj4+Cj4+PiBTdWdnZXN0ZWQtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJl
ZGhhdC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhp
bG1kQHJlZGhhdC5jb20+Cj4+Cj4+IEluIHN1Y2ggcGF0Y2gsIHlvdSBzaG91bGQgZG8gZXh0ZW5z
aXZlIHJldmlldyBvZiBleGlzdGluZyBjYWxsYmFja3MsCj4+IG9yIGZpbmQgYSBjb252aW5jaW5n
IGFyZ3VtZW50IHRoYXQgdGhpcyBjYW4ndCBicmVhay4KPiAKPiBBcmdoIEkgbWlzc2VkIHRoYXQu
Cj4gCj4+IFRoZSBwcm9ibGVtIGlzIHRoZXJlIGFyZSBhIGxvdCBvZiBjYW5fcmVhZCBjYWxsYmFj
a3MsIGFuZCBpdCdzIG5vdAo+PiB0cml2aWFsLiBUaGUgKmZpcnN0KiBvZiBnaXQtZ3JlcCBpcyBy
bmdfZWdkX2Nocl9jYW5fcmVhZCgpCj4+Cj4+ICA1NyAgICAgUVNJTVBMRVFfRk9SRUFDSChyZXEs
ICZzLT5wYXJlbnQucmVxdWVzdHMsIG5leHQpIHsKPj4gIDU4ICAgICAgICAgc2l6ZSArPSByZXEt
PnNpemUgLSByZXEtPm9mZnNldDsKPj4gIDU5ICAgICB9Cj4+ICA2MAo+PiAgNjEgICAgIHJldHVy
biBzaXplOwo+Pgo+PiBDbGVhcmx5IG5vdCBvYnZpb3VzIGlmIGl0IHJldHVybnMgPj0gMC4KPj4K
Pj4gQW5vdGhlciBhcHByb2FjaCBpcyB0byBsb29rIGF0IHRoZSBjYWxsZXIgYW5kIHRoZSByZXR1
cm4gdmFsdWUKPj4gaGFuZGxpbmcuIElmIG5vbmUgaGFuZGxlIG5lZ2F0aXZlIHZhbHVlcyAob3Ig
d291bGQgaGF2ZSB3cm9uZwo+PiBiZWhhdmlvdXIgd2l0aCBuZWdhdGl2ZSB2YWx1ZXMpLCB0aGUg
YXNzZXJ0KCkgaXMgcGVyaGFwcyBqdXN0aWZpZWQsIGFzCj4+IGl0IGNvdWxkIHByZXZlbnQgZnJv
bSBkb2luZyBtb3JlIGhhcm0uCj4gCj4gSSdsbCBnbyBhbmQgYXVkaXQgYWxsIG9mIHRoZW0uCgpB
Y3R1YWxseSBJIGFscmVhZHkgZGlkIHRoZSB3b3JrLCBidXQgaXQgaXMgaW4gdGhlIHBhcnQgIzIg
YWZ0ZXIgdGhpcwpzZXJpZXMsIGFzIHN1Z2dlc3RlZCBieSBQYW9sbzoKCmh0dHBzOi8vbGlzdHMu
Z251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDE4LTEwL21zZzAyMjk0Lmh0bWwKCkkn
bGwgc2ltcGx5IGNoZXJyeS1waWNrIHRoZSBjb21taXQgZnJvbSBzZXJpZXMgIzIgYmVmb3JlIHRo
aXMgcGF0Y2guCgpUaGFua3MsCgpQaGlsLgoKPj4+IC0tLQo+Pj4gIGNoYXJkZXYvY2hhci5jIHwg
NSArKysrLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvY2hhcmRldi9jaGFyLmMgYi9jaGFyZGV2L2NoYXIuYwo+
Pj4gaW5kZXggZjZkNjFmYTVmOC4uNzFlY2QzMmIyNSAxMDA2NDQKPj4+IC0tLSBhL2NoYXJkZXYv
Y2hhci5jCj4+PiArKysgYi9jaGFyZGV2L2NoYXIuYwo+Pj4gQEAgLTE1OSwxMiArMTU5LDE1IEBA
IGludCBxZW11X2Nocl93cml0ZShDaGFyZGV2ICpzLCBjb25zdCB1aW50OF90ICpidWYsIGludCBs
ZW4sIGJvb2wgd3JpdGVfYWxsKQo+Pj4gIGludCBxZW11X2Nocl9iZV9jYW5fd3JpdGUoQ2hhcmRl
diAqcykKPj4+ICB7Cj4+PiAgICAgIENoYXJCYWNrZW5kICpiZSA9IHMtPmJlOwo+Pj4gKyAgICBp
bnQgcmVjZWl2YWJsZV9ieXRlczsKPj4+Cj4+PiAgICAgIGlmICghYmUgfHwgIWJlLT5jaHJfY2Fu
X3JlYWQpIHsKPj4+ICAgICAgICAgIHJldHVybiAwOwo+Pj4gICAgICB9Cj4+Pgo+Pj4gLSAgICBy
ZXR1cm4gYmUtPmNocl9jYW5fcmVhZChiZS0+b3BhcXVlKTsKPj4+ICsgICAgcmVjZWl2YWJsZV9i
eXRlcyA9IGJlLT5jaHJfY2FuX3JlYWQoYmUtPm9wYXF1ZSk7Cj4+PiArICAgIGFzc2VydChyZWNl
aXZhYmxlX2J5dGVzID49IDApOwo+Pj4gKyAgICByZXR1cm4gcmVjZWl2YWJsZV9ieXRlczsKPj4+
ICB9Cj4+Pgo+Pj4gIHZvaWQgcWVtdV9jaHJfYmVfd3JpdGVfaW1wbChDaGFyZGV2ICpzLCB1aW50
OF90ICpidWYsIGludCBsZW4pCj4+PiAtLQo+Pj4gMi4yMC4xCj4+PgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
