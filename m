From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v4 09/20] x86emul: adjust_bnd() should check XCR0
Date: Wed, 28 Feb 2018 06:04:00 -0700
Message-ID: <5A96B6D002000078001ACBD0@prv-mh.provo.novell.com>
References: <5A96B3B902000078001ACB6D@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ets7=fw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1er1Oz-00024Y-Dw
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 13:04:09 +0000
In-Reply-To: <5A96B3B902000078001ACB6D@prv-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RXhwZXJpbWVudGFsbHkgTVBYIGluc3RydWN0aW9ucyBoYXZlIGJlZW4gY29uZmlybWVkIHRvIGJl
aGF2ZSBhcyBOT1BzCnVubGVzcyBib3RoIHJlbGF0ZWQgWENSMCBiaXRzIGFyZSBzZXQgdG8gMS4g
QnkgaW1wbGljYXRpb24gYnJhbmNoZXMKdGhlbiBhbHNvIGRvbid0IGNsZWFyIEJORG4uCgpTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KdjQ6IFJlLWJhc2Ug
b3ZlciBYU1RBVEVfKiByZW5hbWluZy4KCi0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94
ODZfZW11bGF0ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5j
CkBAIC0yMTYxLDEyICsyMTYxLDE2IEBAIHN0YXRpYyBib29sIHVtaXBfYWN0aXZlKHN0cnVjdCB4
ODZfZW11bGEKIHN0YXRpYyB2b2lkIGFkanVzdF9ibmQoc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQg
KmN0eHQsCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB4ODZfZW11bGF0ZV9v
cHMgKm9wcywgZW51bSB2ZXhfcGZ4IHBmeCkKIHsKLSAgICB1aW50NjRfdCBibmRjZmc7CisgICAg
dWludDY0X3QgeGNyMCwgYm5kY2ZnOwogICAgIGludCByYzsKIAogICAgIGlmICggcGZ4ID09IHZl
eF9mMiB8fCAhY3B1X2hhc19tcHggfHwgIXZjcHVfaGFzX21weCgpICkKICAgICAgICAgcmV0dXJu
OwogCisgICAgaWYgKCAhb3BzLT5yZWFkX3hjciB8fCBvcHMtPnJlYWRfeGNyKDAsICZ4Y3IwLCBj
dHh0KSAhPSBYODZFTVVMX09LQVkgfHwKKyAgICAgICAgICEoeGNyMCAmIFg4Nl9YQ1IwX0JORFJF
R1MpIHx8ICEoeGNyMCAmIFg4Nl9YQ1IwX0JORENTUikgKQorICAgICAgICByZXR1cm47CisKICAg
ICBpZiAoICFtb2RlX3JpbmcwKCkgKQogICAgICAgICBibmRjZmcgPSByZWFkX2JuZGNmZ3UoKTsK
ICAgICBlbHNlIGlmICggIW9wcy0+cmVhZF9tc3IgfHwKCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
