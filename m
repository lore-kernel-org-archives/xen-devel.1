From: Juergen Gross <jgross@suse.com>
Subject: [PATCH-for-4.11] xpti: fix bug in double fault handling
Date: Mon, 23 Apr 2018 13:37:02 +0200
Message-ID: <20180423113702.11000-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhva=hm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fAZmM-0008N1-TK
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 11:37:06 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, andrew.cooper3@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

V2hlbiBlbnRlcmluZyB0aGUgaHlwZXJ2aXNvciB2aWEgdGhlIGRvdWJsZSBmYXVsdCBoYW5kbGVy
IHJlc2V0dGluZwp4ZW5fY3IzIHdhcyBtaXNzaW5nLiBUaGlzIGxlZCB0byBzd2l0Y2hpbmcgdG8g
cHZfY3IzIHdoZW4gcmV0dXJuaW5nCmZyb20gdGhlIG5leHQgZm9sbG93aW5nIGludGVycnVwdCwg
ZS5nLiBhZnRlciByZS1lbmFibGluZyBpbnRlcnJ1cHRzCmluIG1hY2hpbmVfcmVzdGFydCgpLgoK
U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHRvb2xz
L2Zpcm13YXJlL3hlbi1kaXIvc2hpbS5jb25maWcgfCAyICstCiB4ZW4vYXJjaC94ODYveDg2XzY0
L2VudHJ5LlMgICAgICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvc2hpbS5j
b25maWcgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL3NoaW0uY29uZmlnCmluZGV4IDRkNTYzMGY4
N2EuLjBiOWUwMDE0MzYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvc2hpbS5j
b25maWcKKysrIGIvdG9vbHMvZmlybXdhcmUveGVuLWRpci9zaGltLmNvbmZpZwpAQCAtMSw2ICsx
LDYgQEAKICMKICMgQXV0b21hdGljYWxseSBnZW5lcmF0ZWQgZmlsZTsgRE8gTk9UIEVESVQuCi0j
IFhlbi94ODYgNC4xMS11bnN0YWJsZSBDb25maWd1cmF0aW9uCisjIFhlbi94ODYgNC4xMS1yYyBD
b25maWd1cmF0aW9uCiAjCiBDT05GSUdfWDg2XzY0PXkKIENPTkZJR19YODY9eQpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TIGIveGVuL2FyY2gveDg2L3g4Nl82NC9lbnRy
eS5TCmluZGV4IDQ1ZDk4NDJkMDkuLmQxMmZiY2I1NWQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni94ODZfNjQvZW50cnkuUworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMKQEAgLTc3
Miw2ICs3NzIsNyBAQCBFTlRSWShkb3VibGVfZmF1bHQpCiAgICAgICAgIGpucyAgIC5MZGJsZl9j
cjNfbG9hZAogICAgICAgICBuZWcgICAlcmJ4CiAuTGRibGZfY3IzX2xvYWQ6CisgICAgICAgIG1v
dnEgJDAsIFNUQUNLX0NQVUlORk9fRklFTEQoeGVuX2NyMykoJXIxNCkKICAgICAgICAgbW92ICAg
JXJieCwgJWNyMwogLkxkYmxmX2NyM19va2F5OgogCi0tIAoyLjEzLjYKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
