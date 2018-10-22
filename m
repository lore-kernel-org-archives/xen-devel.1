From: Milan Boberic <milanboberic94@gmail.com>
Subject: Re: Xen optimization
Date: Mon, 22 Oct 2018 17:02:18 +0200
Message-ID: <CADJ6SV2891kOd_Ga8jjXdtKdjPAoWtADhizuS+kjSZNNOPMK+w@mail.gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <995da0578f0953662536edabb5807fd76ca4d8ce.camel@suse.com>
 <CADJ6SV1yDBptrcaoqUPChtnXTmvhbzj-AAv2FDN2LCMyTipc-A@mail.gmail.com>
 <CAENZ-+=mWFnJ-4OFK+bjb4rimNNB_x4qHFVAbTM1mFd2Sg7s3g@mail.gmail.com>
 <CADJ6SV1Mdnjyd8oEcB4ZCZKuR0LkJ82GCf5s1+AwgASe8vLMWg@mail.gmail.com>
 <alpine.DEB.2.10.1810111024390.436@sstabellini-ThinkPad-X260>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dxpz=nc=gmail.com=milanboberic94@srs-us1.protection.inumbo.net>)
 id 1gEbix-0004e3-A9
 for xen-devel@lists.xenproject.org; Mon, 22 Oct 2018 15:02:31 +0000
Received: by mail-lf1-x143.google.com with SMTP id d7-v6so10051372lfi.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Oct 2018 08:02:30 -0700 (PDT)
In-Reply-To: <d3a589c5d95d70ef1c13b4fe6856b7ed387b4ee3.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: stefano.stabellini@xilinx.com, andrii_anisov@epam.com, julien.grall@arm.com, sstabellini@kernel.org, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

SGksCgo+IEkgdGhpbmsgd2Ugd2FudCB0byBmdWxseSB1bmRlcnN0YW5kIGhvdyBtYW55IG90aGVy
IGludGVycnVwdHMgdGhlCj4gYmFyZW1ldGFsIGd1ZXN0IGlzIHJlY2VpdmluZy4gVG8gZG8gdGhh
dCwgd2UgY2FuIG1vZGlmeSBteSBwcmV2aW91cwo+IHBhdGNoIHRvIHN1cHByZXNzIGFueSBkZWJ1
ZyBtZXNzYWdlcyBmb3IgdmlycT02OC4gVGhhdCB3YXksIHdlIHNob3VsZAo+IG9ubHkgc2VlIHRo
ZSBvdGhlciBpbnRlcnJ1cHRzLiBJZGVhbGx5IHRoZXJlIHdvdWxkIGJlIG5vbmUuCj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS92Z2ljLmMgYi94ZW4vYXJjaC9hcm0vdmdpYy5jCj4gaW5kZXgg
NWE0ZjA4Mi4uYjdhOGUxNyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy5jCj4gKysr
IGIveGVuL2FyY2gvYXJtL3ZnaWMuYwo+IEBAIC01NzcsNyArNTc3LDExIEBAIHZvaWQgdmdpY19p
bmplY3RfaXJxKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQg
dmlycSwKPiAgICAgIC8qIHRoZSBpcnEgaXMgZW5hYmxlZCAqLwo+ICAgICAgaWYgKCB0ZXN0X2Jp
dChHSUNfSVJRX0dVRVNUX0VOQUJMRUQsICZuLT5zdGF0dXMpICkKPiArICAgIHsKPiAgICAgICAg
ICBnaWNfcmFpc2VfZ3Vlc3RfaXJxKHYsIHZpcnEsIHByaW9yaXR5KTsKPiArICAgICAgICBpZiAo
IGQtPmRvbWFpbl9pZCAhPSAwICYmIHZpcnEgIT0gNjggKQo+ICsgICAgICAgICAgICBwcmludGso
IkRFQlVHIHZpcnE9JWQgbG9jYWw9JWRcbiIsdmlycSx2ID09IGN1cnJlbnQpOwo+ICsgICAgfQo+
ICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIGl0ZXIsICZ2LT5hcmNoLnZnaWMuaW5mbGlnaHRf
aXJxcywgaW5mbGlnaHQgKQo+ICAgICAgewoKd2hlbiBJIGFwcGx5IHRoaXMgcGF0Y2ggdGhlcmUg
YXJlIG5vIHByaW50cyBub3IgZGVidWcgbWVzc2FnZXMgaW4geGwKZG1lc2cuIFNvIGJhcmUtbWV0
YWwgcmVjZWl2ZXMgb25seSBpbnRlcnJ1cHQgNjgsIHdoaWNoIGlzIGdvb2QuCgo+IE5leHQgc3Rl
cCB3b3VsZCBiZSB0byB2ZXJpZnkgdGhhdCB0aGVyZSBhcmUgbm8gb3RoZXIgcGh5c2ljYWwgaW50
ZXJydXB0cwo+IGludGVycnVwdGluZyB0aGUgdmNwdSBleGVjdXRpb24gb3RoZXIgdGhlIGlycT02
OC4gV2Ugc2hvdWxkIGJlIGFibGUgdG8KPiBjaGVjayB0aGF0IHdpdGggdGhlIGZvbGxvd2luZyBk
ZWJ1ZyBwYXRjaDoKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLmMgYi94ZW4vYXJj
aC9hcm0vZ2ljLmMKPiBpbmRleCBlNTI0YWQ1Li5iMzRjM2U0IDEwMDY0NAo+IC0tLSBhL3hlbi9h
cmNoL2FybS9naWMuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9naWMuYwo+IEBAIC0zODEsNiArMzgx
LDEzIEBAIHZvaWQgZ2ljX2ludGVycnVwdChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgaW50
IGlzX2ZpcSkKPiAgICAgICAgICAvKiBSZWFkaW5nIElSUSB3aWxsIEFDSyBpdCAqLwo+ICAgICAg
ICAgIGlycSA9IGdpY19od19vcHMtPnJlYWRfaXJxKCk7Cj4gKyAgICAgICAgaWYgKGN1cnJlbnQt
PmRvbWFpbi0+ZG9tYWluX2lkID4gMCAmJiBpcnEgIT0gNjgpCj4gKyAgICAgICAgewo+ICsgICAg
ICAgICAgICBsb2NhbF9pcnFfZW5hYmxlKCk7Cj4gKyAgICAgICAgICAgIHByaW50aygiREVCVUcg
aXJxPSVkXG4iLGlycSk7Cj4gKyAgICAgICAgICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7Cj4gKyAg
ICAgICAgfQo+ICsKPiAgICAgICAgICBpZiAoIGxpa2VseShpcnEgPj0gMTYgJiYgaXJxIDwgMTAy
MCkgKQo+ICAgICAgICAgIHsKPiAgICAgICAgICAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOwoKQnV0
IHdoZW4gSSBhcHBseSB0aGlzIHBhdGNoIGl0IHByaW50cyBmb3JldmVyOgooWEVOKSBERUJVRyBp
cnE9MTAyMwoKVGhhbmtzIGluIGFkdmFuY2UhCgpNaWxhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
