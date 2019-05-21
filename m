From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 26/50] x86emul: support remaining
 AVX512BW legacy-equivalent insns
Date: Tue, 21 May 2019 14:08:27 +0100
Message-ID: <3ff5b0e5-fca3-3c86-5be4-4eeadf43a9dd@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8482020000780021F217@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6u0k=TV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hT4VV-00027W-C8
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 13:08:41 +0000
In-Reply-To: <5C8B8482020000780021F217@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxMDo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLS0tIGEveGVuL2FyY2gv
eDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPiArKysgYi94ZW4vYXJjaC94ODYveDg2X2Vt
dWxhdGUveDg2X2VtdWxhdGUuYwo+IEBAIC00MzUsNyArNDM1LDEwIEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZXh0MGYzOF90YWJsZSB7Cj4gICAgICBkaXNwOHNjYWxlX3QgZDhzOjQ7Cj4gIH0gZXh0
MGYzOF90YWJsZVsyNTZdID0gewo+ICAgICAgWzB4MDBdID0geyAuc2ltZF9zaXplID0gc2ltZF9w
YWNrZWRfaW50LCAuZDhzID0gZDhzX3ZsIH0sCj4gLSAgICBbMHgwMSAuLi4gMHgwYl0gPSB7IC5z
aW1kX3NpemUgPSBzaW1kX3BhY2tlZF9pbnQgfSwKPiArICAgIFsweDAxIC4uLiAweDAzXSA9IHsg
LnNpbWRfc2l6ZSA9IHNpbWRfcGFja2VkX2ludCB9LAo+ICsgICAgWzB4MDRdID0geyAuc2ltZF9z
aXplID0gc2ltZF9wYWNrZWRfaW50LCAuZDhzID0gZDhzX3ZsIH0sCj4gKyAgICBbMHgwNSAuLi4g
MHgwYl0gPSB7IC5zaW1kX3NpemUgPSBzaW1kX3BhY2tlZF9pbnQgfSwKPiArICAgIFsweDBiXSA9
IHsgLnNpbWRfc2l6ZSA9IHNpbWRfcGFja2VkX2ludCwgLmQ4cyA9IGQ4c192bCB9LAoKSXQgZG9l
c24ndCBsb29rIGFzIGlmIHlvdSBtZWFuIDB4MGIgdHdpY2UgaGVyZSwgYWx0aG91Z2ggaXRzIHF1
aXRlCnBvc3NpYmxlIHRoYXQgR0NDIGVsaWRlcyBpdCBzaWxlbnRseSAoQ2xhbmcgZGVmaW5pdGVs
eSB3b24ndCkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
