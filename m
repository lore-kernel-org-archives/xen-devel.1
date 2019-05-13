From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/4] README: document that `python` is
 required
Date: Mon, 13 May 2019 15:36:49 +0100
Message-ID: <20190513143649.GQ2798@zion.uk.xensource.com>
References: <20190513134714.3124-1-wei.liu2@citrix.com>
 <20190513134714.3124-4-wei.liu2@citrix.com>
 <5CD97EC4020000780022E2E4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQC4T-0002RX-5d
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:36:53 +0000
Content-Disposition: inline
In-Reply-To: <5CD97EC4020000780022E2E4@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDg6Mjc6MTZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEzLjA1LjE5IGF0IDE1OjQ3LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS9SRUFETUUKPiA+ICsrKyBiL1JFQURNRQo+ID4gQEAgLTE4MSw2ICsxODEs
MTAgQEAgVmFyaW91cyB0b29scywgc3VjaCBhcyBweWdydWIsIGhhdmUgdGhlIGZvbGxvd2luZyBy
dW50aW1lIGRlcGVuZGVuY2llczoKPiA+ICAgICAgICAgICAgVVJMOiAgICBodHRwOi8vd3d3LnB5
dGhvbi5vcmcvIAo+ID4gICAgICAgICAgICBEZWJpYW46IHB5dGhvbgo+ID4gIAo+ID4gK05vdGUg
dGhhdCB0aGUgYnVpbGQgc3lzdGVtIGV4cGVjdHMgYHB5dGhvbmAgdG8gYmUgYXZhaWxhYmxlLiBJ
ZiB5b3VyIHN5c3RlbQo+ID4gK29ubHkgaGFzIGBweXRob24yYCBvciBgcHl0aG9uM2AgYnV0IG5v
dCBgcHl0aG9uYCAoYXMgaW4gTGludXggRnJvbSBTY3JhdGNoKSwKPiA+ICt5b3Ugd2lsbCBuZWVk
IHRvIGNyZWF0ZSBhIHN5bWxpbmsgZm9yIGl0Lgo+IAo+IElzIGNyZWF0aW5nIGEgc3ltbGluayBp
bmRlZWQgdGhlIG9ubHkgb3B0aW9uPyBXaGF0IGFib3V0IHNwZWNpZnlpbmcKPiBQWVRIT049IG9u
IHRoZSBtYWtlIGNtZGxpbmU/IEkgZG9uJ3QgbWVhbiB0byBzYXkgdGhlIHNldCBvZgo+IHdvcmth
cm91bmRzIG5lZWRzIHRvIGJlIGV4aGF1c3RpdmUgaGVyZSwgYnV0IHBlcmhhcHMgYWRkIGF0Cj4g
bGVhc3QgImUuZy4iIGlmIHRoZXJlIGFyZSBvdGhlciBvcHRpb25zIGFzIHdlbGw/CgpYZW4ncyBi
dWlsZCBzeXN0ZW0gaXMgc3RyYW5nZSBpbiB0aGF0CgogICBtYWtlIEE9QgoKaXMgbm90IHRoZSBz
YW1lIGFzIAoKICAgQT1CIG1ha2UKCi4KCkluIHByYWN0aWNlIHRoaXMgaGFzIGJpdHRlbiBhIGZl
dyBwZW9wbGUgaW4gdGhlIHBhc3QuIFRoYXQncyB3aHkgSSBvcHRlZAp0byBub3QgbWVudGlvbiB0
aGF0IHZhcmlhbnQuCgpCdXQgc2luY2UgeW91IGFzaywgSSBjYW4gYWRkIGl0IHRvIG5leHQgdmVy
c2lvbi4KCldlaS4KCj4gCj4gSmFuCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
