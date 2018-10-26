From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 16/20] tests/bios-tables-test: Remove an useless
 cast
Date: Fri, 26 Oct 2018 17:31:21 +0200
Message-ID: <20181026153125.24738-17-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vnpb=ng=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gG468-0001Su-SK
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 15:32:28 +0000
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClBhdGNoIGNy
ZWF0ZWQgbWVjaGFuaWNhbGx5IGJ5IHJlcnVubmluZzoKCiAgJCAgc3BhdGNoIC0tc3AtZmlsZSBz
Y3JpcHRzL2NvY2NpbmVsbGUvdHlwZWNhc3QuY29jY2kgXAogICAgICAgICAgICAtLW1hY3JvLWZp
bGUgc2NyaXB0cy9jb2NjaS1tYWNyby1maWxlLmggXAogICAgICAgICAgICAtLWRpciAuIC0taW4t
cGxhY2UKClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNh
dC5vcmc+ClJldmlld2VkLWJ5OiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+
CkFja2VkLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgpNZXNzYWdlLUlk
OiA8MjAxODA3MDUxNTU4MTEuMjAzNjYtNS1mNGJ1Z0BhbXNhdC5vcmc+ClNpZ25lZC1vZmYtYnk6
IExhdXJlbnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5ldT4KLS0tCiB0ZXN0cy9iaW9zLXRhYmxl
cy10ZXN0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9iaW9zLXRhYmxlcy10ZXN0LmMgYi90ZXN0cy9iaW9z
LXRhYmxlcy10ZXN0LmMKaW5kZXggYWY0YjFmYjZiZC4uMDJlNzdlYzgxMSAxMDA2NDQKLS0tIGEv
dGVzdHMvYmlvcy10YWJsZXMtdGVzdC5jCisrKyBiL3Rlc3RzL2Jpb3MtdGFibGVzLXRlc3QuYwpA
QCAtMzE5LDcgKzMxOSw3IEBAIHN0YXRpYyBib29sIGxvYWRfYXNsKEdBcnJheSAqc2R0cywgQWNw
aVNkdFRhYmxlICpzZHQpCiAgICAgcmV0ID0gZ19zcGF3bl9jb21tYW5kX2xpbmVfc3luYyhjb21t
YW5kX2xpbmUtPnN0ciwgJm91dCwgJm91dF9lcnIsIE5VTEwsICZlcnJvcik7CiAgICAgZ19hc3Nl
cnRfbm9fZXJyb3IoZXJyb3IpOwogICAgIGlmIChyZXQpIHsKLSAgICAgICAgcmV0ID0gZ19maWxl
X2dldF9jb250ZW50cyhzZHQtPmFzbF9maWxlLCAoZ2NoYXIgKiopJnNkdC0+YXNsLAorICAgICAg
ICByZXQgPSBnX2ZpbGVfZ2V0X2NvbnRlbnRzKHNkdC0+YXNsX2ZpbGUsICZzZHQtPmFzbCwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc2R0LT5hc2xfbGVuLCAmZXJyb3IpOwog
ICAgICAgICBnX2Fzc2VydChyZXQpOwogICAgICAgICBnX2Fzc2VydF9ub19lcnJvcihlcnJvcik7
Ci0tIAoyLjE3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
