From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 5/7] memory: add
 check_get_page_from_gfn() as a wrapper...
Date: Wed, 19 Sep 2018 10:59:34 +0200
Message-ID: <20180919085934.w63rfnzind2ypud5@mac.bytemobile.com>
References: <20180913152128.6114-1-paul.durrant@citrix.com>
 <20180913152128.6114-6-paul.durrant@citrix.com>
 <5BA0FAB702000078001E9779@prv1-mh.provo.novell.com>
 <71ebe85f6fe94f989db6618eabf22c1e@AMSPEX02CL03.citrite.net>
 <5BA110EF02000078001E9802@prv1-mh.provo.novell.com>
 <ef6cbe5d4b994f7fbf61eb634c040dd4@AMSPEX02CL03.citrite.net>
 <5BA1E69F02000078001E99DF@prv1-mh.provo.novell.com>
 <f6f35c7b1ccf4abbaf0352f99b89e4fe@AMSPEX02CL03.citrite.net>
 <a6b4262af22f4c04a223d790a8992921@AMSPEX02CL03.citrite.net>
 <5BA2097302000078001E9C22@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t0u/=mb=citrix.com=prvs=7935e1ad4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g2YOU-0001ob-5j
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 09:03:34 +0000
Content-Disposition: inline
In-Reply-To: <5BA2097302000078001E9C22@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, IanJackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMDI6MzE6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjA5LjE4IGF0IDEwOjAxLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4+IEZyb206IFhlbi1kZXZlbCBbbWFpbHRvOnhlbi1kZXZlbC1ib3VuY2VzQGxp
c3RzLnhlbnByb2plY3Qub3JnXSBPbiBCZWhhbGYKPiA+PiBPZiBQYXVsIER1cnJhbnQKPiA+PiBT
ZW50OiAxOSBTZXB0ZW1iZXIgMjAxOCAwODo1Ngo+ID4+IAo+ID4+ID4gRnJvbTogSmFuIEJldWxp
Y2ggW21haWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPiA+PiA+IFNlbnQ6IDE5IFNlcHRlbWJlciAy
MDE4IDA3OjAzCj4gPj4gPgo+ID4+ID4gPj4+IE9uIDE4LjA5LjE4IGF0IDE4OjM3LCA8UGF1bC5E
dXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gPiBNb3ZpbmcgdG8gcDJtLWNvbW1vbiB3
b24ndCB3b3JrLiBUaGUgZnVuY3Rpb24gZGVjbGFyYXRpb24gaW52b2x2ZXMgYQo+ID4+ID4gPiBw
Mm1fdHlwZV90IGFyZ3VtZW50IGFuZCB0aGF0IGVudW0gaXMgZGVmaW5lZCBpbiB0aGUgYXJtIGFu
ZCB4ODYKPiA+PiBzcGVjaWZpYwo+ID4+ID4gPiBoZWFkZXJzLiBJIHByb3Bvc2UgdGhlcmVmb3Jl
IHRvIGxlYXZlIHRoaXMgcGF0Y2ggYXMtaXMuCj4gPj4gPgo+ID4+ID4gTGVhdmluZyB0aGUgZHVw
bGljYXRpb24gaW4gcGxhY2UgaXMganVzdCB0aGUgbGFzdCByZXNvcnQgaW1vLiBEb2VzCj4gPj4g
PiB4ZW4vbW0uaAo+ID4+ID4gbm90IHdvcmsgZWl0aGVyPwo+ID4+IAo+ID4+IE5vLCBpdCB3b24n
dC4gSXQgaGFzIHRvIGJlIHNvbWV0aGluZyAqYWZ0ZXIqIHRoZSBkZWZpbml0aW9uIG9mIHRoZQo+
ID4+IHAybV90eXBlX3QgZW51bS4gSSBjb3VsZCwgYXMgSnVsaWVuIHN1Z2dlc3RlZCwgbW92ZSB0
aGUgaW5jbHVzaW9uIG9mIHAybS0KPiA+PiBjb21tb24gYWZ0ZXIgdGhhdCBwb2ludCwgYnV0IGl0
IHdvdWxkIG1lYW4gdGhlIGhlYWRlciBndWFyZHMgd291bGQgY2Vhc2UKPiA+PiB0byBEVFJUIG9m
IGNvdXJzZS4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgQyB3aWxsIGFsbG93IG1lIHRvIGZvcndhcmQg
ZGVjbGFyZQo+ID4+IHRoZSBlbnVtIChub3Qgc29tZXRoaW5nIEkndmUgdHJpZWQpIGJ1dCBJIGNv
dWxkIGdpdmUgdGhhdCBhIGdvLiBBbnkgb3RoZXIKPiA+PiBzdWdnZXN0aW9ucz8KPiA+PiAKPiA+
IAo+ID4gRm9yd2FyZCBkZWNsYXJhdGlvbiBvZiB0aGUgZW51bSBkb2VzIGluZGVlZCBhcHBlYXIg
dG8gd29yaywgc28gSSdsbCBnbyB3aXRoIAo+ID4gdGhhdC4KPiAKPiBUaGF0J3MgYW4gZXh0ZW5z
aW9uIEknbSBub3QgZXZlbiBzdXJlIGFsbCBnY2MgdmVyc2lvbnMgc3VwcG9ydCAoSSd2ZSBjaGVj
a2VkCj4gNC4zIGp1c3Qgbm93LCB3aGVyZSBpdCB3b3JrcykuIFJvZ2VyLCBhbnkgY2hhbmNlIHlv
dSBrbm93IHdoZXRoZXIgY2xhbmcKPiBzdXBwb3J0cyB0aGlzPwoKSSd2ZSBqdXN0IHRlc3RlZCB0
aGUgZm9sbG93aW5nIHdpdGggY2xhbmcgNiAod2hpY2ggaXMgdGhlIHZlcnNpb24gdXNlZApieSBv
c3N0ZXN0KToKCmVudW0gZm9vOwplbnVtIGZvbyB7IGEsIGIsIGMgfTsKCkFuZCBpdCB3b3JrcyBm
aW5lLiBJIHRoaW5rIHRyYXZpcyBvciBnaXRsYWIgdGVzdGVkIG9sZGVyIHZlcnNpb25zIG9mCmNs
YW5nICh0aGUgb25lcyBvbiB0aGUgTGludXggZGlzdHJvcykuCgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
