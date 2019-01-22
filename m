From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] iommu: specify page_count rather than
 page_order to iommu_map/unmap()...
Date: Tue, 22 Jan 2019 18:23:27 +0000
Message-ID: <7e52fa7f-fcce-8025-9bdb-f52673d5f826@citrix.com>
References: <20190118160328.10455-1-paul.durrant@citrix.com>
 <5C45ACAA020000780020FAF9@prv1-mh.provo.novell.com>
 <b972772efd3f4ac195d9c0311f71acf6@AMSPEX02CL03.citrite.net>
 <5C45B568020000780020FB4A@prv1-mh.provo.novell.com>
 <a2497e649cfb499aa6f719fe474b5975@AMSPEX02CL03.citrite.net>
 <5C46F4980200007800210113@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k5g+=P6=citrix.com=prvs=91881ecf4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gm0hw-0000Du-2m
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 18:23:32 +0000
In-Reply-To: <5C46F4980200007800210113@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Sander Eikelenboom <linux@eikelenboom.it>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, IanJackson <Ian.Jackson@citrix.com>, Chao Gao <chao.gao@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDEvMjAxOSAxMDo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4KPj4gUmVnYXJkbGVzcyBv
ZiB0aGUgCj4+IGFsaWdubWVudCB0aG91Z2gsIHRoZSBmYWN0IHRoYXQgb3JkZXIgY29tZXMgZnJv
bSBhIGh5cGVyY2FsbCBhcmd1bWVudCBhbmQgbWF5IAo+PiBub3QgbWF0Y2ggYW55IG9mIHRoZSBv
cmRlcnMgc3VwcG9ydGVkIGJ5IHRoZSBJT01NVSBpbXBsZW1lbnRhdGlvbiBtYWtlcyBtZSAKPj4g
dGhpbmsgdGhhdCB1c2luZyBhIHBhZ2UgY291bnQgaXMgYmV0dGVyLgo+IFNwbGl0dGluZyB1cCBn
dWVzdCByZXF1ZXN0cyBpcyBvcnRob2dvbmFsIHRvIHdoZXRoZXIgYSBjb3VudCBvciBhbgo+IG9y
ZGVyIGlzIG1vcmUgc3VpdGFibGUgYXMgYSBwYXJhbWV0ZXIuCgpObyAtIHRoaXMgaXMgbW9zdCBj
ZXJ0YWlubHkgbm90IHRydWUuCgpBbnkgYXJiaXRyYXJ5IG1hcHBpbmcgY2FuIGJlIGV4cHJlc3Nl
ZCB3aXRoIGEgc2luZ2xlIG1hcCBjYWxsLCBnaXZlbiBhCnN0YXJ0L2NvdW50LsKgIFRoaXMgaXMg
bm90IHRydWUgb2YgYSBzdGFydC9vcmRlciBwYWlyLCBzbyBzdGFydC9jb3VudCBpcwpzdHJpY3Rs
eSBtb3JlIGV4cHJlc3NpdmUuCgpGdXJ0aGVybW9yZSwgSSd2ZSBhbHJlYWR5IGdpdmVuIHRoZSBm
b2xsb3dpbmcgY29uY3JldGUgb3B0aW9ucyBhcyB0byB3aHkKc3RhcnQvY291bnQgaXMgYmV0dGVy
IHRoYW4gc3RhcnQvb3JkZXI6wqAgUmVkdWNlZCBjYWxsZXIgbG9vcGluZywgcmVkdWNlZApUTEIg
Zmx1c2hpbmcgaW4gdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24sIGFuZCB0aGUgZmFjdCB3ZSBs
aXRlcmFsbHkKaGF2ZSBoeXBlcmNhbGxzIHVzaW5nIHRoaXMgbWVjaGFuaXNtIHdobydzIEFQSSBp
cyBzdGFibGUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
