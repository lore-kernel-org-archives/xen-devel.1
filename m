From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL v2 20/20] milkymist-minimac2: Use
 qemu_log_mask(GUEST_ERROR) instead of error_report
Date: Tue, 30 Oct 2018 12:23:37 +0100
Message-ID: <20181030112337.17973-21-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=oc9f=nk=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gHS8N-0003si-Qc
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 11:24:31 +0000
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-trivial@nongnu.org, Michael Walle <michael@walle.cc>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KCnFlbXVfbG9n
X21hc2soR1VFU1RfRVJST1IpIGlzIG1vcmUgYXBwcm9wcmlhdGU6CgogICQgcWVtdSAtZCBoZWxw
CiAgTG9nIGl0ZW1zIChjb21tYSBzZXBhcmF0ZWQpOgogIGd1ZXN0X2Vycm9ycyAgICBsb2cgd2hl
biB0aGUgZ3Vlc3QgT1MgZG9lcyBzb21ldGhpbmcgaW52YWxpZCAoZWcgYWNjZXNzaW5nIGEgbm9u
LWV4aXN0ZW50IHJlZ2lzdGVyKQoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPGY0YnVnQGFtc2F0Lm9yZz4KQWNrZWQtYnk6IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2Fs
bGUuY2M+Ck1lc3NhZ2UtSWQ6IDwyMDE4MTAyOTEzMDAzNC4yNjc1MC0xLWY0YnVnQGFtc2F0Lm9y
Zz4KU2lnbmVkLW9mZi1ieTogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgotLS0K
IGh3L25ldC9taWxreW1pc3QtbWluaW1hYzIuYyB8IDE1ICsrKysrKysrKystLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
aHcvbmV0L21pbGt5bWlzdC1taW5pbWFjMi5jIGIvaHcvbmV0L21pbGt5bWlzdC1taW5pbWFjMi5j
CmluZGV4IDNlYWExOWRmZGUuLjY2NGFjMzRmMjUgMTAwNjQ0Ci0tLSBhL2h3L25ldC9taWxreW1p
c3QtbWluaW1hYzIuYworKysgYi9ody9uZXQvbWlsa3ltaXN0LW1pbmltYWMyLmMKQEAgLTMwLDYg
KzMwLDcgQEAKICNpbmNsdWRlICJody9zeXNidXMuaCIKICNpbmNsdWRlICJ0cmFjZS5oIgogI2lu
Y2x1ZGUgIm5ldC9uZXQuaCIKKyNpbmNsdWRlICJxZW11L2xvZy5oIgogI2luY2x1ZGUgInFlbXUv
ZXJyb3ItcmVwb3J0LmgiCiAKICNpbmNsdWRlIDx6bGliLmg+CkBAIC0yMTQsNyArMjE1LDggQEAg
c3RhdGljIHNpemVfdCBhc3NlbWJsZV9mcmFtZSh1aW50OF90ICpidWYsIHNpemVfdCBzaXplLAog
ICAgIHVpbnQzMl90IGNyYzsKIAogICAgIGlmIChzaXplIDwgcGF5bG9hZF9zaXplICsgMTIpIHsK
LSAgICAgICAgZXJyb3JfcmVwb3J0KCJtaWxreW1pc3RfbWluaW1hYzI6IHJlY2VpdmVkIHRvbyBi
aWcgZXRoZXJuZXQgZnJhbWUiKTsKKyAgICAgICAgcWVtdV9sb2dfbWFzayhMT0dfR1VFU1RfRVJS
T1IsICJtaWxreW1pc3RfbWluaW1hYzI6IGZyYW1lIHRvbyBiaWcgIgorICAgICAgICAgICAgICAg
ICAgICAgICIoJXpkIGJ5dGVzKVxuIiwgcGF5bG9hZF9zaXplKTsKICAgICAgICAgcmV0dXJuIDA7
CiAgICAgfQogCkBAIC0zNDcsOCArMzQ5LDkgQEAgbWluaW1hYzJfcmVhZCh2b2lkICpvcGFxdWUs
IGh3YWRkciBhZGRyLCB1bnNpZ25lZCBzaXplKQogICAgICAgICBicmVhazsKIAogICAgIGRlZmF1
bHQ6Ci0gICAgICAgIGVycm9yX3JlcG9ydCgibWlsa3ltaXN0X21pbmltYWMyOiByZWFkIGFjY2Vz
cyB0byB1bmtub3duIHJlZ2lzdGVyIDB4IgotICAgICAgICAgICAgICAgIFRBUkdFVF9GTVRfcGx4
LCBhZGRyIDw8IDIpOworICAgICAgICBxZW11X2xvZ19tYXNrKExPR19HVUVTVF9FUlJPUiwKKyAg
ICAgICAgICAgICAgICAgICAgICAibWlsa3ltaXN0X21pbmltYWMyX3JkJWQ6IDB4JSIgSFdBRERS
X1BSSXggIlxuIiwKKyAgICAgICAgICAgICAgICAgICAgICBzaXplLCBhZGRyIDw8IDIpOwogICAg
ICAgICBicmVhazsKICAgICB9CiAKQEAgLTQxMyw4ICs0MTYsMTAgQEAgbWluaW1hYzJfd3JpdGUo
dm9pZCAqb3BhcXVlLCBod2FkZHIgYWRkciwgdWludDY0X3QgdmFsdWUsCiAgICAgICAgIGJyZWFr
OwogCiAgICAgZGVmYXVsdDoKLSAgICAgICAgZXJyb3JfcmVwb3J0KCJtaWxreW1pc3RfbWluaW1h
YzI6IHdyaXRlIGFjY2VzcyB0byB1bmtub3duIHJlZ2lzdGVyIDB4IgotICAgICAgICAgICAgICAg
IFRBUkdFVF9GTVRfcGx4LCBhZGRyIDw8IDIpOworICAgICAgICBxZW11X2xvZ19tYXNrKExPR19H
VUVTVF9FUlJPUiwKKyAgICAgICAgICAgICAgICAgICAgICAibWlsa3ltaXN0X21pbmltYWMyX3dy
JWQ6IDB4JSIgSFdBRERSX1BSSXgKKyAgICAgICAgICAgICAgICAgICAgICAiID0gMHglIiBQUkl4
NjQgIlxuIiwKKyAgICAgICAgICAgICAgICAgICAgICBzaXplLCBhZGRyIDw8IDIsIHZhbHVlKTsK
ICAgICAgICAgYnJlYWs7CiAgICAgfQogfQotLSAKMi4xNy4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
