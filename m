From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] x86: drop "depends on X86" for TBOOT Kconfig
 option
Date: Tue, 19 Mar 2019 13:59:25 +0000
Message-ID: <20190319135925.26005-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yczf=RW=citrix.com=prvs=9744cf058=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h6FH7-0004mB-Qu
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 13:59:29 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2l2ZW4gdGhhdCB0aGlzIGZpbGUgYWxyZWFkeSByZXNpZGVzIHVuZGVyIGFyY2gveDg2LCB0aGVy
ZSBpcyBubyBuZWVkCnRvIGhhdmUgdGhlIGRlcGVuZGVuY3kuCgpTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9LY29uZmlnIHwgMSAt
CiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2L0tjb25maWcKaW5kZXggNWMyZDEwNzBiNi4uNzYzOTNm
ZDIzYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L0tjb25maWcKKysrIGIveGVuL2FyY2gveDg2
L0tjb25maWcKQEAgLTEzMCw3ICsxMzAsNiBAQCBjb25maWcgSFZNX0ZFUAogY29uZmlnIFRCT09U
CiAJZGVmX2Jvb2wgeQogCXByb21wdCAiWGVuIHRib290IHN1cHBvcnQiIGlmIEVYUEVSVCA9ICJ5
IgotCWRlcGVuZHMgb24gWDg2CiAJc2VsZWN0IENSWVBUTwogCS0tLWhlbHAtLS0KIAkgIEFsbG93
cyBzdXBwb3J0IGZvciBUcnVzdGVkIEJvb3QgdXNpbmcgdGhlIEludGVsKFIpIFRydXN0ZWQgRXhl
Y3V0aW9uCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
