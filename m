From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 11/25] xen: Let xencons_send() take a 'size'
 argument
Date: Wed, 20 Feb 2019 02:02:18 +0100
Message-ID: <20190220010232.18731-12-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGL7-00016q-Sd
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:06:21 +0000
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

VGhlIHNpbmdsZSBjYWxsZXIgb2YgeGVuY29uc19zZW5kKCksIGNvbl9ldmVudCgpIGFscmVhZHkg
dXNlIHRoZQpkaWZmZXJlbmNlICdjb24tPmJ1ZmZlci5zaXplIC0gY29uLT5idWZmZXIuY29uc3Vt
ZWQnLgpEZWR1cGxpY2F0ZSBieSBwYXNzaW5nIHRoZSBkaWZmZXJlbmNlIGFzIGFuIGFyZ3VtZW50
LgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQu
Y29tPgotLS0KIGh3L2NoYXIveGVuX2NvbnNvbGUuYyB8IDEyICsrKysrKystLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9o
dy9jaGFyL3hlbl9jb25zb2xlLmMgYi9ody9jaGFyL3hlbl9jb25zb2xlLmMKaW5kZXggOTFmMzRl
ZjA2Yy4uMDgzYjJjOGUyYSAxMDA2NDQKLS0tIGEvaHcvY2hhci94ZW5fY29uc29sZS5jCisrKyBi
L2h3L2NoYXIveGVuX2NvbnNvbGUuYwpAQCAtMTQ0LDExICsxNDQsMTAgQEAgc3RhdGljIHZvaWQg
eGVuY29uc19yZWNlaXZlKHZvaWQgKm9wYXF1ZSwgY29uc3QgdWludDhfdCAqYnVmLCBpbnQgbGVu
KQogICAgIHhlbl9wdl9zZW5kX25vdGlmeSgmY29uLT54ZW5kZXYpOwogfQogCi1zdGF0aWMgdm9p
ZCB4ZW5jb25zX3NlbmQoc3RydWN0IFhlbkNvbnNvbGUgKmNvbikKK3N0YXRpYyB2b2lkIHhlbmNv
bnNfc2VuZChzdHJ1Y3QgWGVuQ29uc29sZSAqY29uLCBzc2l6ZV90IHNpemUpCiB7Ci0gICAgc3Np
emVfdCBsZW4sIHNpemU7CisgICAgc3NpemVfdCBsZW47CiAKLSAgICBzaXplID0gY29uLT5idWZm
ZXIuc2l6ZSAtIGNvbi0+YnVmZmVyLmNvbnN1bWVkOwogICAgIGlmIChxZW11X2Nocl9mZV9iYWNr
ZW5kX2Nvbm5lY3RlZCgmY29uLT5jaHIpKSB7CiAgICAgICAgIGxlbiA9IHFlbXVfY2hyX2ZlX3dy
aXRlKCZjb24tPmNociwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uLT5idWZm
ZXIuZGF0YSArIGNvbi0+YnVmZmVyLmNvbnN1bWVkLApAQCAtMjgwLDEwICsyNzksMTMgQEAgc3Rh
dGljIHZvaWQgY29uX2Rpc2Nvbm5lY3Qoc3RydWN0IFhlbkxlZ2FjeURldmljZSAqeGVuZGV2KQog
c3RhdGljIHZvaWQgY29uX2V2ZW50KHN0cnVjdCBYZW5MZWdhY3lEZXZpY2UgKnhlbmRldikKIHsK
ICAgICBzdHJ1Y3QgWGVuQ29uc29sZSAqY29uID0gY29udGFpbmVyX29mKHhlbmRldiwgc3RydWN0
IFhlbkNvbnNvbGUsIHhlbmRldik7CisgICAgc3NpemVfdCBzaXplOwogCiAgICAgYnVmZmVyX2Fw
cGVuZChjb24pOwotICAgIGlmIChjb24tPmJ1ZmZlci5zaXplIC0gY29uLT5idWZmZXIuY29uc3Vt
ZWQpCi0gICAgICAgIHhlbmNvbnNfc2VuZChjb24pOworICAgIHNpemUgPSBjb24tPmJ1ZmZlci5z
aXplIC0gY29uLT5idWZmZXIuY29uc3VtZWQ7CisgICAgaWYgKHNpemUpIHsKKyAgICAgICAgeGVu
Y29uc19zZW5kKGNvbiwgc2l6ZSk7CisgICAgfQogfQogCiAvKiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAqLwotLSAK
Mi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
