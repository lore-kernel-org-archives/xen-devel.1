From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL v2 14/20] qobject: Catch another straggler for
 use of qdict_put_str()
Date: Tue, 30 Oct 2018 12:23:31 +0100
Message-ID: <20181030112337.17973-15-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=oc9f=nk=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gHS8A-0003Yw-Vp
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 11:24:19 +0000
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
Y3JpcHRzL2NvY2NpbmVsbGUvcW9iamVjdC5jb2NjaSBcCiAgICAgICAgICAgIC0tbWFjcm8tZmls
ZSBzY3JpcHRzL2NvY2NpLW1hY3JvLWZpbGUuaCBcCiAgICAgICAgICAgIC0tZGlyIC4gLS1pbi1w
bGFjZQoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0
Lm9yZz4KUmV2aWV3ZWQtYnk6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4K
QWNrZWQtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Ck1lc3NhZ2UtSWQ6
IDwyMDE4MDcwNTE1NTgxMS4yMDM2Ni0yLWY0YnVnQGFtc2F0Lm9yZz4KU2lnbmVkLW9mZi1ieTog
TGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgotLS0KIHFvYmplY3QvYmxvY2stcWRp
Y3QuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3FvYmplY3QvYmxvY2stcWRpY3QuYyBiL3FvYmplY3QvYmxvY2stcWRp
Y3QuYwppbmRleCA0MjA1NGNjMjc0Li4xNDg3Y2M1ZGQ4IDEwMDY0NAotLS0gYS9xb2JqZWN0L2Js
b2NrLXFkaWN0LmMKKysrIGIvcW9iamVjdC9ibG9jay1xZGljdC5jCkBAIC01NzcsNyArNTc3LDcg
QEAgc3RhdGljIFFPYmplY3QgKnFkaWN0X2NydW1wbGVfZm9yX2tleXZhbF9xaXYoUURpY3QgKnNy
YywgRXJyb3IgKiplcnJwKQogICAgICAgICBpZiAoIXRtcCkgewogICAgICAgICAgICAgdG1wID0g
cWRpY3RfY2xvbmVfc2hhbGxvdyhzcmMpOwogICAgICAgICB9Ci0gICAgICAgIHFkaWN0X3B1dCh0
bXAsIGVudC0+a2V5LCBxc3RyaW5nX2Zyb21fc3RyKHMpKTsKKyAgICAgICAgcWRpY3RfcHV0X3N0
cih0bXAsIGVudC0+a2V5LCBzKTsKICAgICAgICAgZ19mcmVlKGJ1Zik7CiAgICAgfQogCi0tIAoy
LjE3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
