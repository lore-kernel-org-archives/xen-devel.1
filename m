From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/2] tools: add new xl command get-config
 for getting hypervisor config
Date: Thu, 17 Jan 2019 15:12:50 +0000
Message-ID: <20190117151250.63mbb3pgs56ztxop@zion.uk.xensource.com>
References: <20190117145722.30311-1-jgross@suse.com>
 <20190117145722.30311-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bbbE=PZ=citrix.com=prvs=9134cd51d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gk9Lj-0002p5-8b
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 15:12:55 +0000
Content-Disposition: inline
In-Reply-To: <20190117145722.30311-3-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTcsIDIwMTkgYXQgMDM6NTc6MjJQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBBZGQgICBuZXcgc3ViY29tbWFuZCAiZ2V0LWNvbmZpZyIgdG8geGwgY29uZmlnIHRv
IHByaW50IHRoZSBoeXBlcnZpc29yCj4gLmNvbmZpZyBmaWxlLgoKSSBzbGlnaHQgcHJlZmVyIGdl
dC14ZW4tY29uZmlnIG9yIGdldC1oeXBlcnZpc29yLWNvbmZpZy4KCj4gCj4gVG8gYmUgYWJsZSB0
byByZXVzZSBhbHJlYWR5IGV4aXN0aW5nIGRlY29tcHJlc3NpbmcgY29kZSBpbiBsaWJ4ZW5ndWVz
dAo+IHhjX2luZmxhdGVfYnVmZmVyKCkgaGFzIHRvIGJlIG1vdmVkIHRvIGxpYnhlbmd1ZXN0Lmgu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpbLi4u
XQo+ICAKPiAraW50IGxpYnhsX2dldF9jb25maWcobGlieGxfY3R4ICpjdHgsIGNoYXIgKipidWZm
ZXIpCj4gK3sKPiArICAgIGludCByZXQ7Cj4gKyAgICB1bnNpZ25lZCBsb25nIGd6X3NpemUsIG91
dF9zaXplOwo+ICsgICAgY2hhciAqZ3pfYnVmZmVyOwo+ICsgICAgR0NfSU5JVChjdHgpOwo+ICsK
PiArICAgIHJldCA9IHhjX2dldF9jb25maWcoY3R4LT54Y2gsICZnel9idWZmZXIsICZnel9zaXpl
KTsKPiArICAgIGlmIChyZXQgPCAwKSB7Cj4gKyAgICAgICAgTE9HRVYoRVJST1IsIHJldCwgImdl
dHRpbmcgY29uZmlnIik7Cj4gKyAgICAgICAgR0NfRlJFRTsKPiArICAgICAgICByZXR1cm4gRVJS
T1JfRkFJTDsKPiArICAgIH0KPiArCj4gKyAgICAqYnVmZmVyID0geGNfaW5mbGF0ZV9idWZmZXIo
Y3R4LT54Y2gsIGd6X2J1ZmZlciwgZ3pfc2l6ZSwgJm91dF9zaXplKTsKPiArCj4gKyAgICBHQ19G
UkVFOwoKUGxlYXNlIG1vdmUgdGhpcyB0byB0aGUgZW5kIG9mIHRoZSBmdW5jdGlvbiBhbmQgLi4u
Cgo+ICsgICAgZnJlZShnel9idWZmZXIpOwo+ICsKPiArICAgIGlmICghKmJ1ZmZlcikgewo+ICsg
ICAgICAgIExPR0UoRVJST1IsICJkZWNvbXByZXNzaW5nIGNvbmZpZyBkYXRhIGZhaWxlZCIpOwo+
ICsgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOwoKLi4uIHVzZSBnb3RvIHN0eWxlIGluc3RlYWQu
CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
