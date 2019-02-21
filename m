From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: xen/evtchn and forced threaded irq
Date: Thu, 21 Feb 2019 10:14:31 +0100
Message-ID: <20190221091431.vqi53op37mvhi25z__42508.9715326735$1550740629$gmane$org@Air-de-Roger>
References: <20190220000209.GA4091@localhost.localdomain>
 <a872d480-9f1b-6cd7-e507-ac4fcdf705af@arm.com>
 <21214d47-9c68-e6bf-007a-4047cc2b02f9@oracle.com>
 <8f7445d7-fa50-f3e9-44f5-cc2aebd020f4@arm.com>
 <15bc52cb-82d8-4d2c-e5a8-c6ae8de90276@oracle.com>
 <5df8888a-4a29-fccd-bac2-a9c170244029@arm.com>
 <1574a7fe-a5ac-4bc2-d3f0-967d8d01e5f1@oracle.com>
 <1100e6b1-6fa8-06f0-8ecc-b0699a2ce5f4@arm.com>
 <20190221080752.zy2qlzb4vi7tbu3p@Air-de-Roger>
 <CAF3u54Ct7nBjoLw9Vzb=aZVu=N5Ccp5_k6GxLo_ZSA=YCsco6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dj2S=Q4=citrix.com=prvs=9488a9425=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gwkSY-0006Xd-NZ
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 09:16:02 +0000
Content-Disposition: inline
In-Reply-To: <CAF3u54Ct7nBjoLw9Vzb=aZVu=N5Ccp5_k6GxLo_ZSA=YCsco6A@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dave P Martin <dave.martin@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMDg6Mzg6MzlBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFJvZ2VyLAo+IAo+IE9uIFRodSwgMjEgRmViIDIwMTksIDA4OjA4IFJvZ2VyIFBh
dSBNb25uw6ksIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gPiBGV0lXLCB5b3Ug
Y2FuIGFsc28gbWFzayB0aGUgaW50ZXJydXB0IHdoaWxlIHdhaXRpbmcgZm9yIHRoZSB0aHJlYWQg
dG8KPiA+IGV4ZWN1dGUgdGhlIGludGVycnVwdCBoYW5kbGVyLiBJZToKPiA+Cj4gCj4gVGhhbmsg
eW91IGZvciBwcm92aWRpbmcgc3RlcHMsIGhvd2V2ZXIgd2hlcmUgd291bGQgdGhlIG1hc2tpbmcg
YmUgZG9uZT8gQnkKPiB0aGUgaXJxY2hpcCBvciBhIGN1c3RvbSBzb2x1dGlvbj8KCkknbSBub3Qg
ZmFtaWxpYXIgd2l0aCB0aGUgaXJxY2hpcCBpbmZyYXN0cnVjdHVyZSBpbiBMaW51eCwgd2hhdCBJ
CnByb3Bvc2VkIGJlbG93IGlzIHdoYXQgRnJlZUJTRCBkb2VzIHdoZW4gcnVubmluZyBpbnRlcnJ1
cHQgaGFuZGxlcnMgaW4KZGVmZXJyZWQgdGhyZWFkcyBJSVJDLgoKSWYgaXJxY2hpcCBoYXMgYSBz
cGVjaWZpYyBoYW5kbGVyIHRvIGRpc3BhdGNoIHRvIGEgdGhyZWFkLCB0aGVuIHRoYXQncwp0aGUg
cGxhY2Ugd2hlcmUgdGhlIG1hc2tpbmcgc2hvdWxkIGhhcHBlbi4gTGlrZWx5LCB0aGUgdW5tYXNr
aW5nCnNob3VsZCBiZSBkb25lIGJ5IHRoZSBpcnEgaGFuZGxpbmcgaW5mcmFzdHJ1Y3R1cmUgYWZ0
ZXIgdGhlIHRocmVhZApleGVjdXRpbmcgdGhlIGludGVycnVwdCBoYW5kbGVyIGhhcyBmaW5pc2hl
ZC4KCklzbid0IHRoZXJlIGEgc2ltaWxhciB3YXkgdG8gaGFuZGxlIGludGVycnVwdHMgaW4gdGhy
ZWFkcyBmb3IgTGludXg/Cgo+IAo+ID4gMS4gSW50ZXJydXB0IGluamVjdGVkCj4gPiAyLiBFeGVj
dXRlIGd1ZXN0IGV2ZW50IGNoYW5uZWwgY2FsbGJhY2sKPiA+IDMuIFNjYW4gZm9yIHBlbmRpbmcg
aW50ZXJydXB0cwo+ID4gNC4gTWFzayBpbnRlcnJ1cHQKPiA+IDUuIENsZWFyIHBlbmRpbmcgZmll
bGQKPiA+IDYuIFF1ZXVlIHRocmVhZGVkIGhhbmRsZXIKPiA+IDcuIEdvIHRvIDMgdW50aWwgYWxs
IGludGVycnVwdHMgYXJlIGRyYWluZWQKPiA+IFsuLi5dCj4gPiA4LiBFeGVjdXRlIGludGVycnVw
dCBoYW5kbGVyIGluIHRocmVhZAo+ID4gOS4gVW5tYXNrIGludGVycnVwdAo+ID4KPiA+IFRoYXQg
c2hvdWxkIHByZXZlbnQgeW91IGZyb20gc3RhY2tpbmcgaW50ZXJydXB0cz8KPiA+Cj4gPiBSb2dl
ci4KPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
