From: Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: Xen optimization
Date: Thu, 25 Oct 2018 09:15:51 -0700
Message-ID: <alpine.DEB.2.10.1810250915030.25937@sstabellini-ThinkPad-X260>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <alpine.DEB.2.10.1810121035440.436@sstabellini-ThinkPad-X260>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=skzb=nf=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1gFiIm-0000XZ-Fy
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 16:16:04 +0000
In-Reply-To: <d5769cb9-9d87-3db4-e23d-414242692a89@arm.com>
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

T24gVGh1LCAyNSBPY3QgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMTAvMjQvMTggMToyNCBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
VHVlLCAyMyBPY3QgMjAxOCwgTWlsYW4gQm9iZXJpYyB3cm90ZToKPiA+IEkgZG9uJ3QgaGF2ZSBh
bnkgb3RoZXIgdGhpbmdzIHRvIHN1Z2dlc3QgcmlnaHQgbm93LiBZb3Ugc2hvdWxkIGJlIGFibGUK
PiA+IHRvIG1lYXN1cmUgYW4gb3ZlcmFsbCAyLjV1cyBJUlEgbGF0ZW5jeSAoaWYgdGhlIGludGVy
cnVwdCByYXRlIGlzIG5vdAo+ID4gdG9vIGhpZ2gpLgo+IAo+IElzIGl0IG51bWJlciB5b3UgbWVh
c3VyZWQgb24gWGVuIDQuMTEgZmxhdm9yZWQgWGlsaW54PyBPciBhcmUgdGhleSBjb21pbmcgZnJv
bQo+IHRoZSBibG9nIHBvc3QgWzFdIHdoaWNoIGlzIGJhc2VkIG9uIFhlbiA0Ljk/Cj4gCj4gSWYg
dGhlIGxhdHRlciwgdGhlbiBJIGNhbid0IHJ1bGUgb3V0IHdlIG1heSBoYXZlIGludHJvZHVjZSBh
IHNsb3dkb3duIGZvciBnb29kCj4gb3IgYmFkIHJlYXNvbi4uLgo+IAo+IFRvIHJ1bGUgb3V0IHRo
aXMgcG9zc2liaWxpdHksIEkgd291bGQgcmVjb21tZW5kIHRvIHRyeSBhbmQgcmVwcm9kdWNlIHRo
ZSBzYW1lCj4gbnVtYmVyIG9uIFhlbiA0LjkgYW5kIHRoZW4gdHJ5IHdpdGggWGVuIDQuMTEuCj4g
Cj4gQ2hlZXJzLAo+IAo+IFsxXSBodHRwczovL2Jsb2cueGVucHJvamVjdC5vcmcvMjAxNy8wMy8y
MC94ZW4tb24tYXJtLWludGVycnVwdC1sYXRlbmN5LwoKSSB3YXMgdGFsa2luZyBhYm91dCB0aGUg
b2xkIG51bWJlcnMgZnJvbSBYZW4gNC45LiBZb3UgYXJlIHJpZ2h0LCB3ZQpjYW5ub3QgcnVsZSBv
dXQgdGhlIHBvc3NpYmlsaXR5IHRoYXQgd2UgaW50cm9kdWNlZCBhIHNsb3dkb3duLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
