From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 08/20] scripts/qemu.py: remove trailing quotes on
 docstring
Date: Fri, 26 Oct 2018 17:31:13 +0200
Message-ID: <20181026153125.24738-9-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vnpb=ng=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gG45i-0000xl-Ux
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 15:32:02 +0000
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

RnJvbTogQ2xlYmVyIFJvc2EgPGNyb3NhQHJlZGhhdC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBDbGVi
ZXIgUm9zYSA8Y3Jvc2FAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KTWVzc2FnZS1JZDogPDIwMTgxMDA0MTYxODUyLjEx
NjczLTExLWNyb3NhQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgVml2aWVyIDxs
YXVyZW50QHZpdmllci5ldT4KLS0tCiBzY3JpcHRzL3FlbXUucHkgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRz
L3FlbXUucHkgYi9zY3JpcHRzL3FlbXUucHkKaW5kZXggZjA5OWNlNzI3OC4uYjBiMmYxMmNlNiAx
MDA2NDQKLS0tIGEvc2NyaXB0cy9xZW11LnB5CisrKyBiL3NjcmlwdHMvcWVtdS5weQpAQCAtODcs
NyArODcsNyBAQCBjbGFzcyBRRU1VTWFjaGluZShvYmplY3QpOgogICAgICAgICBAcGFyYW0gbmFt
ZTogcHJlZml4IGZvciBzb2NrZXQgYW5kIGxvZyBmaWxlIG5hbWVzIChkZWZhdWx0OiBxZW11LVBJ
RCkKICAgICAgICAgQHBhcmFtIHRlc3RfZGlyOiB3aGVyZSB0byBjcmVhdGUgc29ja2V0IGFuZCBs
b2cgZmlsZQogICAgICAgICBAcGFyYW0gbW9uaXRvcl9hZGRyZXNzOiBhZGRyZXNzIGZvciBRTVAg
bW9uaXRvcgotICAgICAgICBAcGFyYW0gc29ja2V0X3NjbV9oZWxwZXI6IGhlbHBlciBwcm9ncmFt
LCByZXF1aXJlZCBmb3Igc2VuZF9mZF9zY20oKSIKKyAgICAgICAgQHBhcmFtIHNvY2tldF9zY21f
aGVscGVyOiBoZWxwZXIgcHJvZ3JhbSwgcmVxdWlyZWQgZm9yIHNlbmRfZmRfc2NtKCkKICAgICAg
ICAgQG5vdGU6IFFlbXUgcHJvY2VzcyBpcyBub3Qgc3RhcnRlZCB1bnRpbCBsYXVuY2goKSBpcyB1
c2VkLgogICAgICAgICAnJycKICAgICAgICAgaWYgYXJncyBpcyBOb25lOgotLSAKMi4xNy4yCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
