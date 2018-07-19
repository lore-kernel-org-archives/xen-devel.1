From: Waiman Long <longman@redhat.com>
Subject: [PATCH v2] xen/spinlock: Don't use pvqspinlock if only
 1 vCPU
Date: Thu, 19 Jul 2018 17:39:57 -0400
Message-ID: <1532036397-19449-1-git-send-email-longman__8803.07334377921$1532036339$gmane$org@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fsdu=kd=redhat.com=longman@srs-us1.protection.inumbo.net>)
 id 1fgGed-0000Aq-V4
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 21:40:07 +0000
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
ZSB1bmxvY2sgc2lkZSB0aGFuIHRoZSBuYXRpdmUKcXNwaW5sb2NrIGNvZGUuCgpUaGUgeGVuX3B2
c3BpbiB2ZXJpYWJsZSBpcyBhbHNvIHR1cm5lZCBvZmYgaW4gdGhpcyAxIHZDUFUgY2FzZSB0bwpl
bGltaW5hdGUgdW5uZWVkZWQgcHZxc3BpbmxvY2sgaW5pdGlhbGl6YXRpb24gaW4geGVuX2luaXRf
bG9ja19jcHUoKQp3aGljaCBpcyBydW4gYWZ0ZXIgeGVuX2luaXRfc3BpbmxvY2tzKCkuCgpTaWdu
ZWQtb2ZmLWJ5OiBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPgotLS0KIGFyY2gveDg2
L3hlbi9zcGlubG9jay5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3NwaW5sb2NrLmMgYi9hcmNoL3g4Ni94ZW4vc3Bp
bmxvY2suYwppbmRleCBjZDk3YTYyLi45NzNmMTBlIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4v
c3BpbmxvY2suYworKysgYi9hcmNoL3g4Ni94ZW4vc3BpbmxvY2suYwpAQCAtMTMwLDYgKzEzMCwx
MCBAQCB2b2lkIHhlbl91bmluaXRfbG9ja19jcHUoaW50IGNwdSkKIHZvaWQgX19pbml0IHhlbl9p
bml0X3NwaW5sb2Nrcyh2b2lkKQogewogCisJLyogIERvbid0IG5lZWQgdG8gdXNlIHB2cXNwaW5s
b2NrIGNvZGUgaWYgdGhlcmUgaXMgb25seSAxIHZDUFUuICovCisJaWYgKG51bV9wb3NzaWJsZV9j
cHVzKCkgPT0gMSkKKwkJeGVuX3B2c3BpbiA9IGZhbHNlOworCiAJaWYgKCF4ZW5fcHZzcGluKSB7
CiAJCXByaW50ayhLRVJOX0RFQlVHICJ4ZW46IFBWIHNwaW5sb2NrcyBkaXNhYmxlZFxuIik7CiAJ
CXJldHVybjsKLS0gCjEuOC4zLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
