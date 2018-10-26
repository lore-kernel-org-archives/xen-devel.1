From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 06/20] docs/devel/testing.rst: add missing
 newlines after code block
Date: Fri, 26 Oct 2018 17:31:11 +0200
Message-ID: <20181026153125.24738-7-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vnpb=ng=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gG45l-00010R-QX
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 15:32:05 +0000
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

RnJvbTogQ2xlYmVyIFJvc2EgPGNyb3NhQHJlZGhhdC5jb20+CgpUaGUgbGluZSBpbW1lZGlhdGUg
Zm9sbG93aW5nIGEgIi4uIGNvZGU6OiIgYmxvY2sgaXMgY29uc2lkZXJlZAp0byBjb250YWlucyBh
cmd1bWVudHMgdG8gdGhlICJjb2RlIGRpcmVjdGl2ZSIuICBUaGUgbGFjayBvZiBhCm5ldyBsaW5l
IGdpdmVzIG1lIGR1cmluZyBhdCBwYXJzZSB0aW1lOgoKICAgdGVzdGluZy5yc3Q6NjM6IChFUlJP
Ui8zKSBFcnJvciBpbiAiY29kZSIgZGlyZWN0aXZlOgogICBtYXhpbXVtIDEgYXJndW1lbnQocykg
YWxsb3dlZCwgMyBzdXBwbGllZC4KCiAgIC4uIGNvZGU6OgogICAgIG1ha2UgY2hlY2stdW5pdCBW
PTEKCiAgIHRlc3RpbmcucnN0OjEyMDogKEVSUk9SLzMpIEVycm9yIGluICJjb2RlIiBkaXJlY3Rp
dmU6CiAgIG1heGltdW0gMSBhcmd1bWVudChzKSBhbGxvd2VkLCAzIHN1cHBsaWVkLgoKICAgLi4g
Y29kZTo6CiAgICAgbWFrZSBjaGVjay1xdGVzdCBWPTEKCkxldCdzIGFkZCB0aGUgbWlzc2luZyBu
ZXdsaW5lcywgYm90aCBmb3IgY29uc2lzdGVuY3kgYW5kIHRvCmF2b2lkIHRoZSBwYXJzaW5nIGVy
cm9ycy4KClNpZ25lZC1vZmYtYnk6IENsZWJlciBSb3NhIDxjcm9zYUByZWRoYXQuY29tPgpSZXZp
ZXdlZC1ieTogSm9obiBTbm93IDxqc25vd0ByZWRoYXQuY29tPgpNZXNzYWdlLUlkOiA8MjAxODEw
MDQxNjE4NTIuMTE2NzMtNi1jcm9zYUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50
IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+Ci0tLQogZG9jcy9kZXZlbC90ZXN0aW5nLnJzdCB8
IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kb2Nz
L2RldmVsL3Rlc3RpbmcucnN0IGIvZG9jcy9kZXZlbC90ZXN0aW5nLnJzdAppbmRleCBmY2ZhZDg3
NjE0Li5hMjI3NzU0Zjg2IDEwMDY0NAotLS0gYS9kb2NzL2RldmVsL3Rlc3RpbmcucnN0CisrKyBi
L2RvY3MvZGV2ZWwvdGVzdGluZy5yc3QKQEAgLTU5LDYgKzU5LDcgQEAgdmFyaWFibGUgKHdoaWNo
IGFmZmVjdHMgbWVtb3J5IHJlY2xhbWF0aW9uIGFuZCBjYXRjaGVzIGludmFsaWQgcG9pbnRlcnMg
YmV0dGVyKQogYW5kIGd0ZXN0ZXIgb3B0aW9ucy4gSWYgbmVjZXNzYXJ5LCB5b3UgY2FuIHJ1bgog
CiAuLiBjb2RlOjoKKwogICBtYWtlIGNoZWNrLXVuaXQgVj0xCiAKIGFuZCBjb3B5IHRoZSBhY3R1
YWwgY29tbWFuZCBsaW5lIHdoaWNoIGV4ZWN1dGVzIHRoZSB1bml0IHRlc3QsIHRoZW4gcnVuCkBA
IC0xMTYsNiArMTE3LDcgQEAgYW5kIHVzaW5nIGdkYiBvbiB0aGUgdGVzdCBpcyBzdGlsbCBzaW1w
bGUgdG8gZG86IGZpbmQgb3V0IHRoZSBhY3R1YWwgY29tbWFuZAogZnJvbSB0aGUgb3V0cHV0IG9m
CiAKIC4uIGNvZGU6OgorCiAgIG1ha2UgY2hlY2stcXRlc3QgVj0xCiAKIHdoaWNoIHlvdSBjYW4g
cnVuIG1hbnVhbGx5LgotLSAKMi4xNy4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
