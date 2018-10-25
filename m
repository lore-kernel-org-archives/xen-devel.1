From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen optimization
Date: Thu, 25 Oct 2018 15:04:10 +0100
Message-ID: <8e4efe56-77df-cdf0-7f2d-485183f0c9ed@arm.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
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
 <CADJ6SV3kj0sN-0nzfqBwbz_BMerArKRtdYAQ-FfgvdM3FPqu_Q@mail.gmail.com>
 <12464587-0b86-890c-d115-b5cc417ea0ef@arm.com>
 <CADJ6SV2Uzt=Q_C2ycXwcYqyQr290cHy3SzE0k08=WNHY1eBgRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uelk=nf=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gFgFF-0004HF-Dl
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 14:04:17 +0000
In-Reply-To: <CADJ6SV2Uzt=Q_C2ycXwcYqyQr290cHy3SzE0k08=WNHY1eBgRQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Milan Boberic <milanboberic94@gmail.com>
Cc: stefano.stabellini@xilinx.com, andrii_anisov@epam.com, Dario Faggioli <dfaggioli@suse.com>, sstabellini@kernel.org, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMC8yNS8xOCAxOjM2IFBNLCBNaWxhbiBCb2JlcmljIHdyb3RlOgo+IE9uIFRodSwgT2N0
IDI1LCAyMDE4IGF0IDE6MzAgUE0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4g
d3JvdGU6Cj4+Cj4+IEhpIE1pbGFuLAo+IAo+IEhpIEp1bGllbiwKPiAKPj4gU29ycnkgaWYgaXQg
d2FzIGFscmVhZHkgYXNrZWQuIENhbiB5b3UgcHJvdmlkZSB5b3VyIC5jb25maWcgZm9yIHlvdXIK
Pj4gdGVzdD8KPiAKPiBZZXMgb2YgY291cnNlLCBiYXJlLW1ldGFsJ3MgLmNmZyBmaWxlIGlzIGlu
IGl0J3MgaW4gYXR0YWNobWVudCAoaWYKPiB0aGF0IGlzIHdoYXQgeW91IGFza2VkIDopICkuCkkg
d2FzIGFza2luZyB0aGUgWGVuIGNvbmZpZ3VyYXRpb24gKHhlbi8uY29uZmlnKSB0byBrbm93IHdo
YXQgeW91IGhhdmUgCmVuYWJsZWQgaW4gWGVuLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
