From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 17/25] net/filter-mirror: Use size_t
Date: Wed, 20 Feb 2019 12:23:52 +0100
Message-ID: <CAMxuvax-F7PWF_ncpoTtVLu327Tph=J_q8OnFa1Qject7u6b9Q@mail.gmail.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-18-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wVrY=Q3=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1gwPzt-0006uQ-6u
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 11:25:05 +0000
Received: by mail-qk1-f194.google.com with SMTP id x9so1743809qkf.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 03:25:04 -0800 (PST)
In-Reply-To: <20190220010232.18731-18-philmd@redhat.com>
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

SGkKCk9uIFdlZCwgRmViIDIwLCAyMDE5IGF0IDI6MDcgQU0gUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kKPHBoaWxtZEByZWRoYXQuY29tPiB3cm90ZToKPgo+IFNpbmNlIGlvdl9zaXplKCkgcmV0dXJu
cyBhIHNpemVfdCwgbm8gbmVlZCB0byB1c2UgYSBzaWduZWQgdHlwZS4KCkFuZCBpdCBpcyB0aGUg
dmFyaWFibGUgb25seSBwdXJwb3NlLgoKPgo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KCgpSZXZpZXdlZC1ieTogTWFyYy1BbmRyw6kg
THVyZWF1IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+CgoKPiAtLS0KPiAgbmV0L2ZpbHRl
ci1taXJyb3IuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbmV0L2ZpbHRlci1taXJyb3IuYyBiL25ldC9maWx0
ZXItbWlycm9yLmMKPiBpbmRleCAzYTYxY2YyMWU4Li45N2I1MmQwNTQ0IDEwMDY0NAo+IC0tLSBh
L25ldC9maWx0ZXItbWlycm9yLmMKPiArKysgYi9uZXQvZmlsdGVyLW1pcnJvci5jCj4gQEAgLTQ4
LDcgKzQ4LDcgQEAgc3RhdGljIGludCBmaWx0ZXJfc2VuZChNaXJyb3JTdGF0ZSAqcywKPiAgewo+
ICAgICAgTmV0RmlsdGVyU3RhdGUgKm5mID0gTkVURklMVEVSKHMpOwo+ICAgICAgaW50IHJldCA9
IDA7Cj4gLSAgICBzc2l6ZV90IHNpemUgPSAwOwo+ICsgICAgc2l6ZV90IHNpemUgPSAwOwo+ICAg
ICAgdWludDMyX3QgbGVuID0gMDsKPiAgICAgIGNoYXIgKmJ1ZjsKPgo+IC0tCj4gMi4yMC4xCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
