From: Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: Xen optimizationcy
Date: Thu, 25 Oct 2018 09:18:51 -0700
Message-ID: <alpine.DEB.2.10.1810250917510.25937@sstabellini-ThinkPad-X260>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <21de0bb5-81f2-ca26-e2e0-916c20ab2c02@arm.com>
 <CADJ6SV3sfqaXm8gvZDAx2wFY5_oiCf+mf0JynCGNrLBFkS-rVw@mail.gmail.com>
 <alpine.DEB.2.10.1810191336090.31582@sstabellini-ThinkPad-X260>
 <d3a589c5d95d70ef1c13b4fe6856b7ed387b4ee3.camel@suse.com>
 <CADJ6SV2891kOd_Ga8jjXdtKdjPAoWtADhizuS+kjSZNNOPMK+w@mail.gmail.com>
 <alpine.DEB.2.10.1810221037270.31582@sstabellini-ThinkPad-X260>
 <CADJ6SV0gUvRv_4Kp=Vz5n4WSQ3kgQrC=+gPz1QjrBzdFOoJwPA@mail.gmail.com>
 <alpine.DEB.2.10.1810231005040.31582@sstabellini-ThinkPad-X260>
 <CADJ6SV3kj0sN-0nzfqBwbz_BMerArKRtdYAQ-FfgvdM3FPqu_Q@mail.gmail.com>
 <12464587-0b86-890c-d115-b5cc417ea0ef@arm.com>
 <CADJ6SV2Uzt=Q_C2ycXwcYqyQr290cHy3SzE0k08=WNHY1eBgRQ@mail.gmail.com>
 <8e4efe56-77df-cdf0-7f2d-485183f0c9ed@arm.com>
 <CADJ6SV0+A7n-d9aZERdpyui2XOSOczqO1o8A10qJBubPzkJrrQ@mail.gmail.com>
 <4a7ca225-130a-8002-e9ba-335e187f5f8b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=skzb=nf=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1gFiLh-0000fY-Ro
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 16:19:05 +0000
In-Reply-To: <4a7ca225-130a-8002-e9ba-335e187f5f8b@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: stefano.stabellini@xilinx.com, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, sstabellini@kernel.org, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyNSBPY3QgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDEwLzI1LzE4IDM6
NDcgUE0sIE1pbGFuIEJvYmVyaWMgd3JvdGU6Cj4gPiA+IEkgd2FzIGFza2luZyB0aGUgWGVuIGNv
bmZpZ3VyYXRpb24gKHhlbi8uY29uZmlnKSB0byBrbm93IHdoYXQgeW91IGhhdmUKPiA+ID4gZW5h
YmxlZCBpbiBYZW4uCj4gPiAKPiA+IE9oLCBzb3JyeSwgYmVjYXVzZSBJJ20gYnVpbGRpbmcgeGVu
IGZyb20gZ2l0IHJlcG9zaXRvcnkgaGVyZSBpcyB0aGUKPiA+IGxpbmsgdG8gaXQgd2hlcmUgeW91
IGNhbiBjaGVjayB0aGUgZmlsZSB5b3UgbWVudGlvbmVkLgo+ID4gCj4gPiBodHRwczovL2dpdGh1
Yi5jb20vWGlsaW54L3hlbi90cmVlL3hpbGlueC92ZXJzYWwveGVuCj4gCj4gSSBhbSBhZnJhaWQg
bm8uIC5jb25maWcgaXMgZ2VuZXJhdGVkIGR1cmluZyBidWlsZGluZyB0aW1lLiBTbyBjYW4geW91
IHBhc3RlCj4gaGVyZSBwbGVhc2UuCgpJdCBtb3N0IHByb2JhYmx5IGlzIHRoZSBkZWZhdWx0IGtj
b25maWcgZm9yIFhlbiA0LjExLgoKTWlsYW4sCgpKdWxpZW4gd2FzIGFza2luZyBmb3IgdGhlIGZp
bGUgbmFtZWQgIi5jb25maWciIHlvdSBjYW4gZmluZCB1bmRlciB0aGUKeGVuLyBkaXJlY3Rvcnku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
