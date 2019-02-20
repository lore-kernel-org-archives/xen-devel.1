From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 22/25] s390x/sclp: Let write_console_data()
 take a size_t
Date: Wed, 20 Feb 2019 02:02:29 +0100
Message-ID: <20190220010232.18731-23-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGNa-0002Hm-6e
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:08:54 +0000
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

U2luY2UgYWxsIGNhbGxlcnMgcHJvdmlkZSBhbiB1bnNpZ25lZCB2YWx1ZSwgd2UgY2FuIHNhZmVs
eQp1c2UgYSBzaXplX3QgYXJndW1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcvY2hhci9zY2xwY29uc29sZS1sbS5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvaHcvY2hhci9zY2xwY29uc29sZS1sbS5jIGIvaHcvY2hhci9zY2xwY29uc29s
ZS1sbS5jCmluZGV4IDQ4Yzc2ZDg2M2UuLjI5MGQzMTE4YTUgMTAwNjQ0Ci0tLSBhL2h3L2NoYXIv
c2NscGNvbnNvbGUtbG0uYworKysgYi9ody9jaGFyL3NjbHBjb25zb2xlLWxtLmMKQEAgLTE5MSw3
ICsxOTEsNyBAQCBzdGF0aWMgaW50IHJlYWRfZXZlbnRfZGF0YShTQ0xQRXZlbnQgKmV2ZW50LCBF
dmVudEJ1ZmZlckhlYWRlciAqZXZ0X2J1Zl9oZHIsCiAgKiAgLSB3cml0ZSBjb25zb2xlIGRhdGEg
dG8gY2hhcmFjdGVyIGxheWVyCiAgKiAgcmV0dXJucyA8IDAgaWYgYW4gZXJyb3Igb2NjdXJyZWQK
ICAqLwotc3RhdGljIGludCB3cml0ZV9jb25zb2xlX2RhdGEoU0NMUEV2ZW50ICpldmVudCwgY29u
c3QgdWludDhfdCAqYnVmLCBpbnQgbGVuKQorc3RhdGljIGludCB3cml0ZV9jb25zb2xlX2RhdGEo
U0NMUEV2ZW50ICpldmVudCwgY29uc3QgdWludDhfdCAqYnVmLCBzaXplX3QgbGVuKQogewogICAg
IFNDTFBDb25zb2xlTE0gKnNjb24gPSBTQ0xQTE1fQ09OU09MRShldmVudCk7CiAKLS0gCjIuMjAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
