From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL v2 04/20] tests/tcg/README: fix location for lm32
 tests
Date: Tue, 30 Oct 2018 12:23:21 +0100
Message-ID: <20181030112337.17973-5-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=oc9f=nk=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gHS7v-0003F2-CW
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 11:24:03 +0000
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

RnJvbTogQ2xlYmVyIFJvc2EgPGNyb3NhQHJlZGhhdC5jb20+CgpQb2ludCB0byB0aGUgcmlnaHQg
YW5kIG9idmlvdXMgbG9jYXRpb24gZm9yIGxtMzIgdGVzdHMuCgpTaWduZWQtb2ZmLWJ5OiBDbGVi
ZXIgUm9zYSA8Y3Jvc2FAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFRob21hcyBIdXRoIDx0aHV0
aEByZWRoYXQuY29tPgpBY2tlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8u
b3JnPgpNZXNzYWdlLUlkOiA8MjAxODEwMDQxNjE4NTIuMTE2NzMtMy1jcm9zYUByZWRoYXQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+Ci0tLQog
dGVzdHMvdGNnL1JFQURNRSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9SRUFETUUgYi90ZXN0cy90Y2cv
UkVBRE1FCmluZGV4IGE1NjQzZDMzZTcuLjJhNThmOWEwNTggMTAwNjQ0Ci0tLSBhL3Rlc3RzL3Rj
Zy9SRUFETUUKKysrIGIvdGVzdHMvdGNnL1JFQURNRQpAQCAtMTAsNiArMTAsNiBAQCB3aXRoICJt
YWtlIHRlc3QtY3JpcyIuCiAKIExNMzIKID09PT0KLVRoZSB0ZXN0c3VpdGUgZm9yIExNMzIgaXMg
aW4gdGVzdHMvdGNnL2NyaXMuICBZb3UgY2FuIHJ1biBpdAorVGhlIHRlc3RzdWl0ZSBmb3IgTE0z
MiBpcyBpbiB0ZXN0cy90Y2cvbG0zMi4gIFlvdSBjYW4gcnVuIGl0CiB3aXRoICJtYWtlIHRlc3Qt
bG0zMiIuCiAKLS0gCjIuMTcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
