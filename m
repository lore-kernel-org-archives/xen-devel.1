From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL v2 18/20] hw/intc/gicv3: Remove useless
 parenthesis around DIV_ROUND_UP macro
Date: Tue, 30 Oct 2018 12:23:35 +0100
Message-ID: <20181030112337.17973-19-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=oc9f=nk=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gHS8M-0003qh-Ma
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 11:24:30 +0000
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
cmc+CkFja2VkLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgpNZXNzYWdl
LUlkOiA8MjAxODA3MDUxNTU4MTEuMjAzNjYtOC1mNGJ1Z0BhbXNhdC5vcmc+ClNpZ25lZC1vZmYt
Ynk6IExhdXJlbnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5ldT4KLS0tCiBpbmNsdWRlL2h3L2lu
dGMvYXJtX2dpY3YzX2NvbW1vbi5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9pbnRjL2FybV9naWN2
M19jb21tb24uaCBiL2luY2x1ZGUvaHcvaW50Yy9hcm1fZ2ljdjNfY29tbW9uLmgKaW5kZXggYjc5
ODQ4NmVjZi4uMzFlYzlhMWFlNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody9pbnRjL2FybV9naWN2
M19jb21tb24uaAorKysgYi9pbmNsdWRlL2h3L2ludGMvYXJtX2dpY3YzX2NvbW1vbi5oCkBAIC02
Miw3ICs2Miw3IEBACiAgKiBhdm9pZHMgYnVncyB3aGVyZSB3ZSBmb3JnZXQgdG8gc3VidHJhY3Qg
R0lDX0lOVEVSTkFMIGZyb20gYW4KICAqIGludGVycnVwdCBudW1iZXIuCiAgKi8KLSNkZWZpbmUg
R0lDVjNfQk1QX1NJWkUgKERJVl9ST1VORF9VUChHSUNWM19NQVhJUlEsIDMyKSkKKyNkZWZpbmUg
R0lDVjNfQk1QX1NJWkUgRElWX1JPVU5EX1VQKEdJQ1YzX01BWElSUSwgMzIpCiAKICNkZWZpbmUg
R0lDX0RFQ0xBUkVfQklUTUFQKG5hbWUpIFwKICAgICB1aW50MzJfdCBuYW1lW0dJQ1YzX0JNUF9T
SVpFXQotLSAKMi4xNy4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
