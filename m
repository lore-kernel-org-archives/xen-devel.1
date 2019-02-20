From: Corey Minyard <minyard@acm.org>
Subject: Re: [PATCH v3 23/25] hw/ipmi: Assert outlen > outpos
Date: Wed, 20 Feb 2019 07:36:08 -0600
Message-ID: <20190220133608.GB5504@minyard.net>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-24-philmd@redhat.com>
Reply-To: minyard@acm.org
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PRB9=Q3=gmail.com=tcminyard@srs-us1.protection.inumbo.net>)
 id 1gwS2o-00023z-Ui
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 13:36:14 +0000
Received: by mail-ot1-x341.google.com with SMTP id 98so40229665oty.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 05:36:13 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20190220010232.18731-24-philmd@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Amit Shah <amit@kernel.org>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDI6MDI6MzBBTSArMDEwMCwgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgd3JvdGU6Cj4gQSB0aHJvdWdmdWxsIGF1ZGl0IHNob3cgdGhhdCBhbGwgdGltZSBk
YXRhIGlzIGFkZGVkIHRvIG91dGJ1ZltdLAo+ICdvdXRsZW4nIGlzIGluY3JlbWVudGVkLiAgVGhl
biBhdCBjcmVhdGlvbiBhbmQgZWFjaCB0aW1lCj4gY29udGludWVfc2VuZCgpIHJldHVybnMgaXQg
cGFzcyB0aHJ1IGNoZWNrX3Jlc2V0IHdoaWNoIHJlc2V0cwo+ICdvdXRwb3MnLCB0aHVzIHdlIGFs
d2F5cyBoYXZlICdvdXRsZW4gPj0gb3V0cG9zJy4KClBlcmhhcHM6ICJBIHRob3JvdWdoIGF1ZGl0
IHNob3dzIHRoYXQgb3V0bGVuIGlzIGFsd2F5cyBpbmNyZW1lbnRlZAp3aGVuIGRhdGEgaXMgYWx3
YXlzIGFkZGVkIHRvIG91dGJ1ZltdLiAgVGhlbiBhdCBjcmVhdGlvbiBhbmQgZWFjaAp0aW1lIGNv
bnRpbnVzX3NlbmQoKSByZXR1cm5zIGl0IGFzc3VyZXMgaWYgb3V0cG9zIHJlYWNoZXMgb3V0bGVu
LApib3RoIHZhbHVlcyBhcmUgcmVzZXQgdG8gemVybywgZXhjZXB0IGluIHRoZSBjYXNlIG9mIHNl
bmRpbmcKYSByZXNldCB3aGVyZSBhIG5ldyBjb21tYW5kIGlzIGFkZGVkLiIKClRoaXMgaXMgY2Vy
dGFpbmx5IHRoZSBkZXNpZ24gaW50ZW50LCB0aGFuayB5b3UgZm9yIHRoZSB0aG9yb3VnaAphdWRp
dC4KCj4gQWxzbyBkdWUgdG8gdGhlIGNoZWNrIG9uIGVudHJ5LCB3ZSBrbm93IG91dGxlbiAhPSAw
Lgo+IFdlIGNhbiB0aGVuIGFkZCBhbiBhc3NlcnRpb24gb24gJ291dGxlbiA+IG91dHBvcycsIHdo
aWNoIHdpbGwKPiBoZWxwcyB0aGUgbmV4dCBwYXRjaCB0byBzYWZlbHkgY29udmVydCAnb3V0bGVu
IC0gb3V0cG9zJyBhcyBhbgoKSSB3YXMgYSBsaXR0bGUgY29uZnVzZWQgYnkgIm5leHQgcGF0Y2gi
LCB0aGVyZSBpcyBubyBmb2xsb3dpbmcKcGF0Y2ggaW4gdGhlIHNlcmllcyBmb3IgdGhpcy4gIE1h
eWJlICJuZXh0IHBhcnQgb2YgdGhlIHBhdGNoIj8KCj4gdW5zaWduZWQgdHlwZSAoc2l6ZV90KS4K
PiAKPiBNYWtlIHRoaXMgYXNzZXJ0aW9uIGV4cGxpY2l0IGJ5IGNhc3RpbmcgJ291dGxlbiAtIG91
dHBvcycgc2l6ZV90Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IDxwaGlsbWRAcmVkaGF0LmNvbT4KCk91dHNpZGUgb2YgdGhlIG1pbm9yIGdyYW1tZXIgaXNzdWVz
LCB0aGlzIGxvb2tzIGdvb2QuICBJIGhhdmUKbm90aWNlZCB0aGUgaW5jb25zaXN0ZW50IHNpZ25l
ZC91bnNpZ25lZCB1c2FnZSBpbiBxZW11IGFuZCBJTUhPCml0J3MgbGlrZWx5IHRvIGxlYWQgdG8g
dmVyeSBiYWQgYnVncyBhdCBzb21lIHBvaW50LiAgVGhlcmUgaGF2ZQpiZWVuIHN0dWRpZXMgdGhh
dCBzaG93IHRoYXQgdW5zaWduZWQgdmFsdWVzIHRlbmQgdG8gYmUgbW9yZQpidWdneSBpbiB1c2Fn
ZSBkdWUgdG8gdW5kZXJmbG93cywgYnV0IGZvciBhIGxlbmd0aCB2YWx1ZSB0aGF0CndpbGwgZXZl
bnR1YWxseSBiZSBjb252ZXJ0ZWQgdG8gYW4gdW5zaWduZWQgdmFsdWUsIHdoYXQgaXMKaGVyZSBp
cyBiZXR0ZXIsIEkgdGhpbmsuCgpCb3RoIG91dHBvcyBhbmQgb3V0bGVuIGFyZSB1bnNpZ25lZCwg
c28gdGhlIHNpemVfdCgpIGNhc3QgaXMKbm90IHJlYWxseSBuZWNlc3NhcnksIGJ1dCBJIGd1ZXNz
IGl0IG1ha2VzIGl0IGNsZWFyLgoKUmV2aWV3ZWQtYnk6IENvcmV5IE1pbnlhcmQgPGNtaW55YXJk
QG12aXN0YS5jb20+Cgo+IC0tLQo+ICBody9pcG1pL2lwbWlfYm1jX2V4dGVybi5jIHwgMyArKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9ody9pcG1pL2lwbWlfYm1jX2V4dGVybi5jIGIvaHcvaXBtaS9pcG1pX2JtY19l
eHRlcm4uYwo+IGluZGV4IGJmMGI3ZWUwZjUuLmNhNjFiMDQ5NDIgMTAwNjQ0Cj4gLS0tIGEvaHcv
aXBtaS9pcG1pX2JtY19leHRlcm4uYwo+ICsrKyBiL2h3L2lwbWkvaXBtaV9ibWNfZXh0ZXJuLmMK
PiBAQCAtMTA3LDggKzEwNyw5IEBAIHN0YXRpYyB2b2lkIGNvbnRpbnVlX3NlbmQoSVBNSUJtY0V4
dGVybiAqaWJlKQo+ICAgICAgICAgIGdvdG8gY2hlY2tfcmVzZXQ7Cj4gICAgICB9Cj4gICBzZW5k
Ogo+ICsgICAgYXNzZXJ0KGliZS0+b3V0bGVuID4gaWJlLT5vdXRwb3MpOwo+ICAgICAgcmV0ID0g
cWVtdV9jaHJfZmVfd3JpdGUoJmliZS0+Y2hyLCBpYmUtPm91dGJ1ZiArIGliZS0+b3V0cG9zLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgaWJlLT5vdXRsZW4gLSBpYmUtPm91dHBvcyk7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAoc2l6ZV90KShpYmUtPm91dGxlbiAtIGli
ZS0+b3V0cG9zKSk7Cj4gICAgICBpZiAocmV0ID4gMCkgewo+ICAgICAgICAgIGliZS0+b3V0cG9z
ICs9IHJldDsKPiAgICAgIH0KPiAtLSAKPiAyLjIwLjEKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
