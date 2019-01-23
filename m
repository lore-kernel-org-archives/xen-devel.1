From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] iommu: specify page_count rather than
 page_order to iommu_map/unmap()...
Date: Wed, 23 Jan 2019 03:42:03 -0700
Message-ID: <5C4844FB02000078002104B5@prv1-mh.provo.novell.com>
References: <20190118160328.10455-1-paul.durrant@citrix.com>
 <5C45ACAA020000780020FAF9@prv1-mh.provo.novell.com>
 <b972772efd3f4ac195d9c0311f71acf6@AMSPEX02CL03.citrite.net>
 <5C45B568020000780020FB4A@prv1-mh.provo.novell.com>
 <a2497e649cfb499aa6f719fe474b5975@AMSPEX02CL03.citrite.net>
 <5C46F4980200007800210113@prv1-mh.provo.novell.com>
 <7e52fa7f-fcce-8025-9bdb-f52673d5f826@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gmFyz-0003hK-RQ
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 10:42:09 +0000
In-Reply-To: <7e52fa7f-fcce-8025-9bdb-f52673d5f826@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Sander Eikelenboom <linux@eikelenboom.it>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, IanJackson <Ian.Jackson@citrix.com>, Chao Gao <chao.gao@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAxLjE5IGF0IDE5OjIzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjIvMDEvMjAxOSAxMDo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Cj4+PiBSZWdh
cmRsZXNzIG9mIHRoZSAKPj4+IGFsaWdubWVudCB0aG91Z2gsIHRoZSBmYWN0IHRoYXQgb3JkZXIg
Y29tZXMgZnJvbSBhIGh5cGVyY2FsbCBhcmd1bWVudCBhbmQgbWF5IAo+Pj4gbm90IG1hdGNoIGFu
eSBvZiB0aGUgb3JkZXJzIHN1cHBvcnRlZCBieSB0aGUgSU9NTVUgaW1wbGVtZW50YXRpb24gbWFr
ZXMgbWUgCj4+PiB0aGluayB0aGF0IHVzaW5nIGEgcGFnZSBjb3VudCBpcyBiZXR0ZXIuCj4+IFNw
bGl0dGluZyB1cCBndWVzdCByZXF1ZXN0cyBpcyBvcnRob2dvbmFsIHRvIHdoZXRoZXIgYSBjb3Vu
dCBvciBhbgo+PiBvcmRlciBpcyBtb3JlIHN1aXRhYmxlIGFzIGEgcGFyYW1ldGVyLgo+IAo+IE5v
IC0gdGhpcyBpcyBtb3N0IGNlcnRhaW5seSBub3QgdHJ1ZS4KPiAKPiBBbnkgYXJiaXRyYXJ5IG1h
cHBpbmcgY2FuIGJlIGV4cHJlc3NlZCB3aXRoIGEgc2luZ2xlIG1hcCBjYWxsLCBnaXZlbiBhCj4g
c3RhcnQvY291bnQuICBUaGlzIGlzIG5vdCB0cnVlIG9mIGEgc3RhcnQvb3JkZXIgcGFpciwgc28g
c3RhcnQvY291bnQgaXMKPiBzdHJpY3RseSBtb3JlIGV4cHJlc3NpdmUuCj4gCj4gRnVydGhlcm1v
cmUsIEkndmUgYWxyZWFkeSBnaXZlbiB0aGUgZm9sbG93aW5nIGNvbmNyZXRlIG9wdGlvbnMgYXMg
dG8gd2h5Cj4gc3RhcnQvY291bnQgaXMgYmV0dGVyIHRoYW4gc3RhcnQvb3JkZXI6ICBSZWR1Y2Vk
IGNhbGxlciBsb29waW5nLAoKVGhhdCBkZXBlbmRzIG9uIGhvdyBtYW55IGNhbGxlcnMgYXJlIGFj
dHVhbGx5IGFmZmVjdGVkLiBIZW5jZSBteQpyZXF1ZXN0IGZvciBjb25jcmV0ZSBleGFtcGxlcy4g
SSdtIGFib3V0IHRvIGxvb2sgaW50byB3aGF0IFJvZ2VyJ3MKbGF0ZXN0IHJlcGx5IGlzIG1lYW5p
bmcgaW4gdGhpcyByZWdhcmQuCgo+IHJlZHVjZWQgVExCIGZsdXNoaW5nIGluIHRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uLAoKSSdtIGFmcmFpZCBJIGxhY2sgdGhlIGNvbm5lY3Rpb24gdG8gdGhl
IGFtb3VudCBvZiBUTEIgZmx1c2hpbmcgZG9uZS4KCj4gYW5kIHRoZSBmYWN0IHdlIGxpdGVyYWxs
eSBoYXZlIGh5cGVyY2FsbHMgdXNpbmcgdGhpcyBtZWNoYW5pc20gd2hvJ3MKPiBBUEkgaXMgc3Rh
YmxlLgoKSG1tLCB3b3VsZCB5b3UgbWluZCBoZWxwaW5nIG1lIHdpdGggdGhpcz8gQWxsIHRoZSBt
ZW1vcC1zIGFyZQp1c2luZyBvcmRlciB2YWx1ZXMgYXMgaW5wdXQuIFhFTl9ET01DVExfbWVtb3J5
X21hcHBpbmcgaXMKbm90IGEgc3RhYmxlIGludGVyZmFjZS4gV2hhdCBlbHNlIGRvIHdlIGhhdmUg
dGhhdCBJIGNhbid0IHNlZW0KdG8gcmVjYWxsPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
