From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to
 irq created for msi.
Date: Thu, 28 Feb 2019 12:41:50 +0100
Message-ID: <20190228114150.mzhsbs4blqq4jkts@Air-de-Roger>
References: <20190208101559.GA21228@mail-itl>
 <20190208101705.31790-1-marmarek@invisiblethingslab.com>
 <5C766F8A020000780021AA64@prv1-mh.provo.novell.com>
 <20190227151851.GF19265@mail-itl>
 <5C77BCE6020000780021B005@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rn/R=RD=citrix.com=prvs=9559e9694=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gzK5D-0001OE-7K
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 11:42:35 +0000
Content-Disposition: inline
In-Reply-To: <5C77BCE6020000780021B005@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjgsIDIwMTkgYXQgMDM6NTA6MTRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI3LjAyLjE5IGF0IDE2OjE4LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdz
bGFiLmNvbT4gd3JvdGU6Cj4gPiBPbiBXZWQsIEZlYiAyNywgMjAxOSBhdCAwNDowNzo1NEFNIC0w
NzAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMDguMDIuMTkgYXQgMTE6MTcsIDxt
YXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToKPiA+PiA+IEBAIC0xOTAsMTkg
KzE5MCwxOSBAQCBpbnQgY3JlYXRlX2lycShub2RlaWRfdCBub2RlKQo+ID4+ID4gICAgICAgICAg
ZGVzYy0+YXJjaC51c2VkID0gSVJRX1VOVVNFRDsKPiA+PiA+ICAgICAgICAgIGlycSA9IHJldDsK
PiA+PiA+ICAgICAgfQo+ID4+ID4gLSAgICBlbHNlIGlmICggaGFyZHdhcmVfZG9tYWluICkKPiA+
PiA+ICsgICAgZWxzZSBpZiAoIGRtX2RvbWFpbiApCj4gPj4gPiAgICAgIHsKPiA+PiA+IC0gICAg
ICAgIHJldCA9IGlycV9wZXJtaXRfYWNjZXNzKGhhcmR3YXJlX2RvbWFpbiwgaXJxKTsKPiA+PiA+
ICsgICAgICAgIHJldCA9IGlycV9wZXJtaXRfYWNjZXNzKGRtX2RvbWFpbiwgaXJxKTsKPiA+PiAK
PiA+PiBEb2Vzbid0IHRoaXMgaW1wbHkgdGhhdCBEb20wIGhhcyBubyB3YXkgb2YgY2xlYW5pbmcg
dXAgYWZ0ZXIgdGhlCj4gPj4gZ3Vlc3Qvc3R1YmRvbSBwYWlyPyBJT1cgSSB3b25kZXIgd2hldGhl
ciBib3RoIGRtIGFuZCBod2RvbQo+ID4+IHNob3VsZCBiZSBncmFudGVkIGFjY2Vzcy4KPiA+IAo+
ID4gU2VlIGRpc2N1c3Npb24gd2l0aCBSb2dlciBvbiB0aGlzIHZlcnkgcGF0Y2guCj4gPiBJbiBz
aG9ydDogc2luY2UgcGVybWlzc2lvbnMgYXJlIHN0b3JlZCBpbiBkb21haW4gc3RydWN0LCBub3Qg
aXJxLCB0aGVyZQo+ID4gaXMgbm90IG11Y2ggdG8gY2xlYW51cCBhZnRlciBkb21haW4gZGVzdHJ1
Y3Rpb24uCj4gCj4gTXkgcG9pbnQgd2Fzbid0IGFib3V0IGNsZWFuaW5nIHVwIHBlcm1pc3Npb25z
LCBidXQgYWJvdXQgY2xlYW5pbmcKPiB1cCB0aGUgSVJRcy4gRG9tMCBjYW4ndCBkbyBhbnl0aGlu
ZyB3aXRoIHRoZW0gd2l0aG91dCBiZWluZwo+IGdpdmVuIHBlcm1pc3Npb24uCgpJcnFzIHNob3Vs
ZCBiZSBjbGVhbmVkIHVwIGJ5IHRoZSBkb21haW4gbW9kZWwgaW4gY2FzZSBvZiBob3QtdW5wbHVn
LApvciBieSBYZW4gd2hlbiB0aGUgZG9tYWluIGlzIGRlc3Ryb3llZCBhbmQgdGhlIGRldmljZSBp
cyBkZWFzc2lnbmVkLgpUaGlzIHdpbGwgYmUgZml4ZWQgYnkgdGhlIEludGVsIHBhdGNoZXMgcG9z
dGVkIGJ5IENoYW8gSUlSQy4KCkFGQUlDVCB0aGlzIGlzIG5vIGRpZmZlcmVudCBmcm9tIHdoZW4g
dGhlIGRldmljZSBtb2RlbCBpbiBkb20wIGNyYXNoZXMKYW5kIFhlbiBoYXMgdG8gcGVyZm9ybSB0
aGUgY2xlYW4gdXAgb2YgTVNJL01TSS1YIGlycXMsIHNpbmNlIG5laXRoZXIKcGNpYmFjaywgbm9y
IHRoZSB0b29sc3RhY2sga25vdyBhbnl0aGluZyBhYm91dCB0aG9zZSBpcnFzLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
