From: Milan Boberic <milanboberic94@gmail.com>
Subject: Re: Xen optimization
Date: Thu, 25 Oct 2018 12:09:29 +0200
Message-ID: <CADJ6SV3kj0sN-0nzfqBwbz_BMerArKRtdYAQ-FfgvdM3FPqu_Q@mail.gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
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
 <CADJ6SV2891kOd_Ga8jjXdtKdjPAoWtADhizuS+kjSZNNOPMK+w@mail.gmail.com>
 <alpine.DEB.2.10.1810221037270.31582@sstabellini-ThinkPad-X260>
 <CADJ6SV0gUvRv_4Kp=Vz5n4WSQ3kgQrC=+gPz1QjrBzdFOoJwPA@mail.gmail.com>
 <alpine.DEB.2.10.1810231005040.31582@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y3om=nf=gmail.com=milanboberic94@srs-us1.protection.inumbo.net>)
 id 1gFcaF-00012m-DI
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 10:09:43 +0000
Received: by mail-lj1-x242.google.com with SMTP id c21-v6so1761322ljj.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Oct 2018 03:09:41 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1810231005040.31582@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: stefano.stabellini@xilinx.com
Cc: sstabellini@kernel.org, andrii_anisov@epam.com, Dario Faggioli <dfaggioli@suse.com>, julien.grall@arm.com, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

SGksCj4gT24gV2VkLCBPY3QgMjQsIDIwMTggYXQgMjoyNCBBTSBTdGVmYW5vIFN0YWJlbGxpbmkg
PHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPiB3cm90ZToKPiBJdCBpcyBnb29kIHRoYXQg
dGhlcmUgYXJlIG5vIHBoeXNpY2FsIGludGVycnVwdHMgaW50ZXJydXB0aW5nIHRoZSBjcHUuCj4g
c2Vycm9ycz1wYW5pYyBtYWtlcyB0aGUgY29udGV4dCBzd2l0Y2ggZmFzdGVyLiBJIGd1ZXNzIHRo
ZXJlIGFyZSBub3QKPiBlbm91Z2ggY29udGV4dCBzd2l0Y2hlcyB0byBtYWtlIGEgbWVhc3VyYWJs
ZSBkaWZmZXJlbmNlLgoKWWVzLCB3aGVuIEkgZGlkOgpncmVwIGN0eHQgL3Byb2MvMjE1My9zdGF0
dXMKSSBnb3Q6CnZvbHVudGFyeV9jdHh0X3N3aXRjaGVzOiAgICAgICAgNQpub252b2x1bnRhcnlf
Y3R4dF9zd2l0Y2hlczogICAgIDMKCj4gSSBkb24ndCBoYXZlIGFueSBvdGhlciB0aGluZ3MgdG8g
c3VnZ2VzdCByaWdodCBub3cuIFlvdSBzaG91bGQgYmUgYWJsZQo+IHRvIG1lYXN1cmUgYW4gb3Zl
cmFsbCAyLjV1cyBJUlEgbGF0ZW5jeSAoaWYgdGhlIGludGVycnVwdCByYXRlIGlzIG5vdAo+IHRv
byBoaWdoKS4KClRoaXMgYmFyZS1tZXRhbCBhcHBsaWNhdGlvbiBpcyB0aGUgbW9zdCBzdXNwaWNp
b3VzLCBpbmRlZWQuIFN0aWxsCndhaXRpbmcgYW5zd2VyIG9uIFhpbGlueCBmb3J1bS4KCj4gIEp1
c3QgdG8gYmUgcGFyYW5vaWQsIHdlIG1pZ2h0IGFsc28gd2FudCB0byBjaGVjayB0aGUgZm9sbG93
aW5nLCBhZ2FpbiBpdAo+IHNob3VsZG4ndCBnZXQgcHJpbnRlZDoKPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL3ZnaWMuYyBiL3hlbi9hcmNoL2FybS92Z2ljLmMKPiBpbmRleCA1YTRmMDgyLi42
Y2Y2ODE0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS92Z2ljLmMKPiArKysgYi94ZW4vYXJj
aC9hcm0vdmdpYy5jCj4gQEAgLTUzMiw2ICs1MzIsOCBAQCB2b2lkIHZnaWNfaW5qZWN0X2lycShz
dHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IHZpcnEsCj4gICAg
ICBzdHJ1Y3QgcGVuZGluZ19pcnEgKml0ZXIsICpuOwo+ICAgICAgdW5zaWduZWQgbG9uZyBmbGFn
czsKPiArICAgIGlmICggZC0+ZG9tYWluX2lkICE9IDAgJiYgdmlycSAhPSA2OCApCj4gKyAgICAg
ICAgcHJpbnRrKCJERUJVRyB2aXJxPSVkIGxvY2FsPSVkXG4iLHZpcnEsdiA9PSBjdXJyZW50KTsK
PiAgICAgIC8qCj4gICAgICAgKiBGb3IgZWRnZSB0cmlnZ2VyZWQgaW50ZXJydXB0cyB3ZSBhbHdh
eXMgaWdub3JlIGEgImZhbGxpbmcgZWRnZSIuCj4gICAgICAgKiBGb3IgbGV2ZWwgdHJpZ2dlcmVk
IGludGVycnVwdHMgd2Ugc2hvdWxkbid0LCBidXQgZG8gYW55d2F5cy4KQ2hlY2tlZCBpdCBhZ2Fp
biwgbm8gcHJpbnRzLiBJIGhvcGVkIHRoYXQgSSB3aWxsIGRpc2NvdmVyIHNvbWUgdklSUXMKb3Ig
cElSUXMgc2xvd2luZyB0aGluZ3MgZG93biBidXQgbm8sIG5vIHByaW50cy4KSSBtaWdodCB0cnkg
c29tZXRoaW5nIGVsc2UgaW5zdGVhZCBvZiB0aGlzIGJhcmUtbWV0YWwgYXBwbGljYXRpb24KYmVj
YXVzZSB0aGlzIFhpbGlueCBTREsgZXhhbXBsZSBpcyB2ZXJ5IHN1c3BpY2lvdXMuCgpUaGFuayB5
b3UgZm9yIHlvdXIgdGltZS4KCk1pbGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
