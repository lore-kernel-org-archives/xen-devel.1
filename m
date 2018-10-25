From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen optimization
Date: Thu, 25 Oct 2018 12:09:29 +0100
Message-ID: <d5769cb9-9d87-3db4-e23d-414242692a89@arm.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <CADJ6SV2v5=_MqfrABdfs1rcQ-BmCUJYyi_9fG8BC7C2vyxaqBA@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uelk=nf=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gFdWC-000664-T1
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 11:09:36 +0000
In-Reply-To: <alpine.DEB.2.10.1810231005040.31582@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>, Milan Boberic <milanboberic94@gmail.com>
Cc: sstabellini@kernel.org, andrii_anisov@epam.com, Dario Faggioli <dfaggioli@suse.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDEwLzI0LzE4IDE6MjQgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDIzIE9jdCAyMDE4LCBNaWxhbiBCb2JlcmljIHdyb3RlOgo+IEkgZG9uJ3Qg
aGF2ZSBhbnkgb3RoZXIgdGhpbmdzIHRvIHN1Z2dlc3QgcmlnaHQgbm93LiBZb3Ugc2hvdWxkIGJl
IGFibGUKPiB0byBtZWFzdXJlIGFuIG92ZXJhbGwgMi41dXMgSVJRIGxhdGVuY3kgKGlmIHRoZSBp
bnRlcnJ1cHQgcmF0ZSBpcyBub3QKPiB0b28gaGlnaCkuCgpJcyBpdCBudW1iZXIgeW91IG1lYXN1
cmVkIG9uIFhlbiA0LjExIGZsYXZvcmVkIFhpbGlueD8gT3IgYXJlIHRoZXkgCmNvbWluZyBmcm9t
IHRoZSBibG9nIHBvc3QgWzFdIHdoaWNoIGlzIGJhc2VkIG9uIFhlbiA0Ljk/CgpJZiB0aGUgbGF0
dGVyLCB0aGVuIEkgY2FuJ3QgcnVsZSBvdXQgd2UgbWF5IGhhdmUgaW50cm9kdWNlIGEgc2xvd2Rv
d24gCmZvciBnb29kIG9yIGJhZCByZWFzb24uLi4KClRvIHJ1bGUgb3V0IHRoaXMgcG9zc2liaWxp
dHksIEkgd291bGQgcmVjb21tZW5kIHRvIHRyeSBhbmQgcmVwcm9kdWNlIHRoZSAKc2FtZSBudW1i
ZXIgb24gWGVuIDQuOSBhbmQgdGhlbiB0cnkgd2l0aCBYZW4gNC4xMS4KCkNoZWVycywKClsxXSBo
dHRwczovL2Jsb2cueGVucHJvamVjdC5vcmcvMjAxNy8wMy8yMC94ZW4tb24tYXJtLWludGVycnVw
dC1sYXRlbmN5LwoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
