From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] mm: fix LLVM code-generation issue
Date: Thu, 22 Nov 2018 16:20:02 +0100
Message-ID: <20181122152002.piljxsuytliraxhk@mac>
References: <20181122120327.66403-1-roger.pau@citrix.com>
 <c0b25df2-49ca-fbe1-804a-e1a9839bb854@citrix.com>
 <6fde305e-7f47-2577-d795-0291e2adc137@arm.com>
 <5BF6AEB602000078001FEE5D@prv1-mh.provo.novell.com>
 <9cd10d0c-8c1a-0c1f-39a1-c3a2bbd1d734@citrix.com>
 <5BF6B0F502000078001FEE76@prv1-mh.provo.novell.com>
 <cb727842-018a-0181-9788-e3f1b8dd28b8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mIHh=OB=citrix.com=prvs=8571d395d=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gPqm4-0005RL-86
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 15:20:12 +0000
Content-Disposition: inline
In-Reply-To: <cb727842-018a-0181-9788-e3f1b8dd28b8@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDI6MDM6NTVQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIEphbiwKPiAKPiBPbiAxMS8yMi8xOCAxOjM2IFBNLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+ID4gPiA+IE9uIDIyLjExLjE4IGF0IDE0OjMxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gd3JvdGU6Cj4gPiA+IEkgdGhpbmsgSnVsaWVuJ3MgcG9pbnQgaXMgdGhhdCB3aXRob3V0
IGV4cGxpY2l0bHkgYmFycmllcnMsIENQVTAncwo+ID4gPiB1cGRhdGUgdG8gc3lzdGVtX3N0YXRl
IG1heSBub3QgYmUgdmlzaWJsZSBvbiBDUFUxLCBldmVuIHRob3VnaCB0aGUKPiA+ID4gbWFwcGlu
Z3MgaGF2ZSBiZWVuIHNob3QgZG93bi4KPiA+ID4gCj4gPiA+IFRoZXJlZm9yZSwgZnJvbSB0aGUg
cHJvY2Vzc29ycyBwb2ludCBvZiB2aWV3LCBpdCBkaWQgZXZlcnl0aGluZwo+ID4gPiBjb3JyZWN0
bHksIGFuZCBoaXQgYSByZWFsIHBhZ2VmYXVsdC4KPiA+IAo+ID4gQm9vdCB0aW1lIHVwZGF0ZXMg
b2Ygc3lzdGVtX3N0YXRlIHNob3VsZCBiZSBvZiBubyBpbnRlcmVzdCBoZXJlLAo+ID4gYXMgYXQg
dGhhdCB0aW1lIHRoZSBBUHMgYXJlIGFsbCBpZGxpbmcuCj4gCj4gVGhhdCdzIHByb2JhYmx5IHRy
dWUgdG9kYXkuIEJ1dCB0aGlzIGNvZGUgbG9va3MgcmF0aGVyIGZyYWdpbGUgYXMgeW91IGRvbid0
Cj4ga25vdyBob3cgdGhpcyBpcyBnb2luZyB0byBiZSB1c2VkIGluIHRoZSBmdXR1cmUuCj4gCj4g
SWYgeW91IGRlY2lkZSB0byBnYXRlIGluaXQgY29kZSB3aXRoIHN5c3RlbV9zdGF0ZSwgdGhlbiB5
b3UgbmVlZCBhIGJhcnJpZXIKPiB0byBlbnN1cmUgdGhlIGNvZGUgaXMgZnV0dXJlIHByb29mLgoK
V291bGRuJ3QgaXQgYmUgZW5vdWdoIHRvIGRlY2xhcmUgc3lzdGVtX3N0YXRlIGFzIHZvbGF0aWxl
PwoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
