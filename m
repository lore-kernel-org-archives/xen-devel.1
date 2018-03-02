From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86: invpcid support
Date: Fri, 2 Mar 2018 17:03:15 +0000
Message-ID: <20180302170315.4k5ffq7asq2kxe4x@citrix.com>
References: <20180302162338.21772-1-wei.liu2@citrix.com>
 <5A998E4102000078001ADFF4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lugh=fy=citrix.com=prvs=592fbcc37=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ero5X-0003nw-Dt
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 17:03:19 +0000
Content-Disposition: inline
In-Reply-To: <5A998E4102000078001ADFF4@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDIsIDIwMTggYXQgMDk6NDc6NDVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAyLjAzLjE4IGF0IDE3OjIzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiArc3RhdGljIGlubGluZSB2b2lkIGludnBjaWQodW5zaWduZWQgaW50IHBjaWQsIHVu
c2lnbmVkIGxvbmcgYWRkciwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgdHlwZSkKPiA+ICt7Cj4gPiArICAgIHN0cnVjdCB7Cj4gPiArICAgICAgICB1aW50NjRf
dCBwY2lkOjEyOwo+ID4gKyAgICAgICAgdWludDY0X3QgcmVzZXJ2ZWQ6NTI7Cj4gPiArICAgICAg
ICB1aW50NjRfdCBhZGRyOwo+ID4gKyAgICB9IGRlc2MgPSB7IC5wY2lkID0gcGNpZCwgLmFkZHIg
PSBhZGRyIH07Cj4gPiArCj4gPiArICAgIGFzbSB2b2xhdGlsZSAoCj4gPiArI2lmZGVmIEhBVkVf
QVNfSU5WUENJRAo+ID4gKyAgICAgICAgICAgICAgICAgICJpbnZwY2lkICVbZGVzY10sICVxW3R5
cGVdIgo+ID4gKyAgICAgICAgICAgICAgICAgIDogLyogTm8gb3V0cHV0ICovCj4gPiArICAgICAg
ICAgICAgICAgICAgOiBbZGVzY10gIm0iIChkZXNjKSwgW3R5cGVdICJyIiAodHlwZSkKPiA+ICsj
ZWxzZQo+ID4gKyAgICAgICAgICAgICAgICAgIElOVlBDSURfT1BDT0RFIE1PRFJNX0VDWF8wMQo+
ID4gKyAgICAgICAgICAgICAgICAgIDogLyogTm8gb3V0cHV0ICovCj4gPiArICAgICAgICAgICAg
ICAgICAgOiAiYSIgKHR5cGUpLCAiYyIgKCZkZXNjKQo+ID4gKyNlbmRpZgo+ID4gKyAgICAgICAg
ICAgICAgICAgIDogIm1lbW9yeSIgKTsKPiAKPiBJIGNhbiBzZWUgd2h5IHlvdSBuZWVkIHRoZSBt
ZW1vcnkgY2xvYmJlciBpbiB0aGUgI2Vsc2UgY2FzZQo+IChhbGJlaXQgZXZlbiB0aGVyZSBpdCBj
b3VsZCBiZSBhdm9pZGVkIGJ5IGFsc28gcHJvcGVybHkgc3BlY2lmeWluZwo+IHRoZSBpbnB1dCks
IGJ1dCB3aGF0IGlzIHRoaXMgZ29vZCBmb3IgaW4gdGhlICNpZiBjYXNlPwoKSXQgaXMgdGhlIHNh
bWUgYXMgd2h5IHdyaXRpbmcgdG8gQ1IzIHJlcXVpcmVzIGEgbWVtb3J5IGNsb2JiZXIuIEl0IGlz
CmZsdXNoaW5nIFRMQi4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
