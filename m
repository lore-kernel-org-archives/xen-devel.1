From: Pu Wen <puwen@hygon.cn>
Subject: [RFC PATCH] x86/xen/pmu: Use MSRs C001_020X instead of
 the legacy MSRs for Hygon
Date: Fri, 22 Mar 2019 18:43:39 +0800
Message-ID: <1553251419-7066-1-git-send-email-puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BQEE=RZ=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1h7Hfu-0001sj-Pm
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 10:45:22 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com, bp@alien8.de, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, Pu Wen <puwen@hygon.cn>
List-Id: xen-devel@lists.xenproject.org

VGhlIEh5Z29uIERoeWFuYSBwcm9jZXNzb3Igc3VwcG9ydHMgTVNScyBDMDAxXzAyMFggZm9yIHRo
ZSBwZXJmb3JtYW5jZQptb25pdG9yIGNvdW50ZXIoUE1DKS4gVGhlcmUgYXJlIHNpeCBjb3JlIHBl
cmZvcm1hbmNlIGV2ZW50cyBjb3VudGVycyBmb3IKRGh5YW5hIGJ1dCB0aGVyZSBhcmUgb25seSBm
b3VyIGxlZ2FjeSBQTUMgTVNScy4gU28gc3dpdGNoaW5nIHRvIHVzZSBNU1JzCkMwMDFfMDIwWChj
b21wYXRpYmxlIHdpdGggdGhlIEYxNUggb25lcykgZm9yIFhlbiB2UE1VIGluZnJhc3RydWN0dXJl
IG9uCkh5Z29uIHBsYXRmb3JtLgoKU2lnbmVkLW9mZi1ieTogUHUgV2VuIDxwdXdlbkBoeWdvbi5j
bj4KLS0tCiBhcmNoL3g4Ni94ZW4vcG11LmMgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2
L3hlbi9wbXUuYyBiL2FyY2gveDg2L3hlbi9wbXUuYwppbmRleCBlMTNiMGI0Li42NDgwZWVkIDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4vcG11LmMKKysrIGIvYXJjaC94ODYveGVuL3BtdS5jCkBA
IC05MiwxMSArOTIsMTEgQEAgc3RhdGljIHZvaWQgeGVuX3BtdV9hcmNoX2luaXQodm9pZCkKIAkJ
CWJyZWFrOwogCQl9CiAJfSBlbHNlIGlmIChib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2
X1ZFTkRPUl9IWUdPTikgewotCQlhbWRfbnVtX2NvdW50ZXJzID0gRjEwSF9OVU1fQ09VTlRFUlM7
Ci0JCWFtZF9jb3VudGVyc19iYXNlID0gTVNSX0s3X1BFUkZDVFIwOwotCQlhbWRfY3RybHNfYmFz
ZSA9IE1TUl9LN19FVk5UU0VMMDsKLQkJYW1kX21zcl9zdGVwID0gMTsKLQkJazdfY291bnRlcnNf
bWlycm9yZWQgPSAwOworCQlhbWRfbnVtX2NvdW50ZXJzID0gRjE1SF9OVU1fQ09VTlRFUlM7CisJ
CWFtZF9jb3VudGVyc19iYXNlID0gTVNSX0YxNUhfUEVSRl9DVFI7CisJCWFtZF9jdHJsc19iYXNl
ID0gTVNSX0YxNUhfUEVSRl9DVEw7CisJCWFtZF9tc3Jfc3RlcCA9IDI7CisJCWs3X2NvdW50ZXJz
X21pcnJvcmVkID0gMTsKIAl9IGVsc2UgewogCQl1aW50MzJfdCBlYXgsIGVieCwgZWN4LCBlZHg7
CiAKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
