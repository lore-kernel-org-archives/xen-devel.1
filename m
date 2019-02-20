From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 21/25] s390x/sclp: Use size_t in process_mdb()
Date: Wed, 20 Feb 2019 02:02:28 +0100
Message-ID: <20190220010232.18731-22-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGMq-0001yN-Fy
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:08:08 +0000
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

U2luY2UgaXQgaXMgdW5saWtlbHkgd2UgaGF2ZSBzaXplb2YobWRiby0+bXRvLm1lc3NhZ2UpIDwg
MCwKd2UgY2FuIGNvbnZlcnQgdGhpcyB2YXJpYWJsZSB0byBhbiB1bnNpZ25lZCB0eXBlLgoKU2ln
bmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgot
LS0KIGh3L2NoYXIvc2NscGNvbnNvbGUtbG0uYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaHcvY2hhci9zY2xwY29u
c29sZS1sbS5jIGIvaHcvY2hhci9zY2xwY29uc29sZS1sbS5jCmluZGV4IDQ5NTQzZTJjODMuLjQ4
Yzc2ZDg2M2UgMTAwNjQ0Ci0tLSBhL2h3L2NoYXIvc2NscGNvbnNvbGUtbG0uYworKysgYi9ody9j
aGFyL3NjbHBjb25zb2xlLWxtLmMKQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgaW50IHdyaXRl
X2NvbnNvbGVfZGF0YShTQ0xQRXZlbnQgKmV2ZW50LCBjb25zdCB1aW50OF90ICpidWYsIGludCBs
ZW4pCiBzdGF0aWMgaW50IHByb2Nlc3NfbWRiKFNDTFBFdmVudCAqZXZlbnQsIE1EQk8gKm1kYm8p
CiB7CiAgICAgaW50IHJjOwotICAgIGludCBsZW47CisgICAgdWludDE2X3QgbGVuOwogICAgIHVp
bnQ4X3QgYnVmZmVyW1NJWkVfQlVGRkVSXTsKICAgICBjb25zdCBzaXplX3QgaGxlbiA9IHNpemVv
ZihtZGJvLT5sZW5ndGgpCiAgICAgICAgICAgICArIHNpemVvZihtZGJvLT50eXBlKQpAQCAtMjE3
LDYgKzIxNyw3IEBAIHN0YXRpYyBpbnQgcHJvY2Vzc19tZGIoU0NMUEV2ZW50ICpldmVudCwgTURC
TyAqbWRibykKICAgICAgICAgICAgICsgc2l6ZW9mKG1kYm8tPm10by5fcmVzZXJ2ZWQpOwogCiAg
ICAgbGVuID0gYmUxNl90b19jcHUobWRiby0+bGVuZ3RoKTsKKyAgICBhc3NlcnQobGVuID49IGhs
ZW4pOwogICAgIGxlbiAtPSBobGVuOwogICAgIGFzc2VydChsZW4gPD0gU0laRV9CVUZGRVIpOwog
Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
