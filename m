From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 12/25] xen: Let buffer_append() return the
 size consumed
Date: Wed, 20 Feb 2019 02:02:19 +0100
Message-ID: <20190220010232.18731-13-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGKr-0000wG-44
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:06:05 +0000
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

VGhlIGJ1ZmZlci5zaXplIGFuZCBidWZmZXIuY29uc3VtZWQgZmllbGRzIGFyZSBvbmx5IHVwZGF0
ZWQgd2l0aGluIHRoZQpidWZmZXJfYXBwZW5kKCkgYm9keS4gV2UgY2FuIHNpbXBseSBsZXQgYnVm
ZmVyX2FwcGVuZCgpIHJldHVybiB0aGUKZGlmZmVyZW5jZSAodGhlIGJ1ZmZlciBjb25zdW1lZCku
CgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5j
b20+Ci0tLQogaHcvY2hhci94ZW5fY29uc29sZS5jIHwgMTMgKysrKysrKystLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9o
dy9jaGFyL3hlbl9jb25zb2xlLmMgYi9ody9jaGFyL3hlbl9jb25zb2xlLmMKaW5kZXggMDgzYjJj
OGUyYS4uMWEzMDAxNGExMSAxMDA2NDQKLS0tIGEvaHcvY2hhci94ZW5fY29uc29sZS5jCisrKyBi
L2h3L2NoYXIveGVuX2NvbnNvbGUuYwpAQCAtNDgsNyArNDgsNyBAQCBzdHJ1Y3QgWGVuQ29uc29s
ZSB7CiAgICAgaW50ICAgICAgICAgICAgICAgYmFja2xvZzsKIH07CiAKLXN0YXRpYyB2b2lkIGJ1
ZmZlcl9hcHBlbmQoc3RydWN0IFhlbkNvbnNvbGUgKmNvbikKK3N0YXRpYyBzc2l6ZV90IGJ1ZmZl
cl9hcHBlbmQoc3RydWN0IFhlbkNvbnNvbGUgKmNvbikKIHsKICAgICBzdHJ1Y3QgYnVmZmVyICpi
dWZmZXIgPSAmY29uLT5idWZmZXI7CiAgICAgWEVOQ09OU19SSU5HX0lEWCBjb25zLCBwcm9kLCBz
aXplOwpAQCAtNTksOCArNTksOSBAQCBzdGF0aWMgdm9pZCBidWZmZXJfYXBwZW5kKHN0cnVjdCBY
ZW5Db25zb2xlICpjb24pCiAgICAgeGVuX21iKCk7CiAKICAgICBzaXplID0gcHJvZCAtIGNvbnM7
Ci0gICAgaWYgKChzaXplID09IDApIHx8IChzaXplID4gc2l6ZW9mKGludGYtPm91dCkpKQotICAg
ICAgICByZXR1cm47CisgICAgaWYgKChzaXplID09IDApIHx8IChzaXplID4gc2l6ZW9mKGludGYt
Pm91dCkpKSB7CisgICAgICAgIGdvdG8gb3V0OworICAgIH0KIAogICAgIGlmICgoYnVmZmVyLT5j
YXBhY2l0eSAtIGJ1ZmZlci0+c2l6ZSkgPCBzaXplKSB7CiAgICAgICAgIGJ1ZmZlci0+Y2FwYWNp
dHkgKz0gKHNpemUgKyAxMDI0KTsKQEAgLTg5LDYgKzkwLDkgQEAgc3RhdGljIHZvaWQgYnVmZmVy
X2FwcGVuZChzdHJ1Y3QgWGVuQ29uc29sZSAqY29uKQogICAgICAgICBpZiAoYnVmZmVyLT5jb25z
dW1lZCA+IGJ1ZmZlci0+bWF4X2NhcGFjaXR5IC0gb3ZlcikKICAgICAgICAgICAgIGJ1ZmZlci0+
Y29uc3VtZWQgPSBidWZmZXItPm1heF9jYXBhY2l0eSAtIG92ZXI7CiAgICAgfQorCisgb3V0Ogor
ICAgIHJldHVybiBidWZmZXItPnNpemUgLSBidWZmZXItPmNvbnN1bWVkOwogfQogCiBzdGF0aWMg
dm9pZCBidWZmZXJfYWR2YW5jZShzdHJ1Y3QgYnVmZmVyICpidWZmZXIsIHNpemVfdCBsZW4pCkBA
IC0yODEsOCArMjg1LDcgQEAgc3RhdGljIHZvaWQgY29uX2V2ZW50KHN0cnVjdCBYZW5MZWdhY3lE
ZXZpY2UgKnhlbmRldikKICAgICBzdHJ1Y3QgWGVuQ29uc29sZSAqY29uID0gY29udGFpbmVyX29m
KHhlbmRldiwgc3RydWN0IFhlbkNvbnNvbGUsIHhlbmRldik7CiAgICAgc3NpemVfdCBzaXplOwog
Ci0gICAgYnVmZmVyX2FwcGVuZChjb24pOwotICAgIHNpemUgPSBjb24tPmJ1ZmZlci5zaXplIC0g
Y29uLT5idWZmZXIuY29uc3VtZWQ7CisgICAgc2l6ZSA9IGJ1ZmZlcl9hcHBlbmQoY29uKTsKICAg
ICBpZiAoc2l6ZSkgewogICAgICAgICB4ZW5jb25zX3NlbmQoY29uLCBzaXplKTsKICAgICB9Ci0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
