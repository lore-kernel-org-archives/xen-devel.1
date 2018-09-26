From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul: fix test harness build after e8dfbc2962
Date: Wed, 26 Sep 2018 02:03:36 -0600
Message-ID: <5BAB3D5802000078001EC00C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=an3h=mi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g54nL-0003gv-8Z
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 08:03:39 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgd2FzIGFub3RoZXIgc3RkaW8uaCBpbmNsdXNpb24gbGVmdCBpbiBwbGFjZS4gUmUtb3Jk
ZXIgI2luY2x1ZGUtcwphbHRvZ2V0aGVyIGluIHRlc3RfeDg2X2VtdWxhdG9yLmMuCgpTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS90b29scy90ZXN0
cy94ODZfZW11bGF0b3IvdGVzdF94ODZfZW11bGF0b3IuYworKysgYi90b29scy90ZXN0cy94ODZf
ZW11bGF0b3IvdGVzdF94ODZfZW11bGF0b3IuYwpAQCAtMSwxMCArMSwxMCBAQAotI2luY2x1ZGUg
PGVycm5vLmg+Ci0jaW5jbHVkZSA8bGltaXRzLmg+Ci0jaW5jbHVkZSA8c3RkaW8uaD4KLSNpbmNs
dWRlIDxzeXMvbW1hbi5oPgotCiAjaW5jbHVkZSAieDg2LWVtdWxhdGUuaCIKIAorI2luY2x1ZGUg
PGVycm5vLmg+CisjaW5jbHVkZSA8bGltaXRzLmg+CisjaW5jbHVkZSA8c3RkaW8uaD4KKyNpbmNs
dWRlIDxzeXMvbW1hbi5oPgorCiBhc20gKCAiLnB1c2hzZWN0aW9uIC50ZXN0LCBcImF4XCIsIEBw
cm9nYml0czsgLnBvcHNlY3Rpb24iICk7CiAKICNpbmNsdWRlICJibG93ZmlzaC5oIgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
