From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL v2 11/20] cpu.h: fix a typo in comment
Date: Tue, 30 Oct 2018 12:23:28 +0100
Message-ID: <20181030112337.17973-12-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=oc9f=nk=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gHS86-0003R3-3t
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 11:24:14 +0000
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-trivial@nongnu.org, Li Qiang <liq3ea@gmail.com>, Michael Walle <michael@walle.cc>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>Lauren
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTGkgUWlhbmcgPGxpcTNlYUBnbWFpbC5jb20+CgpGb3VuZCBieSByZWFkaW5nIHRoZSBj
b2RlLgoKU2lnbmVkLW9mZi1ieTogTGkgUWlhbmcgPGxpcTNlYUBnbWFpbC5jb20+Ck1lc3NhZ2Ut
SWQ6IDwxNTM2MTUwNTQ4LTI3OTctMS1naXQtc2VuZC1lbWFpbC1saXEzZWFAZ21haWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+Ci0tLQogaW5j
bHVkZS9xb20vY3B1LmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3FvbS9jcHUuaCBiL2luY2x1ZGUvcW9t
L2NwdS5oCmluZGV4IDRlMjM4YjBkOWYuLmRlZjBjNjQzMDggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
cW9tL2NwdS5oCisrKyBiL2luY2x1ZGUvcW9tL2NwdS5oCkBAIC04NTIsNyArODUyLDcgQEAgZXh0
ZXJuIENQVUludGVycnVwdEhhbmRsZXIgY3B1X2ludGVycnVwdF9oYW5kbGVyOwogLyoqCiAgKiBj
cHVfaW50ZXJydXB0OgogICogQGNwdTogVGhlIENQVSB0byBzZXQgYW4gaW50ZXJydXB0IG9uLgot
ICogQG1hc2s6IFRoZSBpbnRlcnVwdHMgdG8gc2V0LgorICogQG1hc2s6IFRoZSBpbnRlcnJ1cHRz
IHRvIHNldC4KICAqCiAgKiBJbnZva2VzIHRoZSBpbnRlcnJ1cHQgaGFuZGxlci4KICAqLwotLSAK
Mi4xNy4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
