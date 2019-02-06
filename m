From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v5 9/9] common/memory: block
 speculative out-of-bound accesses
Date: Wed, 6 Feb 2019 16:39:22 +0100
Message-ID: <64a6119e-b4c8-ce97-9a0d-de5ba98534b5@amazon.de>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
 <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
 <1548772997-32742-10-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <20F3469E02000096B1E090C7@prv1-mh.provo.novell.com>
 <5C5AFC6F020000780021459B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uZET=QN=amazon.de=prvs=933e5c1f7=nmanthey@srs-us1.protection.inumbo.net>)
 id 1grPIc-0005f6-Ik
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 15:39:42 +0000
In-Reply-To: <5C5AFC6F020000780021459B@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi82LzE5IDE2OjI1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyOS4wMS4xOSBhdCAx
NTo0MywgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+IEBAIC0zMywxMCArMzQsMTAgQEAg
dW5zaWduZWQgbG9uZyBfX3JlYWRfbW9zdGx5IHBkeF9ncm91cF92YWxpZFtCSVRTX1RPX0xPTkdT
KAo+PiAgCj4+ICBib29sIF9fbWZuX3ZhbGlkKHVuc2lnbmVkIGxvbmcgbWZuKQo+PiAgewo+PiAt
ICAgIHJldHVybiBsaWtlbHkobWZuIDwgbWF4X3BhZ2UpICYmCj4+IC0gICAgICAgICAgIGxpa2Vs
eSghKG1mbiAmIHBmbl9ob2xlX21hc2spKSAmJgo+PiAtICAgICAgICAgICBsaWtlbHkodGVzdF9i
aXQocGZuX3RvX3BkeChtZm4pIC8gUERYX0dST1VQX0NPVU5ULAo+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGR4X2dyb3VwX3ZhbGlkKSk7Cj4+ICsgICAgcmV0dXJuIGV2YWx1YXRlX25v
c3BlYyhsaWtlbHkobWZuIDwgbWF4X3BhZ2UpICYmCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICBsaWtlbHkoIShtZm4gJiBwZm5faG9sZV9tYXNrKSkgJiYKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxpa2VseSh0ZXN0X2JpdChwZm5fdG9fcGR4KG1mbikgLyBQRFhfR1JPVVBf
Q09VTlQsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGR4
X2dyb3VwX3ZhbGlkKSkpOwo+IE90aGVyIHRoYW4gaW4gdGhlIHF1ZXN0aW9uYWJsZSBncmFudCB0
YWJsZSBjYXNlLCBoZXJlIEkgYWdyZWUgdGhhdAo+IHlvdSB3YW50IHRvIHdyYXAgdGhlIGVudGly
ZSBjb25zdHJ1Y3QuIFRoaXMgaGFzIGFuIHVud2FudGVkIGVmZmVjdAo+IHRob3VnaDogVGhlIHRl
c3RfYml0KCkgbWF5IHN0aWxsIGJlIHNwZWN1bGF0ZWQgaW50byB3aXRoIGFuIG91dC1vZi0KPiBi
b3VuZHMgbWZuLiAoQXMgbWVudGlvbmVkIGVsc2V3aGVyZSwgb3BlcmF0aW9ucyBvbiBiaXQgYXJy
YXlzIGFyZQo+IGFuIG9wZW4gaXNzdWUgYWx0b2dldGhlci4pIEkgdGhlcmVmb3JlIHRoaW5rIHlv
dSB3YW50IHRvIHNwbGl0IHRoaXMgaW50bwo+IHR3bzoKPgo+IGJvb2wgX19tZm5fdmFsaWQodW5z
aWduZWQgbG9uZyBtZm4pCj4gewo+ICAgICByZXR1cm4gbGlrZWx5KGV2YWx1YXRlX25vc3BlYyht
Zm4gPCBtYXhfcGFnZSkpICYmCj4gICAgICAgICAgICBldmFsdWF0ZV9ub3NwZWMobGlrZWx5KCEo
bWZuICYgcGZuX2hvbGVfbWFzaykpICYmCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlr
ZWx5KHRlc3RfYml0KHBmbl90b19wZHgobWZuKSAvIFBEWF9HUk9VUF9DT1VOVCwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGR4X2dyb3VwX3ZhbGlkKSkpOwo+
IH0KCkkgY2FuIHNwbGl0IHRoZSBjb2RlLiBIb3dldmVyLCBJIHdvbmRlciB3aGV0aGVyIHRoZSB0
ZXN0X2JpdCBhY2Nlc3NlcwpzaG91bGQgYmUgcHJvdGVjdGVkIHNlcGFyYXRlbHksIG9yIGFjdHVh
bGx5IGFzIHBhcnQgb2YgdGhlIHRlc3RfYml0Cm1ldGhvZCB0aGVtc2VsdmVzLiBEbyB5b3UgaGF2
ZSBhbnkgcGxhbnMgdG8gZG8gdGhhdCBhbHJlYWR5LCBiZWNhdXNlIGluCnRoYXQgY2FzZSBJIHdv
dWxkIG5vdCBoYXZlIHRvIG1vZGlmeSB0aGUgY29kZS4KCkJlc3QsCk5vcmJlcnQKCgoKCkFtYXpv
biBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJl
cmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmlj
aApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJs
b3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
