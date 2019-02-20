From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 02/25] chardev: Assert IOCanReadHandler
 can not be negative
Date: Wed, 20 Feb 2019 12:13:25 +0100
Message-ID: <68f7233c-8b95-8782-27a7-106fc2997646@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-3-philmd@redhat.com>
 <CAMxuvaw_Hgbtxu79NEUAoaKaEnmKRCgorJ_r5mXQQTbrHEMtbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwPog-0005cI-G1
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 11:13:30 +0000
Received: by mail-wr1-f65.google.com with SMTP id c8so25482626wrs.4
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 03:13:29 -0800 (PST)
In-Reply-To: <CAMxuvaw_Hgbtxu79NEUAoaKaEnmKRCgorJ_r5mXQQTbrHEMtbQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMC8xOSAxMTowMyBBTSwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOgo+IEhpCj4gCj4g
T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMjowMyBBTSBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqQo+
IDxwaGlsbWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Cj4+IFRoZSBiYWNrZW5kIHNob3VsZCBub3Qg
cmV0dXJuIGEgbmVnYXRpdmUgbGVuZ3RoIHRvIHJlYWQuCj4+IFdlIHdpbGwgbGF0ZXIgY2hhbmdl
IHRoZSBwcm90b3R5cGUgb2YgSU9DYW5SZWFkSGFuZGxlciB0byByZXR1cm4gYW4KPj4gdW5zaWdu
ZWQgbGVuZ3RoLiBNZWFud2hpbGUgbWFrZSBzdXJlIHRoZSByZXR1cm4gbGVuZ3RoIGlzIHBvc2l0
aXZlLgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5j
b20+Cj4+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVk
aGF0LmNvbT4KPiAKPiBJbiBzdWNoIHBhdGNoLCB5b3Ugc2hvdWxkIGRvIGV4dGVuc2l2ZSByZXZp
ZXcgb2YgZXhpc3RpbmcgY2FsbGJhY2tzLAo+IG9yIGZpbmQgYSBjb252aW5jaW5nIGFyZ3VtZW50
IHRoYXQgdGhpcyBjYW4ndCBicmVhay4KCkFyZ2ggSSBtaXNzZWQgdGhhdC4KCj4gVGhlIHByb2Js
ZW0gaXMgdGhlcmUgYXJlIGEgbG90IG9mIGNhbl9yZWFkIGNhbGxiYWNrcywgYW5kIGl0J3Mgbm90
Cj4gdHJpdmlhbC4gVGhlICpmaXJzdCogb2YgZ2l0LWdyZXAgaXMgcm5nX2VnZF9jaHJfY2FuX3Jl
YWQoKQo+IAo+ICA1NyAgICAgUVNJTVBMRVFfRk9SRUFDSChyZXEsICZzLT5wYXJlbnQucmVxdWVz
dHMsIG5leHQpIHsKPiAgNTggICAgICAgICBzaXplICs9IHJlcS0+c2l6ZSAtIHJlcS0+b2Zmc2V0
Owo+ICA1OSAgICAgfQo+ICA2MAo+ICA2MSAgICAgcmV0dXJuIHNpemU7Cj4gCj4gQ2xlYXJseSBu
b3Qgb2J2aW91cyBpZiBpdCByZXR1cm5zID49IDAuCj4gCj4gQW5vdGhlciBhcHByb2FjaCBpcyB0
byBsb29rIGF0IHRoZSBjYWxsZXIgYW5kIHRoZSByZXR1cm4gdmFsdWUKPiBoYW5kbGluZy4gSWYg
bm9uZSBoYW5kbGUgbmVnYXRpdmUgdmFsdWVzIChvciB3b3VsZCBoYXZlIHdyb25nCj4gYmVoYXZp
b3VyIHdpdGggbmVnYXRpdmUgdmFsdWVzKSwgdGhlIGFzc2VydCgpIGlzIHBlcmhhcHMganVzdGlm
aWVkLCBhcwo+IGl0IGNvdWxkIHByZXZlbnQgZnJvbSBkb2luZyBtb3JlIGhhcm0uCgpJJ2xsIGdv
IGFuZCBhdWRpdCBhbGwgb2YgdGhlbS4KClRoYW5rcyBmb3IgdGhlIHJldmlldyEKClBoaWwuCgo+
PiAtLS0KPj4gIGNoYXJkZXYvY2hhci5jIHwgNSArKysrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvY2hhcmRldi9j
aGFyLmMgYi9jaGFyZGV2L2NoYXIuYwo+PiBpbmRleCBmNmQ2MWZhNWY4Li43MWVjZDMyYjI1IDEw
MDY0NAo+PiAtLS0gYS9jaGFyZGV2L2NoYXIuYwo+PiArKysgYi9jaGFyZGV2L2NoYXIuYwo+PiBA
QCAtMTU5LDEyICsxNTksMTUgQEAgaW50IHFlbXVfY2hyX3dyaXRlKENoYXJkZXYgKnMsIGNvbnN0
IHVpbnQ4X3QgKmJ1ZiwgaW50IGxlbiwgYm9vbCB3cml0ZV9hbGwpCj4+ICBpbnQgcWVtdV9jaHJf
YmVfY2FuX3dyaXRlKENoYXJkZXYgKnMpCj4+ICB7Cj4+ICAgICAgQ2hhckJhY2tlbmQgKmJlID0g
cy0+YmU7Cj4+ICsgICAgaW50IHJlY2VpdmFibGVfYnl0ZXM7Cj4+Cj4+ICAgICAgaWYgKCFiZSB8
fCAhYmUtPmNocl9jYW5fcmVhZCkgewo+PiAgICAgICAgICByZXR1cm4gMDsKPj4gICAgICB9Cj4+
Cj4+IC0gICAgcmV0dXJuIGJlLT5jaHJfY2FuX3JlYWQoYmUtPm9wYXF1ZSk7Cj4+ICsgICAgcmVj
ZWl2YWJsZV9ieXRlcyA9IGJlLT5jaHJfY2FuX3JlYWQoYmUtPm9wYXF1ZSk7Cj4+ICsgICAgYXNz
ZXJ0KHJlY2VpdmFibGVfYnl0ZXMgPj0gMCk7Cj4+ICsgICAgcmV0dXJuIHJlY2VpdmFibGVfYnl0
ZXM7Cj4+ICB9Cj4+Cj4+ICB2b2lkIHFlbXVfY2hyX2JlX3dyaXRlX2ltcGwoQ2hhcmRldiAqcywg
dWludDhfdCAqYnVmLCBpbnQgbGVuKQo+PiAtLQo+PiAyLjIwLjEKPj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
