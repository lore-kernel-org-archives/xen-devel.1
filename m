From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL v2 17/20] hw/pci-host: Remove useless parenthesis
 around DIV_ROUND_UP macro
Date: Tue, 30 Oct 2018 12:23:34 +0100
Message-ID: <20181030112337.17973-18-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=oc9f=nk=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gHS8H-0003kF-Qx
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 11:24:25 +0000
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClBhdGNoIGNy
ZWF0ZWQgbWVjaGFuaWNhbGx5IGJ5IHJlcnVubmluZzoKCiAgJCAgc3BhdGNoIC0tc3AtZmlsZSBz
Y3JpcHRzL2NvY2NpbmVsbGUvcm91bmQuY29jY2kgXAogICAgICAgICAgICAtLW1hY3JvLWZpbGUg
c2NyaXB0cy9jb2NjaS1tYWNyby1maWxlLmggXAogICAgICAgICAgICAtLWRpciAuIC0taW4tcGxh
Y2UKClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5v
cmc+ClJldmlld2VkLWJ5OiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+CkFj
a2VkLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgpNZXNzYWdlLUlkOiA8
MjAxODA3MDUxNTU4MTEuMjAzNjYtNy1mNGJ1Z0BhbXNhdC5vcmc+ClNpZ25lZC1vZmYtYnk6IExh
dXJlbnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5ldT4KLS0tCiBody9wY2ktaG9zdC9waWl4LmMg
fCAyICstCiBody9wY2ktaG9zdC9xMzUuYyAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9wY2ktaG9zdC9waWl4
LmMgYi9ody9wY2ktaG9zdC9waWl4LmMKaW5kZXggZGE3Mzc0M2ZhMi4uNDcyOTNhMzkxNSAxMDA2
NDQKLS0tIGEvaHcvcGNpLWhvc3QvcGlpeC5jCisrKyBiL2h3L3BjaS1ob3N0L3BpaXguYwpAQCAt
MTQ0LDcgKzE0NCw3IEBAIHN0YXRpYyB2b2lkIGk0NDBmeF91cGRhdGVfbWVtb3J5X21hcHBpbmdz
KFBDSUk0NDBGWFN0YXRlICpkKQogICAgIG1lbW9yeV9yZWdpb25fdHJhbnNhY3Rpb25fYmVnaW4o
KTsKICAgICBmb3IgKGkgPSAwOyBpIDwgMTM7IGkrKykgewogICAgICAgICBwYW1fdXBkYXRlKCZk
LT5wYW1fcmVnaW9uc1tpXSwgaSwKLSAgICAgICAgICAgICAgICAgICBwZC0+Y29uZmlnW0k0NDBG
WF9QQU0gKyAoRElWX1JPVU5EX1VQKGksIDIpKV0pOworICAgICAgICAgICAgICAgICAgIHBkLT5j
b25maWdbSTQ0MEZYX1BBTSArIERJVl9ST1VORF9VUChpLCAyKV0pOwogICAgIH0KICAgICBtZW1v
cnlfcmVnaW9uX3NldF9lbmFibGVkKCZkLT5zbXJhbV9yZWdpb24sCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAhKHBkLT5jb25maWdbSTQ0MEZYX1NNUkFNXSAmIFNNUkFNX0RfT1BFTikp
OwpkaWZmIC0tZ2l0IGEvaHcvcGNpLWhvc3QvcTM1LmMgYi9ody9wY2ktaG9zdC9xMzUuYwppbmRl
eCA4Y2UxZTA5OTMyLi45NjZhN2NmOTJkIDEwMDY0NAotLS0gYS9ody9wY2ktaG9zdC9xMzUuYwor
KysgYi9ody9wY2ktaG9zdC9xMzUuYwpAQCAtMzU2LDcgKzM1Niw3IEBAIHN0YXRpYyB2b2lkIG1j
aF91cGRhdGVfcGFtKE1DSFBDSVN0YXRlICptY2gpCiAgICAgbWVtb3J5X3JlZ2lvbl90cmFuc2Fj
dGlvbl9iZWdpbigpOwogICAgIGZvciAoaSA9IDA7IGkgPCAxMzsgaSsrKSB7CiAgICAgICAgIHBh
bV91cGRhdGUoJm1jaC0+cGFtX3JlZ2lvbnNbaV0sIGksCi0gICAgICAgICAgICAgICAgICAgcGQt
PmNvbmZpZ1tNQ0hfSE9TVF9CUklER0VfUEFNMCArIChESVZfUk9VTkRfVVAoaSwgMikpXSk7Cisg
ICAgICAgICAgICAgICAgICAgcGQtPmNvbmZpZ1tNQ0hfSE9TVF9CUklER0VfUEFNMCArIERJVl9S
T1VORF9VUChpLCAyKV0pOwogICAgIH0KICAgICBtZW1vcnlfcmVnaW9uX3RyYW5zYWN0aW9uX2Nv
bW1pdCgpOwogfQotLSAKMi4xNy4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
