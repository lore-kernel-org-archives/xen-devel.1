From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 07/25] gdbstub: Let put_buffer() use size_t
Date: Wed, 20 Feb 2019 02:02:14 +0100
Message-ID: <20190220010232.18731-8-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGKF-0000hr-KG
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:05:27 +0000
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

QWxsIGNhbGxlcnMgcHJvdmlkZSBhIHNpemVfdCBhcmd1bWVudCwgd2UgY2FuIHNhZmVseSB1c2Ug
c2l6ZV90CmZvciB0aGlzIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGdkYnN0dWIuYyB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9nZGJzdHViLmMgYi9nZGJzdHViLmMKaW5kZXggNjkzNDBkN2NkMS4uODYwZTliYjdjNyAxMDA2
NDQKLS0tIGEvZ2Ric3R1Yi5jCisrKyBiL2dkYnN0dWIuYwpAQCAtNDc1LDEwICs0NzUsMTAgQEAg
c3RhdGljIGludCBnZGJfY29udGludWVfcGFydGlhbChHREJTdGF0ZSAqcywgY2hhciAqbmV3c3Rh
dGVzKQogICAgIHJldHVybiByZXM7CiB9CiAKLXN0YXRpYyB2b2lkIHB1dF9idWZmZXIoR0RCU3Rh
dGUgKnMsIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwgaW50IGxlbikKK3N0YXRpYyB2b2lkIHB1dF9idWZm
ZXIoR0RCU3RhdGUgKnMsIGNvbnN0IHVpbnQ4X3QgKmJ1Ziwgc2l6ZV90IGxlbikKIHsKICNpZmRl
ZiBDT05GSUdfVVNFUl9PTkxZCi0gICAgaW50IHJldDsKKyAgICBzc2l6ZV90IHJldDsKIAogICAg
IHdoaWxlIChsZW4gPiAwKSB7CiAgICAgICAgIHJldCA9IHNlbmQocy0+ZmQsIGJ1ZiwgbGVuLCAw
KTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
