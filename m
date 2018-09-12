From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] x86/xen: disable cpu0 hotplug for xen pv
Date: Wed, 12 Sep 2018 19:41:22 +0200
Message-ID: <20180912174122.24282-1-jgross__13713.6303740137$1536774014$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jbun=l2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g098q-0005xf-Er
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 17:41:28 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, mingo@redhat.com, tglx@linutronix.de, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

WGVuIHB2IGd1ZXN0cyBkb24ndCBhbGxvdyBjcHUwIGhvdHBsdWcsIHNvIGRpc2FibGUgaXQuCgpT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogYXJjaC94
ODYva2VybmVsL3RvcG9sb2d5LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvdG9wb2xv
Z3kuYyBiL2FyY2gveDg2L2tlcm5lbC90b3BvbG9neS5jCmluZGV4IDEyY2JlMmI4OGMwZi4uNzM4
YmY0MmIwMjE4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvdG9wb2xvZ3kuYworKysgYi9h
cmNoL3g4Ni9rZXJuZWwvdG9wb2xvZ3kuYwpAQCAtMTExLDggKzExMSwxMCBAQCBpbnQgYXJjaF9y
ZWdpc3Rlcl9jcHUoaW50IG51bSkKIAkvKgogCSAqIEN1cnJlbnRseSBDUFUwIGlzIG9ubHkgaG90
cGx1Z2dhYmxlIG9uIEludGVsIHBsYXRmb3Jtcy4gT3RoZXIKIAkgKiB2ZW5kb3JzIGNhbiBhZGQg
aG90cGx1ZyBzdXBwb3J0IGxhdGVyLgorCSAqIFhlbiBQViBndWVzdHMgZG9uJ3Qgc3VwcG9ydCBD
UFUwIGhvdHBsdWcgYXQgYWxsLgogCSAqLwotCWlmIChjLT54ODZfdmVuZG9yICE9IFg4Nl9WRU5E
T1JfSU5URUwpCisJaWYgKGMtPng4Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9JTlRFTCB8fAorCSAg
ICBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfWEVOUFYpKQogCQljcHUwX2hvdHBsdWdnYWJsZSA9
IDA7CiAKIAkvKgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
