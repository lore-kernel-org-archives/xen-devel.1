From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v4 0/2] vhpet: add support for level triggered
 interrupts
Date: Tue, 17 Jul 2018 12:38:51 +0200
Message-ID: <20180717103854.55773-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jnja=kb=citrix.com=prvs=72919e7bd=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ffNOJ-0007la-19
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 10:39:35 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBhZGQgc3VwcG9ydCBmb3IgbGV2ZWwgdHJpZ2dl
ciBpbnRlcnJ1cHRzIHRvIHZocGV0LgpMZXZlbCB0cmlnZ2VyZWQgaW50ZXJydXB0cyBhcmUgbm90
IGFuIG9wdGlvbmFsIGZlYXR1cmUgb2YgdGhlIGhwZXQgc3BlYywKc28gdGhleSBtdXN0IGJlIGlt
cGxlbWVudGVkIGluIG9yZGVyIHRvIGhhdmUgYSBjb21wbGV0ZSBlbXVsYXRlZCBocGV0CmltcGxl
bWVudGF0aW9uIGluIFhlbi4KClRoZSBleHRyYSBwYXRjaCBhZGRzIHNvbWUgYmFzaWMgdGVzdGlu
ZyBvZiBocGV0IChtYWlubHkgdGhlIGxldmVsCnRyaWdnZXJlZCBpbnRlcnJ1cHRzKSB0byB4dGYu
CgpUaGUgWGVuIHNlcmllcyBjYW4gYmUgZm91bmQgYXQ6CgpnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcv
cGVvcGxlL3JveWdlci94ZW4uZ2l0IHZocGV0LnY0CgpUaGFua3MsIFJvZ2VyLgoKUm9nZXIgUGF1
IE1vbm5lICgyKToKICB2cHQ6IGFkZCBzdXBwb3J0IGZvciBsZXZlbCBpbnRlcnJ1cHRzCiAgdmhw
ZXQ6IGFkZCBzdXBwb3J0IGZvciBsZXZlbCB0cmlnZ2VyZWQgaW50ZXJydXB0cwoKIHhlbi9hcmNo
L3g4Ni9odm0vaHBldC5jICAgICAgIHwgNTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0KIHhlbi9hcmNoL3g4Ni9odm0vaTgyNTQuYyAgICAgIHwgIDQgKy0tCiB4ZW4vYXJjaC94
ODYvaHZtL2lycS5jICAgICAgICB8IDE1ICsrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9odm0vcnRj
LmMgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vdmxhcGljLmMgICAgIHwgIDggKysr
LS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZwdC5jICAgICAgICB8IDQ4ICsrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2lycS5oIHwgIDMgKy0KIHhl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZwdC5oIHwgIDMgKy0KIDggZmlsZXMgY2hhbmdlZCwgMTA3
IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
