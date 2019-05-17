From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/spec-ctrl: Knights Landing/Mill are
 retpoline-safe
Date: Fri, 17 May 2019 19:50:05 +0100
Message-ID: <1558119005-30941-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gdXm=TR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRhvm-0007Zo-6R
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 18:50:10 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhleSBhcmUgYm90aCBBaXJtb250LWJhc2VkIGFuZCBzaG91bGQgaGF2ZSBiZWVuIGluY2x1ZGVk
IGluIGMvcyAxN2Y3NDI0MmNjZgoieDg2L3NwZWMtY3RybDogRXh0ZW5kIHJlcG9saW5lIHNhZmV5
IGNhbGN1YXRpb25zIGZvciBlSUJSUyBhbmQgQXRvbSBwYXJ0cyIuCgpTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvc3BlY19jdHJsLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jIGIveGVuL2FyY2gveDg2L3Nw
ZWNfY3RybC5jCmluZGV4IDVkOThjYWMuLmU2Njg3OWYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9zcGVjX2N0cmwuYworKysgYi94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMKQEAgLTUyNCw5ICs1
MjQsMTEgQEAgc3RhdGljIGJvb2wgX19pbml0IHJldHBvbGluZV9zYWZlKHVpbnQ2NF90IGNhcHMp
CiAgICAgY2FzZSAweDRkOiAvKiBBdmF0b24gLyBSYW5nZWx5IChTaWx2ZXJtb250KSAqLwogICAg
IGNhc2UgMHg0YzogLyogQ2hlcnJ5dHJhaWwgLyBCcmFzc3dlbGwgKi8KICAgICBjYXNlIDB4NGE6
IC8qIE1lcnJpZmllbGQgKi8KKyAgICBjYXNlIDB4NTc6IC8qIEtuaWdodHMgTGFuZGluZyAqLwog
ICAgIGNhc2UgMHg1YTogLyogTW9vcmVmaWVsZCAqLwogICAgIGNhc2UgMHg1YzogLyogR29sZG1v
bnQgKi8KICAgICBjYXNlIDB4NWY6IC8qIERlbnZlcnRvbiAqLworICAgIGNhc2UgMHg4NTogLyog
S25pZ2h0cyBNaWxsICovCiAgICAgICAgIHJldHVybiB0cnVlOwogCiAgICAgZGVmYXVsdDoKLS0g
CjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
