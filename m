From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 23/25] hw/ipmi: Assert outlen > outpos
Date: Wed, 20 Feb 2019 02:02:30 +0100
Message-ID: <20190220010232.18731-24-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGNI-0002Ao-0i
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:08:36 +0000
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

QSB0aHJvdWdmdWxsIGF1ZGl0IHNob3cgdGhhdCBhbGwgdGltZSBkYXRhIGlzIGFkZGVkIHRvIG91
dGJ1ZltdLAonb3V0bGVuJyBpcyBpbmNyZW1lbnRlZC4gVGhlbiBhdCBjcmVhdGlvbiBhbmQgZWFj
aCB0aW1lCmNvbnRpbnVlX3NlbmQoKSByZXR1cm5zIGl0IHBhc3MgdGhydSBjaGVja19yZXNldCB3
aGljaCByZXNldHMKJ291dHBvcycsIHRodXMgd2UgYWx3YXlzIGhhdmUgJ291dGxlbiA+PSBvdXRw
b3MnLgpBbHNvIGR1ZSB0byB0aGUgY2hlY2sgb24gZW50cnksIHdlIGtub3cgb3V0bGVuICE9IDAu
CldlIGNhbiB0aGVuIGFkZCBhbiBhc3NlcnRpb24gb24gJ291dGxlbiA+IG91dHBvcycsIHdoaWNo
IHdpbGwKaGVscHMgdGhlIG5leHQgcGF0Y2ggdG8gc2FmZWx5IGNvbnZlcnQgJ291dGxlbiAtIG91
dHBvcycgYXMgYW4KdW5zaWduZWQgdHlwZSAoc2l6ZV90KS4KCk1ha2UgdGhpcyBhc3NlcnRpb24g
ZXhwbGljaXQgYnkgY2FzdGluZyAnb3V0bGVuIC0gb3V0cG9zJyBzaXplX3QuCgpTaWduZWQtb2Zm
LWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcv
aXBtaS9pcG1pX2JtY19leHRlcm4uYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaHcvaXBtaS9pcG1pX2JtY19leHRl
cm4uYyBiL2h3L2lwbWkvaXBtaV9ibWNfZXh0ZXJuLmMKaW5kZXggYmYwYjdlZTBmNS4uY2E2MWIw
NDk0MiAxMDA2NDQKLS0tIGEvaHcvaXBtaS9pcG1pX2JtY19leHRlcm4uYworKysgYi9ody9pcG1p
L2lwbWlfYm1jX2V4dGVybi5jCkBAIC0xMDcsOCArMTA3LDkgQEAgc3RhdGljIHZvaWQgY29udGlu
dWVfc2VuZChJUE1JQm1jRXh0ZXJuICppYmUpCiAgICAgICAgIGdvdG8gY2hlY2tfcmVzZXQ7CiAg
ICAgfQogIHNlbmQ6CisgICAgYXNzZXJ0KGliZS0+b3V0bGVuID4gaWJlLT5vdXRwb3MpOwogICAg
IHJldCA9IHFlbXVfY2hyX2ZlX3dyaXRlKCZpYmUtPmNociwgaWJlLT5vdXRidWYgKyBpYmUtPm91
dHBvcywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBpYmUtPm91dGxlbiAtIGliZS0+b3V0
cG9zKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAoc2l6ZV90KShpYmUtPm91dGxlbiAt
IGliZS0+b3V0cG9zKSk7CiAgICAgaWYgKHJldCA+IDApIHsKICAgICAgICAgaWJlLT5vdXRwb3Mg
Kz0gcmV0OwogICAgIH0KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
