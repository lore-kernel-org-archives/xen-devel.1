From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 4/8] mm: introduce a helper to get the
 memory type of a page
Date: Fri, 17 Aug 2018 18:37:27 +0200
Message-ID: <20180817163727.7xrscdohig5hsyav@mac>
References: <20180814134336.75539-1-roger.pau@citrix.com>
 <20180814134336.75539-5-roger.pau@citrix.com>
 <5B76A0BB02000078001DF53B@prv1-mh.provo.novell.com>
 <5B76A3F902000078001DF595@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qfmz=la=citrix.com=prvs=760927a5f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fqhkr-0002Yr-4w
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 16:37:41 +0000
Content-Disposition: inline
In-Reply-To: <5B76A3F902000078001DF595@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDQ6MzE6MjFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjA4LjE4IGF0IDEyOjE3LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+ID4+Pj4gT24gMTQuMDguMTggYXQgMTU6NDMsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPj4gKyAgICAgICAgICAgIHN3aXRjaCAoIGU4MjAubWFwW2ldLnR5cGUgKQo+ID4+ICsg
ICAgICAgICAgICB7Cj4gPj4gKyAgICAgICAgICAgIGNhc2UgRTgyMF9SQU06Cj4gPj4gKyAgICAg
ICAgICAgICAgICByZXR1cm4gUkFNX1RZUEVfQ09OVkVOVElPTkFMOwo+ID4+ICsKPiA+PiArICAg
ICAgICAgICAgY2FzZSBFODIwX1JFU0VSVkVEOgo+ID4+ICsgICAgICAgICAgICAgICAgcmV0dXJu
IFJBTV9UWVBFX1JFU0VSVkVEOwo+ID4+ICsKPiA+PiArICAgICAgICAgICAgY2FzZSBFODIwX1VO
VVNBQkxFOgo+ID4+ICsgICAgICAgICAgICAgICAgcmV0dXJuIFJBTV9UWVBFX1VOVVNBQkxFOwo+
ID4+ICsKPiA+PiArICAgICAgICAgICAgY2FzZSBFODIwX0FDUEk6Cj4gPj4gKyAgICAgICAgICAg
IGNhc2UgRTgyMF9OVlM6Cj4gPj4gKyAgICAgICAgICAgICAgICByZXR1cm4gUkFNX1RZUEVfQUNQ
STsKPiA+PiArCj4gPj4gKyAgICAgICAgICAgIGRlZmF1bHQ6Cj4gPj4gKyAgICAgICAgICAgICAg
ICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPiA+PiArICAgICAgICAgICAgICAgIHJldHVybiAtMTsK
PiA+PiArICAgICAgICAgICAgfQo+ID4+ICsgICAgfQo+ID4+ICsKPiA+PiArICAgIHJldHVybiAt
MTsKPiA+PiArfQo+ID4gCj4gPiBPbmUgbW9yZSBjYXNlIHRvIGNvbnNpZGVyOiBXaGF0IGFib3V0
IGEgcGFnZSBwYXJ0IG9mIHdoaWNoIGlzCj4gPiBhIGdpdmVuIHR5cGUsIGFuZCB0aGUgb3RoZXIg
cGFydCBvZiB3aGljaCBpcyBzaW1wbHkgbWlzc2luZyBmcm9tCj4gPiB0aGUgRTgyMCB0YWJsZT8g
SSdtIHVuY2VydGFpbiB3aGV0aGVyIGluIHRoYXQgY2FzZSBpdCBtaWdodCBiZSBhCj4gPiBnb29k
IGlkZWEgaW4gZ2VuZXJhbCB0byByZXBvcnQgaXQgYXMgaGF2aW5nIHRoZSBnaXZlbiB0eXBlOyBm
b3IgdGhlCj4gPiBzcGVjaWZpYyBwdXJwb3NlIHlvdSB3YW50IHRoZSBmdW5jdGlvbiBmb3IsIHRo
YXQgd291bGQgaW1vIGJlCj4gPiBxdWl0ZSBoZWxwZnVsLgo+IAo+IENvbnNpZGVyaW5nIFJBTV9U
WVBFXyogYXJlIGJpdCBtYXNrcyAtIHBlcmhhcHMgdGhlIGZ1bmN0aW9uCj4gc2hvdWxkIE9SIHRv
Z2V0aGVyIGFsbCB0eXBlcyBmb3VuZCBmb3IgdGhlIHJlcXVlc3RlZCBwYWdlLCBhbmQKPiBsZXQg
dGhlIGNhbGxlciBnbyBmcm9tIHRoZXJlPyBBbmQgdG8gYWNjb3VudCBmb3IgbXkgZWFybGllciBy
ZW1hcmssCj4gYWRkIGEgc2VwYXJhdGUgUkFNX1RZUEVfVU5LTk9XTiAoYW5kIG5ldmVyIGhhdmUg
dGhlIGZ1bmN0aW9uCj4gcmV0dXJuIC0xIG9yIHNvbWUgc3VjaDsgaXRzIHJldHVybiB0eXBlIHRo
ZW4gd291bGQgYmV0dGVyIGJlCj4gdW5zaWduZWQgaW50KT8KCkkgY2FuIGRvIHNvbWV0aGluZyBh
bG9uZyB0aGlzIGxpbmVzLCBidXQgdGhlbiB0aGUgZnVuY3Rpb25hbGl0eSBvZiB0aGUKZXhpc3Rp
bmcgaW5jbHVzaXZlIG9wdGlvbiBpcyBsaWtlbHkgdG8gY2hhbmdlIG9uIGJveGVzIGhhdmluZyBt
ZW1vcnkKdHlwZXMgbm90IGFsaWduZWQgdG8gYSBwYWdlIGJvdW5kYXJ5LgoKQWxzbywgd2Ugc2hv
dWxkIGxpa2VseSBkaXNjdXNzIHdoYXQgdG8gZG8gd2l0aCBhIHBhZ2UgdGhhdCBmb3IgZXhhbXBs
ZQpoYXMgYm90aCB1bnVzYWJsZSBhbmQgcmVzZXJ2ZWQgcmVnaW9ucy4gSSB3b3VsZCBtYXAgaXQg
aW4gdGhlCmluY2x1c2l2ZSBjYXNlIGJlY2F1c2UgaXQgaGFzIGEgcmVzZXJ2ZWQgcmVnaW9uLCBi
dXQgd291bGQgbGlrZSB0bwpoZWFyIHlvdXIgb3Bpbmlvbi4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
