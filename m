From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 16/25] tpm: Use size_t to hold sizes
Date: Wed, 20 Feb 2019 12:22:30 +0100
Message-ID: <CAMxuvayRcj2W2_+hrZbVeH5yHDp2F8sBE1++Y0p2d6iJknLVbw@mail.gmail.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-17-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wVrY=Q3=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1gwPxa-0006fz-Ck
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 11:22:42 +0000
Received: by mail-qt1-f196.google.com with SMTP id o6so26689910qtk.6
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 03:22:41 -0800 (PST)
In-Reply-To: <20190220010232.18731-17-philmd@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMjowNiBBTSBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqQo8
cGhpbG1kQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gQXZvaWQgdG8gdXNlIGEgc2lnbmVkIHR5cGUg
dG8gaG9sZCBhbiB1bnNpZ25lZCB2YWx1ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KCgpSZXZpZXdlZC1ieTogTWFyYy1BbmRy
w6kgTHVyZWF1IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+Cgo+IC0tLQo+ICBody90cG0v
dHBtX2VtdWxhdG9yLmMgfCA3ICsrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9ody90cG0vdHBtX2VtdWxhdG9y
LmMgYi9ody90cG0vdHBtX2VtdWxhdG9yLmMKPiBpbmRleCA3MGY0YjEwMjg0Li45MzFlNTZmNmVk
IDEwMDY0NAo+IC0tLSBhL2h3L3RwbS90cG1fZW11bGF0b3IuYwo+ICsrKyBiL2h3L3RwbS90cG1f
ZW11bGF0b3IuYwo+IEBAIC04NywxNyArODcsMTggQEAgc3RhdGljIGludCB0cG1fZW11bGF0b3Jf
Y3RybGNtZChUUE1FbXVsYXRvciAqdHBtLCB1bnNpZ25lZCBsb25nIGNtZCwgdm9pZCAqbXNnLAo+
ICB7Cj4gICAgICBDaGFyQmFja2VuZCAqZGV2ID0gJnRwbS0+Y3RybF9jaHI7Cj4gICAgICB1aW50
MzJfdCBjbWRfbm8gPSBjcHVfdG9fYmUzMihjbWQpOwo+IC0gICAgc3NpemVfdCBuID0gc2l6ZW9m
KHVpbnQzMl90KSArIG1zZ19sZW5faW47Cj4gKyAgICBzaXplX3Qgc3ogPSBzaXplb2YodWludDMy
X3QpICsgbXNnX2xlbl9pbjsKPiArICAgIHNzaXplX3QgbjsKPiAgICAgIHVpbnQ4X3QgKmJ1ZiA9
IE5VTEw7Cj4gICAgICBpbnQgcmV0ID0gLTE7Cj4KPiAgICAgIHFlbXVfbXV0ZXhfbG9jaygmdHBt
LT5tdXRleCk7Cj4KPiAtICAgIGJ1ZiA9IGdfYWxsb2NhKG4pOwo+ICsgICAgYnVmID0gZ19hbGxv
Y2Eoc3opOwo+ICAgICAgbWVtY3B5KGJ1ZiwgJmNtZF9ubywgc2l6ZW9mKGNtZF9ubykpOwo+ICAg
ICAgbWVtY3B5KGJ1ZiArIHNpemVvZihjbWRfbm8pLCBtc2csIG1zZ19sZW5faW4pOwo+Cj4gLSAg
ICBuID0gcWVtdV9jaHJfZmVfd3JpdGVfYWxsKGRldiwgYnVmLCBuKTsKPiArICAgIG4gPSBxZW11
X2Nocl9mZV93cml0ZV9hbGwoZGV2LCBidWYsIHN6KTsKPiAgICAgIGlmIChuIDw9IDApIHsKPiAg
ICAgICAgICBnb3RvIGVuZDsKPiAgICAgIH0KPiAtLQo+IDIuMjAuMQo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
