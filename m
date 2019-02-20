From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 19/25] s390/ebcdic: Use size_t to iterate
 over arrays
Date: Wed, 20 Feb 2019 02:02:26 +0100
Message-ID: <20190220010232.18731-20-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGMJ-0001fm-4K
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:07:35 +0000
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

U2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29t
PgotLS0KIGluY2x1ZGUvaHcvczM5MHgvZWJjZGljLmggfCA4ICsrKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvaHcvczM5MHgvZWJjZGljLmggYi9pbmNsdWRlL2h3L3MzOTB4L2ViY2RpYy5oCmluZGV4IDY5
YTA0Y2FiNjIuLmQ4OTE3NGUxMTMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvczM5MHgvZWJjZGlj
LmgKKysrIGIvaW5jbHVkZS9ody9zMzkweC9lYmNkaWMuaApAQCAtODMsMTggKzgzLDE4IEBAIHN0
YXRpYyBjb25zdCB1aW50OF90IGFzY2lpMmViY2RpY1tdID0gewogICAgIDB4OTAsIDB4M0YsIDB4
M0YsIDB4M0YsIDB4M0YsIDB4RUEsIDB4M0YsIDB4RkYKIH07CiAKLXN0YXRpYyBpbmxpbmUgdm9p
ZCBlYmNkaWNfcHV0KHVpbnQ4X3QgKnAsIGNvbnN0IGNoYXIgKmFzY2lpLCBpbnQgbGVuKQorc3Rh
dGljIGlubGluZSB2b2lkIGViY2RpY19wdXQodWludDhfdCAqcCwgY29uc3QgY2hhciAqYXNjaWks
IHNpemVfdCBsZW4pCiB7Ci0gICAgaW50IGk7CisgICAgc2l6ZV90IGk7CiAKICAgICBmb3IgKGkg
PSAwOyBpIDwgbGVuOyBpKyspIHsKICAgICAgICAgcFtpXSA9IGFzY2lpMmViY2RpY1sodWludDhf
dClhc2NpaVtpXV07CiAgICAgfQogfQogCi1zdGF0aWMgaW5saW5lIHZvaWQgYXNjaWlfcHV0KHVp
bnQ4X3QgKnAsIGNvbnN0IGNoYXIgKmViY2RpYywgaW50IGxlbikKK3N0YXRpYyBpbmxpbmUgdm9p
ZCBhc2NpaV9wdXQodWludDhfdCAqcCwgY29uc3QgY2hhciAqZWJjZGljLCBzaXplX3QgbGVuKQog
ewotICAgIGludCBpOworICAgIHNpemVfdCBpOwogCiAgICAgZm9yIChpID0gMDsgaSA8IGxlbjsg
aSsrKSB7CiAgICAgICAgIHBbaV0gPSBlYmNkaWMyYXNjaWlbKHVpbnQ4X3QpZWJjZGljW2ldXTsK
LS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
