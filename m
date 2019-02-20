From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH v3 13/25] xen: Let buffer_append() return a
 size_t
Date: Wed, 20 Feb 2019 02:02:20 +0100
Message-ID: <20190220010232.18731-14-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGL3-00013x-Kx
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:06:17 +0000
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

VG8gdGhlIFhlbiB0ZWFtOiB0aGlzIGlzIG5vdCB0cml2aWFsIHRvIG1lIHRvIGRlbW9uc3RyYXRl
CnRoaXMgYXNzZXJ0aW9uIGNhbiBuZXZlciBoYXBwZW4sIGJ1dCB0aGVuIHRoZSB3aG9sZSBzZXJp
ZXMKaXMganVzdGlmaWVkIGFuZCBJIGNhbiBjb252ZXJ0IHFlbXVfY2hyX2ZlX3dyaXRlKCkgdG8g
dXNlCnNpemVfdCBhcmd1bWVudC4KQ2FuIHlvdSBoZWxwIG1lIGhlcmU/CgpTaWduZWQtb2ZmLWJ5
OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcvY2hh
ci94ZW5fY29uc29sZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRp
ZmYgLS1naXQgYS9ody9jaGFyL3hlbl9jb25zb2xlLmMgYi9ody9jaGFyL3hlbl9jb25zb2xlLmMK
aW5kZXggMWEzMDAxNGExMS4uNWI2NzJhNWEyNCAxMDA2NDQKLS0tIGEvaHcvY2hhci94ZW5fY29u
c29sZS5jCisrKyBiL2h3L2NoYXIveGVuX2NvbnNvbGUuYwpAQCAtOTIsNiArOTIsNyBAQCBzdGF0
aWMgc3NpemVfdCBidWZmZXJfYXBwZW5kKHN0cnVjdCBYZW5Db25zb2xlICpjb24pCiAgICAgfQog
CiAgb3V0OgorICAgIGFzc2VydChidWZmZXItPnNpemUgPj0gYnVmZmVyLT5jb25zdW1lZCk7CiAg
ICAgcmV0dXJuIGJ1ZmZlci0+c2l6ZSAtIGJ1ZmZlci0+Y29uc3VtZWQ7CiB9CiAKLS0gCjIuMjAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
