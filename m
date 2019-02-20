From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 14/25] virtio-serial: Let
 VirtIOSerialPortClass::have_data() use size_t
Date: Wed, 20 Feb 2019 12:21:32 +0100
Message-ID: <CAMxuvay56AwY0Mw9RfjNU4eJn+zJkvSKDKPpx+Qkx2tgp6r2tQ@mail.gmail.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-15-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wVrY=Q3=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1gwPwe-0006c9-W1
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 11:21:45 +0000
Received: by mail-qt1-f195.google.com with SMTP id w4so26756855qtc.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 03:21:44 -0800 (PST)
In-Reply-To: <20190220010232.18731-15-philmd@redhat.com>
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
cGhpbG1kQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gQm90aCBjYWxsZXJzIGluIGh3L2NoYXIvdmly
dGlvLXNlcmlhbC1idXMuYyBwcm92aWRlIHVuc2lnbmVkIHZhbHVlcywKPiBldmVuIHRoZSB0cmFj
ZSBldmVudCBkaXNwbGF5IGFuIHVuc2lnbmVkIHZhbHVlLgo+IENvbnZlcnQgdGhlIGhhdmVfZGF0
YSgpIGhhbmRsZXIgdG8gdGFrZSBhbiB1bnNpZ25lZCB2YWx1ZS4KPgo+IFNpZ25lZC1vZmYtYnk6
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KCgpSZXZpZXdlZC1i
eTogTWFyYy1BbmRyw6kgTHVyZWF1IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+Cgo+IC0t
LQo+IEl0IGlzIGZ1bm55L3NjYXJ5IHRoYXQgdGhlcmUgYXJlIGJpZyBjb21tZW50cyBhYm91dCBo
b3cgdG8gdHJlYXQKPiBlcnJvcnMgdG8gc2V0IHRoZSByZXR1cm4gdmFsdWUsIHRoZW4gdGhlIHJl
dHVybiB2YWx1ZSBpcyBzaW1wbHkKPiBpZ25vcmVkIGJ5IHRoZSBjYWxsZXIuCgpoYXZlX2RhdGEo
KSByZXR1cm4gdmFsdWU/IHllcywgdGhlIGNvZGUgbWF5IGhhdmUgY2hhbmdlIGFuZCB0aGUKY29t
bWVudCBkb2Vzbid0IHNlZW0gdG8gcmVmbGVjdCBhY2N1cmF0ZWx5IHdoYXQncyBnb2luZyBvbi4K
Cj4gLS0tCj4gIGh3L2NoYXIvdmlydGlvLWNvbnNvbGUuYyAgICAgICAgICB8IDIgKy0KPiAgaW5j
bHVkZS9ody92aXJ0aW8vdmlydGlvLXNlcmlhbC5oIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9ody9jaGFy
L3ZpcnRpby1jb25zb2xlLmMgYi9ody9jaGFyL3ZpcnRpby1jb25zb2xlLmMKPiBpbmRleCAyY2Jl
MWQ0ZWQ1Li4xOTYzOWRjYTNiIDEwMDY0NAo+IC0tLSBhL2h3L2NoYXIvdmlydGlvLWNvbnNvbGUu
Ywo+ICsrKyBiL2h3L2NoYXIvdmlydGlvLWNvbnNvbGUuYwo+IEBAIC00NSw3ICs0NSw3IEBAIHN0
YXRpYyBnYm9vbGVhbiBjaHJfd3JpdGVfdW5ibG9ja2VkKEdJT0NoYW5uZWwgKmNoYW4sIEdJT0Nv
bmRpdGlvbiBjb25kLAo+Cj4gIC8qIENhbGxiYWNrIGZ1bmN0aW9uIHRoYXQncyBjYWxsZWQgd2hl
biB0aGUgZ3Vlc3Qgc2VuZHMgdXMgZGF0YSAqLwo+ICBzdGF0aWMgc3NpemVfdCBmbHVzaF9idWYo
VmlydElPU2VyaWFsUG9ydCAqcG9ydCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0
IHVpbnQ4X3QgKmJ1Ziwgc3NpemVfdCBsZW4pCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCB1aW50OF90ICpidWYsIHNpemVfdCBsZW4pCj4gIHsKPiAgICAgIFZpcnRDb25zb2xlICp2
Y29uID0gVklSVElPX0NPTlNPTEUocG9ydCk7Cj4gICAgICBzc2l6ZV90IHJldDsKPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9ody92aXJ0aW8vdmlydGlvLXNlcmlhbC5oIGIvaW5jbHVkZS9ody92aXJ0
aW8vdmlydGlvLXNlcmlhbC5oCj4gaW5kZXggMTI2NTdhOWYzOS4uZjFhNWNjZjRmNyAxMDA2NDQK
PiAtLS0gYS9pbmNsdWRlL2h3L3ZpcnRpby92aXJ0aW8tc2VyaWFsLmgKPiArKysgYi9pbmNsdWRl
L2h3L3ZpcnRpby92aXJ0aW8tc2VyaWFsLmgKPiBAQCAtODEsNyArODEsNyBAQCB0eXBlZGVmIHN0
cnVjdCBWaXJ0SU9TZXJpYWxQb3J0Q2xhc3Mgewo+ICAgICAgICogJ2xlbicuICBJbiB0aGlzIGNh
c2UsIHRocm90dGxpbmcgd2lsbCBiZSBlbmFibGVkIGZvciB0aGlzIHBvcnQuCj4gICAgICAgKi8K
PiAgICAgIHNzaXplX3QgKCpoYXZlX2RhdGEpKFZpcnRJT1NlcmlhbFBvcnQgKnBvcnQsIGNvbnN0
IHVpbnQ4X3QgKmJ1ZiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgIHNzaXplX3QgbGVuKTsK
PiArICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBsZW4pOwo+ICB9IFZpcnRJT1Nlcmlh
bFBvcnRDbGFzczsKPgo+ICAvKgo+IC0tCj4gMi4yMC4xCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
