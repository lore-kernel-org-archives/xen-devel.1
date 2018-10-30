From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL v2 19/20] ppc: move at24c to its own CONFIG_
 symbol
Date: Tue, 30 Oct 2018 12:23:36 +0100
Message-ID: <20181030112337.17973-20-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=oc9f=nk=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gHS8L-0003pF-G5
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 11:24:29 +0000
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

RnJvbTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KCkFUMjRjIEVFUFJPTSBp
cyBjdXJyZW50bHkgZ2F0ZWQgYnkgQ09ORklHX0kyQywgYW5kIGFzIHN1Y2ggaXQgaXMKYmVpbmcg
aW5jbHVkZWQgaW4gYWxsIGVtdWxhdG9ycyB0aGF0IHVzZSBJMkMsIGV2ZW4gaWYgdGhleSBkbyBu
b3QKcmVhbGx5IG5lZWQgaXQuICBTZXBhcmF0ZSBpdCBhbmQsIHNpbmNlIGl0IHdhcyBhZGRlZCBm
b3IgdGhlIGU1MDAKbWFjaGluZXMsIGFkZCBpdCB0byBxZW11LXN5c3RlbS1wcGMgYW5kIHFlbXUt
c3lzdGVtLXBwYzY0LgoKU2lnbmVkLW9mZi1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVk
aGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNh
dC5vcmc+ClJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4KTWVzc2Fn
ZS1JZDogPDIwMTgwNTIyMTkxNzQzLjEyODcyLTEtcGJvbnppbmlAcmVkaGF0LmNvbT4KW2x2OiBy
ZWJhc2VdClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5ldT4K
LS0tCiBkZWZhdWx0LWNvbmZpZ3MvcHBjLXNvZnRtbXUubWFrIHwgMSArCiBody9udnJhbS9NYWtl
ZmlsZS5vYmpzICAgICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kZWZhdWx0LWNvbmZpZ3MvcHBjLXNvZnRt
bXUubWFrIGIvZGVmYXVsdC1jb25maWdzL3BwYy1zb2Z0bW11Lm1hawppbmRleCAzMTgxYmJmMTYz
Li4yM2Q4NzFmYjNlIDEwMDY0NAotLS0gYS9kZWZhdWx0LWNvbmZpZ3MvcHBjLXNvZnRtbXUubWFr
CisrKyBiL2RlZmF1bHQtY29uZmlncy9wcGMtc29mdG1tdS5tYWsKQEAgLTI4LDYgKzI4LDcgQEAg
Q09ORklHX1NNNTAxPXkKIENPTkZJR19EREM9eQogQ09ORklHX0lERV9TSUkzMTEyPXkKIENPTkZJ
R19JMkM9eQorQ09ORklHX0FUMjRDPXkKIENPTkZJR19CSVRCQU5HX0kyQz15CiBDT05GSUdfTTQx
VDgwPXkKIENPTkZJR19WR0FfQ0lSUlVTPXkKZGlmZiAtLWdpdCBhL2h3L252cmFtL01ha2VmaWxl
Lm9ianMgYi9ody9udnJhbS9NYWtlZmlsZS5vYmpzCmluZGV4IGE5MTJkMjUzOTEuLmIzMThlNTNh
NDMgMTAwNjQ0Ci0tLSBhL2h3L252cmFtL01ha2VmaWxlLm9ianMKKysrIGIvaHcvbnZyYW0vTWFr
ZWZpbGUub2JqcwpAQCAtMSw2ICsxLDYgQEAKIGNvbW1vbi1vYmotJChDT05GSUdfRFMxMjI1WSkg
Kz0gZHMxMjI1eS5vCiBjb21tb24tb2JqLXkgKz0gZWVwcm9tOTN4eC5vCi1jb21tb24tb2JqLSQo
Q09ORklHX0kyQykgKz0gZWVwcm9tX2F0MjRjLm8KK2NvbW1vbi1vYmotJChDT05GSUdfQVQyNEMp
ICs9IGVlcHJvbV9hdDI0Yy5vCiBjb21tb24tb2JqLXkgKz0gZndfY2ZnLm8KIGNvbW1vbi1vYmot
eSArPSBjaHJwX252cmFtLm8KIGNvbW1vbi1vYmotJChDT05GSUdfTUFDX05WUkFNKSArPSBtYWNf
bnZyYW0ubwotLSAKMi4xNy4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
