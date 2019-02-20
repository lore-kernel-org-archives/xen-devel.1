From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 16/25] tpm: Use size_t to hold sizes
Date: Wed, 20 Feb 2019 02:02:23 +0100
Message-ID: <20190220010232.18731-17-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGLg-0001Pb-Hr
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:06:56 +0000
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

QXZvaWQgdG8gdXNlIGEgc2lnbmVkIHR5cGUgdG8gaG9sZCBhbiB1bnNpZ25lZCB2YWx1ZS4KClNp
Z25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4K
LS0tCiBody90cG0vdHBtX2VtdWxhdG9yLmMgfCA3ICsrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvdHBtL3RwbV9l
bXVsYXRvci5jIGIvaHcvdHBtL3RwbV9lbXVsYXRvci5jCmluZGV4IDcwZjRiMTAyODQuLjkzMWU1
NmY2ZWQgMTAwNjQ0Ci0tLSBhL2h3L3RwbS90cG1fZW11bGF0b3IuYworKysgYi9ody90cG0vdHBt
X2VtdWxhdG9yLmMKQEAgLTg3LDE3ICs4NywxOCBAQCBzdGF0aWMgaW50IHRwbV9lbXVsYXRvcl9j
dHJsY21kKFRQTUVtdWxhdG9yICp0cG0sIHVuc2lnbmVkIGxvbmcgY21kLCB2b2lkICptc2csCiB7
CiAgICAgQ2hhckJhY2tlbmQgKmRldiA9ICZ0cG0tPmN0cmxfY2hyOwogICAgIHVpbnQzMl90IGNt
ZF9ubyA9IGNwdV90b19iZTMyKGNtZCk7Ci0gICAgc3NpemVfdCBuID0gc2l6ZW9mKHVpbnQzMl90
KSArIG1zZ19sZW5faW47CisgICAgc2l6ZV90IHN6ID0gc2l6ZW9mKHVpbnQzMl90KSArIG1zZ19s
ZW5faW47CisgICAgc3NpemVfdCBuOwogICAgIHVpbnQ4X3QgKmJ1ZiA9IE5VTEw7CiAgICAgaW50
IHJldCA9IC0xOwogCiAgICAgcWVtdV9tdXRleF9sb2NrKCZ0cG0tPm11dGV4KTsKIAotICAgIGJ1
ZiA9IGdfYWxsb2NhKG4pOworICAgIGJ1ZiA9IGdfYWxsb2NhKHN6KTsKICAgICBtZW1jcHkoYnVm
LCAmY21kX25vLCBzaXplb2YoY21kX25vKSk7CiAgICAgbWVtY3B5KGJ1ZiArIHNpemVvZihjbWRf
bm8pLCBtc2csIG1zZ19sZW5faW4pOwogCi0gICAgbiA9IHFlbXVfY2hyX2ZlX3dyaXRlX2FsbChk
ZXYsIGJ1Ziwgbik7CisgICAgbiA9IHFlbXVfY2hyX2ZlX3dyaXRlX2FsbChkZXYsIGJ1Ziwgc3op
OwogICAgIGlmIChuIDw9IDApIHsKICAgICAgICAgZ290byBlbmQ7CiAgICAgfQotLSAKMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
