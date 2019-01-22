From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] iommu: specify page_count rather than
 page_order to iommu_map/unmap()...
Date: Tue, 22 Jan 2019 18:02:13 +0100
Message-ID: <20190122170213.jx5vc3e76qbqkynf@mac>
References: <20190118160328.10455-1-paul.durrant@citrix.com>
 <5C45ACAA020000780020FAF9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y/S+=P6=citrix.com=prvs=918322aae=roger.pau@srs-us1.protection.inumbo.net>)
 id 1glzRz-00029K-43
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 17:02:59 +0000
Content-Disposition: inline
In-Reply-To: <5C45ACAA020000780020FAF9@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Sander Eikelenboom <linux@eikelenboom.it>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMDQ6Mjc6MzhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE4LjAxLjE5IGF0IDE3OjAzLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4gLi4uYW5kIHJlbW92ZSBhbGlnbm1lbnQgYXNzZXJ0aW9ucy4KPiA+IAo+ID4g
VGVzdGluZyBzaG93cyB0aGF0IGNlcnRhaW4gY2FsbGVycyBvZiBpb21tdV9sZWdhY3lfbWFwL3Vu
bWFwKCkgc3BlY2lmeQo+ID4gb3JkZXIgPiAwIHJhbmdlcyB0aGF0IGFyZSBub3Qgb3JkZXIgYWxp
Z25lZCB0aHVzIGNhdXNpbmcgb25lIG9mIHRoZQo+ID4gSVNfQUxJR05FRCgpIGFzc2VydGlvbnMg
dG8gZmlyZS4KPiAKPiBBcyBzYWlkIGJlZm9yZSAtIHdpdGhvdXQgYSBtdWNoIGJldHRlciBleHBs
YW5hdGlvbiBvZiB3aHkgdGhlIGN1cnJlbnQKPiBvcmRlci1iYXNlZCBtb2RlbCBpcyB1bnN1aXRh
YmxlIChzbyBmYXIgSSd2ZSBiZWVuIHByb3ZpZGVkIG9ubHkgdmFndWUKPiBwb2ludGVycyBpbnRv
ICJzb21ld2hlcmUgaW4gUFZIIERvbTAgYm9vdCBjb2RlIiBpaXJjKSB0byB1bmRlcnN0YW5kCj4g
d2h5IGl0J3MgdW5kZXNpcmFibGUgdG8gc2ltcGx5IG1ha2UgdGhvc2UgY2FsbCBzaXRlcyBvYmV5
IHRvIHRoZSBjdXJyZW50Cj4gcmVxdWlyZW1lbnRzLCBJJ20gbm90IGhhcHB5IHRvIHNlZSB1cyBn
byB0aGlzIHJvdXRlLgoKVGhlIGN1cnJlbnQgUFZIIGRvbTAgYnVpbGRlciB3aWxsIHRyeSB0byBh
bHdheXMgdXNlIHRoZSBiaWdnZXN0CnBvc3NpYmxlIG9yZGVyIHRvIHBvcHVsYXRlIHRoZSBwaHlz
bWFwLgoKSG93ZXZlciwgdGhlIG1lbW9yeSBtYXAgdXNlZCBieSBkb20wIGlzIG5vdCB1bmRlciBv
dXIgY29udHJvbCwgc28gaXQncwpxdWl0ZSBsaWtlbHkgdGhhdCBhIFJBTSByZWdpb24gc3RhcnRz
IGF0IGEgNEsgb25seSBhbGlnbmVkIGFkZHJlc3MuCmRvbTAgYnVpbGRlciB3aWxsIHRoZW4gZmlu
ZCB0aGUgbmV4dCAyTSBvciAxRyBhbGlnbmVkIGFkZHJlc3MgYW5kCnBvcHVsYXRlIHRoZSBzcGFj
ZSBiZXR3ZWVuIHRoZSBjdXJyZW50IGFkZHJlc3MgYW5kIHRoZSBuZXh0IGFsaWduZWQKYWRkcmVz
cyB1c2luZyBhbiBvcmRlciBhcyBoaWdoIGFzIHBvc3NpYmxlLiBJbiB0aGUgYWJvdmUgc2NlbmFy
aW8sCml0J3MgcGVyZmVjdGx5IGZpbmUgdG8gcG9wdWxhdGUgYSA0SyBhbGlnbmVkIGVudHJ5IHVz
aW5nIGFuIG9yZGVyIG9mIDUKZm9yIGV4YW1wbGUsIGluIG9yZGVyIHRvIHJlYWNoIHRoZSBuZXh0
IDJNIG9yIDFHIGFsaWduZWQgYWRkcmVzcy4KCk5vdCByZW1vdmluZyB0aGUgYXNzZXJ0cyB3b3Vs
ZCBpbXBseSB0aGF0IGluIHRoZSBhYm92ZSBleGFtcGxlIHRoZQpkb20wIGJ1aWxkZXIgaGFzIHRv
IGl0ZXJhdGUgb3ZlciBhbGwgdGhlIDRLIHBhZ2VzIGFuZCBtYWtlIHJlcGVhdGVkCmd1ZXN0X3Bo
eXNtYXBfYWRkX3BhZ2UgY2FsbHMgd2l0aCBvcmRlciAwLiBUaGlzIGlzIHN1Yi1vcHRpbWFsLApj
cmVhdGVzIGEgbm9uLXRyaXZpYWwgb3ZlcmhlYWQgdG8gdGhlIERvbTAgYnVpbGRlciwgYW5kIGFs
c28gcHJvbW90ZXMKdGhlIG9wZW4tY29kaW5nIG9mIGxvb3BzIGFyb3VuZCBndWVzdF9waHlzbWFw
X2FkZF9wYWdlLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
