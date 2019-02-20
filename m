From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 18/25] s390x/3270: Let
 insert_IAC_escape_char() use size_t
Date: Wed, 20 Feb 2019 02:02:25 +0100
Message-ID: <20190220010232.18731-19-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGMa-0001pA-Oe
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:07:52 +0000
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

VGhpcyBmdW5jdGlvbiB0YWtlcyBzaXplX3QgYXJndW1lbnQgYW5kIHJldHVybiBhIHNpemVfdC4K
ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNv
bT4KLS0tCiBody9jaGFyL3Rlcm1pbmFsMzI3MC5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L2NoYXIv
dGVybWluYWwzMjcwLmMgYi9ody9jaGFyL3Rlcm1pbmFsMzI3MC5jCmluZGV4IDM1YjA3OWQ1YzQu
LjFjYjQ4YTNjNmYgMTAwNjQ0Ci0tLSBhL2h3L2NoYXIvdGVybWluYWwzMjcwLmMKKysrIGIvaHcv
Y2hhci90ZXJtaW5hbDMyNzAuYwpAQCAtMTk5LDkgKzE5OSwxMCBAQCBzdGF0aWMgaW50IHJlYWRf
cGF5bG9hZF8zMjcwKEVtdWxhdGVkQ2N3MzI3MERldmljZSAqZGV2KQogfQogCiAvKiBUTjMyNzAg
dXNlcyBiaW5hcnkgdHJhbnNtaXNzaW9uLCB3aGljaCBuZWVkcyBlc2NhcGUgSUFDIHRvIElBQyBJ
QUMgKi8KLXN0YXRpYyBpbnQgaW5zZXJ0X0lBQ19lc2NhcGVfY2hhcih1aW50OF90ICpvdXR2LCBp
bnQgb3V0X2xlbikKK3N0YXRpYyBzaXplX3QgaW5zZXJ0X0lBQ19lc2NhcGVfY2hhcih1aW50OF90
ICpvdXR2LCBzaXplX3Qgb3V0X2xlbikKIHsKLSAgICBpbnQgSUFDX251bSA9IDAsIG5ld19vdXRf
bGVuLCBpLCBqOworICAgIHNpemVfdCBuZXdfb3V0X2xlbjsKKyAgICBpbnQgSUFDX251bSA9IDAs
IGksIGo7CiAKICAgICBmb3IgKGkgPSAwOyBpIDwgb3V0X2xlbjsgaSsrKSB7CiAgICAgICAgIGlm
IChvdXR2W2ldID09IElBQykgewpAQCAtMjMyLDcgKzIzMyw3IEBAIHN0YXRpYyBpbnQgd3JpdGVf
cGF5bG9hZF8zMjcwKEVtdWxhdGVkQ2N3MzI3MERldmljZSAqZGV2LCB1aW50OF90IGNtZCkKICAg
ICBpbnQgY291bnQgPSBjY3dfZHN0cmVhbV9hdmFpbChnZXRfY2RzKHQpKTsKICAgICBpbnQgYm91
bmQgPSAoT1VUUFVUX0JVRkZFUl9TSVpFIC0gMykgLyAyOwogICAgIGludCBsZW4gPSBNSU4oY291
bnQsIGJvdW5kKTsKLSAgICBpbnQgb3V0X2xlbiA9IDA7CisgICAgc2l6ZV90IG91dF9sZW4gPSAw
OwogCiAgICAgaWYgKCF0LT5oYW5kc2hha2VfZG9uZSkgewogICAgICAgICBpZiAoISh0LT5vdXR2
WzBdID09IElBQyAmJiB0LT5vdXR2WzFdICE9IElBQykpIHsKLS0gCjIuMjAuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
