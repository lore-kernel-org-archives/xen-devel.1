From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 03/25] chardev/wctablet: Use unsigned type to
 hold unsigned value
Date: Wed, 20 Feb 2019 02:02:10 +0100
Message-ID: <20190220010232.18731-4-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGJ7-0000Ih-Gt
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:04:17 +0000
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

VGFibGV0Q2hhcmRldjo6cXVlcnkgaXMgYW4gYXJyYXkgb2YgdWludDhfdC4KVXNlIHRoZSBzYW1l
IHR5cGUgdG8gaG9sZCBpdCAodGhpcyBhbHNvIHNpbGVudCBhIC1Xc2lnbi1jb252ZXJzaW9uCndh
cm5pbmcgaW4gdGhlIHRyYWNlIGZ1bmN0aW9uKS4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBjaGFyZGV2L3RyYWNlLWV2ZW50
cyB8IDIgKy0KIGNoYXJkZXYvd2N0YWJsZXQuYyAgIHwgNSArKystLQogMiBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY2hhcmRldi90
cmFjZS1ldmVudHMgYi9jaGFyZGV2L3RyYWNlLWV2ZW50cwppbmRleCBkMGU1ZjNiYmMxLi41NjJi
ZmU3MGU5IDEwMDY0NAotLS0gYS9jaGFyZGV2L3RyYWNlLWV2ZW50cworKysgYi9jaGFyZGV2L3Ry
YWNlLWV2ZW50cwpAQCAtNSw3ICs1LDcgQEAgd2N0X2luaXQodm9pZCkgIiIKIHdjdF9jbWRfcmUo
dm9pZCkgIiIKIHdjdF9jbWRfc3Qodm9pZCkgIiIKIHdjdF9jbWRfc3Aodm9pZCkgIiIKLXdjdF9j
bWRfdHMoaW50IGlucHV0KSAiMHglMDJ4Igord2N0X2NtZF90cyh1aW50OF90IGlucHV0KSAiMHgl
MDJ4Igogd2N0X2NtZF9vdGhlcihjb25zdCBjaGFyICpjbWQpICIlcyIKIHdjdF9zcGVlZChpbnQg
c3BlZWQpICIlZCIKIApkaWZmIC0tZ2l0IGEvY2hhcmRldi93Y3RhYmxldC5jIGIvY2hhcmRldi93
Y3RhYmxldC5jCmluZGV4IDM1ZGJkMjlhMzMuLmNmN2EwOGEzNjMgMTAwNjQ0Ci0tLSBhL2NoYXJk
ZXYvd2N0YWJsZXQuYworKysgYi9jaGFyZGV2L3djdGFibGV0LmMKQEAgLTIwNyw3ICsyMDcsOCBA
QCBzdGF0aWMgaW50IHdjdGFibGV0X2Nocl93cml0ZShzdHJ1Y3QgQ2hhcmRldiAqY2hyLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWludDhfdCAqYnVmLCBpbnQgbGVuKQog
ewogICAgIFRhYmxldENoYXJkZXYgKnRhYmxldCA9IFdDVEFCTEVUX0NIQVJERVYoY2hyKTsKLSAg
ICB1bnNpZ25lZCBpbnQgaSwgY2xlbjsKKyAgICBzaXplX3QgaTsKKyAgICB1bnNpZ25lZCBpbnQg
Y2xlbjsKICAgICBjaGFyICpwb3M7CiAKICAgICBpZiAodGFibGV0LT5saW5lX3NwZWVkICE9IDk2
MDApIHsKQEAgLTI2OSw3ICsyNzAsNyBAQCBzdGF0aWMgaW50IHdjdGFibGV0X2Nocl93cml0ZShz
dHJ1Y3QgQ2hhcmRldiAqY2hyLAogCiAgICAgfSBlbHNlIGlmIChzdHJuY21wKChjaGFyICopdGFi
bGV0LT5xdWVyeSwgIlRTIiwgMikgPT0gMCAmJgogICAgICAgICAgICAgICAgY2xlbiA9PSAzKSB7
Ci0gICAgICAgIHVuc2lnbmVkIGludCBpbnB1dCA9IHRhYmxldC0+cXVlcnlbMl07CisgICAgICAg
IHVpbnQ4X3QgaW5wdXQgPSB0YWJsZXQtPnF1ZXJ5WzJdOwogICAgICAgICB1aW50OF90IGNvZGVz
WzddID0gewogICAgICAgICAgICAgMHhhMywKICAgICAgICAgICAgICgoaW5wdXQgJiAweDgwKSA9
PSAwKSA/IDB4N2UgOiAweDdmLAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
