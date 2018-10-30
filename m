From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL v2 13/20] configure: Support pkg-config for zlib
Date: Tue, 30 Oct 2018 12:23:30 +0100
Message-ID: <20181030112337.17973-14-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=oc9f=nk=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gHS8A-0003Yz-WD
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-trivial@nongnu.org, Michael Walle <michael@walle.cc>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>, Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>Laure
List-Id: xen-devel@lists.xenproject.org

RnJvbTogU3RlZmFuIFdlaWwgPHN3QHdlaWxuZXR6LmRlPgoKVGhpcyBpcyBuZWVkZWQgZm9yIGJ1
aWxkcyB3aXRoIHRoZSBtaW5ndzY0LSogcGFja2FnZXMgZnJvbSBDeWd3aW4sCmJ1dCBhbHNvIHdv
cmtzIGZvciBMaW51eC4KCk1vdmUgdGhlIHpsaWIgdGVzdCBhbHNvIG1vcmUgdG8gdGhlIGVuZCBi
ZWNhdXNlIHVzZXJzIHNob3VsZApnZXQgaW5mb3JtYXRpb24gb24gdGhlIHJlYWxseSBpbXBvcnRh
bnQgbWlzc2luZyBwYWNrYWdlcwood2hpY2ggYWxzbyByZXF1aXJlIHpsaWIpIGZpcnN0LgoKU2ln
bmVkLW9mZi1ieTogU3RlZmFuIFdlaWwgPHN3QHdlaWxuZXR6LmRlPgpSZXZpZXdlZC1ieTogU3Rl
ZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpNZXNzYWdlLUlkOiA8MjAxODA3MTIx
OTI2MDMuMTE1OTktMS1zd0B3ZWlsbmV0ei5kZT4KU2lnbmVkLW9mZi1ieTogTGF1cmVudCBWaXZp
ZXIgPGxhdXJlbnRAdml2aWVyLmV1PgotLS0KIGNvbmZpZ3VyZSB8IDQwICsrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25z
KCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUK
aW5kZXggMWVlMDliZDExMi4uYTAyZGYzMGRkZSAxMDA3NTUKLS0tIGEvY29uZmlndXJlCisrKyBi
L2NvbmZpZ3VyZQpAQCAtMjE1MSwyMyArMjE1MSw2IEBAIEVPRgogICBmaQogZmkKIAotIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKLSMgemxpYiBjaGVjawotCi1pZiB0
ZXN0ICIkemxpYiIgIT0gIm5vIiA7IHRoZW4KLSAgICBjYXQgPiAkVE1QQyA8PCBFT0YKLSNpbmNs
dWRlIDx6bGliLmg+Ci1pbnQgbWFpbih2b2lkKSB7IHpsaWJWZXJzaW9uKCk7IHJldHVybiAwOyB9
Ci1FT0YKLSAgICBpZiBjb21waWxlX3Byb2cgIiIgIi1seiIgOyB0aGVuCi0gICAgICAgIDoKLSAg
ICBlbHNlCi0gICAgICAgIGVycm9yX2V4aXQgInpsaWIgY2hlY2sgZmFpbGVkIiBcCi0gICAgICAg
ICAgICAiTWFrZSBzdXJlIHRvIGhhdmUgdGhlIHpsaWIgbGlicyBhbmQgaGVhZGVycyBpbnN0YWxs
ZWQuIgotICAgIGZpCi1maQotTElCUz0iJExJQlMgLWx6IgotCiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKICMgbHpvIGNoZWNrCiAKQEAgLTM0NzksNiArMzQ2Miwy
OSBAQCBpZiAhIGNvbXBpbGVfcHJvZyAiJGdsaWJfY2ZsYWdzIC1XZXJyb3IiICIkZ2xpYl9saWJz
IiA7IHRoZW4KICAgICBmaQogZmkKIAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKKyMgemxpYiBjaGVjaworCitpZiB0ZXN0ICIkemxpYiIgIT0gIm5vIiA7IHRoZW4K
KyAgICBpZiAkcGtnX2NvbmZpZyAtLWV4aXN0cyB6bGliOyB0aGVuCisgICAgICAgIHpsaWJfY2Zs
YWdzPSQoJHBrZ19jb25maWcgLS1jZmxhZ3MgemxpYikKKyAgICAgICAgemxpYl9saWJzPSQoJHBr
Z19jb25maWcgLS1saWJzIHpsaWIpCisgICAgICAgIFFFTVVfQ0ZMQUdTPSIkemxpYl9jZmxhZ3Mg
JFFFTVVfQ0ZMQUdTIgorICAgICAgICBMSUJTPSIkemxpYl9saWJzICRMSUJTIgorICAgIGVsc2UK
KyAgICAgICAgY2F0ID4gJFRNUEMgPDwgRU9GCisjaW5jbHVkZSA8emxpYi5oPgoraW50IG1haW4o
dm9pZCkgeyB6bGliVmVyc2lvbigpOyByZXR1cm4gMDsgfQorRU9GCisgICAgICAgIGlmIGNvbXBp
bGVfcHJvZyAiIiAiLWx6IiA7IHRoZW4KKyAgICAgICAgICAgIExJQlM9IiRMSUJTIC1seiIKKyAg
ICAgICAgZWxzZQorICAgICAgICAgICAgZXJyb3JfZXhpdCAiemxpYiBjaGVjayBmYWlsZWQiIFwK
KyAgICAgICAgICAgICAgICAiTWFrZSBzdXJlIHRvIGhhdmUgdGhlIHpsaWIgbGlicyBhbmQgaGVh
ZGVycyBpbnN0YWxsZWQuIgorICAgICAgICBmaQorICAgIGZpCitmaQorCiAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKICMgU0hBIGNvbW1hbmQgcHJvYmUgZm9yIG1v
ZHVsZXMKIGlmIHRlc3QgIiRtb2R1bGVzIiA9IHllczsgdGhlbgotLSAKMi4xNy4yCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
