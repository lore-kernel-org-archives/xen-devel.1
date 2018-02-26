From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/PV: fix off-by-one in I/O bitmap limit check
Date: Mon, 26 Feb 2018 00:38:11 -0700
Message-ID: <5A93C77302000078001AB8CB@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=uzez=fu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eqDMc-0004o8-Fl
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 07:38:22 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVu
L2FyY2gveDg2L3B2L2VtdWwtcHJpdi1vcC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLXBy
aXYtb3AuYwpAQCAtMTM2LDcgKzEzNiw3IEBAIHN0YXRpYyBib29sIGd1ZXN0X2lvX29rYXkodW5z
aWduZWQgaW50IHAKICAgICBpZiAoIGlvcGxfb2sodiwgcmVncykgKQogICAgICAgICByZXR1cm4g
dHJ1ZTsKIAotICAgIGlmICggdi0+YXJjaC5wdl92Y3B1LmlvYm1wX2xpbWl0ID4gKHBvcnQgKyBi
eXRlcykgKQorICAgIGlmICggdi0+YXJjaC5wdl92Y3B1LmlvYm1wX2xpbWl0ID49IChwb3J0ICsg
Ynl0ZXMpICkKICAgICB7CiAgICAgICAgIHVuaW9uIHsgdWludDhfdCBieXRlc1syXTsgdWludDE2
X3QgbWFzazsgfSB4OwogCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
