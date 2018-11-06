From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v2 0/8] x86/vvmx: various fixes
Date: Tue, 6 Nov 2018 12:07:51 +0000
Message-ID: <20181106120759.8789-1-sergey.dyasli@citrix.com>
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
dC10ZXN0cy4KClNlcmdleSBEeWFzbGkgKDgpOgogIHg4Ni92dm14OiBpbnRyb2R1Y2UgbnZteF92
Y3B1X3ByZWluaXQoKQogIHg4Ni9uZXN0ZWRodm06IGludHJvZHVjZSB2dm1jeF92YWxpZCgpCiAg
eDg2L3Z2bXg6IGFkZCBWTVhfSU5TTl9JTlZFUFRfSU5WVlBJRF9JTlZBTElEX09QIGVycm5vCiAg
eDg2L3Z2bXg6IGNvcnJlY3Qgdm1mYWlsKCkgdXNhZ2UgZm9yIHZtcHRybGQgYW5kIHZtY2xlYXIK
ICB4ODYvdnZteDogYWRkIFZNWF9JTlNOX1ZNUFRSTERfV0lUSF9WTVhPTl9QVFIgZXJybm8KICB4
ODYvdnZteDogcmVmYWN0b3IgbnZteF9oYW5kbGVfdm1jbGVhcigpCiAgeDg2L3Z2bXg6IGNvcnJl
Y3RseSByZXBvcnQgdnZtY3Mgc2l6ZQogIHg4Ni92dm14OiBmaXggSS9PIGFuZCBNU1IgYml0bWFw
cyBtYXBwaW5nCgogeGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMgICAgfCAgIDIgKy0K
IHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAgICAgICAgIHwgICA0ICstCiB4ZW4vYXJjaC94
ODYvaHZtL3ZteC92dm14LmMgICAgICAgICB8IDIxMSArKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9uZXN0ZWRodm0uaCB8ICAgNSArCiB4ZW4vaW5j
bHVkZS9hc20teDg2L2h2bS92bXgvdm1jcy5oICB8ICAgMyArCiB4ZW4vaW5jbHVkZS9hc20teDg2
L2h2bS92bXgvdnZteC5oICB8ICAgMSArCiA2IGZpbGVzIGNoYW5nZWQsIDE1MCBpbnNlcnRpb25z
KCspLCA3NiBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
