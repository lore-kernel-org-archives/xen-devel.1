From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v6 3/9] x86/mm: add disallow_mask parameter
 to get_page_from_l1e
Date: Mon, 19 Mar 2018 12:10:29 +0000
Message-ID: <20180319121029.GA31437@deinos.phlegethon.org>
References: <20180213200408.5463-1-wei.liu2@citrix.com>
 <20180213200408.5463-4-wei.liu2@citrix.com>
 <5AA8024702000078001B117F@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=sbzt=gj=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1extca-0003QW-DJ
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 12:10:36 +0000
Content-Disposition: inline
In-Reply-To: <5AA8024702000078001B117F@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

QXQgMDk6NTQgLTA2MDAgb24gMTMgTWFyICgxNTIwOTM0ODcxKSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gPj4+IE9uIDEzLjAyLjE4IGF0IDIxOjA0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6
Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRpLmMKPiA+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9tbS9zaGFkb3cvbXVsdGkuYwo+ID4gQEAgLTg1OCwxMyArODU4LDIxIEBAIHNoYWRv
d19nZXRfcGFnZV9mcm9tX2wxZShzaGFkb3dfbDFlX3Qgc2wxZSwgc3RydWN0IGRvbWFpbiAqZCwg
cDJtX3R5cGVfdCB0eXBlKQo+ID4gICAgICBpbnQgcmVzOwo+ID4gICAgICBtZm5fdCBtZm47Cj4g
PiAgICAgIHN0cnVjdCBkb21haW4gKm93bmVyOwo+ID4gKyAgICAvKiBUaGUgZGlzYWxsb3cgbWFz
ayBpcyB0YWtlbiBmcm9tIGFyY2gveDg2L21tLmMgZm9yIEhWTSBndWVzdCAqLwo+ID4gKyAgICB1
aW50MzJfdCBkaXNhbGxvd19tYXNrID0KPiA+ICsgICAgICAgIH4oX1BBR0VfUFJFU0VOVCB8IF9Q
QUdFX1JXIHwgX1BBR0VfVVNFUiB8IF9QQUdFX0FDQ0VTU0VEIHwKPiA+ICsgICAgICAgICAgX1BB
R0VfRElSVFkgfCBfUEFHRV9BVkFJTCB8IF9QQUdFX0FWQUlMX0hJR0ggfCBfUEFHRV9OWCk7Cj4g
PiAgCj4gPiArICAgIGRpc2FsbG93X21hc2sgPSAoZGlzYWxsb3dfbWFzayB8IF9QQUdFX0dOVFRB
QikgJiB+X1BBR0VfR0xPQkFMOwo+ID4gKyAgICBkaXNhbGxvd19tYXNrICY9IH5QQUdFX0NBQ0hF
X0FUVFJTOwo+IAo+IElmIGFueSBvZiB0aGlzIGlzIG5lZWRlZCBpbiB0aGUgZmlyc3QgcGxhY2Ug
KHNlZSBiZWxvdyksIGF0IGxlYXN0IHRoaXMKPiBsYXN0IGxpbmUgY291bGQgYmUgZm9sZGVkIGlu
dG8gdGhlIHZhcmlhYmxlJ3MgaW5pdGlhbGl6ZXIgYXMgaXQgbG9va3MuCgpCdWlsZGluZyBpdCBw
aWVjZXdpc2UgaXMgZmluZSBieSBtZSwgYnV0IHNpbmNlIHRoaXMgaXMgYSBjb25zdGFudCBpdApz
aG91bGQgcHJvYmFibHkgYmUgZGVjbGFyZWQgb25jZSBpbiBzb21lIGhlYWRlciBmaWxlIHJhdGhl
ciB0aGFuIGhlcmUuCkluIGFueSBjYXNlIGl0IG5lZWRzIGEgY29tbWVudCB0aGF0IGRlc2NyaWJl
cyB3aGF0IGl0IGlzLCBhbmQgbm90IHRoYXQKaXQgdXNlZCB0byBsaXZlIGluIG1tLmMuIDopCgpM
aWtlIEphbiwgSSdtIG5vdCBjb252aW5jZWQgdGhhdCBoYXZpbmcgdGhpcyBiZSBhbiBhcmd1bWVu
dCB0bwpnZXRfcGFnZV9mcm9tX2wxZSBpcyBzdXBlci11c2VmdWwgLS0gaXQgc2VlbXMgbGlrZSBh
biBvcHBvcnR1bml0eSBmb3IKb25lIG9mIHRoZSBjYWxsZXJzIHRvIGdldCBpdCB3cm9uZyBhbmQg
ZmFpbCB0byBlbmZvcmNlIG91ciBpbnZhcmlhbnRzLgoKPiA+ICsgICAgQVNTRVJUKGlzX2h2bV9k
b21haW4oZCkpOwoKVGhpcyBhc3NlcnRpb24gaXNuJ3QgcGFydGljdWxhcmx5IGhlbHBmdWwgSU1P
IChiZWNhdXNlIGl0J3MKc2hhZG93X21vZGVfcmVmY291bnRzIHRoYXQncyByZWxldmFudCBoZXJl
LCBub3QgaXNfaHZtKSBidXQgSSBkb24ndApvYmplY3QgdG8gaXQuCgpDaGVlcnMsCgpUaW0uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
