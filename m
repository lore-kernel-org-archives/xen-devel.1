From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/XPTI: fix S3 resume (and CPU
 offlining in general)
Date: Fri, 25 May 2018 11:25:29 +0100
Message-ID: <1deb4ba9-85df-1ac6-5a73-281324155a01@citrix.com>
References: <5B07A70402000078001C5D20@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j+m0=im=citrix.com=prvs=676bf93bc=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fM9ue-0000eE-1p
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 10:25:32 +0000
In-Reply-To: <5B07A70402000078001C5D20@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Simon Gaiser <simon@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDUvMTggMDc6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdlIHNob3VsZCBpbmRleCBh
biBMMSB0YWJsZSB3aXRoIGFuIEwxIGluZGV4Lgo+Cj4gUmVwb3J0ZWQtYnk6IFNpbW9uIEdhaXNl
ciA8c2ltb25AaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpJbmRlZWQgd2Ugc2hvdWxkLgoKUmV2aWV3ZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+LCBhbmQgSSd2ZSBnb3Qg
YQpmb2xsb3d1cCBwYXRjaCB0byBmaXggc29tZSBzdGFsZSBjb21tZW50cy4KCj4gLS0tCj4gdjI6
IEVudGlyZWx5IGRpZmZlcmVudC4KPgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPiAr
KysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4gQEAgLTg4Myw3ICs4ODMsNyBAQCBzdGF0aWMg
dm9pZCBjbGVhbnVwX2NwdV9yb290X3BndCh1bnNpZ25lCj4gICAgICAgICAgbDJfcGdlbnRyeV90
ICpsMnQgPSBsM2VfdG9fbDJlKGwzdFtsM190YWJsZV9vZmZzZXQoc3R1Yl9saW5lYXIpXSk7Cj4g
ICAgICAgICAgbDFfcGdlbnRyeV90ICpsMXQgPSBsMmVfdG9fbDFlKGwydFtsMl90YWJsZV9vZmZz
ZXQoc3R1Yl9saW5lYXIpXSk7Cj4gIAo+IC0gICAgICAgIGwxdFtsMl90YWJsZV9vZmZzZXQoc3R1
Yl9saW5lYXIpXSA9IGwxZV9lbXB0eSgpOwo+ICsgICAgICAgIGwxdFtsMV90YWJsZV9vZmZzZXQo
c3R1Yl9saW5lYXIpXSA9IGwxZV9lbXB0eSgpOwo+ICAgICAgfQo+ICB9Cj4gIAo+Cj4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
