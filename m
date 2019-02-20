From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 20/25] s390x/sclp: Use a const variable to
 improve readability
Date: Wed, 20 Feb 2019 02:02:27 +0100
Message-ID: <20190220010232.18731-21-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGMW-0001m3-AM
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:07:48 +0000
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

V2Ugd2lsbCByZXVzZSB0aGlzIHZhcmlhYmxlIGluIHRoZSBuZXh0IHBhdGNoLgoKU2lnbmVkLW9m
Zi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGh3
L2NoYXIvc2NscGNvbnNvbGUtbG0uYyB8IDcgKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9jaGFyL3NjbHBjb25z
b2xlLWxtLmMgYi9ody9jaGFyL3NjbHBjb25zb2xlLWxtLmMKaW5kZXggZGJjOTFhMWU1Yi4uNDk1
NDNlMmM4MyAxMDA2NDQKLS0tIGEvaHcvY2hhci9zY2xwY29uc29sZS1sbS5jCisrKyBiL2h3L2No
YXIvc2NscGNvbnNvbGUtbG0uYwpAQCAtMjEwLDEzICsyMTAsMTQgQEAgc3RhdGljIGludCBwcm9j
ZXNzX21kYihTQ0xQRXZlbnQgKmV2ZW50LCBNREJPICptZGJvKQogICAgIGludCByYzsKICAgICBp
bnQgbGVuOwogICAgIHVpbnQ4X3QgYnVmZmVyW1NJWkVfQlVGRkVSXTsKLQotICAgIGxlbiA9IGJl
MTZfdG9fY3B1KG1kYm8tPmxlbmd0aCk7Ci0gICAgbGVuIC09IHNpemVvZihtZGJvLT5sZW5ndGgp
ICsgc2l6ZW9mKG1kYm8tPnR5cGUpCisgICAgY29uc3Qgc2l6ZV90IGhsZW4gPSBzaXplb2YobWRi
by0+bGVuZ3RoKQorICAgICAgICAgICAgKyBzaXplb2YobWRiby0+dHlwZSkKICAgICAgICAgICAg
ICsgc2l6ZW9mKG1kYm8tPm10by5saW5lX3R5cGVfZmxhZ3MpCiAgICAgICAgICAgICArIHNpemVv
ZihtZGJvLT5tdG8uYWxhcm1fY29udHJvbCkKICAgICAgICAgICAgICsgc2l6ZW9mKG1kYm8tPm10
by5fcmVzZXJ2ZWQpOwogCisgICAgbGVuID0gYmUxNl90b19jcHUobWRiby0+bGVuZ3RoKTsKKyAg
ICBsZW4gLT0gaGxlbjsKICAgICBhc3NlcnQobGVuIDw9IFNJWkVfQlVGRkVSKTsKIAogICAgIC8q
IGNvbnZlcnQgRUJDRElDIFNDTFAgY29udGVudHMgdG8gQVNDSUkgY29uc29sZSBtZXNzYWdlICov
Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
