From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] mm: fix LLVM code-generation issue
Date: Fri, 23 Nov 2018 04:33:52 -0700
Message-ID: <5BF7E5A002000078001FF5B6@prv1-mh.provo.novell.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gQ9ie-0005At-U9
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 11:33:56 +0000
In-Reply-To: <84A23E9D020000170063616D@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, george.dunlap@citrix.com, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjExLjE4IGF0IDEyOjIzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEltYWdlIGFuIEFQIHJlYWRzIHN5c3RlbV9zdGF0ZSA8IFNZU19TVEFURV9hY3RpdmUsIHRoZW4g
QlNQIHNldHMKPiBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVfYWN0aXZlIGFuZCBjbGVhcnMgdGhl
IGluaXQgbWFwcGluZ3MsIHRoZW4KPiB3aGVuIHRoZSBBUCB0cmllcyB0byByZWFkIGFuIGluaXQg
dmFyaWFibGUgaXQgd291bGQgZ2V0IGEgcGFnZSBmYXVsdC4KCkFzIHNhaWQgYmVmb3JlIC0gQVBz
IGFyZSBzdXBwb3NlZCB0byBiZSBxdWllc2NlbnQgZHVyaW5nIHRoaXMKcGFydGljdWxhciB0cmFu
c2l0aW9uIG9mIHN5c3RlbV9zdGF0ZSwgYW5kIHRoZSBpZGxlIHNjcnViYmluZyBhZGRlZAphbiBl
eGNlcHRpb24gdG8gdGhhdCBydWxlLiBJIGRvbid0IHNlZSB3aHkgc3VjaCBhbiBleGNlcHRpb24g
bWF5Cm5vdCBpbnZvbHZlIGV4Y2VwdGlvbmFsIHRyZWF0bWVudCBvbiB0aGUgcGFydGljdWxhciBy
ZWFkaW5nIHBhdGguCkZ1cnRoZXJtb3JlIEFQcywgd2hpY2ggbWF5IGFsc28gYmUgYnJvdWdodCB1
cCBhdCBydW4gdGltZSwgbWF5Cm5ldmVyIGV2ZXIgdG91Y2ggaW5pdCBtYXBwaW5ncyBvZiBhbnkg
a2luZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
