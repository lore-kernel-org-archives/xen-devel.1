From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] configure: Don't add Xen's libs to LDFLAGS
Date: Mon, 21 Jan 2019 14:48:41 +0000
Message-ID: <20190121144841.24467-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pK04=P5=citrix.com=prvs=917ecb37e=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1glask-0003xR-LJ
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 14:48:58 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul.durrant@citrix.com>, Peter Maydell <peter.maydell@linaro.org>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBYZW4gaXMgZGV0ZWN0ZWQgdmlhIHBrZy1jb25maWcsIGl0IGlzbid0IG5lY2Vzc2FyeSB0
byBtb2RpZnkKTERGTEFHUyBhcyBtb2RpZnlpbmcgbGlic19zb2Z0bW11IGlzIGVub3VnaC4KClJl
cG9ydGVkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+ClNpZ25l
ZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0K
IGNvbmZpZ3VyZSB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUKaW5kZXggMTJmZDM0ZjMwYi4uOThiMjcwOTc0ZCAx
MDA3NTUKLS0tIGEvY29uZmlndXJlCisrKyBiL2NvbmZpZ3VyZQpAQCAtMjM1NSw3ICsyMzU1LDYg
QEAgaWYgdGVzdCAiJHhlbiIgIT0gIm5vIiA7IHRoZW4KICAgICBmaQogICAgIFFFTVVfQ0ZMQUdT
PSIkUUVNVV9DRkxBR1MgJCgkcGtnX2NvbmZpZyAtLWNmbGFncyAkeGVuX3BjKSIKICAgICBsaWJz
X3NvZnRtbXU9IiQoJHBrZ19jb25maWcgLS1saWJzICR4ZW5fcGMpICRsaWJzX3NvZnRtbXUiCi0g
ICAgTERGTEFHUz0iJCgkcGtnX2NvbmZpZyAtLWxpYnMgJHhlbl9wYykgJExERkxBR1MiCiAgIGVs
c2UKIAogICAgIHhlbl9saWJzPSItbHhlbnN0b3JlIC1seGVuY3RybCAtbHhlbmd1ZXN0IgotLSAK
QW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
