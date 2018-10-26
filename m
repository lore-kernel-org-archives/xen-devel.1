From: Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: Xen optimization
Date: Fri, 26 Oct 2018 13:41:13 -0700
Message-ID: <alpine.DEB.2.10.1810261340530.32521@sstabellini-ThinkPad-X260>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <CADJ6SV3jk=nnP=6T8R+OuvJH2uQ6uBrLmvudAHkKHP+mN-3hPA@mail.gmail.com>
 <e0f4fe11-eeb0-3a28-2e7e-246a8f72da19@arm.com>
 <12a4352a-2fd1-2d04-874a-4a779d18a097@arm.com>
 <CADJ6SV0E=cO3eFyt+meXTtZaoETYxpsHkViMDU=XV9CwNOjP8A@mail.gmail.com>
 <21de0bb5-81f2-ca26-e2e0-916c20ab2c02@arm.com>
 <CADJ6SV3sfqaXm8gvZDAx2wFY5_oiCf+mf0JynCGNrLBFkS-rVw@mail.gmail.com>
 <alpine.DEB.2.10.1810191336090.31582@sstabellini-ThinkPad-X260>
 <d3a589c5d95d70ef1c13b4fe6856b7ed387b4ee3.camel@suse.com>
 <CADJ6SV2891kOd_Ga8jjXdtKdjPAoWtADhizuS+kjSZNNOPMK+w@mail.gmail.com>
 <alpine.DEB.2.10.1810221037270.31582@sstabellini-ThinkPad-X260>
 <CADJ6SV0gUvRv_4Kp=Vz5n4WSQ3kgQrC=+gPz1QjrBzdFOoJwPA@mail.gmail.com>
 <alpine.DEB.2.10.1810231005040.31582@sstabellini-ThinkPad-X260>
 <d5769cb9-9d87-3db4-e23d-414242692a89@arm.com>
 <alpine.DEB.2.10.1810250915030.25937@sstabellini-ThinkPad-X260>
 <94c08d07-b028-8eb1-7e94-21a416cd8007@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vxfo=ng=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1gG8vJ-0003az-O5
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 20:41:37 +0000
In-Reply-To: <94c08d07-b028-8eb1-7e94-21a416cd8007@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, sstabellini@kernel.org, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyNiBPY3QgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMTAvMjUvMTggNToxNSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
VGh1LCAyNSBPY3QgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBIaSBTdGVmYW5vLAo+
ID4gPiAKPiA+ID4gT24gMTAvMjQvMTggMToyNCBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+ID4gPiA+IE9uIFR1ZSwgMjMgT2N0IDIwMTgsIE1pbGFuIEJvYmVyaWMgd3JvdGU6Cj4gPiA+
ID4gSSBkb24ndCBoYXZlIGFueSBvdGhlciB0aGluZ3MgdG8gc3VnZ2VzdCByaWdodCBub3cuIFlv
dSBzaG91bGQgYmUgYWJsZQo+ID4gPiA+IHRvIG1lYXN1cmUgYW4gb3ZlcmFsbCAyLjV1cyBJUlEg
bGF0ZW5jeSAoaWYgdGhlIGludGVycnVwdCByYXRlIGlzIG5vdAo+ID4gPiA+IHRvbyBoaWdoKS4K
PiA+ID4gCj4gPiA+IElzIGl0IG51bWJlciB5b3UgbWVhc3VyZWQgb24gWGVuIDQuMTEgZmxhdm9y
ZWQgWGlsaW54PyBPciBhcmUgdGhleSBjb21pbmcKPiA+ID4gZnJvbQo+ID4gPiB0aGUgYmxvZyBw
b3N0IFsxXSB3aGljaCBpcyBiYXNlZCBvbiBYZW4gNC45Pwo+ID4gPiAKPiA+ID4gSWYgdGhlIGxh
dHRlciwgdGhlbiBJIGNhbid0IHJ1bGUgb3V0IHdlIG1heSBoYXZlIGludHJvZHVjZSBhIHNsb3dk
b3duIGZvcgo+ID4gPiBnb29kCj4gPiA+IG9yIGJhZCByZWFzb24uLi4KPiA+ID4gCj4gPiA+IFRv
IHJ1bGUgb3V0IHRoaXMgcG9zc2liaWxpdHksIEkgd291bGQgcmVjb21tZW5kIHRvIHRyeSBhbmQg
cmVwcm9kdWNlIHRoZQo+ID4gPiBzYW1lCj4gPiA+IG51bWJlciBvbiBYZW4gNC45IGFuZCB0aGVu
IHRyeSB3aXRoIFhlbiA0LjExLgo+ID4gPiAKPiA+ID4gQ2hlZXJzLAo+ID4gPiAKPiA+ID4gWzFd
IGh0dHBzOi8vYmxvZy54ZW5wcm9qZWN0Lm9yZy8yMDE3LzAzLzIwL3hlbi1vbi1hcm0taW50ZXJy
dXB0LWxhdGVuY3kvCj4gPiAKPiA+IEkgd2FzIHRhbGtpbmcgYWJvdXQgdGhlIG9sZCBudW1iZXJz
IGZyb20gWGVuIDQuOS4gWW91IGFyZSByaWdodCwgd2UKPiA+IGNhbm5vdCBydWxlIG91dCB0aGUg
cG9zc2liaWxpdHkgdGhhdCB3ZSBpbnRyb2R1Y2VkIGEgc2xvd2Rvd24uCj4gCj4gQ2FuIHlvdSB0
cnkgdG8gcmVwcm9kdWNlIHRob3NlIG51bWJlciB3aXRoIHlvdXIgc2V0dXAgb24gWGVuIDQuMTE/
CgpZZXMsIEkgaW50ZW5kIHRvLCBpdCBpcyBvbiBteSBUT0RPLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
