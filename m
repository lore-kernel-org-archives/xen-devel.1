From: Milan Boberic <milanboberic94@gmail.com>
Subject: Re: Xen optimization
Date: Wed, 31 Oct 2018 21:35:17 +0100
Message-ID: <CADJ6SV22eAxR0s0ocpGNRRefo+FmsMz9KsEeXw+cME1sSM-ssg@mail.gmail.com>
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
 <67f6ece7-0a26-e29c-b20b-acf83a01f6eb@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uxyi=nl=gmail.com=milanboberic94@srs-us1.protection.inumbo.net>)
 id 1gHxD8-00028o-OE
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 20:35:30 +0000
Received: by mail-lj1-x243.google.com with SMTP id g8-v6so13211041ljk.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Oct 2018 13:35:29 -0700 (PDT)
In-Reply-To: <67f6ece7-0a26-e29c-b20b-acf83a01f6eb@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: stefano.stabellini@xilinx.com, andrii_anisov@epam.com, Dario Faggioli <dfaggioli@suse.com>, sstabellini@kernel.org, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

SGksCgo+IEludGVyZXN0aW5nLiBDb3VsZCB5b3UgY29uZmlybSB0aGUgY29tbWl0IHlvdSB3ZXJl
IHVzaW5nIChvciB0aGUgcG9pbnQKPiByZWxlYXNlKT8KPiBTdGVmYW5vJ3MgbnVtYmVyIHdlcmUg
YmFzZWQgb24gY29tbWl0ICJmdXp6OiB1cGRhdGUgUkVBRE1FLmFmbCBleGFtcGxlIgo+IDU1YTA0
ZmVhYTFmOGFiNmVmN2Q3MjNmYmIxZDM5YzZiOTZhZDE4NGEgd2hpY2ggaXMgYW4gdW5yZWxlYXNl
ZCB2ZXJzaW9uCj4gb2YgWGVuLgoKQWxsIFhlbnMgSSB1c2VkIGFyZSBmcm9tIFhpbGlueCBnaXQg
cmVwb3NpdG9yeSBiZWNhdXNlIEkgaGF2ZQpVbHRyYVplZC1FRyBib2FyZCB3aGljaCBoYXMgWnlu
cSBVbHRyYVNjYWxlIFNvQy4KVW5kZXIgYnJhbmNoZXMgeW91IGNhbiBmaW5kIFhlbiA0LjgsIDQu
OSwgIGV0Yy4KSSBhbHdheXMgdXNlZCBsYXRlc3QgY29tbWl0OiBjMjI3ZmU2ODU4OWJkZmIzNmI4
NWY3Yjc4YzAzNGE0MGM5NWI5YTMwCkhlcmUgaXMgbGluayB0byBpdDoKaHR0cHM6Ly9naXRodWIu
Y29tL1hpbGlueC94ZW4vdHJlZS94aWxpbngvc3RhYmxlLTQuOQoKQmVzdCByZWdhcmRzLgoKTWls
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
