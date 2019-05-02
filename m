From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 1/9] x86: adjust cr3_pcid() return type
Date: Thu, 02 May 2019 06:18:42 -0600
Message-ID: <5CCAE022020000780022B2E5@prv1-mh.provo.novell.com>
References: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMAfs-0004Nm-2Y
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:18:52 +0000
In-Reply-To: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUncyBubyBuZWVkIGZvciBpdCB0byBiZSA2NCBiaXRzIHdpZGUgLSBvbmx5IHRoZSBsb3cg
dHdlbHZlIGJpdHMKb2YgQ1IzIGhvbGQgdGhlIFBDSUQuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYwor
KysgYi94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYwpAQCAtMTAzLDcgKzEwMyw4IEBAIHN0YXRpYyB2
b2lkIGRvX3RsYl9mbHVzaCh2b2lkKQogCiB2b2lkIHN3aXRjaF9jcjNfY3I0KHVuc2lnbmVkIGxv
bmcgY3IzLCB1bnNpZ25lZCBsb25nIGNyNCkKIHsKLSAgICB1bnNpZ25lZCBsb25nIGZsYWdzLCBv
bGRfY3I0LCBvbGRfcGNpZDsKKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzLCBvbGRfY3I0OworICAg
IHVuc2lnbmVkIGludCBvbGRfcGNpZDsKICAgICB1MzIgdDsKIAogICAgIC8qIFRoaXMgbm9uLXJl
ZW50cmFudCBmdW5jdGlvbiBpcyBzb21ldGltZXMgY2FsbGVkIGluIGludGVycnVwdCBjb250ZXh0
LiAqLwotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvcHJvY2Vzc29yLmgKQEAgLTI5Miw3ICsyOTIsNyBAQCBzdGF0aWMgaW5saW5l
IHVuc2lnbmVkIGxvbmcgY3IzX3BhKHVuc2lnCiAgICAgcmV0dXJuIGNyMyAmIFg4Nl9DUjNfQURE
Ul9NQVNLOwogfQogCi1zdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgY3IzX3BjaWQodW5zaWdu
ZWQgbG9uZyBjcjMpCitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBjcjNfcGNpZCh1bnNpZ25l
ZCBsb25nIGNyMykKIHsKICAgICByZXR1cm4gY3IzICYgWDg2X0NSM19QQ0lEX01BU0s7CiB9CgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
