From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 2/9] x86: add missing "inline" keyword
Date: Tue, 7 Aug 2018 11:00:45 +0100
Message-ID: <536730a67461cad7ef8253c89db0f29c0e5dba2b.1533636027.git-series.wei.liu2@citrix.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xdgf=kw=citrix.com=prvs=7503460ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fmynQ-000464-Qm
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 10:00:56 +0000
In-Reply-To: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vaW5j
bHVkZS9hc20teDg2L3B2L3RyYXBzLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3B2
L3RyYXBzLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3B2L3RyYXBzLmgKaW5kZXggNzI3OWQxNi4u
ODk5ODVkMSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wdi90cmFwcy5oCisrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvcHYvdHJhcHMuaApAQCAtNDcsNyArNDcsNyBAQCBzdGF0aWMg
aW5saW5lIGJvb2wgcHZfdHJhcF9jYWxsYmFja19yZWdpc3RlcmVkKGNvbnN0IHN0cnVjdCB2Y3B1
ICp2LAogc3RhdGljIGlubGluZSB2b2lkIHB2X3RyYXBfaW5pdCh2b2lkKSB7fQogCiAvKiBEZWxp
dmVyIGludGVycnVwdCB0byBQViBndWVzdC4gUmV0dXJuIDAgb24gc3VjY2Vzcy4gKi8KLXN0YXRp
YyBpbnQgcHZfcmFpc2VfaW50ZXJydXB0KHN0cnVjdCB2Y3B1ICp2LCB1aW50OF90IHZlY3Rvcikg
eyByZXR1cm4gLUVPUE5PVFNVUFA7IH0KK3N0YXRpYyBpbmxpbmUgaW50IHB2X3JhaXNlX2ludGVy
cnVwdChzdHJ1Y3QgdmNwdSAqdiwgdWludDhfdCB2ZWN0b3IpIHsgcmV0dXJuIC1FT1BOT1RTVVBQ
OyB9CiAKIHN0YXRpYyBpbmxpbmUgaW50IHB2X2VtdWxhdGVfcHJpdmlsZWdlZF9vcChzdHJ1Y3Qg
Y3B1X3VzZXJfcmVncyAqcmVncykgeyByZXR1cm4gMDsgfQogc3RhdGljIGlubGluZSB2b2lkIHB2
X2VtdWxhdGVfZ2F0ZV9vcChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykge30KLS0gCmdpdC1z
ZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
