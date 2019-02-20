From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 05/25] gdbstub: Use size_t for strlen()
 return value
Date: Wed, 20 Feb 2019 02:02:12 +0100
Message-ID: <20190220010232.18731-6-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGJl-0000XJ-QJ
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:04:57 +0000
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

U2luY2Ugc3RybGVuKCkgcmV0dXJucyBhbiB1bnNpZ25lZCB2YWx1ZSwgaXQgaXMgcG9pbnRsZXNz
IHRvCmNvbnZlcnQgaXQgdG8gYSBzaWduZWQgb25lLiBVc2Ugc2l6ZV90IHRvIGhvbGQgaXRzIHJl
dHVybiB2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGls
bWRAcmVkaGF0LmNvbT4KLS0tCiBnZGJzdHViLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9nZGJzdHViLmMgYi9nZGJz
dHViLmMKaW5kZXggYmM3NzRhZTk5Mi4uNzZlY2EzYmI3ZSAxMDA2NDQKLS0tIGEvZ2Ric3R1Yi5j
CisrKyBiL2dkYnN0dWIuYwpAQCAtMTY5Myw3ICsxNjkzLDcgQEAgc3RhdGljIGludCBnZGJfaGFu
ZGxlX3BhY2tldChHREJTdGF0ZSAqcywgY29uc3QgY2hhciAqbGluZV9idWYpCiAgICAgICAgIH0K
ICNlbHNlIC8qICFDT05GSUdfVVNFUl9PTkxZICovCiAgICAgICAgIGVsc2UgaWYgKHN0cm5jbXAo
cCwgIlJjbWQsIiwgNSkgPT0gMCkgewotICAgICAgICAgICAgaW50IGxlbiA9IHN0cmxlbihwICsg
NSk7CisgICAgICAgICAgICBzaXplX3QgbGVuID0gc3RybGVuKHAgKyA1KTsKIAogICAgICAgICAg
ICAgaWYgKChsZW4gJSAyKSAhPSAwKSB7CiAgICAgICAgICAgICAgICAgcHV0X3BhY2tldChzLCAi
RTAxIik7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
