From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen optimization
Date: Wed, 31 Oct 2018 18:59:38 +0000
Message-ID: <67f6ece7-0a26-e29c-b20b-acf83a01f6eb@arm.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
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
 <alpine.DEB.2.10.1810261340530.32521@sstabellini-ThinkPad-X260>
 <CADJ6SV174NdceJ4kWCWYJ-UaNp1AAisb28V5tgKz14N+-pBVEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yklc=nl=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gHviS-00020S-0N
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 18:59:44 +0000
In-Reply-To: <CADJ6SV174NdceJ4kWCWYJ-UaNp1AAisb28V5tgKz14N+-pBVEg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Milan Boberic <milanboberic94@gmail.com>, stefano.stabellini@xilinx.com
Cc: sstabellini@kernel.org, andrii_anisov@epam.com, Dario Faggioli <dfaggioli@suse.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

SGkgTWlsYW4sCgpPbiAxMC8yOS8xOCAxMjoyOSBQTSwgTWlsYW4gQm9iZXJpYyB3cm90ZToKPiBT
b3JyeSBmb3IgbGF0ZSByZXBseSwKCkRvbid0IHdvcnJ5LCB0aGFuayB5b3UgZm9yIHRoZSB0ZXN0
aW5nIGFuZCBzZW5kaW5nIHRoZSAuY29uZmlnLgoKPiAKPj4gSSBhbSBhZnJhaWQgbm8uIC5jb25m
aWcgaXMgZ2VuZXJhdGVkIGR1cmluZyBidWlsZGluZyB0aW1lLiBTbyBjYW4geW91Cj4+IHBhc3Rl
IGhlcmUgcGxlYXNlLgo+IAo+IAo+ICIuY29uZmlnIiBmaWxlIGlzIGluIGF0dGFjaG1lbnQuCj4g
Cj4gSSBhbHNvIHRyaWVkIFhlbiA0LjkgYW5kIEkgZ290IGFsbW9zdCBzYW1lIG51bWJlcnMsIGpp
dHRlciBpcyBzbWFsbGVyCj4gYnkgMTUwbnMgd2hpY2ggaXNuJ3Qgc2lnbmlmaWNhbnQgY2hhbmdl
IGF0IGFsbC4KCkludGVyZXN0aW5nLiBDb3VsZCB5b3UgY29uZmlybSB0aGUgY29tbWl0IHlvdSB3
ZXJlIHVzaW5nIChvciB0aGUgcG9pbnQgCnJlbGVhc2UpPwoKU3RlZmFubydzIG51bWJlciB3ZXJl
IGJhc2VkIG9uIGNvbW1pdCAiZnV6ejogdXBkYXRlIFJFQURNRS5hZmwgZXhhbXBsZSIgCjU1YTA0
ZmVhYTFmOGFiNmVmN2Q3MjNmYmIxZDM5YzZiOTZhZDE4NGEgd2hpY2ggaXMgYW4gdW5yZWxlYXNl
ZCB2ZXJzaW9uIApvZiBYZW4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
