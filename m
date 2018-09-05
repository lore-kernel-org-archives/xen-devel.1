From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] x86/xen: make xen_reservation_lock static
Date: Wed,  5 Sep 2018 07:36:34 +0200
Message-ID: <20180905053634.13648-1-jgross__7517.80590876496$1536125749$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=evre=lt=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fxQUa-0006IC-Po
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 05:36:40 +0000
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

dGlwLmdpdCBmMDMwYWFkZTkxNjUgKCJ4ODYveGVuOiBNb3ZlIHB2IHNwZWNpZmljIHBhcnRzIG9m
CmFyY2gveDg2L3hlbi9tbXUuYyB0byBtbXVfcHYuYyIpIG1pc3NlZCB0byBtYWtlIHhlbl9yZXNl
cnZhdGlvbl9sb2NrCnN0YXRpYy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KLS0tCiBhcmNoL3g4Ni94ZW4vbW11X3B2LmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni94ZW4vbW11X3B2LmMgYi9hcmNoL3g4Ni94ZW4vbW11X3B2LmMKaW5kZXggMTIxODBlNzI4M2I3
Li4zYTI3MjliODMyOTkgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9tbXVfcHYuYworKysgYi9h
cmNoL3g4Ni94ZW4vbW11X3B2LmMKQEAgLTEwNCw3ICsxMDQsNyBAQCBzdGF0aWMgcHVkX3QgbGV2
ZWwzX3VzZXJfdnN5c2NhbGxbUFRSU19QRVJfUFVEXSBfX3BhZ2VfYWxpZ25lZF9ic3M7CiAgKiBQ
cm90ZWN0cyBhdG9taWMgcmVzZXJ2YXRpb24gZGVjcmVhc2UvaW5jcmVhc2UgYWdhaW5zdCBjb25j
dXJyZW50IGluY3JlYXNlcy4KICAqIEFsc28gcHJvdGVjdHMgbm9uLWF0b21pYyB1cGRhdGVzIG9m
IGN1cnJlbnRfcGFnZXMgYW5kIGJhbGxvb24gbGlzdHMuCiAgKi8KLURFRklORV9TUElOTE9DSyh4
ZW5fcmVzZXJ2YXRpb25fbG9jayk7CitzdGF0aWMgREVGSU5FX1NQSU5MT0NLKHhlbl9yZXNlcnZh
dGlvbl9sb2NrKTsKIAogLyoKICAqIE5vdGUgYWJvdXQgY3IzIChwYWdldGFibGUgYmFzZSkgdmFs
dWVzOgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
