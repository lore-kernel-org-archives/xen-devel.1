From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 03/20] memory.h: fix typos in comments
Date: Fri, 26 Oct 2018 17:31:08 +0200
Message-ID: <20181026153125.24738-4-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vnpb=ng=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gG45c-0000u0-Lr
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-trivial@nongnu.org, Li Qiang <liq3ea@gmail.com>, Markus Armbruster <armbru@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>Laur
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTGkgUWlhbmcgPGxpcTNlYUBnbWFpbC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMaSBRaWFu
ZyA8bGlxM2VhQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IFBldGVyIE1heWRlbGwgPHBldGVyLm1h
eWRlbGxAbGluYXJvLm9yZz4KTWVzc2FnZS1JZDogPDE1MzkwODA0NjctMjk3Ni0xLWdpdC1zZW5k
LWVtYWlsLWxpcTNlYUBnbWFpbC5jb20+Cltsdjogcy90eXBlcy90eXBvcy9dClNpZ25lZC1vZmYt
Ynk6IExhdXJlbnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5ldT4KLS0tCiBpbmNsdWRlL2V4ZWMv
bWVtb3J5LmggfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2V4ZWMvbWVtb3J5LmggYi9pbmNsdWRl
L2V4ZWMvbWVtb3J5LmgKaW5kZXggNjY3NDY2YjhmMy4uZDBjN2YwZDllOSAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9leGVjL21lbW9yeS5oCisrKyBiL2luY2x1ZGUvZXhlYy9tZW1vcnkuaApAQCAtOTM1
LDcgKzkzNSw3IEBAIHVpbnQ2NF90IG1lbW9yeV9yZWdpb25fc2l6ZShNZW1vcnlSZWdpb24gKm1y
KTsKIC8qKgogICogbWVtb3J5X3JlZ2lvbl9pc19yYW06IGNoZWNrIHdoZXRoZXIgYSBtZW1vcnkg
cmVnaW9uIGlzIHJhbmRvbSBhY2Nlc3MKICAqCi0gKiBSZXR1cm5zICV0cnVlIGlzIGEgbWVtb3J5
IHJlZ2lvbiBpcyByYW5kb20gYWNjZXNzLgorICogUmV0dXJucyAldHJ1ZSBpZiBhIG1lbW9yeSBy
ZWdpb24gaXMgcmFuZG9tIGFjY2Vzcy4KICAqCiAgKiBAbXI6IHRoZSBtZW1vcnkgcmVnaW9uIGJl
aW5nIHF1ZXJpZWQKICAqLwpAQCAtOTQ3LDcgKzk0Nyw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBt
ZW1vcnlfcmVnaW9uX2lzX3JhbShNZW1vcnlSZWdpb24gKm1yKQogLyoqCiAgKiBtZW1vcnlfcmVn
aW9uX2lzX3JhbV9kZXZpY2U6IGNoZWNrIHdoZXRoZXIgYSBtZW1vcnkgcmVnaW9uIGlzIGEgcmFt
IGRldmljZQogICoKLSAqIFJldHVybnMgJXRydWUgaXMgYSBtZW1vcnkgcmVnaW9uIGlzIGEgZGV2
aWNlIGJhY2tlZCByYW0gcmVnaW9uCisgKiBSZXR1cm5zICV0cnVlIGlmIGEgbWVtb3J5IHJlZ2lv
biBpcyBhIGRldmljZSBiYWNrZWQgcmFtIHJlZ2lvbgogICoKICAqIEBtcjogdGhlIG1lbW9yeSBy
ZWdpb24gYmVpbmcgcXVlcmllZAogICovCkBAIC0xMTYxLDcgKzExNjEsNyBAQCB1aW50OF90IG1l
bW9yeV9yZWdpb25fZ2V0X2RpcnR5X2xvZ19tYXNrKE1lbW9yeVJlZ2lvbiAqbXIpOwogLyoqCiAg
KiBtZW1vcnlfcmVnaW9uX2lzX3JvbTogY2hlY2sgd2hldGhlciBhIG1lbW9yeSByZWdpb24gaXMg
Uk9NCiAgKgotICogUmV0dXJucyAldHJ1ZSBpcyBhIG1lbW9yeSByZWdpb24gaXMgcmVhZC1vbmx5
IG1lbW9yeS4KKyAqIFJldHVybnMgJXRydWUgaWYgYSBtZW1vcnkgcmVnaW9uIGlzIHJlYWQtb25s
eSBtZW1vcnkuCiAgKgogICogQG1yOiB0aGUgbWVtb3J5IHJlZ2lvbiBiZWluZyBxdWVyaWVkCiAg
Ki8KLS0gCjIuMTcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
