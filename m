From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL v2 07/20] scripts/decodetree.py: remove unused
 imports
Date: Tue, 30 Oct 2018 12:23:24 +0100
Message-ID: <20181030112337.17973-8-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=oc9f=nk=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gHS7x-0003H2-KG
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 11:24:05 +0000
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

RnJvbTogQ2xlYmVyIFJvc2EgPGNyb3NhQHJlZGhhdC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBDbGVi
ZXIgUm9zYSA8Y3Jvc2FAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KTWVzc2FnZS1JZDogPDIwMTgxMDA0MTYxODUyLjEx
NjczLTgtY3Jvc2FAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogTGF1cmVudCBWaXZpZXIgPGxh
dXJlbnRAdml2aWVyLmV1PgotLS0KIHNjcmlwdHMvZGVjb2RldHJlZS5weSB8IDIgLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvZGVjb2RldHJl
ZS5weSBiL3NjcmlwdHMvZGVjb2RldHJlZS5weQppbmRleCAyNzdmOWE5YmJhLi40NTdjZmZlYTkw
IDEwMDc1NQotLS0gYS9zY3JpcHRzL2RlY29kZXRyZWUucHkKKysrIGIvc2NyaXB0cy9kZWNvZGV0
cmVlLnB5CkBAIC0xNDksMTIgKzE0OSwxMCBAQAogIyAgIHRyYW5zX2FkZGxfaShjdHgsICZhcmdf
b3BpLCBpbnNuKQogIwogCi1pbXBvcnQgaW8KIGltcG9ydCBvcwogaW1wb3J0IHJlCiBpbXBvcnQg
c3lzCiBpbXBvcnQgZ2V0b3B0Ci1pbXBvcnQgcGRiCiAKIGluc253aWR0aCA9IDMyCiBpbnNubWFz
ayA9IDB4ZmZmZmZmZmYKLS0gCjIuMTcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
