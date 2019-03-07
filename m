From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 2/2] x86/mtrr: fix build with gcc9
Date: Thu, 07 Mar 2019 03:32:12 -0700
Message-ID: <5C80F32C020000780021C626@prv1-mh.provo.novell.com>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1qK3-0000a2-HI
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 10:32:19 +0000
In-Reply-To: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
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
Cc: Charles Arnold <CARNOLD@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Z2VuZXJpYy5jOiBJbiBmdW5jdGlvbiDigJhwcmludF9tdHJyX3N0YXRl4oCZOgpnZW5lcmljLmM6
MjEwOjExOiBlcnJvcjog4oCYJTAqbHjigJkgZGlyZWN0aXZlIG91dHB1dCBiZXR3ZWVuIDEgYW5k
IDEwNzM3NDE4MjMgYnl0ZXMgbWF5IGNhdXNlIHJlc3VsdCB0byBleGNlZWQK4oCYSU5UX01BWOKA
mSBbLVdlcnJvcj1mb3JtYXQtb3ZlcmZsb3c9XQogIDIxMCB8ICAgIHByaW50aygiJXMgICV1IGJh
c2UgJTAqIlBSSXg2NCIwMDAgbWFzayAlMCoiUFJJeDY0IjAwMCAlc1xuIiwKICAgICAgfCAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fn4KZ2VuZXJpYy5jOjIxMDo0NDogbm90ZTogZm9ybWF0IHN0
cmluZyBpcyBkZWZpbmVkIGhlcmUKICAyMTAgfCAgICBwcmludGsoIiVzICAldSBiYXNlICUwKiJQ
Ukl4NjQiMDAwIG1hc2sgJTAqIlBSSXg2NCIwMDAgJXNcbiIsCmdlbmVyaWMuYzoyMTA6MTE6IG5v
dGU6IGRpcmVjdGl2ZSBhcmd1bWVudCBpbiB0aGUgcmFuZ2UgWzAsIDQ1MDM1OTk2MjczNzA0OTVd
CiAgMjEwIHwgICAgcHJpbnRrKCIlcyAgJXUgYmFzZSAlMCoiUFJJeDY0IjAwMCBtYXNrICUwKiJQ
Ukl4NjQiMDAwICVzXG4iLAogICAgICB8ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgpnZW5l
cmljLmM6MjEwOjExOiBub3RlOiBhc3N1bWluZyBkaXJlY3RpdmUgb3V0cHV0IG9mIDEgYnl0ZQoK
UmVzdHJpY3QgdGhlIHdpZHRoIG9mIHRoZSB2YXJpYWJsZSAid2lkdGgiIGNvbnRyb2xsaW5nIHRo
ZSBudW1iZXIgb2YKYWRkcmVzcyBkaWdpdHMgb3V0cHV0LgoKUmVwb3J0ZWQtYnk6IENoYXJsZXMg
QXJub2xkIDxjYXJub2xkQHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvY3B1L210cnIvZ2VuZXJpYy5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9jcHUvbXRyci9nZW5lcmljLmMKQEAgLTE4Miw3ICsxODIsNyBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgcHJpbnRfZml4ZWQodW5zaWduZWQKIHN0YXRpYyB2b2lkIF9faW5p
dCBwcmludF9tdHJyX3N0YXRlKGNvbnN0IGNoYXIgKmxldmVsKQogewogCXVuc2lnbmVkIGludCBp
OwotCWludCB3aWR0aDsKKwl1bnNpZ25lZCBjaGFyIHdpZHRoOyAvKiBnY2M5IGRvZXNuJ3QgbGlr
ZSBwbGFpbiAiaW50IiBoZXJlICovCiAKIAlwcmludGsoIiVzTVRSUiBkZWZhdWx0IHR5cGU6ICVz
XG4iLCBsZXZlbCwKIAkgICAgICAgbXRycl9hdHRyaWJfdG9fc3RyKG10cnJfc3RhdGUuZGVmX3R5
cGUpKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
