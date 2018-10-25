From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen optimization
Date: Thu, 25 Oct 2018 12:30:28 +0100
Message-ID: <12464587-0b86-890c-d115-b5cc417ea0ef@arm.com>
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
 <CADJ6SV3kj0sN-0nzfqBwbz_BMerArKRtdYAQ-FfgvdM3FPqu_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uelk=nf=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gFdqU-0008Hc-KB
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 11:30:34 +0000
In-Reply-To: <CADJ6SV3kj0sN-0nzfqBwbz_BMerArKRtdYAQ-FfgvdM3FPqu_Q@mail.gmail.com>
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

SGkgTWlsYW4sCgpPbiAxMC8yNS8xOCAxMTowOSBBTSwgTWlsYW4gQm9iZXJpYyB3cm90ZToKPiBI
aSwKPj4gT24gV2VkLCBPY3QgMjQsIDIwMTggYXQgMjoyNCBBTSBTdGVmYW5vIFN0YWJlbGxpbmkg
PHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPiB3cm90ZToKPj4gSXQgaXMgZ29vZCB0aGF0
IHRoZXJlIGFyZSBubyBwaHlzaWNhbCBpbnRlcnJ1cHRzIGludGVycnVwdGluZyB0aGUgY3B1Lgo+
PiBzZXJyb3JzPXBhbmljIG1ha2VzIHRoZSBjb250ZXh0IHN3aXRjaCBmYXN0ZXIuIEkgZ3Vlc3Mg
dGhlcmUgYXJlIG5vdAo+PiBlbm91Z2ggY29udGV4dCBzd2l0Y2hlcyB0byBtYWtlIGEgbWVhc3Vy
YWJsZSBkaWZmZXJlbmNlLgo+IAo+IFllcywgd2hlbiBJIGRpZDoKPiBncmVwIGN0eHQgL3Byb2Mv
MjE1My9zdGF0dXMKPiBJIGdvdDoKPiB2b2x1bnRhcnlfY3R4dF9zd2l0Y2hlczogICAgICAgIDUK
PiBub252b2x1bnRhcnlfY3R4dF9zd2l0Y2hlczogICAgIDMKPiAKPj4gSSBkb24ndCBoYXZlIGFu
eSBvdGhlciB0aGluZ3MgdG8gc3VnZ2VzdCByaWdodCBub3cuIFlvdSBzaG91bGQgYmUgYWJsZQo+
PiB0byBtZWFzdXJlIGFuIG92ZXJhbGwgMi41dXMgSVJRIGxhdGVuY3kgKGlmIHRoZSBpbnRlcnJ1
cHQgcmF0ZSBpcyBub3QKPj4gdG9vIGhpZ2gpLgo+IAo+IFRoaXMgYmFyZS1tZXRhbCBhcHBsaWNh
dGlvbiBpcyB0aGUgbW9zdCBzdXNwaWNpb3VzLCBpbmRlZWQuIFN0aWxsCj4gd2FpdGluZyBhbnN3
ZXIgb24gWGlsaW54IGZvcnVtLgoKU29ycnkgaWYgaXQgd2FzIGFscmVhZHkgYXNrZWQuIENhbiB5
b3UgcHJvdmlkZSB5b3VyIC5jb25maWcgZm9yIHlvdXIgCnRlc3Q/IERvIHlvdSBoYXZlIERFQlVH
IGVuYWJsZWQ/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
