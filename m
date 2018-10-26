From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen optimization
Date: Fri, 26 Oct 2018 20:12:31 +0100
Message-ID: <94c08d07-b028-8eb1-7e94-21a416cd8007@arm.com>
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
 <alpine.DEB.2.10.1810250915030.25937@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cgvd=ng=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gG7XE-0004va-QT
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 19:12:40 +0000
In-Reply-To: <alpine.DEB.2.10.1810250915030.25937@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: sstabellini@kernel.org, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDEwLzI1LzE4IDU6MTUgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUaHUsIDI1IE9jdCAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIFN0ZWZh
bm8sCj4+Cj4+IE9uIDEwLzI0LzE4IDE6MjQgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
Pj4+IE9uIFR1ZSwgMjMgT2N0IDIwMTgsIE1pbGFuIEJvYmVyaWMgd3JvdGU6Cj4+PiBJIGRvbid0
IGhhdmUgYW55IG90aGVyIHRoaW5ncyB0byBzdWdnZXN0IHJpZ2h0IG5vdy4gWW91IHNob3VsZCBi
ZSBhYmxlCj4+PiB0byBtZWFzdXJlIGFuIG92ZXJhbGwgMi41dXMgSVJRIGxhdGVuY3kgKGlmIHRo
ZSBpbnRlcnJ1cHQgcmF0ZSBpcyBub3QKPj4+IHRvbyBoaWdoKS4KPj4KPj4gSXMgaXQgbnVtYmVy
IHlvdSBtZWFzdXJlZCBvbiBYZW4gNC4xMSBmbGF2b3JlZCBYaWxpbng/IE9yIGFyZSB0aGV5IGNv
bWluZyBmcm9tCj4+IHRoZSBibG9nIHBvc3QgWzFdIHdoaWNoIGlzIGJhc2VkIG9uIFhlbiA0Ljk/
Cj4+Cj4+IElmIHRoZSBsYXR0ZXIsIHRoZW4gSSBjYW4ndCBydWxlIG91dCB3ZSBtYXkgaGF2ZSBp
bnRyb2R1Y2UgYSBzbG93ZG93biBmb3IgZ29vZAo+PiBvciBiYWQgcmVhc29uLi4uCj4+Cj4+IFRv
IHJ1bGUgb3V0IHRoaXMgcG9zc2liaWxpdHksIEkgd291bGQgcmVjb21tZW5kIHRvIHRyeSBhbmQg
cmVwcm9kdWNlIHRoZSBzYW1lCj4+IG51bWJlciBvbiBYZW4gNC45IGFuZCB0aGVuIHRyeSB3aXRo
IFhlbiA0LjExLgo+Pgo+PiBDaGVlcnMsCj4+Cj4+IFsxXSBodHRwczovL2Jsb2cueGVucHJvamVj
dC5vcmcvMjAxNy8wMy8yMC94ZW4tb24tYXJtLWludGVycnVwdC1sYXRlbmN5Lwo+IAo+IEkgd2Fz
IHRhbGtpbmcgYWJvdXQgdGhlIG9sZCBudW1iZXJzIGZyb20gWGVuIDQuOS4gWW91IGFyZSByaWdo
dCwgd2UKPiBjYW5ub3QgcnVsZSBvdXQgdGhlIHBvc3NpYmlsaXR5IHRoYXQgd2UgaW50cm9kdWNl
ZCBhIHNsb3dkb3duLgoKQ2FuIHlvdSB0cnkgdG8gcmVwcm9kdWNlIHRob3NlIG51bWJlciB3aXRo
IHlvdXIgc2V0dXAgb24gWGVuIDQuMTE/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
