From: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH v5 8/8] microcode: update microcode on cores
 in parallel
Date: Wed, 13 Feb 2019 10:30:49 +0800
Message-ID: <20190213023047.GA3678@gao-cwp>
References: <1548659210-16870-1-git-send-email-chao.gao@intel.com>
 <1548659210-16870-9-git-send-email-chao.gao@intel.com>
 <5C62C15D0200007800215E2E@prv1-mh.provo.novell.com>
 <20190212132507.mwp4yyf22oslc7d4@mac>
 <5C62D0480200007800215F27@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpIX=QU=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1gtkG6-0007fK-Nc
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 02:26:46 +0000
Content-Disposition: inline
In-Reply-To: <5C62D0480200007800215F27@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMTIsIDIwMTkgYXQgMDY6NTU6MjBBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMTIuMDIuMTkgYXQgMTQ6MjUsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4+IE9uIFR1ZSwgRmViIDEyLCAyMDE5IGF0IDA1OjUxOjQxQU0gLTA3MDAsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gPj4+IE9uIDI4LjAxLjE5IGF0IDA4OjA2LCA8Y2hhby5nYW9AaW50ZWwu
Y29tPiB3cm90ZToKPj4+ID4gQEAgLTMxNCw5ICszMTAsNyBAQCBzdGF0aWMgaW50IGFwcGx5X21p
Y3JvY29kZSh1bnNpZ25lZCBpbnQgY3B1KQo+Pj4gPiAgCj4+PiA+ICAgICAgbWNfaW50ZWwgPSBw
YXRjaC0+ZGF0YTsKPj4+ID4gICAgICBCVUdfT04oIW1jX2ludGVsKTsKPj4+ID4gLQo+Pj4gPiAt
ICAgIC8qIHNlcmlhbGl6ZSBhY2Nlc3MgdG8gdGhlIHBoeXNpY2FsIHdyaXRlIHRvIE1TUiAweDc5
ICovCj4+PiA+IC0gICAgc3Bpbl9sb2NrX2lycXNhdmUoJm1pY3JvY29kZV91cGRhdGVfbG9jaywg
ZmxhZ3MpOwo+Pj4gPiArICAgIEJVR19PTihsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsKPj4+ID4g
IAo+Pj4gPiAgICAgIC8qIHdyaXRlIG1pY3JvY29kZSB2aWEgTVNSIDB4NzkgKi8KPj4+ID4gICAg
ICB3cm1zcmwoTVNSX0lBMzJfVUNPREVfV1JJVEUsICh1bnNpZ25lZCBsb25nKW1jX2ludGVsLT5i
aXRzKTsKPj4+ID4gQEAgLTMyOSw3ICszMjMsNiBAQCBzdGF0aWMgaW50IGFwcGx5X21pY3JvY29k
ZSh1bnNpZ25lZCBpbnQgY3B1KQo+Pj4gPiAgICAgIHJkbXNybChNU1JfSUEzMl9VQ09ERV9SRVYs
IG1zcl9jb250ZW50KTsKPj4+ID4gICAgICB2YWxbMV0gPSAodWludDMyX3QpKG1zcl9jb250ZW50
ID4+IDMyKTsKPj4+ID4gIAo+Pj4gPiAtICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm1pY3Jv
Y29kZV91cGRhdGVfbG9jaywgZmxhZ3MpOwo+Pj4gPiAgICAgIGlmICggdmFsWzFdICE9IG1jX2lu
dGVsLT5oZHIucmV2ICkKPj4+ID4gICAgICB7Cj4+PiA+ICAgICAgICAgIHByaW50ayhLRVJOX0VS
UiAibWljcm9jb2RlOiBDUFUlZCB1cGRhdGUgZnJvbSByZXZpc2lvbiAiCj4+PiAKPj4+IEFtIEkg
dW5kZXJzdGFuZGluZyByaWdodCB0aGF0IHlvdSBub3cgcmVseSBvbiB1cHBlciBsYXllcnMgaW4g
dGhlCj4+PiBjYWxsIHRyZWUgdG8gYXZvaWQgY2FsbGluZyBpbnRvIGhlcmUgaW4gcGFyYWxsZWwg
Zm9yIHR3byBoeXBlcnRocmVhZHMKPj4+IG9mIHRoZSBzYW1lIGNvcmU/IEkgY2FuJ3Qgc2VlIGhv
dyB5b3UgYXZvaWQgdGhpcyBzaXR1YXRpb24gZHVyaW5nCj4+PiBBUCBicmluZ3VwLCBmb3IgZXhh
bXBsZS4gRGlkIEkgb3Zlcmxvb2sgYW55dGhpbmcgaW4gdGhpcyByZWdhcmQ/Cj4+IAo+PiBJSVJD
IG1pY3JvY29kZSB1cGRhdGUgaXMgZG9uZSBpbiB0aGUgc2VyaWFsaXplZCBwYXJ0IG9mIEFQIGJy
aW5ndXAsCj4+IGJlZm9yZSB0aGUgY2FsbCB0byBzbXBfY2FsbGluLCB3aGljaCBndWFyYW50ZWVz
IHNlcmlhbGl6YXRpb24uCj4KPkhtbSwgeWVzLCByaWdodCBub3cgaXQgaXMuIEJ1dCBJJ2QgY2Fs
bCB0aGlzICJoYXBwZW5zIHRvIGJlIHRoYXQgd2F5Igo+cmF0aGVyIHRoYW4gImlzIGd1YXJhbnRl
ZWQgdG8gYmUgdGhhdCB3YXkiIC0gcHJpb3IgdG8gY29tbWl0Cj5mOTc4MzhiYmQ5IGl0IGRpZCBo
YXBwZW4gbGF0ZXIuCgpIb3cgYWJvdXQgZW1wbG95aW5nIGFub3RoZXIgbG9jaywgImVhcmx5X3Vj
b2RlX3VwZGF0ZV9sb2NrIiwgdG8KZ3VhcmFudGVlIHNlcmlhbGl6YXRpb24uCgpJbiBwYXJ0aWN1
bGFyLCBlYXJseV9taWNyb2NvZGVfdXBkYXRlX2NwdSgpIGFuZCBtaWNyb2NvZGVfcmVzdW1lX2Nw
dSgpCndpbGwgYWNxdWlyZSB0aGlzIGxvY2sgYmVmb3JlIHVjb2RlIHVwZGF0ZS4KClRoYW5rcwpD
aGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
