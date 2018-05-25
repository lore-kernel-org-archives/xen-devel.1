From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Fri, 25 May 2018 00:02:44 -0600
Message-ID: <5B07A70402000078001C5D20@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uj/n=im=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fM5oN-00053O-LG
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 06:02:47 +0000
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Simon Gaiser <simon@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2Ugc2hvdWxkIGluZGV4IGFuIEwxIHRhYmxlIHdpdGggYW4gTDEgaW5kZXguCgpSZXBvcnRlZC1i
eTogU2ltb24gR2Fpc2VyIDxzaW1vbkBpbnZpc2libGV0aGluZ3NsYWIuY29tPgpTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MjogRW50aXJlbHkgZGlm
ZmVyZW50LgoKLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4vYXJjaC94ODYv
c21wYm9vdC5jCkBAIC04ODMsNyArODgzLDcgQEAgc3RhdGljIHZvaWQgY2xlYW51cF9jcHVfcm9v
dF9wZ3QodW5zaWduZQogICAgICAgICBsMl9wZ2VudHJ5X3QgKmwydCA9IGwzZV90b19sMmUobDN0
W2wzX3RhYmxlX29mZnNldChzdHViX2xpbmVhcildKTsKICAgICAgICAgbDFfcGdlbnRyeV90ICps
MXQgPSBsMmVfdG9fbDFlKGwydFtsMl90YWJsZV9vZmZzZXQoc3R1Yl9saW5lYXIpXSk7CiAKLSAg
ICAgICAgbDF0W2wyX3RhYmxlX29mZnNldChzdHViX2xpbmVhcildID0gbDFlX2VtcHR5KCk7Cisg
ICAgICAgIGwxdFtsMV90YWJsZV9vZmZzZXQoc3R1Yl9saW5lYXIpXSA9IGwxZV9lbXB0eSgpOwog
ICAgIH0KIH0KIAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
