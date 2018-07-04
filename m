From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/8] Coccinelle cleanups
Date: Wed,  4 Jul 2018 12:39:11 -0300
Message-ID: <20180704153919.12432-1-f4bug@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qusl=ju=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1fajso-0001FV-Rt
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 15:39:54 +0000
Received: by mail-qt0-x244.google.com with SMTP id h4-v6so4838124qtj.7
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jul 2018 08:39:53 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Laurent Vivier <laurent@vivier.eu>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
List-Id: xen-devel@lists.xenproject.org

Tm90aGluZyBleGNpdGluZyBoZXJlLCBwYXRjaGVzIGNyZWF0ZWQgbWVjaGFuaWNhbGx5Cihjb21t
b24gYWZ0ZXIgc29mdCBmcmVlemUpLgoKUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgKDgpOgogIHFv
YmplY3Q6IENhdGNoIGFub3RoZXIgc3RyYWdnbGVyIGZvciB1c2Ugb2YgcWRpY3RfcHV0X3N0cigp
CiAgZXJyb3I6IFJlbW92ZSBOVUxMIGNoZWNrcyBvbiBlcnJvcl9wcm9wYWdhdGUoKSBjYWxscwog
IGNyeXB0bzogUmVtb3ZlIHVzZWxlc3MgY2FzdHMKICB4ZW46IFJlbW92ZSB1c2VsZXNzIGNhc3Rz
CiAgdGVzdHMvYmlvcy10YWJsZXMtdGVzdDogUmVtb3ZlIHVzZWxlc3MgY2FzdHMKICB1aS92bmM6
IFJlbW92ZSB1c2VsZXNzIHBhcmVudGhlc2lzIGFyb3VuZCBESVZfUk9VTkRfVVAgbWFjcm8KICBo
dy9wY2ktaG9zdDogUmVtb3ZlIHVzZWxlc3MgcGFyZW50aGVzaXMgYXJvdW5kIERJVl9ST1VORF9V
UCBtYWNybwogIGh3L2ludGMvZ2ljdjM6IFJlbW92ZSB1c2VsZXNzIHBhcmVudGhlc2lzIGFyb3Vu
ZCBESVZfUk9VTkRfVVAgbWFjcm8KCiBpbmNsdWRlL2h3L2ludGMvYXJtX2dpY3YzX2NvbW1vbi5o
IHwgMiArLQogY3J5cHRvL2NpcGhlci1idWlsdGluLmMgICAgICAgICAgICB8IDQgKystLQogaHcv
cGNpLWhvc3QvcGlpeC5jICAgICAgICAgICAgICAgICB8IDIgKy0KIGh3L3BjaS1ob3N0L3EzNS5j
ICAgICAgICAgICAgICAgICAgfCAyICstCiBody9zMzkweC92aXJ0aW8tY2N3LmMgICAgICAgICAg
ICAgIHwgNCArLS0tCiBody94ZW4veGVuX3B0X2NvbmZpZ19pbml0LmMgICAgICAgIHwgMiArLQog
cW9iamVjdC9ibG9jay1xZGljdC5jICAgICAgICAgICAgICB8IDIgKy0KIHRlc3RzL2Jpb3MtdGFi
bGVzLXRlc3QuYyAgICAgICAgICAgfCAyICstCiB1aS92bmMtZW5jLXRpZ2h0LmMgICAgICAgICAg
ICAgICAgIHwgMiArLQogdWkvdm5jLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDMgKyst
CiAxMCBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCi0t
IAoyLjE4LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
