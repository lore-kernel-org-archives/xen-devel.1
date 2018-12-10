From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul: refine VME/PVI early #GP check
Date: Mon, 10 Dec 2018 04:32:15 -0700
Message-ID: <5C0E4EBF02000078002049C8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gWJnS-0006Uu-Uk
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 11:32:22 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW4gY29tbWl0IGVmZTljYmE2NmMgKCJ4ODZlbXVsOiBWTUUgYW5kIFBWSSBtb2RlcyByZXF1aXJl
IGEgI0dQKDApIGNoZWNrCmZpcnN0IHRoaW5nIikgSSBuZWdsZWN0ZWQgdGhlIGZhY3QgdGhhdCB0
aGUgcmV0aXJlIGZsYWdzIGdldCB6YXBwZWQgb25seQppbiB4ODZfZGVjb2RlKCksIHdoaWNoIGhh
c24ndCBiZWVuIGludm9rZWQgeWV0IGF0IHRoZSBwb2ludCBvZiB0aGUgI0dQKDApCmNoZWNrIGFk
ZGVkLgoKQWhlYWQgb2YgdGhlIG90aGVyIGV4cGxpY2l0IHJldHVybiAocmF0aGVyIHRoYW4gImdv
dG8iKSBwYXRoIHVzZSBhbgpleHBsaWNpdCByZXR1cm4gaGVyZSB0b28sIHRvIG1ha2UgdGhlIGZs
b3cgbW9yZSBvYnZpb3VzLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKKysr
IGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKQEAgLTM0MDAsMTAgKzM0
MDAsMTUgQEAgeDg2X2VtdWxhdGUoCiAKICAgICBBU1NFUlQob3BzLT5yZWFkKTsKIAotICAgIGdl
bmVyYXRlX2V4Y2VwdGlvbl9pZigobW9kZV92aWYoKSAmJgotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKF9yZWdzLmVmbGFncyAmIFg4Nl9FRkxBR1NfVklGKSAmJgotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKF9yZWdzLmVmbGFncyAmIFg4Nl9FRkxBR1NfVklQKSksCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgIEVYQ19HUCwgMCk7CisgICAgaWYgKCB1bmxpa2VseShtb2RlX3ZpZigp
KSAmJgorICAgICAgICAgKF9yZWdzLmVmbGFncyAmIFg4Nl9FRkxBR1NfVklGKSAmJgorICAgICAg
ICAgKF9yZWdzLmVmbGFncyAmIFg4Nl9FRkxBR1NfVklQKSApCisgICAgeworICAgICAgICB4ODZf
ZW11bF9od19leGNlcHRpb24oRVhDX0dQLCAwLCBjdHh0KTsKKyAgICAgICAgLyogeDg2X2RlY29k
ZSgpIHdhcyBub3QgY2FsbGVkIHlldC4gKi8KKyAgICAgICAgY3R4dC0+cmV0aXJlLnJhdyA9IDA7
CisgICAgICAgIHJldHVybiBYODZFTVVMX0VYQ0VQVElPTjsKKyAgICB9CiAKICAgICByYyA9IHg4
Nl9kZWNvZGUoJnN0YXRlLCBjdHh0LCBvcHMpOwogICAgIGlmICggcmMgIT0gWDg2RU1VTF9PS0FZ
ICkKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
