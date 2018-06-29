From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/spec-ctrl: "no-xen" should not imply
 "no-eager-fpu"
Date: Fri, 29 Jun 2018 06:52:00 -0600
Message-ID: <5B362B7002000078001CF218@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gccx=jp=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fYssd-0007UN-8s
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 12:52:03 +0000
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

IkVhZ2VyIEZQVSIgbW9kZSBpcyB0byBndWFyZCBndWVzdHMsIG5vdCBYZW4gaXRzZWxmLCBhcyBp
cyBhbHNvCmV4cHJlc3NlZCBieSBwcmludF9kZXRhaWxzKCkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvc3BlY19jdHJs
LmMKKysrIGIveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jCkBAIC0xMjQsNiArMTI0LDggQEAgc3Rh
dGljIGludCBfX2luaXQgcGFyc2Vfc3BlY19jdHJsKGNvbnN0CiAgICAgICAgICAgICBvcHRfbXNy
X3NjX3B2ID0gZmFsc2U7CiAgICAgICAgICAgICBvcHRfbXNyX3NjX2h2bSA9IGZhbHNlOwogCisg
ICAgICAgICAgICBvcHRfZWFnZXJfZnB1ID0gMDsKKwogICAgICAgICBkaXNhYmxlX2NvbW1vbjoK
ICAgICAgICAgICAgIG9wdF9yc2JfcHYgPSBmYWxzZTsKICAgICAgICAgICAgIG9wdF9yc2JfaHZt
ID0gZmFsc2U7CkBAIC0xMzEsNyArMTMzLDYgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2Vfc3Bl
Y19jdHJsKGNvbnN0CiAgICAgICAgICAgICBvcHRfdGh1bmsgPSBUSFVOS19KTVA7CiAgICAgICAg
ICAgICBvcHRfaWJycyA9IDA7CiAgICAgICAgICAgICBvcHRfaWJwYiA9IGZhbHNlOwotICAgICAg
ICAgICAgb3B0X2VhZ2VyX2ZwdSA9IDA7CiAgICAgICAgIH0KICAgICAgICAgZWxzZSBpZiAoIHZh
bCA+IDAgKQogICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
