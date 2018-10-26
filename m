From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 19/20] milkymist-minimac2: Use
 qemu_log_mask(GUEST_ERROR) instead of error_report
Date: Fri, 26 Oct 2018 17:31:24 +0200
Message-ID: <20181026153125.24738-20-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vnpb=ng=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gG465-0001OO-D3
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 15:32:25 +0000
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KCnFlbXVfbG9n
X21hc2soR1VFU1RfRVJST1IpIGlzIG1vcmUgYXBwcm9wcmlhdGU6CgogICQgcWVtdSAtZCBoZWxw
CiAgTG9nIGl0ZW1zIChjb21tYSBzZXBhcmF0ZWQpOgogIGd1ZXN0X2Vycm9ycyAgICBsb2cgd2hl
biB0aGUgZ3Vlc3QgT1MgZG9lcyBzb21ldGhpbmcgaW52YWxpZCAoZWcgYWNjZXNzaW5nIGEgbm9u
LWV4aXN0ZW50IHJlZ2lzdGVyKQoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPGY0YnVnQGFtc2F0Lm9yZz4KQWNrZWQtYnk6IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2Fs
bGUuY2M+Ck1lc3NhZ2UtSWQ6IDwyMDE4MDcwMjAxNDAyMi4xMjM5NS0xLWY0YnVnQGFtc2F0Lm9y
Zz4KU2lnbmVkLW9mZi1ieTogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgotLS0K
IGh3L25ldC9taWxreW1pc3QtbWluaW1hYzIuYyB8IDE0ICsrKysrKysrKy0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3
L25ldC9taWxreW1pc3QtbWluaW1hYzIuYyBiL2h3L25ldC9taWxreW1pc3QtbWluaW1hYzIuYwpp
bmRleCAzZWFhMTlkZmRlLi4zMjJmYjc3ZTQ2IDEwMDY0NAotLS0gYS9ody9uZXQvbWlsa3ltaXN0
LW1pbmltYWMyLmMKKysrIGIvaHcvbmV0L21pbGt5bWlzdC1taW5pbWFjMi5jCkBAIC0zMCw2ICsz
MCw3IEBACiAjaW5jbHVkZSAiaHcvc3lzYnVzLmgiCiAjaW5jbHVkZSAidHJhY2UuaCIKICNpbmNs
dWRlICJuZXQvbmV0LmgiCisjaW5jbHVkZSAicWVtdS9sb2cuaCIKICNpbmNsdWRlICJxZW11L2Vy
cm9yLXJlcG9ydC5oIgogCiAjaW5jbHVkZSA8emxpYi5oPgpAQCAtMjE0LDcgKzIxNSw4IEBAIHN0
YXRpYyBzaXplX3QgYXNzZW1ibGVfZnJhbWUodWludDhfdCAqYnVmLCBzaXplX3Qgc2l6ZSwKICAg
ICB1aW50MzJfdCBjcmM7CiAKICAgICBpZiAoc2l6ZSA8IHBheWxvYWRfc2l6ZSArIDEyKSB7Ci0g
ICAgICAgIGVycm9yX3JlcG9ydCgibWlsa3ltaXN0X21pbmltYWMyOiByZWNlaXZlZCB0b28gYmln
IGV0aGVybmV0IGZyYW1lIik7CisgICAgICAgIHFlbXVfbG9nX21hc2soTE9HX0dVRVNUX0VSUk9S
LCAibWlsa3ltaXN0X21pbmltYWMyOiBmcmFtZSB0b28gYmlnICIKKyAgICAgICAgICAgICAgICAg
ICAgICAiKCV6ZCBieXRlcylcbiIsIHBheWxvYWRfc2l6ZSk7CiAgICAgICAgIHJldHVybiAwOwog
ICAgIH0KIApAQCAtMzQ3LDggKzM0OSw5IEBAIG1pbmltYWMyX3JlYWQodm9pZCAqb3BhcXVlLCBo
d2FkZHIgYWRkciwgdW5zaWduZWQgc2l6ZSkKICAgICAgICAgYnJlYWs7CiAKICAgICBkZWZhdWx0
OgotICAgICAgICBlcnJvcl9yZXBvcnQoIm1pbGt5bWlzdF9taW5pbWFjMjogcmVhZCBhY2Nlc3Mg
dG8gdW5rbm93biByZWdpc3RlciAweCIKLSAgICAgICAgICAgICAgICBUQVJHRVRfRk1UX3BseCwg
YWRkciA8PCAyKTsKKyAgICAgICAgcWVtdV9sb2dfbWFzayhMT0dfR1VFU1RfRVJST1IsCisgICAg
ICAgICAgICAgICAgICAgICAgIm1pbGt5bWlzdF9taW5pbWFjMl9yZCVkOiAweCUiIEhXQUREUl9Q
Ukl4ICJcbiIsCisgICAgICAgICAgICAgICAgICAgICAgc2l6ZSwgYWRkciA8PCAyKTsKICAgICAg
ICAgYnJlYWs7CiAgICAgfQogCkBAIC00MTMsOCArNDE2LDkgQEAgbWluaW1hYzJfd3JpdGUodm9p
ZCAqb3BhcXVlLCBod2FkZHIgYWRkciwgdWludDY0X3QgdmFsdWUsCiAgICAgICAgIGJyZWFrOwog
CiAgICAgZGVmYXVsdDoKLSAgICAgICAgZXJyb3JfcmVwb3J0KCJtaWxreW1pc3RfbWluaW1hYzI6
IHdyaXRlIGFjY2VzcyB0byB1bmtub3duIHJlZ2lzdGVyIDB4IgotICAgICAgICAgICAgICAgIFRB
UkdFVF9GTVRfcGx4LCBhZGRyIDw8IDIpOworICAgICAgICBxZW11X2xvZ19tYXNrKExPR19HVUVT
VF9FUlJPUiwKKyAgICAgICAgICAgICAgICAgICAgICAibWlsa3ltaXN0X21pbmltYWMyX3dyJWQ6
IDB4JSIgSFdBRERSX1BSSXggIiA9IDB4JWx4XG4iLAorICAgICAgICAgICAgICAgICAgICAgIHNp
emUsIGFkZHIgPDwgMiwgdmFsdWUpOwogICAgICAgICBicmVhazsKICAgICB9CiB9Ci0tIAoyLjE3
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
