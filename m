From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 04/11] x86/hvm: block
 speculative out-of-bound accesses
Date: Fri, 01 Feb 2019 02:06:49 -0700
Message-ID: <5C540C2902000078002130EF@prv1-mh.provo.novell.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-5-git-send-email-nmanthey@amazon.de>
 <503e6a7a-43d4-c3fd-38bb-c9fa0d2743c1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gpUmm-0004Jp-1l
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 09:06:56 +0000
In-Reply-To: <503e6a7a-43d4-c3fd-38bb-c9fa0d2743c1@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, nmanthey@amazon.de, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjAxLjE5IGF0IDIwOjMxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjMvMDEvMjAxOSAxMTo1MSwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+PiAtLS0g
YS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMK
Pj4gQEAgLTM3LDYgKzM3LDcgQEAKPj4gICNpbmNsdWRlIDx4ZW4vbW9uaXRvci5oPgo+PiAgI2lu
Y2x1ZGUgPHhlbi93YXJuaW5nLmg+Cj4+ICAjaW5jbHVkZSA8eGVuL3ZwY2kuaD4KPj4gKyNpbmNs
dWRlIDx4ZW4vbm9zcGVjLmg+Cj4+ICAjaW5jbHVkZSA8YXNtL3NoYWRvdy5oPgo+PiAgI2luY2x1
ZGUgPGFzbS9oYXAuaD4KPj4gICNpbmNsdWRlIDxhc20vY3VycmVudC5oPgo+PiBAQCAtMjEwMiw3
ICsyMTAzLDcgQEAgaW50IGh2bV9tb3ZfZnJvbV9jcih1bnNpZ25lZCBpbnQgY3IsIHVuc2lnbmVk
IGludCBncHIpCj4+ICAgICAgY2FzZSAyOgo+PiAgICAgIGNhc2UgMzoKPj4gICAgICBjYXNlIDQ6
Cj4+IC0gICAgICAgIHZhbCA9IGN1cnItPmFyY2guaHZtLmd1ZXN0X2NyW2NyXTsKPj4gKyAgICAg
ICAgdmFsID0gYXJyYXlfYWNjZXNzX25vc3BlYyhjdXJyLT5hcmNoLmh2bS5ndWVzdF9jciwgY3Ip
Owo+IAo+IFRoaXMgaXMgYW4gaW50ZXJlc3RpbmcgY2FzZSAtIHdlIGRvbid0IGFjdHVhbGx5IG5l
ZWQgcHJvdGVjdGlvbiBoZXJlLgo+IAo+IFRoaXMgcGF0aCBpcyBjYWxsZWQgZXhjbHVzaXZlbHkg
ZnJvbSBpbnRlcmNlcHRzLCBzbyBjciBpcyBzdHJpY3RseSBvbmUKPiBvZiAwLCAyLCAzLCA0LCA4
IGV2ZW4gdW5kZXIgYWR2ZXJzYXJpYWwgc3BlY3VsYXRpb24uICBIb3dldmVyLCBhcwo+IGd1ZXN0
X2NyW10gaXMgb25seSA1IGVudHJpZXMgbG9uZywgdGhlIDggY2FzZSBjYW4gc3RpbGwgcmVzdWx0
IGluIGFuIE9vQgo+IHJlYWQuCj4gCj4gSG93ZXZlciwgZ2l2ZW4gdGhhdCB0aGUgOCBpbmRleCBp
cyBpbiB0aGUgaHdfY3JbXSBhcnJheSBhbmQgZ3VhcmFudGVlZAo+IHRvIGJlIGluIHRoZSBjYWNo
ZSBieSB0aGlzIHBvaW50LCBhbiBhdHRhY2tlciBjYW4ndCBnYWluIGFueSBhZGRpdGlvbmFsCj4g
aW5mb3JtYXRpb24gYnkgcG9pc29uaW5nIHRoZSBzd2l0Y2ggbG9naWMuCgpRdWVzdGlvbiB0aG91
Z2ggaXMgLSBkbyB3ZSB3YW50IHRvIG1ha2UgdGhlIHNhZmV0eSBvZiBvdXIKY29kZSBkZXBlbmRl
bnQgb24gc3VjaCAoZWFzaWx5IGFuZCB1bi1ub3RpY2VhYmx5IGNoYW5nZWFibGUpCmxheW91dCBj
b25zaWRlcmF0aW9ucz8gSSdtIG5vdCBvcHBvc2VkIChhbmQgSSd2ZSB1c2VkIHNpbWlsYXIKYXJn
dW1lbnRzIGZvciBvdmVycnVucyBieSAxIGVsc2V3aGVyZSwgYWxiZWl0IGluIGNhc2VzIHdoZXJl
CnRoZSBsYXlvdXQgd2Fzbid0IGFzIGZhciBhd2F5IGZyb20gdGhlIGNvZGUgaW4gcXVlc3Rpb24g
YXMgaXQKaXMgaGVyZSwgYW5kIHdoZXJlIHRoZSB0d28gZmllbGRzIHdlcmUgYWRqYWNlbnQpLCBi
dXQgcGVyaGFwcwp3ZSdkIHRoZW4gd2FudCBhIEJVSUxEX0JVR19PTigpIHdpdGggYSBzdWl0YWJs
ZSBjb21tZW50CihhbmQgY2FyZWZ1bGx5IGNvZGVkIHRvIGF2b2lkIHBvdGVudGlhbCBhcnJheS1p
bmRleC1vdXQtb2YtCmJvdW5kcyBkaWFnbm9zdGljcyk/CgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
