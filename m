From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL v2 09/20] qemu-iotests: make 218 executable
Date: Tue, 30 Oct 2018 12:23:26 +0100
Message-ID: <20181030112337.17973-10-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=oc9f=nk=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gHS81-0003LR-Ea
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 11:24:09 +0000
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

RnJvbTogQ2xlYmVyIFJvc2EgPGNyb3NhQHJlZGhhdC5jb20+CgpDb21taXQgOTkwZGMzOWMgbWFk
ZSBhbGwgdGVzdHMgZXhlY3V0YWJsZSBhdCB0aGUgdGltZSwgYnV0IDIxOCBjYW1lIGluCmxhdGVy
LCBhbmQgbWlzc2luZyB0aG9zZSBwZXJtaXNzaW9ucy4KClNpZ25lZC1vZmYtYnk6IENsZWJlciBS
b3NhIDxjcm9zYUByZWRoYXQuY29tPgpNZXNzYWdlLUlkOiA8MjAxODEwMDQxNjE4NTIuMTE2NzMt
NC1jcm9zYUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFZpdmllciA8bGF1cmVu
dEB2aXZpZXIuZXU+Ci0tLQogdGVzdHMvcWVtdS1pb3Rlc3RzLzIxOCB8IDAKIDEgZmlsZSBjaGFu
Z2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCiBtb2RlIGNoYW5nZSAxMDA2NDQg
PT4gMTAwNzU1IHRlc3RzL3FlbXUtaW90ZXN0cy8yMTgKCmRpZmYgLS1naXQgYS90ZXN0cy9xZW11
LWlvdGVzdHMvMjE4IGIvdGVzdHMvcWVtdS1pb3Rlc3RzLzIxOApvbGQgbW9kZSAxMDA2NDQKbmV3
IG1vZGUgMTAwNzU1Ci0tIAoyLjE3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
