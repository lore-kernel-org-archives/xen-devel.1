From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 5/7] vpci: fix execution of long running
 operations
Date: Thu, 8 Nov 2018 13:47:27 +0100
Message-ID: <20181108124727.34nyejn4ukggd4co@mac.citrite.net>
References: <20181030154123.4218-1-roger.pau@citrix.com>
 <20181030154123.4218-6-roger.pau@citrix.com>
 <5BE0762D02000078001F8356@prv1-mh.provo.novell.com>
 <20181107111146.ksaemioxod3uk5p4@mac.citrite.net>
 <5BE2FF5802000078001F9313@prv1-mh.provo.novell.com>
 <20181107171517.7p34q6vjpggmzb4i@mac.citrite.net>
 <5BE4082C02000078001F97FE@prv1-mh.provo.novell.com>
 <20181108112959.7oc4guik3icb7nls@mac.citrite.net>
 <5BE42CC202000078001F9A29@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/xu1=nt=citrix.com=prvs=843091f4c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gKjil-0007ps-Lv
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 12:47:39 +0000
Content-Disposition: inline
In-Reply-To: <5BE42CC202000078001F9A29@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDU6MzI6MDJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA4LjExLjE4IGF0IDEyOjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDI6NTU6NTZBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDA3LjExLjE4IGF0IDE4OjE1LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ICBUaGVuIGlmIHRoZSBibG9ja2VkIGJpdCBpcyBub3Qgc2V0
IHRoZSBjYWxsIHRvIGRvX3NvZnRpcnEKPiA+PiA+IHdvdWxkIGJlIHJlY3VycmVkLCB0aHVzIHBy
b2JhYmx5IGxlYWRpbmcgdG8gYSBzdGFjayBvdmVyZmxvdyBpZgo+ID4+ID4gdGhlcmUncyBlbm91
Z2ggcGVuZGluZyB3b3JrLiBpZToKPiA+PiA+IAo+ID4+ID4gPHByb2Nlc3Mgd29yaz4KPiA+PiA+
IAk8ZG9fc29mdGlycT4KPiA+PiA+IAkJPHByb2Nlc3Mgd29yaz4KPiA+PiA+IAkJCTxkb19zb2Z0
aXJxPgo+ID4+ID4gCQkJCTwuLi4+Cj4gPj4gCj4gPj4gV2h5IHdvdWxkIHRoYXQgYmU/IFRoZSBk
b19zb2Z0aXJxKCkgaW52b2NhdGlvbiBzaXRzIG9uIHRoZSBleGl0LQo+ID4+IHRvLWd1ZXN0IHBh
dGgsIGV4cGxpY2l0bHkgYXZvaWRpbmcgYW55IHN1Y2ggbmVzdGluZyB1bmxlc3MgdGhlcmUKPiA+
PiB3YXMgYSBkb19zb2Z0aXJxKCkgaW52b2NhdGlvbiBzb21ld2hlcmUgaW4gYSBzb2Z0aXJxIGhh
bmRsZXIuCj4gPiAKPiA+IEl0IHNpdHMgb24gYW4gZXhpdC10by1ndWVzdCBwYXRoLCBidXQgdGhl
IGZvbGxvd2luZyBjaHVuazoKPiA+IAo+ID4gcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJR
KTsKPiA+IGRvX3NvZnRpcnEoKTsKPiA+IAo+ID4gV291bGQgcHJldmVudCB0aGUgcGF0aCBmcm9t
IGV2ZXIgcmVhY2hpbmcgdGhlIGV4aXQtdG8tZ3Vlc3QgYW5kCj4gPiBuZXN0aW5nIG9uIGl0c2Vs
ZiwgdW5sZXNzIHRoZSB2Q1BVIGlzIG1hcmtlZCBhcyBibG9ja2VkLCB3aGljaAo+ID4gcHJldmVu
dHMgaXQgZnJvbSBiZWluZyBzY2hlZHVsZWQgdGh1cyBhdm9pZGluZyB0aGlzIHJlY3Vyc2lvbi4K
PiAKPiBJdCB3b3VsZCwgaW5kZWVkLCBidXQgZW1waGFzaXMgaXMgb24gdGhlIHN1Ymp1bmN0aXZl
IHVubGVzcwo+IHlvdSBoYXZlIGFuIGV4YW1wbGUgb2Ygc3VjaCBtYWxmb3JtZWQgY29kZS4gSSdt
IG5vdAo+IGF3YXJlIG9mIGFueSwgYW5kIG15IGVhcmxpZXIgY29tbWVudHMgYWxzbyBkaWRuJ3Qg
c3VnZ2VzdCB0bwo+IGludHJvZHVjZSBzdWNoLiBQZXJoYXBzIEknbSBzaW1wbHkgbWlzc2luZyBw
YXJ0IG9mIHdoYXQgeW91Cj4gdGhpbmsgeW91IHNlZT8KCk1heWJlLCBJIHRoaW5rIEknbSBhbHNv
IGxvc3QgaW4gdGhpcyBkaXNjdXNzaW9uIGJlY2F1c2Ugd2Ugc2VlbSB0bwphZ3JlZS4KCk15IHBv
aW50IHdvdWxkIGJlIHRoYXQgb24geDg2IEkgdGhpbmsgdGhlIG9ubHkgd2F5IHRvIGhhdmUgcHJl
ZW1wdGlibGUKbG9uZy1ydW5uaW5nIG9wZXJhdGlvbnMgaW5zaWRlIG9mIFhlbiBpcyB0byBibG9j
ayB0aGUgZ3Vlc3QgdkNQVSBhbmQKcnVuIHRoZW0gaW4gYSB0YXNrbGV0LCBvciBhdCBsZWFzdCB0
aGlzIHNlZW1zIHRoZSBsZXNzIGludmFzaXZlIG9uZS4KCkRvIHlvdSBzdGlsbCBoYXZlIG9iamVj
dGlvbnMgdG8gdGhpcyBwYXRjaC9hcHByb2FjaD8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
