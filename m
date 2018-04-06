From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 2/7] x86/xpti: don't flush TLB twice when
 switching to 64-bit pv context
Date: Fri,  6 Apr 2018 09:52:51 +0200
Message-ID: <20180406075256.8427-3-jgross@suse.com>
References: <20180406075256.8427-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ofhv=g3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f4MBD-0001TO-JG
 for xen-devel@lists.xenproject.org; Fri, 06 Apr 2018 07:53:03 +0000
In-Reply-To: <20180406075256.8427-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, andrew.cooper3@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

V2hlbiBzd2l0Y2hpbmcgdG8gYSA2NC1iaXQgcHYgY29udGV4dCB0aGUgVExCIGlzIGZsdXNoZWQg
dHdpY2UgdG9kYXk6CnRoZSBmaXJzdCB0aW1lIHdoZW4gc3dpdGNoaW5nIHRvIHRoZSBuZXcgYWRk
cmVzcyBzcGFjZSBpbgp3cml0ZV9wdGJhc2UoKSwgdGhlIHNlY29uZCB0aW1lIHdoZW4gc3dpdGNo
aW5nIHRvIGd1ZXN0IG1vZGUgaW4KcmVzdG9yZV90b19ndWVzdC4KCkxpbWl0IHRoZSBmaXJzdCBm
bHVzaCB0byBub24tZ2xvYmFsIGVudHJpZXMgaW4gdGhhdCBjYXNlLgoKU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgotLS0KVjM6Ci0gb21pdCBzZXR0aW5nIHJvb3RfcGd0X2NoYW5n
ZWQgdG8gZmFsc2UgKEphbiBCZXVsaWNoKQotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgOSArKysr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRleCBm
ZDg5Njg1NDg2Li5jZjJjY2IwN2U2IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysg
Yi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtMTI0LDYgKzEyNCw3IEBACiAjaW5jbHVkZSA8YXNtL3Bj
aS5oPgogI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgogI2luY2x1ZGUgPGFzbS9odm0vaW9yZXEuaD4K
KyNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+CiAKICNpbmNsdWRlIDxhc20vaHZtL2dyYW50X3Rh
YmxlLmg+CiAjaW5jbHVkZSA8YXNtL3B2L2dyYW50X3RhYmxlLmg+CkBAIC01MDQsOSArNTA1LDEz
IEBAIHZvaWQgbWFrZV9jcjMoc3RydWN0IHZjcHUgKnYsIG1mbl90IG1mbikKIAogdm9pZCB3cml0
ZV9wdGJhc2Uoc3RydWN0IHZjcHUgKnYpCiB7Ci0gICAgaWYgKCB0aGlzX2NwdShyb290X3BndCkg
KQorICAgIGlmICggdGhpc19jcHUocm9vdF9wZ3QpICYmIGlzX3B2X3ZjcHUodikgJiYgIWlzX3B2
XzMyYml0X3ZjcHUodikgKQorICAgIHsKICAgICAgICAgZ2V0X2NwdV9pbmZvKCktPnJvb3RfcGd0
X2NoYW5nZWQgPSB0cnVlOwotICAgIHdyaXRlX2NyMyh2LT5hcmNoLmNyMyk7CisgICAgICAgIGFz
bSB2b2xhdGlsZSAoICJtb3YgJTAsICUlY3IzIiA6IDogInIiICh2LT5hcmNoLmNyMykgOiAibWVt
b3J5IiApOworICAgIH0KKyAgICBlbHNlCisgICAgICAgIHdyaXRlX2NyMyh2LT5hcmNoLmNyMyk7
CiB9CiAKIC8qCi0tIAoyLjEzLjYKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
