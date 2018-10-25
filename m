From: Milan Boberic <milanboberic94@gmail.com>
Subject: Re: Xen optimization
Date: Thu, 25 Oct 2018 16:47:50 +0200
Message-ID: <CADJ6SV0+A7n-d9aZERdpyui2XOSOczqO1o8A10qJBubPzkJrrQ@mail.gmail.com>
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
 <8e4efe56-77df-cdf0-7f2d-485183f0c9ed@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y3om=nf=gmail.com=milanboberic94@srs-us1.protection.inumbo.net>)
 id 1gFgvb-00088O-IT
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 14:48:03 +0000
Received: by mail-lf1-x129.google.com with SMTP id n26-v6so7024199lfl.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Oct 2018 07:48:02 -0700 (PDT)
In-Reply-To: <8e4efe56-77df-cdf0-7f2d-485183f0c9ed@arm.com>
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

PiBJIHdhcyBhc2tpbmcgdGhlIFhlbiBjb25maWd1cmF0aW9uICh4ZW4vLmNvbmZpZykgdG8ga25v
dyB3aGF0IHlvdSBoYXZlCj4gZW5hYmxlZCBpbiBYZW4uCgpPaCwgc29ycnksIGJlY2F1c2UgSSdt
IGJ1aWxkaW5nIHhlbiBmcm9tIGdpdCByZXBvc2l0b3J5IGhlcmUgaXMgdGhlCmxpbmsgdG8gaXQg
d2hlcmUgeW91IGNhbiBjaGVjayB0aGUgZmlsZSB5b3UgbWVudGlvbmVkLgoKaHR0cHM6Ly9naXRo
dWIuY29tL1hpbGlueC94ZW4vdHJlZS94aWxpbngvdmVyc2FsL3hlbgoKCj4gSXQgbWlnaHQsIE9U
T0gsIGJlIHdpc2UgdG8gdHVybiBpdCBvbiB3aGVuIGludmVzdGlnYXRpbmcgdGhlIHN5c3RlbQo+
IGJlaGF2aW9yIChidXQgdGhhdCdzIGEgZ2VuZXJhbCByZW1hcmssIEkgZG9uJ3Qga25vdyB0byB3
aGF0IEp1bGllbiB3YXMKPiByZWZlcnJpbmcgdG8gaW4gdGhpcyBzcGVjaWZpYyBjYXNlKS4KCkkg
d2lsbCBkZWZpbml0ZWx5IHRyeSB0byBlbmFibGUgREVCVUcuCgpNaWxhbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
