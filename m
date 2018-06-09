From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH 08/11] driver/acpi: Add support for Hygon's
 Dhyana Family 18h processor
Date: Sat,  9 Jun 2018 21:23:53 +0800
Message-ID: <1528550633-28441-1-git-send-email-puwen__20379.9084098593$1528551710$gmane$org@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=2ind=i3=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1fRe8J-0006u6-WD
 for xen-devel@lists.xenproject.org; Sat, 09 Jun 2018 13:42:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: rjw@rjwysocki.net, lenb@kernel.org, zhangpanyong@hygon.cn
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, peterz@infradead.org, viresh.kumar@linaro.org, trenn@suse.com, linux-x86_64@vger.kernel.org, hpa@zytor.com, shuah@kernel.org, boris.ostrovsky@oracle.com, linux-arch@vger.kernel.org, Pu Wen <puwen@hygon.cn>, x86@kernel.org, linux-acpi@vger.kernel.org, mingo@redhat.com, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, thomas.lendacky@amd.com, linux-pm@vger.kernel.org, bp@alien8.de, tglx@linutronix.de, mchehab@kernel.org, linux-edac@vger.kernel.org, jgross@suse.com, tony.luck@intel.com, linux-kernel@vger.kernel.org, pbonzini@redhat.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBlbmFibGVzIHRoZSBBQ1BJIGRyaXZlciBzdXBwb3J0IHRvIEh5Z29uIEZhbWls
eSAxOGggQ1BVOgotIEFkZCBIeWdvbiBzdXBwb3J0IGluIHBvd2VyX3NhdmluZ19td2FpdF9pbml0
KCkuCi0gQWRkIEh5Z29uIHN1cHBvcnQgaW4gbGFwaWNfdGltZXJfc3RhdGVfYnJvYWRjYXN0KCku
CgpTaWduZWQtb2ZmLWJ5OiBQdSBXZW4gPHB1d2VuQGh5Z29uLmNuPgotLS0KIGRyaXZlcnMvYWNw
aS9hY3BpX3BhZC5jICAgICAgIHwgMSArCiBkcml2ZXJzL2FjcGkvcHJvY2Vzc29yX2lkbGUuYyB8
IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2FjcGkvYWNwaV9wYWQuYyBiL2RyaXZlcnMvYWNwaS9hY3BpX3BhZC5jCmluZGV4IDU1MmMx
ZjcuLmE0NzY3NmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYWNwaS9hY3BpX3BhZC5jCisrKyBiL2Ry
aXZlcnMvYWNwaS9hY3BpX3BhZC5jCkBAIC03MCw2ICs3MCw3IEBAIHN0YXRpYyB2b2lkIHBvd2Vy
X3NhdmluZ19td2FpdF9pbml0KHZvaWQpCiAKICNpZiBkZWZpbmVkKENPTkZJR19YODYpCiAJc3dp
dGNoIChib290X2NwdV9kYXRhLng4Nl92ZW5kb3IpIHsKKwljYXNlIFg4Nl9WRU5ET1JfSFlHT046
CiAJY2FzZSBYODZfVkVORE9SX0FNRDoKIAljYXNlIFg4Nl9WRU5ET1JfSU5URUw6CiAJCS8qCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcHJvY2Vzc29yX2lkbGUuYyBiL2RyaXZlcnMvYWNwaS9w
cm9jZXNzb3JfaWRsZS5jCmluZGV4IGFiYjU1OWMuLmIyMTMxYzQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvYWNwaS9wcm9jZXNzb3JfaWRsZS5jCisrKyBiL2RyaXZlcnMvYWNwaS9wcm9jZXNzb3JfaWRs
ZS5jCkBAIC0yMDUsNiArMjA1LDcgQEAgc3RhdGljIHZvaWQgbGFwaWNfdGltZXJfc3RhdGVfYnJv
YWRjYXN0KHN0cnVjdCBhY3BpX3Byb2Nlc3NvciAqcHIsCiBzdGF0aWMgdm9pZCB0c2NfY2hlY2tf
c3RhdGUoaW50IHN0YXRlKQogewogCXN3aXRjaCAoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yKSB7
CisJY2FzZSBYODZfVkVORE9SX0hZR09OOgogCWNhc2UgWDg2X1ZFTkRPUl9BTUQ6CiAJY2FzZSBY
ODZfVkVORE9SX0lOVEVMOgogCWNhc2UgWDg2X1ZFTkRPUl9DRU5UQVVSOgotLSAKMi43LjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
