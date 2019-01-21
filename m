From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] configure: Don't add Xen's libs to LDFLAGS
Date: Mon, 21 Jan 2019 15:17:54 +0000
Message-ID: <CAFEAcA_ytAb-K-HB3wL5baMBDkY71ksBK8hsUSFxuUeqVDFyHQ__2793.13901425979$1548087504$gmane$org@mail.gmail.com>
References: <20190121144841.24467-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mrJR=P5=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1glbKy-0006Lv-Tu
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 15:18:08 +0000
Received: by mail-ot1-x342.google.com with SMTP id w25so20768911otm.13
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jan 2019 07:18:07 -0800 (PST)
In-Reply-To: <20190121144841.24467-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyMSBKYW4gMjAxOSBhdCAxNDo0OSwgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gV2hlbiBYZW4gaXMgZGV0ZWN0ZWQgdmlhIHBrZy1j
b25maWcsIGl0IGlzbid0IG5lY2Vzc2FyeSB0byBtb2RpZnkKPiBMREZMQUdTIGFzIG1vZGlmeWlu
ZyBsaWJzX3NvZnRtbXUgaXMgZW5vdWdoLgo+Cj4gUmVwb3J0ZWQtYnk6IFBldGVyIE1heWRlbGwg
PHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgY29uZmlndXJlIHwgMSAtCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvY29uZmlndXJl
IGIvY29uZmlndXJlCj4gaW5kZXggMTJmZDM0ZjMwYi4uOThiMjcwOTc0ZCAxMDA3NTUKPiAtLS0g
YS9jb25maWd1cmUKPiArKysgYi9jb25maWd1cmUKPiBAQCAtMjM1NSw3ICsyMzU1LDYgQEAgaWYg
dGVzdCAiJHhlbiIgIT0gIm5vIiA7IHRoZW4KPiAgICAgIGZpCj4gICAgICBRRU1VX0NGTEFHUz0i
JFFFTVVfQ0ZMQUdTICQoJHBrZ19jb25maWcgLS1jZmxhZ3MgJHhlbl9wYykiCj4gICAgICBsaWJz
X3NvZnRtbXU9IiQoJHBrZ19jb25maWcgLS1saWJzICR4ZW5fcGMpICRsaWJzX3NvZnRtbXUiCj4g
LSAgICBMREZMQUdTPSIkKCRwa2dfY29uZmlnIC0tbGlicyAkeGVuX3BjKSAkTERGTEFHUyIKPiAg
ICBlbHNlCj4KPiAgICAgIHhlbl9saWJzPSItbHhlbnN0b3JlIC1seGVuY3RybCAtbHhlbmd1ZXN0
Igo+IC0tCj4gQW50aG9ueSBQRVJBUkQKClJldmlld2VkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRl
ci5tYXlkZWxsQGxpbmFyby5vcmc+CgpDYydpbmcgTUpULCB3aG8gZmlyc3QgcG9pbnRlZCBvdXQg
dG8gbWUgdGhhdCB0aGlzIGJ1Zwp3YXMgcmVzdWx0aW5nIGluIHZhcmlvdXMgYmluYXJpZXMgbGlr
ZSB0aGUgbGludXgtdXNlciBvbmVzCmdldHRpbmcgbGlua2VkIGFnYWluc3QgdGhlIFhlbiBsaWJz
IHVubmVjZXNzYXJpbHkuCgp0aGFua3MKLS0gUE1NCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
