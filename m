From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] mm: fix LLVM code-generation issue
Date: Fri, 23 Nov 2018 11:39:32 +0000
Message-ID: <34cc742e-3f66-b368-65e4-82d4b33ce4b1@arm.com>
References: <5BF6B0F502000078001FEE76@prv1-mh.provo.novell.com>
 <cb727842-018a-0181-9788-e3f1b8dd28b8@arm.com>
 <20181122152002.piljxsuytliraxhk@mac>
 <4775d924-8d59-e9e8-0c76-2937aa9581b0@citrix.com>
 <20181122160748.lcvry74jirfobb7x@mac>
 <15320b56-3f03-2364-8092-df33944c857f@citrix.com>
 <20181122163939.eoto26witi5mx2n2@mac>
 <3a723412-e6f4-08b0-400f-8c894e56bd24@arm.com>
 <a1236490-870a-bdac-2a79-0a487417713c@citrix.com>
 <20873c8e-a087-a414-e8fe-dde56ac05cb7@arm.com>
 <20181123112340.fb5jsjoqwmtd3khy@mac>
 <6A900FE40200004F0063616D@prv1-mh.provo.novell.com>
 <EED9718A020000A45C475325@prv1-mh.provo.novell.com>
 <07D102DD0200008F8E2C01CD@prv1-mh.provo.novell.com>
 <8B4AD5A1020000935C475325@prv1-mh.provo.novell.com>
 <84A23E9D020000170063616D@prv1-mh.provo.novell.com>
 <5BF7E5A002000078001FF5B6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5or3=oc=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gQ9o8-0005mQ-LN
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 11:39:36 +0000
In-Reply-To: <5BF7E5A002000078001FF5B6@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, george.dunlap@citrix.com, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMjMvMTEvMjAxOCAxMTozMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MjMuMTEuMTggYXQgMTI6MjMsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEltYWdl
IGFuIEFQIHJlYWRzIHN5c3RlbV9zdGF0ZSA8IFNZU19TVEFURV9hY3RpdmUsIHRoZW4gQlNQIHNl
dHMKPj4gc3lzdGVtX3N0YXRlID0gU1lTX1NUQVRFX2FjdGl2ZSBhbmQgY2xlYXJzIHRoZSBpbml0
IG1hcHBpbmdzLCB0aGVuCj4+IHdoZW4gdGhlIEFQIHRyaWVzIHRvIHJlYWQgYW4gaW5pdCB2YXJp
YWJsZSBpdCB3b3VsZCBnZXQgYSBwYWdlIGZhdWx0Lgo+IAo+IEFzIHNhaWQgYmVmb3JlIC0gQVBz
IGFyZSBzdXBwb3NlZCB0byBiZSBxdWllc2NlbnQgZHVyaW5nIHRoaXMKPiBwYXJ0aWN1bGFyIHRy
YW5zaXRpb24gb2Ygc3lzdGVtX3N0YXRlLCBhbmQgdGhlIGlkbGUgc2NydWJiaW5nIGFkZGVkCj4g
YW4gZXhjZXB0aW9uIHRvIHRoYXQgcnVsZS4gSSBkb24ndCBzZWUgd2h5IHN1Y2ggYW4gZXhjZXB0
aW9uIG1heQo+IG5vdCBpbnZvbHZlIGV4Y2VwdGlvbmFsIHRyZWF0bWVudCBvbiB0aGUgcGFydGlj
dWxhciByZWFkaW5nIHBhdGguCj4gRnVydGhlcm1vcmUgQVBzLCB3aGljaCBtYXkgYWxzbyBiZSBi
cm91Z2h0IHVwIGF0IHJ1biB0aW1lLCBtYXkKPiBuZXZlciBldmVyIHRvdWNoIGluaXQgbWFwcGlu
Z3Mgb2YgYW55IGtpbmQuCgpUaGUgInN1cHBvc2VkIiBpcyBxdWl0ZSB3b3JyeWluZyBiZWNhdXNl
IHdlIGhhdmUgbm8gd2F5IHRvIHZlcmlmeSB0aGF0IAphc3N1bXB0aW9uIHVudGlsIHdlIGdldCBh
IHJhbmRvbSBjcmFzaC4KCkFsc28sIHRoZSBjb3N0IG9mIHRoZSBiYXJyaWVyIHNob3VsZCBiZSBx
dWl0ZSBjaGVhcCBvdmVyIHRoZSByZXN0IG9mIHRoZSBmdW5jdGlvbi4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
