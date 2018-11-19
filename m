From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/5] vpci: fix updating the command
 register
Date: Mon, 19 Nov 2018 01:26:11 -0700
Message-ID: <5BF273A302000078001FD2BD@prv1-mh.provo.novell.com>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-2-roger.pau@citrix.com>
 <5BEEB15D02000078001FCB9A@prv1-mh.provo.novell.com>
 <20181116143245.vpk3vgpbcqujvofb@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gOest-0004k1-3z
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 08:26:19 +0000
In-Reply-To: <20181116143245.vpk3vgpbcqujvofb@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjExLjE4IGF0IDE1OjMyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgTm92IDE2LCAyMDE4IGF0IDA1OjAwOjI5QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTQuMTEuMTggYXQgMTI6NTcsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gQEAgLTQxMyw3ICs0MTIsNyBAQCBzdGF0aWMgdm9pZCByb21fd3JpdGUoY29u
c3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsCj4+ID4gICAgICAgICAg
aGVhZGVyLT5yb21fZW5hYmxlZCA9IG5ld19lbmFibGVkOwo+PiA+ICAgICAgICAgIHBjaV9jb25m
X3dyaXRlMzIocGRldi0+c2VnLCBwZGV2LT5idXMsIHNsb3QsIGZ1bmMsIHJlZywgdmFsKTsKPj4g
PiAgICAgIH0KPj4gPiAtICAgIGVsc2UgaWYgKCBtb2RpZnlfYmFycyhwZGV2LCBuZXdfZW5hYmxl
ZCwgdHJ1ZSkgKQo+PiA+ICsgICAgZWxzZSBpZiAoIG1vZGlmeV9iYXJzKHBkZXYsIG5ld19lbmFi
bGVkID8gUENJX0NPTU1BTkRfTUVNT1JZIDogMCwgdHJ1ZSkgKQo+PiAKPj4gRG8geW91IHJlYWxs
eSBtZWFuIHRvIGNsZWFyIGFsbCBvdGhlciBkZWZpbmVkIGJpdHMgb2YgdGhlIGNvbW1hbmQKPj4g
cmVnaXN0ZXIgaGVyZT8KPiAKPiBUaGlzIGlzIGEgUk9NIEJBUiB3cml0ZSwgbm90IGEgY29tbWFu
ZCByZWdpc3RlciB3cml0ZS4gcm9tX3dyaXRlCj4gcGFzc2VzIFBDSV9DT01NQU5EX01FTU9SWSBt
ZXJlbHkgdG8gc2lnbmFsIHRoaXMgaXMgYSBtYXBwaW5nCj4gb3BlcmF0aW9uLCBidXQgdGhlIHZh
bHVlIHdvdWxkIG5ldmVyIGJlIHdyaXR0ZW4gdG8gdGhlIGNvbW1hbmQKPiByZWdpc3RlciwgdGhl
cmUncyBhbiBBU1NFUlQoIXJvbV9vbmx5KSBqdXN0IGJlZm9yZSB0aGUgZGVmZXJyZWQgd3JpdGUK
PiBvZiB0aGUgY29tbWFuZCByZWdpc3RlciBpbiBtb2RpZnlfZGVjb2RpbmcuCgpPaCwgSSBzZWUu
IFRoaXMgaXMgZ2V0dGluZyBtb3JlIHN1YnRsZSB0aGFuIGl0IGFscmVhZHkgd2FzLCBzbyBwZXJo
YXBzCndvcnRoIGF0dGFjaGluZyBhIGJyaWVmIGNvbW1lbnQgaGVyZSwgdGhlIG1vcmUgdGhhdCBp
ZiBhbnl0aGluZyB3YXMKd3Jvbmcgd2l0aCB0aGUgbG9naWMgYmFkIGJlaGF2aW9yIHdvdWxkIHJl
c3VsdCBpbiByZWxlYXNlIGJ1aWxkcz8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
