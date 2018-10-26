From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 05/20] qemu-iotests: fix filename containing
 checks
Date: Fri, 26 Oct 2018 17:31:10 +0200
Message-ID: <20181026153125.24738-6-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vnpb=ng=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gG45c-0000tz-Lb
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 15:31:56 +0000
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

RnJvbTogQ2xlYmVyIFJvc2EgPGNyb3NhQHJlZGhhdC5jb20+CgpDb21taXQgY2NlMjkzYTI5NDUg
bW92ZWQgc29tZSBmdW5jdGlvbnMgZnJvbSBjb21tb24uY29uZmlnIHRvCmNvbW1vbi5yYywgYnV0
IHRoZSBlcnJvciBtZXNzYWdlcyBzdGlsbCByZWZlcmVuY2UgdGhlIG9sZCBmaWxlCmxvY2F0aW9u
LgoKU2lnbmVkLW9mZi1ieTogQ2xlYmVyIFJvc2EgPGNyb3NhQHJlZGhhdC5jb20+ClJldmlld2Vk
LWJ5OiBNYXggUmVpdHogPG1yZWl0ekByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgpNZXNzYWdlLUlkOiA8MjAxODEwMDQx
NjE4NTIuMTE2NzMtNS1jcm9zYUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFZp
dmllciA8bGF1cmVudEB2aXZpZXIuZXU+Ci0tLQogdGVzdHMvcWVtdS1pb3Rlc3RzL2NvbW1vbi5y
YyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90ZXN0cy9xZW11LWlvdGVzdHMvY29tbW9uLnJjIGIvdGVzdHMvcWVt
dS1pb3Rlc3RzL2NvbW1vbi5yYwppbmRleCA0NGJlZTE2YTVlLi43MGNhNjViNDliIDEwMDY0NAot
LS0gYS90ZXN0cy9xZW11LWlvdGVzdHMvY29tbW9uLnJjCisrKyBiL3Rlc3RzL3FlbXUtaW90ZXN0
cy9jb21tb24ucmMKQEAgLTE3MCw3ICsxNzAsNyBAQCBpZiBbICEgLWUgIiRURVNUX0RJUiIgXTsg
dGhlbgogZmkKIAogaWYgWyAhIC1kICIkVEVTVF9ESVIiIF07IHRoZW4KLSAgICBlY2hvICJjb21t
b24uY29uZmlnOiBFcnJvcjogXCRURVNUX0RJUiAoJFRFU1RfRElSKSBpcyBub3QgYSBkaXJlY3Rv
cnkiCisgICAgZWNobyAiY29tbW9uLnJjOiBFcnJvcjogXCRURVNUX0RJUiAoJFRFU1RfRElSKSBp
cyBub3QgYSBkaXJlY3RvcnkiCiAgICAgZXhpdCAxCiBmaQogCkBAIC0xNzksNyArMTc5LDcgQEAg
aWYgWyAteiAiJFJFTU9URV9URVNUX0RJUiIgXTsgdGhlbgogZmkKIAogaWYgWyAhIC1kICIkU0FN
UExFX0lNR19ESVIiIF07IHRoZW4KLSAgICBlY2hvICJjb21tb24uY29uZmlnOiBFcnJvcjogXCRT
QU1QTEVfSU1HX0RJUiAoJFNBTVBMRV9JTUdfRElSKSBpcyBub3QgYSBkaXJlY3RvcnkiCisgICAg
ZWNobyAiY29tbW9uLnJjOiBFcnJvcjogXCRTQU1QTEVfSU1HX0RJUiAoJFNBTVBMRV9JTUdfRElS
KSBpcyBub3QgYSBkaXJlY3RvcnkiCiAgICAgZXhpdCAxCiBmaQogCi0tIAoyLjE3LjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
