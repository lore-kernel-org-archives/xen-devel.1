From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 15/25] spapr-vty: Let vty_putchars() use
 size_t
Date: Wed, 20 Feb 2019 02:02:22 +0100
Message-ID: <20190220010232.18731-16-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGLx-0001Wc-6Q
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:07:13 +0000
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

Qm90aCBjYWxsZXJzIChoX3B1dF90ZXJtX2NoYXIgYW5kIHJ0YXNfZGlzcGxheV9jaGFyYWN0ZXIp
IHVzZQphbiB1bnNpZ25lZCB2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBody9jaGFyL3NwYXByX3Z0eS5jICAgICAg
ICB8IDIgKy0KIGluY2x1ZGUvaHcvcHBjL3NwYXByX3Zpby5oIHwgMiArLQogMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvY2hh
ci9zcGFwcl92dHkuYyBiL2h3L2NoYXIvc3BhcHJfdnR5LmMKaW5kZXggNjc0ODMzNGRlZC4uOTJi
OGM0MDQxMCAxMDA2NDQKLS0tIGEvaHcvY2hhci9zcGFwcl92dHkuYworKysgYi9ody9jaGFyL3Nw
YXByX3Z0eS5jCkBAIC04Myw3ICs4Myw3IEBAIHN0YXRpYyBpbnQgdnR5X2dldGNoYXJzKFZJT3NQ
QVBSRGV2aWNlICpzZGV2LCB1aW50OF90ICpidWYsIGludCBtYXgpCiAgICAgcmV0dXJuIG47CiB9
CiAKLXZvaWQgdnR5X3B1dGNoYXJzKFZJT3NQQVBSRGV2aWNlICpzZGV2LCB1aW50OF90ICpidWYs
IGludCBsZW4pCit2b2lkIHZ0eV9wdXRjaGFycyhWSU9zUEFQUkRldmljZSAqc2RldiwgdWludDhf
dCAqYnVmLCBzaXplX3QgbGVuKQogewogICAgIFZJT3NQQVBSVlRZRGV2aWNlICpkZXYgPSBWSU9f
U1BBUFJfVlRZX0RFVklDRShzZGV2KTsKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9wcGMvc3Bh
cHJfdmlvLmggYi9pbmNsdWRlL2h3L3BwYy9zcGFwcl92aW8uaAppbmRleCBlOGIwMDZkMThmLi5l
ZDc5ZDJmMzgwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L3BwYy9zcGFwcl92aW8uaAorKysgYi9p
bmNsdWRlL2h3L3BwYy9zcGFwcl92aW8uaApAQCAtMTI2LDcgKzEyNiw3IEBAIHN0YXRpYyBpbmxp
bmUgaW50IHNwYXByX3Zpb19kbWFfc2V0KFZJT3NQQVBSRGV2aWNlICpkZXYsIHVpbnQ2NF90IHRh
ZGRyLAogaW50IHNwYXByX3Zpb19zZW5kX2NycShWSU9zUEFQUkRldmljZSAqZGV2LCB1aW50OF90
ICpjcnEpOwogCiBWSU9zUEFQUkRldmljZSAqdnR5X2xvb2t1cChzUEFQUk1hY2hpbmVTdGF0ZSAq
c3BhcHIsIHRhcmdldF91bG9uZyByZWcpOwotdm9pZCB2dHlfcHV0Y2hhcnMoVklPc1BBUFJEZXZp
Y2UgKnNkZXYsIHVpbnQ4X3QgKmJ1ZiwgaW50IGxlbik7Cit2b2lkIHZ0eV9wdXRjaGFycyhWSU9z
UEFQUkRldmljZSAqc2RldiwgdWludDhfdCAqYnVmLCBzaXplX3QgbGVuKTsKIHZvaWQgc3BhcHJf
dnR5X2NyZWF0ZShWSU9zUEFQUkJ1cyAqYnVzLCBDaGFyZGV2ICpjaGFyZGV2KTsKIHZvaWQgc3Bh
cHJfdmxhbl9jcmVhdGUoVklPc1BBUFJCdXMgKmJ1cywgTklDSW5mbyAqbmQpOwogdm9pZCBzcGFw
cl92c2NzaV9jcmVhdGUoVklPc1BBUFJCdXMgKmJ1cyk7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
