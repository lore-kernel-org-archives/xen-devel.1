From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 12/25] xen: Let buffer_append() return
 the size consumed
Date: Wed, 20 Feb 2019 12:13:54 +0100
Message-ID: <CAMxuvaxm_uHMm3ccWSwFpk7T3ZDqoOP0FE+Eu-M_NWnXAh=QYQ@mail.gmail.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-13-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wVrY=Q3=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1gwPpG-0005ef-Rq
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 11:14:06 +0000
Received: by mail-qk1-f193.google.com with SMTP id y15so254318qki.8
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 03:14:06 -0800 (PST)
In-Reply-To: <20190220010232.18731-13-philmd@redhat.com>
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

SGkKCk9uIFdlZCwgRmViIDIwLCAyMDE5IGF0IDI6MDYgQU0gUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kKPHBoaWxtZEByZWRoYXQuY29tPiB3cm90ZToKPgo+IFRoZSBidWZmZXIuc2l6ZSBhbmQgYnVm
ZmVyLmNvbnN1bWVkIGZpZWxkcyBhcmUgb25seSB1cGRhdGVkIHdpdGhpbiB0aGUKPiBidWZmZXJf
YXBwZW5kKCkgYm9keS4gV2UgY2FuIHNpbXBseSBsZXQgYnVmZmVyX2FwcGVuZCgpIHJldHVybiB0
aGUKPiBkaWZmZXJlbmNlICh0aGUgYnVmZmVyIGNvbnN1bWVkKS4KPgo+IFNpZ25lZC1vZmYtYnk6
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KClRoaXMgaXMgd2Vp
cmQsIHdoeSBub3QgaW50cm9kdWNlIGEgYnVmZmVyX3NpemUoKSBmdW5jdGlvbiBpbnN0ZWFkPwoK
PiAtLS0KPiAgaHcvY2hhci94ZW5fY29uc29sZS5jIHwgMTMgKysrKysrKystLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2h3L2NoYXIveGVuX2NvbnNvbGUuYyBiL2h3L2NoYXIveGVuX2NvbnNvbGUuYwo+IGluZGV4
IDA4M2IyYzhlMmEuLjFhMzAwMTRhMTEgMTAwNjQ0Cj4gLS0tIGEvaHcvY2hhci94ZW5fY29uc29s
ZS5jCj4gKysrIGIvaHcvY2hhci94ZW5fY29uc29sZS5jCj4gQEAgLTQ4LDcgKzQ4LDcgQEAgc3Ry
dWN0IFhlbkNvbnNvbGUgewo+ICAgICAgaW50ICAgICAgICAgICAgICAgYmFja2xvZzsKPiAgfTsK
Pgo+IC1zdGF0aWMgdm9pZCBidWZmZXJfYXBwZW5kKHN0cnVjdCBYZW5Db25zb2xlICpjb24pCj4g
K3N0YXRpYyBzc2l6ZV90IGJ1ZmZlcl9hcHBlbmQoc3RydWN0IFhlbkNvbnNvbGUgKmNvbikKPiAg
ewo+ICAgICAgc3RydWN0IGJ1ZmZlciAqYnVmZmVyID0gJmNvbi0+YnVmZmVyOwo+ICAgICAgWEVO
Q09OU19SSU5HX0lEWCBjb25zLCBwcm9kLCBzaXplOwo+IEBAIC01OSw4ICs1OSw5IEBAIHN0YXRp
YyB2b2lkIGJ1ZmZlcl9hcHBlbmQoc3RydWN0IFhlbkNvbnNvbGUgKmNvbikKPiAgICAgIHhlbl9t
YigpOwo+Cj4gICAgICBzaXplID0gcHJvZCAtIGNvbnM7Cj4gLSAgICBpZiAoKHNpemUgPT0gMCkg
fHwgKHNpemUgPiBzaXplb2YoaW50Zi0+b3V0KSkpCj4gLSAgICAgICAgcmV0dXJuOwo+ICsgICAg
aWYgKChzaXplID09IDApIHx8IChzaXplID4gc2l6ZW9mKGludGYtPm91dCkpKSB7Cj4gKyAgICAg
ICAgZ290byBvdXQ7Cj4gKyAgICB9Cj4KPiAgICAgIGlmICgoYnVmZmVyLT5jYXBhY2l0eSAtIGJ1
ZmZlci0+c2l6ZSkgPCBzaXplKSB7Cj4gICAgICAgICAgYnVmZmVyLT5jYXBhY2l0eSArPSAoc2l6
ZSArIDEwMjQpOwo+IEBAIC04OSw2ICs5MCw5IEBAIHN0YXRpYyB2b2lkIGJ1ZmZlcl9hcHBlbmQo
c3RydWN0IFhlbkNvbnNvbGUgKmNvbikKPiAgICAgICAgICBpZiAoYnVmZmVyLT5jb25zdW1lZCA+
IGJ1ZmZlci0+bWF4X2NhcGFjaXR5IC0gb3ZlcikKPiAgICAgICAgICAgICAgYnVmZmVyLT5jb25z
dW1lZCA9IGJ1ZmZlci0+bWF4X2NhcGFjaXR5IC0gb3ZlcjsKPiAgICAgIH0KPiArCj4gKyBvdXQ6
Cj4gKyAgICByZXR1cm4gYnVmZmVyLT5zaXplIC0gYnVmZmVyLT5jb25zdW1lZDsKPiAgfQo+Cj4g
IHN0YXRpYyB2b2lkIGJ1ZmZlcl9hZHZhbmNlKHN0cnVjdCBidWZmZXIgKmJ1ZmZlciwgc2l6ZV90
IGxlbikKPiBAQCAtMjgxLDggKzI4NSw3IEBAIHN0YXRpYyB2b2lkIGNvbl9ldmVudChzdHJ1Y3Qg
WGVuTGVnYWN5RGV2aWNlICp4ZW5kZXYpCj4gICAgICBzdHJ1Y3QgWGVuQ29uc29sZSAqY29uID0g
Y29udGFpbmVyX29mKHhlbmRldiwgc3RydWN0IFhlbkNvbnNvbGUsIHhlbmRldik7Cj4gICAgICBz
c2l6ZV90IHNpemU7Cj4KPiAtICAgIGJ1ZmZlcl9hcHBlbmQoY29uKTsKPiAtICAgIHNpemUgPSBj
b24tPmJ1ZmZlci5zaXplIC0gY29uLT5idWZmZXIuY29uc3VtZWQ7Cj4gKyAgICBzaXplID0gYnVm
ZmVyX2FwcGVuZChjb24pOwo+ICAgICAgaWYgKHNpemUpIHsKPiAgICAgICAgICB4ZW5jb25zX3Nl
bmQoY29uLCBzaXplKTsKPiAgICAgIH0KPiAtLQo+IDIuMjAuMQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
