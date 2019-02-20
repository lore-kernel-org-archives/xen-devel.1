From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 02/25] chardev: Assert IOCanReadHandler can
 not be negative
Date: Wed, 20 Feb 2019 02:02:09 +0100
Message-ID: <20190220010232.18731-3-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGIk-0000E8-Tr
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:03:54 +0000
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

VGhlIGJhY2tlbmQgc2hvdWxkIG5vdCByZXR1cm4gYSBuZWdhdGl2ZSBsZW5ndGggdG8gcmVhZC4K
V2Ugd2lsbCBsYXRlciBjaGFuZ2UgdGhlIHByb3RvdHlwZSBvZiBJT0NhblJlYWRIYW5kbGVyIHRv
IHJldHVybiBhbgp1bnNpZ25lZCBsZW5ndGguIE1lYW53aGlsZSBtYWtlIHN1cmUgdGhlIHJldHVy
biBsZW5ndGggaXMgcG9zaXRpdmUuCgpTdWdnZXN0ZWQtYnk6IFBhb2xvIEJvbnppbmkgPHBib256
aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxw
aGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBjaGFyZGV2L2NoYXIuYyB8IDUgKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9jaGFy
ZGV2L2NoYXIuYyBiL2NoYXJkZXYvY2hhci5jCmluZGV4IGY2ZDYxZmE1ZjguLjcxZWNkMzJiMjUg
MTAwNjQ0Ci0tLSBhL2NoYXJkZXYvY2hhci5jCisrKyBiL2NoYXJkZXYvY2hhci5jCkBAIC0xNTks
MTIgKzE1OSwxNSBAQCBpbnQgcWVtdV9jaHJfd3JpdGUoQ2hhcmRldiAqcywgY29uc3QgdWludDhf
dCAqYnVmLCBpbnQgbGVuLCBib29sIHdyaXRlX2FsbCkKIGludCBxZW11X2Nocl9iZV9jYW5fd3Jp
dGUoQ2hhcmRldiAqcykKIHsKICAgICBDaGFyQmFja2VuZCAqYmUgPSBzLT5iZTsKKyAgICBpbnQg
cmVjZWl2YWJsZV9ieXRlczsKIAogICAgIGlmICghYmUgfHwgIWJlLT5jaHJfY2FuX3JlYWQpIHsK
ICAgICAgICAgcmV0dXJuIDA7CiAgICAgfQogCi0gICAgcmV0dXJuIGJlLT5jaHJfY2FuX3JlYWQo
YmUtPm9wYXF1ZSk7CisgICAgcmVjZWl2YWJsZV9ieXRlcyA9IGJlLT5jaHJfY2FuX3JlYWQoYmUt
Pm9wYXF1ZSk7CisgICAgYXNzZXJ0KHJlY2VpdmFibGVfYnl0ZXMgPj0gMCk7CisgICAgcmV0dXJu
IHJlY2VpdmFibGVfYnl0ZXM7CiB9CiAKIHZvaWQgcWVtdV9jaHJfYmVfd3JpdGVfaW1wbChDaGFy
ZGV2ICpzLCB1aW50OF90ICpidWYsIGludCBsZW4pCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
