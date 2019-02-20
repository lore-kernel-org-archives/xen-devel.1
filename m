From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 08/25] ui/gtk: Remove pointless cast
Date: Wed, 20 Feb 2019 02:02:15 +0100
Message-ID: <20190220010232.18731-9-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGK4-0000ci-0J
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:05:16 +0000
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

VGhlICdzaXplJyB2YWx1ZSBpcyBvZiB0eXBlICdndWludCcgd2hpY2ggaXMgYWxyZWFkeSB1bnNp
Z25lZC4KUmVtb3ZlIHRoZSB1c2VsZXNzIGNhc3QuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogdWkvZ3RrLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS91aS9ndGsuYyBiL3VpL2d0ay5jCmluZGV4IDk0OWIxNDNlNGUuLmI1ODc5ZmRlY2UgMTAwNjQ0
Ci0tLSBhL3VpL2d0ay5jCisrKyBiL3VpL2d0ay5jCkBAIC0xNzY0LDcgKzE3NjQsNyBAQCBzdGF0
aWMgZ2Jvb2xlYW4gZ2RfdmNfaW4oVnRlVGVybWluYWwgKnRlcm1pbmFsLCBnY2hhciAqdGV4dCwg
Z3VpbnQgc2l6ZSwKICAgICAgICAgfQogICAgIH0KIAotICAgIHFlbXVfY2hyX2JlX3dyaXRlKHZj
LT52dGUuY2hyLCAodWludDhfdCAgKil0ZXh0LCAodW5zaWduZWQgaW50KXNpemUpOworICAgIHFl
bXVfY2hyX2JlX3dyaXRlKHZjLT52dGUuY2hyLCAodWludDhfdCAgKil0ZXh0LCBzaXplKTsKICAg
ICByZXR1cm4gVFJVRTsKIH0KIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
