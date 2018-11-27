From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Tue, 27 Nov 2018 02:24:29 -0700
Message-ID: <5BFD0D4D02000078002003CD@prv1-mh.provo.novell.com>
References: <20181123132516.28681****************1****************jgross@suse.com>
 <5BFBD1C602000078001FFE09@suse.com>
 <d38b1c33****5cca****572a****a942****b1db8ca309a2@suse.com>
 <5BFBFCD3020000780020004F@suse.com>
 <955bec0d*f574*53c5*91a5*1d6ea0bc4f2a@suse.com>
 <5BFC0A1302000078002000E1@suse.com>
 <06592737*411f*d518*d972*6b4cdc704d9b@suse.com>
 <4c7158b4*d4da*994e*545b*8f5dec97dbb6@arm.com>
 <2b040ede-2103-b93c-c005-5ff39ae21c4c@suse.com>
 <5BFC2462020000780020022A@suse.com>
 <48ce4285-ed04-13e3-6fd7-9a70964d51bf@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRZbf-0001et-VE
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 09:24:35 +0000
In-Reply-To: <48ce4285-ed04-13e3-6fd7-9a70964d51bf@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjExLjE4IGF0IDA4OjM3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Ni8xMS8yMDE4IDE3OjUwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjYuMTEuMTggYXQg
MTc6MTcsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gSSByZWFsbHkgZmFpbCB0byBzZWUg
d2h5IGl0IGlzIHNvIGJhZCB0byBub3QgY2xvYmJlciBkYXRhIGluIGEgY2FzZQo+Pj4gd2hpY2gg
bm9ybWFsbHkgc2hvdWxkIG5ldmVyIG9jY3VyLgo+PiAKPj4gU2VlIEFuZHJldydzIG9yaWdpbmFs
IHJlcGx5LiBZb3UncmUgYWxzbyBjbG9iYmVyaW5nIG9uIHBvdGVudGlhbAo+PiBzdWNjZXNzIHBh
dGhzLgo+IAo+IEkgdGhpbmsgeW91IGFyZSBtaXNzaW5nIGEgIm5vdCIgaGVyZS4KPiAKPiBCdXQg
eWVzLCBJIGFncmVlLiBUaGlzIGlzIGEgZG93bnNpZGUgX0lfIHRoaW5rIHdlIGNhbiBsaXZlIHdp
dGguCj4gCj4gSG93IG1hbnkgY2FzZXMgKHdpdGggcHJvZHVjdGl2ZSBoeXBlcnZpc29ycykgYXJl
IGtub3duIHdoZXJlIG11bHRpY2FsbAo+IHBhcmFtZXRlcnMgaGF2ZSBiZWVuIGlsbGVnYWxseSBy
ZS11c2VkPyBJIGd1ZXNzIHRoZSBudW1iZXIgaXMgZXhhY3RseSAwLgoKSSdtIG5vdCBhd2FyZSBv
ZiBhbnkgZWl0aGVyLCBidXQgdGhpcyBtZWFucyBleGFjdGx5IG5vdGhpbmcuCgo+IEkga25vdyBv
ZiBsZWFzdCBvbmUgY2FzZSB3aGVyZSBub3QgY2xvYmJlcmluZyB3b3VsZCBiZSB1c2VmdWwgZm9y
Cj4gZGlhZ25vc3RpYyByZWFzb25zLgoKV2VsbCwgSSdtIGluIGFncmVlbWVudCB3aXRoIEp1bGll
biB0aGF0IHRoZSBiZWhhdmlvciBiZXR3ZWVuIG9yZGluYXJ5Cmh5cGVyY2FsbHMgYW5kIG11bHRp
Y2FsbHMgd291bGQgYmV0dGVyIGJlIGFzIGNvbnNpc3RlbnQgYXMgcG9zc2libGUuCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
