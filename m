From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 4/5] libxc/pvh: set default MTRR type to
 write-back
Date: Mon, 14 May 2018 17:42:53 +0100
Message-ID: <20180514164252.xxesskz23rvirg6b@citrix.com>
References: <20180510171505.37309-1-roger.pau@citrix.com>
 <20180510171505.37309-5-roger.pau@citrix.com>
 <20180514160051.uf3idifgc4n6p7wl@citrix.com>
 <20180514160247.fyvfgu3hstupexe5@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zpky=ib=citrix.com=prvs=66564b2c0=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fIGZO-0000OJ-43
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 16:43:30 +0000
Content-Disposition: inline
In-Reply-To: <20180514160247.fyvfgu3hstupexe5@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMTQsIDIwMTggYXQgMDU6MDI6NDdQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIE1heSAxNCwgMjAxOCBhdCAwNTowMDo1MVBNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgMTAsIDIwMTggYXQgMDY6MTU6MDRQTSArMDEwMCwg
Um9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiBAQCAtMTAxNCw2ICsxMDM0LDMwIEBAIHN0YXRp
YyBpbnQgdmNwdV9odm0oc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQo+ID4gPiAgICAgIGlmICgg
ZG9tLT5zdGFydF9pbmZvX3NlZy5wZm4gKQo+ID4gPiAgICAgICAgICBic3BfY3R4LmNwdS5yYngg
PSBkb20tPnN0YXJ0X2luZm9fc2VnLnBmbiA8PCBQQUdFX1NISUZUOwo+ID4gPiAgCj4gPiA+ICsg
ICAgLyogU2V0IHRoZSBNVFJSLiAqLwo+ID4gPiArICAgIGJzcF9jdHgubXRycl9kLnR5cGVjb2Rl
ID0gSFZNX1NBVkVfQ09ERShNVFJSKTsKPiA+ID4gKyAgICBic3BfY3R4Lm10cnJfZC5pbnN0YW5j
ZSA9IDA7Cj4gPiA+ICsgICAgYnNwX2N0eC5tdHJyX2QubGVuZ3RoID0gSFZNX1NBVkVfTEVOR1RI
KE1UUlIpOwo+ID4gPiArCj4gPiA+ICsgICAgbXRycl9yZWNvcmQgPSBodm1fZ2V0X3NhdmVfcmVj
b3JkKGZ1bGxfY3R4LCBIVk1fU0FWRV9DT0RFKE1UUlIpLCAwKTsKPiA+ID4gKyAgICBpZiAoICFt
dHJyX3JlY29yZCApCj4gPiA+ICsgICAgewo+ID4gPiArICAgICAgICB4Y19kb21fcGFuaWMoZG9t
LT54Y2gsIFhDX0lOVEVSTkFMX0VSUk9SLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgIiVz
OiB1bmFibGUgdG8gZ2V0IE1UUlIgc2F2ZSByZWNvcmQiLCBfX2Z1bmNfXyk7Cj4gPiA+ICsgICAg
ICAgIGdvdG8gb3V0Owo+ID4gPiArICAgIH0KPiA+IAo+ID4gV2lsbCB0aGlzIGJyZWFrIGNyb3Nz
IHZlcnNpb24gbWlncmF0aW9uIHdoZW4gdGhlIG9sZGVyIGh5cGVydmlzb3IKPiA+IGRvZXNuJ3Qg
aGF2ZSBzdWNoIHJlY29yZD8KPiAKPiBUaGlzIG1pZ3JhdGlvbiByZWNvcmQgaXMgYWxyZWFkeSBw
cmVzZW50LCBpdCdzIG5vdCBpbnRyb2R1Y2VkIGluIHRoaXMKPiBwYXRjaCBzZXJpZXMuIEknbSBz
aW1wbHkgbWFraW5nIHVzZSBvZiBpdCBpbiBvcmRlciB0byBzZXQgYSB2YWxpZAo+IGluaXRpYWwg
TVRSUiBzdGF0ZS4KPiAKClRoZW4gSSdtIGV2ZW4gbW9yZSBjb25mdXNlZDogZG9lcyB0aGlzIG1l
YW4gdGhlIHJlY29yZCBpcyBub3QgcHJvcGVybHkKaG9ub3VyZWQgaW4gdGhlIGh5cGVydmlzb3I/
IEkuZS4gdGhpcyBpcyBhIGh5cGVydmlzb3IgYnVnPwoKV2VpLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
