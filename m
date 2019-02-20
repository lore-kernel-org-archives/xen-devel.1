From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 10/25] usb-redir: Verify usbredirparser_write
 get called with positive count
Date: Wed, 20 Feb 2019 02:02:17 +0100
Message-ID: <20190220010232.18731-11-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGKv-0000yN-Bo
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:06:09 +0000
In-Reply-To: <20190220010232.18731-1-philmd@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, Prasad J Pandit <pjp@fedoraproject.org>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Corey Minyard <minyard@acm.org>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Li Zhijian <lizhijian@cn.fujitsu.com>, Amit Shah <amit@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Stefan Berger <stefanb@linux.ibm.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
List-Id: xen-devel@lists.xenproject.org

VGhlIHVzYnJlZGlycGFyc2VyX3dyaXRlIGhhbmRsZXIgc2hvdWxkIG5ldmVyIGJlIGNhbGxlZCB3
aXRoIGEgbmVnYXRpdmUKc2l6ZSBwYXlsb2FkLCByZXR1cm4gYW4gZXJyb3IgaWYgdGhpcyBpcyBu
b3QgdGhlIGNhc2UuCk5vdyB0aGF0IHdlIGFyZSBzdXJlIHRoZSAnY291bnQnIHZhbHVlIGlzIHBv
c2l0aXZlLCBtYWtlIGl0IG9idmlvdXMgYnkKY2FzdGluZyBpdCB0byBhIHNpemVfdC4KClNpZ25l
ZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0t
CiBody91c2IvcmVkaXJlY3QuYyB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaHcvdXNiL3JlZGlyZWN0LmMgYi9o
dy91c2IvcmVkaXJlY3QuYwppbmRleCAxOGE0MmQxOTM4Li4xMzFlYWUyZTdlIDEwMDY0NAotLS0g
YS9ody91c2IvcmVkaXJlY3QuYworKysgYi9ody91c2IvcmVkaXJlY3QuYwpAQCAtMjg1LDcgKzI4
NSwxMSBAQCBzdGF0aWMgaW50IHVzYnJlZGlyX3dyaXRlKHZvaWQgKnByaXYsIHVpbnQ4X3QgKmRh
dGEsIGludCBjb3VudCkKICAgICAgICAgcmV0dXJuIDA7CiAgICAgfQogCi0gICAgciA9IHFlbXVf
Y2hyX2ZlX3dyaXRlKCZkZXYtPmNzLCBkYXRhLCBjb3VudCk7CisgICAgaWYgKGNvdW50IDwgMCkg
eworICAgICAgICBFUlJPUigiSWxsZWdhbCB3cml0ZSBjb3VudDogJWlcbiIsIGNvdW50KTsKKyAg
ICAgICAgcmV0dXJuIDA7CisgICAgfQorICAgIHIgPSBxZW11X2Nocl9mZV93cml0ZSgmZGV2LT5j
cywgZGF0YSwgKHNpemVfdCljb3VudCk7CiAgICAgaWYgKHIgPCBjb3VudCkgewogICAgICAgICBp
ZiAoIWRldi0+d2F0Y2gpIHsKICAgICAgICAgICAgIGRldi0+d2F0Y2ggPSBxZW11X2Nocl9mZV9h
ZGRfd2F0Y2goJmRldi0+Y3MsIEdfSU9fT1VUIHwgR19JT19IVVAsCi0tIAoyLjIwLjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
