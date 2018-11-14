From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v3 0/8] x86/vvmx: various fixes
Date: Wed, 14 Nov 2018 10:23:15 +0000
Message-ID: <20181114102323.7771-1-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

VGhlc2Ugd2VyZSBmb3VuZCBieSBydW5uaW5nIG5lc3RlZCBWTVggdGVzdHMgZnJvbSBrdm0tdW5p
dC10ZXN0cy4KCnYzOgotIFJlbW92ZWQgMS84ICJ4ODYvdnZteDogaW50cm9kdWNlIG52bXhfdmNw
dV9wcmVpbml0KCkiCi0gQWRkZWQgMS84ICJ4ODYvbmVzdGVkaHZtOiBpbml0IG52X3Z2bWN4YWRk
ciBpbiBodm1fdmNwdV9pbml0aWFsaXNlKCkiCi0gQWRkZWQgUi1ieSBhbmQgQWNrZWQtYnkgdG8g
b3RoZXIgcGF0Y2hlcwoKU2VyZ2V5IER5YXNsaSAoOCk6CiAgeDg2L25lc3RlZGh2bTogaW5pdCBu
dl92dm1jeGFkZHIgaW4gaHZtX3ZjcHVfaW5pdGlhbGlzZSgpCiAgeDg2L25lc3RlZGh2bTogaW50
cm9kdWNlIHZ2bWN4X3ZhbGlkKCkKICB4ODYvdnZteDogYWRkIFZNWF9JTlNOX0lOVkVQVF9JTlZW
UElEX0lOVkFMSURfT1AgZXJybm8KICB4ODYvdnZteDogY29ycmVjdCB2bWZhaWwoKSB1c2FnZSBm
b3Igdm1wdHJsZCBhbmQgdm1jbGVhcgogIHg4Ni92dm14OiBhZGQgVk1YX0lOU05fVk1QVFJMRF9X
SVRIX1ZNWE9OX1BUUiBlcnJubwogIHg4Ni92dm14OiByZWZhY3RvciBudm14X2hhbmRsZV92bWNs
ZWFyKCkKICB4ODYvdnZteDogY29ycmVjdGx5IHJlcG9ydCB2dm1jcyBzaXplCiAgeDg2L3Z2bXg6
IGZpeCBJL08gYW5kIE1TUiBiaXRtYXBzIG1hcHBpbmcKCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5j
ICAgICAgICAgICAgICB8ICAgMiArCiB4ZW4vYXJjaC94ODYvaHZtL3N2bS9uZXN0ZWRzdm0uYyAg
ICB8ICAgMiArLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jICAgICAgICAgfCAyMDEgKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vbmVzdGVk
aHZtLmggfCAgIDUgKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZtY3MuaCAgfCAgIDMg
KwogNSBmaWxlcyBjaGFuZ2VkLCAxMzkgaW5zZXJ0aW9ucygrKSwgNzQgZGVsZXRpb25zKC0pCgot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
