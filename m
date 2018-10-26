From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 10/20] linux-user: fix comment
 s/atomic_write/atomic_set/
Date: Fri, 26 Oct 2018 17:31:15 +0200
Message-ID: <20181026153125.24738-11-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vnpb=ng=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gG45k-0000yw-Gn
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 15:32:04 +0000
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>, "Emilio G. Cota" <cota@braap.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogIkVtaWxpbyBHLiBDb3RhIiA8Y290YUBicmFhcC5vcmc+CgpTaWduZWQtb2ZmLWJ5OiBF
bWlsaW8gRy4gQ290YSA8Y290YUBicmFhcC5vcmc+Ck1lc3NhZ2UtSWQ6IDwyMDE4MDgxMTIxMTAx
MS42Mjc3LTEtY290YUBicmFhcC5vcmc+ClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgVml2aWVyIDxs
YXVyZW50QHZpdmllci5ldT4KLS0tCiBsaW51eC11c2VyL3FlbXUuaCB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpbnV4
LXVzZXIvcWVtdS5oIGIvbGludXgtdXNlci9xZW11LmgKaW5kZXggMWJlYjZhMmNmYy4uZGRlM2Yy
NmY1YSAxMDA2NDQKLS0tIGEvbGludXgtdXNlci9xZW11LmgKKysrIGIvbGludXgtdXNlci9xZW11
LmgKQEAgLTE0Myw3ICsxNDMsNyBAQCB0eXBlZGVmIHN0cnVjdCBUYXNrU3RhdGUgewogICAgIC8q
IE5vbnplcm8gaWYgcHJvY2Vzc19wZW5kaW5nX3NpZ25hbHMoKSBuZWVkcyB0byBkbyBzb21ldGhp
bmcgKGVpdGhlcgogICAgICAqIGhhbmRsZSBhIHBlbmRpbmcgc2lnbmFsIG9yIHVuYmxvY2sgc2ln
bmFscykuCiAgICAgICogVGhpcyBmbGFnIGlzIHdyaXR0ZW4gZnJvbSBhIHNpZ25hbCBoYW5kbGVy
IHNvIHNob3VsZCBiZSBhY2Nlc3NlZCB2aWEKLSAgICAgKiB0aGUgYXRvbWljX3JlYWQoKSBhbmQg
YXRvbWljX3dyaXRlKCkgZnVuY3Rpb25zLiAoSXQgaXMgbm90IGFjY2Vzc2VkCisgICAgICogdGhl
IGF0b21pY19yZWFkKCkgYW5kIGF0b21pY19zZXQoKSBmdW5jdGlvbnMuIChJdCBpcyBub3QgYWNj
ZXNzZWQKICAgICAgKiBmcm9tIG11bHRpcGxlIHRocmVhZHMuKQogICAgICAqLwogICAgIGludCBz
aWduYWxfcGVuZGluZzsKLS0gCjIuMTcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
