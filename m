From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 19/34] x86: check HVM before trying to get
 ioreq server
Date: Mon, 20 Aug 2018 07:08:47 -0600
Message-ID: <5B7ABD5F02000078001E0126@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <d892728cb6705be384a48eb6d0e4de3ded2e4ed6.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jmcq=ld=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1frjvR-0001gf-1w
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 13:08:53 +0000
In-Reply-To: <d892728cb6705be384a48eb6d0e4de3ded2e4ed6.1534518694.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L21tLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+IEBAIC00
MzgyLDYgKzQzODIsMTAgQEAgaW50IGFyY2hfYWNxdWlyZV9yZXNvdXJjZShzdHJ1Y3QgZG9tYWlu
ICpkLCB1bnNpZ25lZCBpbnQgdHlwZSwKPiAgICAgICAgICB1bnNpZ25lZCBpbnQgaTsKPiAgCj4g
ICAgICAgICAgcmMgPSAtRUlOVkFMOwo+ICsgICAgICAgIGlmICggIWlzX2h2bV9kb21haW4oZCkg
KQo+ICsgICAgICAgICAgICBicmVhazsKPiArCj4gKyAgICAgICAgcmMgPSAtRUlOVkFMOwo+ICAg
ICAgICAgIGlmICggaWQgIT0gKHVuc2lnbmVkIGludClpb3NlcnZpZCApCj4gICAgICAgICAgICAg
IGJyZWFrOwoKSSB0aGluayB0aGUgZW50aXJlIGNhc2UgYmxvY2sgd2FzIGJldHRlciB3cmFwcGVk
IGluIGFuICNpZmRlZiwgc28gdGhhdAp3aXRoIG5vIEhWTSBzdXBwb3J0IGV4ZWN1dGlvbiB3b3Vs
ZCBmYWxsIGludG8gZGVmYXVsdDogaW5zdGVhZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
