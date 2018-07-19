From: Waiman Long <longman@redhat.com>
Subject: [PATCH] xen/spinlock: Don't use pvqspinlock if only 1
 vCPU
Date: Thu, 19 Jul 2018 09:48:20 -0400
Message-ID: <1532008100-26922-1-git-send-email-longman__46778.7692127333$1532008041$gmane$org@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fsdu=kd=redhat.com=longman@srs-us1.protection.inumbo.net>)
 id 1fg9IE-0007Tk-TG
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 13:48:30 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Waiman Long <longman@redhat.com>, xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gYSBWTSB3aXRoIG9ubHkgMSB2Q1BVLCB0aGUgbG9ja2luZyBmYXN0IHBhdGhzIHdpbGwgYWx3
YXlzIGJlCnN1Y2Nlc3NmdWwuIEluIHRoaXMgY2FzZSwgdGhlcmUgaXMgbm8gbmVlZCB0byB1c2Ug
dGhlIHRoZSBQViBxc3BpbmxvY2sKY29kZSB3aGljaCBoYXMgaGlnaGVyIG92ZXJoZWFkIG9uIHRo
ZSB1bmxvY2sgc2lkZSB0aGFuIHRoZSBuYXRpdmUKcXNwaW5sb2NrIGNvZGUuCgpTaWduZWQtb2Zm
LWJ5OiBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPgotLS0KIGFyY2gveDg2L3hlbi9z
cGlubG9jay5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vc3BpbmxvY2suYyBiL2FyY2gveDg2
L3hlbi9zcGlubG9jay5jCmluZGV4IGNkOTdhNjIuLjM4ZjQ3YWUgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L3hlbi9zcGlubG9jay5jCisrKyBiL2FyY2gveDg2L3hlbi9zcGlubG9jay5jCkBAIC0xMzAs
NyArMTMwLDggQEAgdm9pZCB4ZW5fdW5pbml0X2xvY2tfY3B1KGludCBjcHUpCiB2b2lkIF9faW5p
dCB4ZW5faW5pdF9zcGlubG9ja3Modm9pZCkKIHsKIAotCWlmICgheGVuX3B2c3BpbikgeworCS8q
ICBEb24ndCBuZWVkIHRvIHVzZSBwdnFzcGlubG9jayBjb2RlIGlmIHRoZXJlIGlzIG9ubHkgMSB2
Q1BVLiAqLworCWlmICgheGVuX3B2c3BpbiB8fCBudW1fcG9zc2libGVfY3B1cygpID09IDEpIHsK
IAkJcHJpbnRrKEtFUk5fREVCVUcgInhlbjogUFYgc3BpbmxvY2tzIGRpc2FibGVkXG4iKTsKIAkJ
cmV0dXJuOwogCX0KLS0gCjEuOC4zLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
