From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 07/25] gdbstub: Let put_buffer() use
 size_t
Date: Wed, 20 Feb 2019 12:02:58 +0100
Message-ID: <CAMxuvaz6ZHh9X3ZV4iXndMcCTFAemRFqAF=6UWj+Mg+B=5BFjg@mail.gmail.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-8-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wVrY=Q3=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1gwPeg-0004X1-UN
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 11:03:10 +0000
Received: by mail-qt1-f193.google.com with SMTP id d2so960549qti.11
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 03:03:09 -0800 (PST)
In-Reply-To: <20190220010232.18731-8-philmd@redhat.com>
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

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMjowNCBBTSBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqQo8
cGhpbG1kQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gQWxsIGNhbGxlcnMgcHJvdmlkZSBhIHNpemVf
dCBhcmd1bWVudCwgd2UgY2FuIHNhZmVseSB1c2Ugc2l6ZV90Cj4gZm9yIHRoaXMgZnVuY3Rpb24u
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhh
dC5jb20+CgpSZXZpZXdlZC1ieTogTWFyYy1BbmRyw6kgTHVyZWF1IDxtYXJjYW5kcmUubHVyZWF1
QHJlZGhhdC5jb20+Cgo+IC0tLQo+ICBnZGJzdHViLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9nZGJz
dHViLmMgYi9nZGJzdHViLmMKPiBpbmRleCA2OTM0MGQ3Y2QxLi44NjBlOWJiN2M3IDEwMDY0NAo+
IC0tLSBhL2dkYnN0dWIuYwo+ICsrKyBiL2dkYnN0dWIuYwo+IEBAIC00NzUsMTAgKzQ3NSwxMCBA
QCBzdGF0aWMgaW50IGdkYl9jb250aW51ZV9wYXJ0aWFsKEdEQlN0YXRlICpzLCBjaGFyICpuZXdz
dGF0ZXMpCj4gICAgICByZXR1cm4gcmVzOwo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgcHV0X2J1ZmZl
cihHREJTdGF0ZSAqcywgY29uc3QgdWludDhfdCAqYnVmLCBpbnQgbGVuKQo+ICtzdGF0aWMgdm9p
ZCBwdXRfYnVmZmVyKEdEQlN0YXRlICpzLCBjb25zdCB1aW50OF90ICpidWYsIHNpemVfdCBsZW4p
Cj4gIHsKPiAgI2lmZGVmIENPTkZJR19VU0VSX09OTFkKPiAtICAgIGludCByZXQ7Cj4gKyAgICBz
c2l6ZV90IHJldDsKPgo+ICAgICAgd2hpbGUgKGxlbiA+IDApIHsKPiAgICAgICAgICByZXQgPSBz
ZW5kKHMtPmZkLCBidWYsIGxlbiwgMCk7Cj4gLS0KPiAyLjIwLjEKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
