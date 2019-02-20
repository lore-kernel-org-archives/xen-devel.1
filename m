From: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 19/25] s390/ebcdic: Use size_t to iterate
 over arrays
Date: Wed, 20 Feb 2019 10:40:51 +0100
Message-ID: <20190220104051.72f1aca0.cohuck@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-20-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=80LJ=Q3=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1gwONH-0004zV-UP
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 09:41:07 +0000
In-Reply-To: <20190220010232.18731-20-philmd@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMCBGZWIgMjAxOSAwMjowMjoyNiArMDEwMApQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQHJlZGhhdC5jb20+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvaHcvczM5
MHgvZWJjZGljLmggfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvczM5MHgvZWJj
ZGljLmggYi9pbmNsdWRlL2h3L3MzOTB4L2ViY2RpYy5oCj4gaW5kZXggNjlhMDRjYWI2Mi4uZDg5
MTc0ZTExMyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2h3L3MzOTB4L2ViY2RpYy5oCj4gKysrIGIv
aW5jbHVkZS9ody9zMzkweC9lYmNkaWMuaAo+IEBAIC04MywxOCArODMsMTggQEAgc3RhdGljIGNv
bnN0IHVpbnQ4X3QgYXNjaWkyZWJjZGljW10gPSB7Cj4gICAgICAweDkwLCAweDNGLCAweDNGLCAw
eDNGLCAweDNGLCAweEVBLCAweDNGLCAweEZGCj4gIH07Cj4gIAo+IC1zdGF0aWMgaW5saW5lIHZv
aWQgZWJjZGljX3B1dCh1aW50OF90ICpwLCBjb25zdCBjaGFyICphc2NpaSwgaW50IGxlbikKPiAr
c3RhdGljIGlubGluZSB2b2lkIGViY2RpY19wdXQodWludDhfdCAqcCwgY29uc3QgY2hhciAqYXNj
aWksIHNpemVfdCBsZW4pCj4gIHsKPiAtICAgIGludCBpOwo+ICsgICAgc2l6ZV90IGk7Cj4gIAo+
ICAgICAgZm9yIChpID0gMDsgaSA8IGxlbjsgaSsrKSB7Cj4gICAgICAgICAgcFtpXSA9IGFzY2lp
MmViY2RpY1sodWludDhfdClhc2NpaVtpXV07Cj4gICAgICB9Cj4gIH0KPiAgCj4gLXN0YXRpYyBp
bmxpbmUgdm9pZCBhc2NpaV9wdXQodWludDhfdCAqcCwgY29uc3QgY2hhciAqZWJjZGljLCBpbnQg
bGVuKQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgYXNjaWlfcHV0KHVpbnQ4X3QgKnAsIGNvbnN0IGNo
YXIgKmViY2RpYywgc2l6ZV90IGxlbikKPiAgewo+IC0gICAgaW50IGk7Cj4gKyAgICBzaXplX3Qg
aTsKPiAgCj4gICAgICBmb3IgKGkgPSAwOyBpIDwgbGVuOyBpKyspIHsKPiAgICAgICAgICBwW2ld
ID0gZWJjZGljMmFzY2lpWyh1aW50OF90KWViY2RpY1tpXV07CgpNYWtpbmcgdGhlIHBhc3NlZCBs
ZW4gcGFyYW1ldGVyIGEgc2l6ZV90IG1ha2VzIHNlbnNlOyBidXQgdXNpbmcgYQpzaXplX3QgYXMg
YW4gYXJyYXkgaXRlcmF0b3IgbG9va3MgYSBiaXQgdW5pZGlvbWF0aWMuLi4gaXQncyBub3Qgd3Jv
bmcsCnRob3VnaC4KCkFja2VkLWJ5OiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
