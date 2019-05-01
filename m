From: David Woodhouse <dwmw2@infradead.org>
Subject: [RFC PATCH 1/7] x86/wakeup: Stop using %fs for lidt/lgdt
Date: Wed,  1 May 2019 12:17:00 +0100
Message-ID: <22e1febec473b55fd7e43ffe02fb3a81f70a5e86.1556708226.git.dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G7ua=TB=merlin.srs.infradead.org=batv+1e733e8c069b692f204e+5729+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hLnEe-0001RW-Qa
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:17:12 +0000
In-Reply-To: <cover.1556708225.git.dwmw2@infradead.org>
In-Reply-To: <cover.1556708225.git.dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: dwmw2@infradead.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClRoZSB3YWtldXAgY29k
ZSBpcyBub3cgcmVsb2NhdGVkIGFsb25nc2lkZSB0aGUgdHJhbXBvbGluZSBjb2RlLCBzbyAlZHMK
aXMganVzdCBmaW5lIGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdA
YW1hem9uLmNvLnVrPgotLS0KIHhlbi9hcmNoL3g4Ni9ib290L3dha2V1cC5TIHwgMTEgKystLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jvb3Qvd2FrZXVwLlMgYi94ZW4vYXJjaC94ODYvYm9v
dC93YWtldXAuUwppbmRleCBmOTYzMmVlZjk1Li44YzUyODE5MTcxIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvYm9vdC93YWtldXAuUworKysgYi94ZW4vYXJjaC94ODYvYm9vdC93YWtldXAuUwpA
QCAtNDAsMTEgKzQwLDggQEAgRU5UUlkod2FrZXVwX3N0YXJ0KQogICAgICAgICBtb3Z3ICAgICVh
eCwgJWZzCiAgICAgICAgIG1vdncgICAgJDB4MGUwMCArICdMJywgJWZzOigweDEwKQogCi0gICAg
ICAgICMgYm9vdCB0cmFtcG9saW5lIGlzIHVuZGVyIDFNLCBhbmQgc2hpZnQgaXRzIHN0YXJ0IGlu
dG8KLSAgICAgICAgIyAlZnMgdG8gcmVmZXJlbmNlIHN5bWJvbHMgaW4gdGhhdCBhcmVhCi0gICAg
ICAgIG1vdiAgICAgd2FrZXN5bSh0cmFtcG9saW5lX3NlZyksICVmcwotICAgICAgICBsaWR0ICAg
ICVmczpib290c3ltKGlkdF80OCkKLSAgICAgICAgbGdkdCAgICAlZnM6Ym9vdHN5bShnZHRfNDgp
CisgICAgICAgIGxpZHQgICAgYm9vdHN5bShpZHRfNDgpCisgICAgICAgIGxnZHQgICAgYm9vdHN5
bShnZHRfNDgpCiAKICAgICAgICAgbW92dyAgICAkMSwgJWF4CiAgICAgICAgIGxtc3cgICAgJWF4
ICAgICAgICAgICAgICMgVHVybiBvbiBDUjAuUEUgCkBAIC0xMDIsMTAgKzk5LDYgQEAgR0xPQkFM
KHZpZGVvX21vZGUpCiAgICAgICAgIC5sb25nIDAKIEdMT0JBTCh2aWRlb19mbGFncykKICAgICAg
ICAgLmxvbmcgMAotdHJhbXBvbGluZV9zZWc6IC53b3JkIDAKLSAgICAgICAgLnB1c2hzZWN0aW9u
IC50cmFtcG9saW5lX3NlZywgImEiCi0gICAgICAgIC5sb25nICAgdHJhbXBvbGluZV9zZWcgLSAu
Ci0gICAgICAgIC5wb3BzZWN0aW9uCiAKICAgICAgICAgLmNvZGUzMgogCi0tIAoyLjE3LjIKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
