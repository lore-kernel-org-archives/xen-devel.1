From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 11/25] xen: Let xencons_send() take a
 'size' argument
Date: Wed, 20 Feb 2019 12:07:13 +0100
Message-ID: <CAMxuvaxORh6Kc-rJ605fJidj1yd+e23VeeA_+O=FU1dH7Zh32w@mail.gmail.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-12-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wVrY=Q3=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1gwPio-0004o8-2S
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 11:07:26 +0000
Received: by mail-qk1-f195.google.com with SMTP id y140so1685744qkb.9
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 03:07:24 -0800 (PST)
In-Reply-To: <20190220010232.18731-12-philmd@redhat.com>
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

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMjowNSBBTSBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqQo8
cGhpbG1kQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gVGhlIHNpbmdsZSBjYWxsZXIgb2YgeGVuY29u
c19zZW5kKCksIGNvbl9ldmVudCgpIGFscmVhZHkgdXNlIHRoZQo+IGRpZmZlcmVuY2UgJ2Nvbi0+
YnVmZmVyLnNpemUgLSBjb24tPmJ1ZmZlci5jb25zdW1lZCcuCj4gRGVkdXBsaWNhdGUgYnkgcGFz
c2luZyB0aGUgZGlmZmVyZW5jZSBhcyBhbiBhcmd1bWVudC4KPgo+IFNpZ25lZC1vZmYtYnk6IFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KCgpSZXZpZXdlZC1ieTog
TWFyYy1BbmRyw6kgTHVyZWF1IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+CgoKPiAtLS0K
PiAgaHcvY2hhci94ZW5fY29uc29sZS5jIHwgMTIgKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaHcv
Y2hhci94ZW5fY29uc29sZS5jIGIvaHcvY2hhci94ZW5fY29uc29sZS5jCj4gaW5kZXggOTFmMzRl
ZjA2Yy4uMDgzYjJjOGUyYSAxMDA2NDQKPiAtLS0gYS9ody9jaGFyL3hlbl9jb25zb2xlLmMKPiAr
KysgYi9ody9jaGFyL3hlbl9jb25zb2xlLmMKPiBAQCAtMTQ0LDExICsxNDQsMTAgQEAgc3RhdGlj
IHZvaWQgeGVuY29uc19yZWNlaXZlKHZvaWQgKm9wYXF1ZSwgY29uc3QgdWludDhfdCAqYnVmLCBp
bnQgbGVuKQo+ICAgICAgeGVuX3B2X3NlbmRfbm90aWZ5KCZjb24tPnhlbmRldik7Cj4gIH0KPgo+
IC1zdGF0aWMgdm9pZCB4ZW5jb25zX3NlbmQoc3RydWN0IFhlbkNvbnNvbGUgKmNvbikKPiArc3Rh
dGljIHZvaWQgeGVuY29uc19zZW5kKHN0cnVjdCBYZW5Db25zb2xlICpjb24sIHNzaXplX3Qgc2l6
ZSkKPiAgewo+IC0gICAgc3NpemVfdCBsZW4sIHNpemU7Cj4gKyAgICBzc2l6ZV90IGxlbjsKPgo+
IC0gICAgc2l6ZSA9IGNvbi0+YnVmZmVyLnNpemUgLSBjb24tPmJ1ZmZlci5jb25zdW1lZDsKPiAg
ICAgIGlmIChxZW11X2Nocl9mZV9iYWNrZW5kX2Nvbm5lY3RlZCgmY29uLT5jaHIpKSB7Cj4gICAg
ICAgICAgbGVuID0gcWVtdV9jaHJfZmVfd3JpdGUoJmNvbi0+Y2hyLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbi0+YnVmZmVyLmRhdGEgKyBjb24tPmJ1ZmZlci5jb25zdW1l
ZCwKPiBAQCAtMjgwLDEwICsyNzksMTMgQEAgc3RhdGljIHZvaWQgY29uX2Rpc2Nvbm5lY3Qoc3Ry
dWN0IFhlbkxlZ2FjeURldmljZSAqeGVuZGV2KQo+ICBzdGF0aWMgdm9pZCBjb25fZXZlbnQoc3Ry
dWN0IFhlbkxlZ2FjeURldmljZSAqeGVuZGV2KQo+ICB7Cj4gICAgICBzdHJ1Y3QgWGVuQ29uc29s
ZSAqY29uID0gY29udGFpbmVyX29mKHhlbmRldiwgc3RydWN0IFhlbkNvbnNvbGUsIHhlbmRldik7
Cj4gKyAgICBzc2l6ZV90IHNpemU7Cj4KPiAgICAgIGJ1ZmZlcl9hcHBlbmQoY29uKTsKPiAtICAg
IGlmIChjb24tPmJ1ZmZlci5zaXplIC0gY29uLT5idWZmZXIuY29uc3VtZWQpCj4gLSAgICAgICAg
eGVuY29uc19zZW5kKGNvbik7Cj4gKyAgICBzaXplID0gY29uLT5idWZmZXIuc2l6ZSAtIGNvbi0+
YnVmZmVyLmNvbnN1bWVkOwo+ICsgICAgaWYgKHNpemUpIHsKPiArICAgICAgICB4ZW5jb25zX3Nl
bmQoY29uLCBzaXplKTsKPiArICAgIH0KPiAgfQo+Cj4gIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICovCj4gLS0K
PiAyLjIwLjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
