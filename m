From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 2/2] x86/AMD: limit C1E disable family range
Date: Fri, 05 Apr 2019 08:27:04 -0600
Message-ID: <5CA765B80200007800224E6D@prv1-mh.provo.novell.com>
References: <5CA75E460200007800224E23@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCPoE-0007WS-0o
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 14:27:10 +0000
In-Reply-To: <5CA75E460200007800224E23@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SnVzdCBsaWtlIGZvciBvdGhlciBmYW1pbHkgdmFsdWVzIG9mIDB4MTcgKHNlZSAieDg2L0FNRDog
Y29ycmVjdCBjZXJ0YWluCkZhbTE3IGNoZWNrcyIpLCBjb21taXQgMzE1N2JiNGUxMyAoIkFkZCBN
U1Igc3VwcG9ydCBmb3IgdmFyaW91cyBmZWF0dXJlCkFNRCBwcm9jZXNzb3IgZmFtaWxpZXMiKSBt
YWRlIHRoZSBvcmlnaW5hbCBjaGVjayBmb3IgRmFtMTEgaGVyZSBpbmNsdWRlCmZhbWlsaWVzIGFs
bCB0aGUgd2F5IHVwIHRvIEZhbTE3LiBUaGUgaW52b2x2ZWQgTVNSICgweEMwMDEwMDU1KSwKaG93
ZXZlciwgaXMgZnVsbHkgcmVzZXJ2ZWQgc3RhcnRpbmcgZnJvbSBGYW0xNiwgYW5kIHRoZSB0d28g
Yml0cyBvZgppbnRlcmVzdCBhcmUgcmVzZXJ2ZWQgZm9yIEZhbTEyIGFuZCBvbndhcmRzIChhbGJl
aXQgSSBhZG1pdCBJIHdhc24ndAphYmxlIHRvIGZpbmQgYW55IEZhbTEzIGRvYykuIFJlc3RvcmUg
dGhlIHVwcGVyIGJvdW5kIHRvIGJlIEZhbTExLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IE5ldy4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUv
YW1kLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwpAQCAtNjI4LDcgKzYyOCw3IEBAIHN0
YXRpYyB2b2lkIGluaXRfYW1kKHN0cnVjdCBjcHVpbmZvX3g4NgogCiAJc3dpdGNoKGMtPng4NikK
IAl7Ci0JY2FzZSAweGYgLi4uIDB4MTc6CisJY2FzZSAweGYgLi4uIDB4MTE6CiAJCWRpc2FibGVf
YzFlKE5VTEwpOwogCQlpZiAoYWNwaV9zbWlfY21kICYmIChhY3BpX2VuYWJsZV92YWx1ZSB8IGFj
cGlfZGlzYWJsZV92YWx1ZSkpCiAJCQlhbWRfYWNwaV9jMWVfcXVpcmsgPSB0cnVlOwoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
