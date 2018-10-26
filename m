From: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 02/20] vga_int: remove unused function protype
Date: Fri, 26 Oct 2018 17:31:07 +0200
Message-ID: <20181026153125.24738-3-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vnpb=ng=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1gG45X-0000sO-PV
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 15:31:51 +0000
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-trivial@nongnu.org, yuchenlin <yuchenlin@synology.com>, Markus Armbruster <armbru@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogeXVjaGVubGluIDx5dWNoZW5saW5Ac3lub2xvZ3kuY29tPgoKU2lnbmVkLW9mZi1ieTog
eXVjaGVubGluIDx5dWNoZW5saW5Ac3lub2xvZ3kuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgpNZXNzYWdlLUlkOiA8MjAxODEwMjIw
ODAwNTMuOTM3OS0xLXl1Y2hlbmxpbkBzeW5vbG9neS5jb20+ClNpZ25lZC1vZmYtYnk6IExhdXJl
bnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5ldT4KLS0tCiBody9kaXNwbGF5L3ZnYV9pbnQuaCB8
IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ody9kaXNw
bGF5L3ZnYV9pbnQuaCBiL2h3L2Rpc3BsYXkvdmdhX2ludC5oCmluZGV4IDZlNGZhNDhhNzkuLjU1
YzQxOGVhYjUgMTAwNjQ0Ci0tLSBhL2h3L2Rpc3BsYXkvdmdhX2ludC5oCisrKyBiL2h3L2Rpc3Bs
YXkvdmdhX2ludC5oCkBAIC0xNjYsNyArMTY2LDYgQEAgTWVtb3J5UmVnaW9uICp2Z2FfaW5pdF9p
byhWR0FDb21tb25TdGF0ZSAqcywgT2JqZWN0ICpvYmosCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IE1lbW9yeVJlZ2lvblBvcnRpbyAqKnZiZV9wb3J0cyk7CiB2b2lkIHZnYV9jb21t
b25fcmVzZXQoVkdBQ29tbW9uU3RhdGUgKnMpOwogCi12b2lkIHZnYV9zeW5jX2RpcnR5X2JpdG1h
cChWR0FDb21tb25TdGF0ZSAqcyk7CiB2b2lkIHZnYV9kaXJ0eV9sb2dfc3RhcnQoVkdBQ29tbW9u
U3RhdGUgKnMpOwogdm9pZCB2Z2FfZGlydHlfbG9nX3N0b3AoVkdBQ29tbW9uU3RhdGUgKnMpOwog
Ci0tIAoyLjE3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
