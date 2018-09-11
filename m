From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] perfc: Print a system time in a convenient
 format
Date: Tue, 11 Sep 2018 10:28:37 +0100
Message-ID: <4a4d7ad8-be0d-ee52-5657-fd90eaaab420@citrix.com>
References: <1536648829-13743-1-git-send-email-andrii.anisov@gmail.com>
 <5B977C7902000078001E70BE@prv1-mh.provo.novell.com>
 <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
 <5B97868502000078001E712B@prv1-mh.provo.novell.com>
 <f150cba5-9458-fe1a-a974-4373e4636e7c@citrix.com>
 <5B97886002000078001E7151@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tpi7=lz=citrix.com=prvs=785918234=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fzeyQ-0006HB-Ug
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 09:28:42 +0000
In-Reply-To: <5B97886002000078001E7151@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTEvMjAxOCAxMDoxOCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTEuMDku
MTggYXQgMTE6MTUsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTEv
MDkvMTggMTA6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTEuMDkuMTggYXQgMTA6
NTAsIDxhbmRyaWlfYW5pc292QGVwYW0uY29tPiB3cm90ZToKPj4+PiBPbiAxMS4wOS4xOCAxMToy
NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE5BSywgZm9yIHR3byByZWFzb25zOiBJJ20gbm90
IG9mIHRoZSBvcGluaW9uIHRoYXQgcmVhZGluZyBhIDE1IG9yIG1vcmUKPj4+Pj4gZGlnaXQgZGVj
aW1hbCBudW1iZXIgd2l0aG91dCBhbnkgc2VwYXJhdG9ycyBpcyBhbnkgZWFzaWVyIHRoYW4gdGhl
Cj4+Pj4+IGN1cnJlbnQgZm9ybWF0Lgo+Pj4+IEl0J3MgcXVpdGUgc3ViamVjdGl2ZS4gSU1ITyB0
aW1lc3RhbXBzIG1lYXN1cmVkIGluIG5zIGVhc2llciB0byAKPj4+PiB1bmRlcnN0YW5kIGluIGRl
Y2ltYWxzIHJhdGhlciB0aGFuIGluIHNlcGFyYXRlZCAzMi1iaXQgaGV4LWVzLiBObyBtYXR0ZXIg
Cj4+Pj4gaG93IG1hbnkgZGlnaXRhbCBudW1iZXIgdGhleSBoYXZlLgo+Pj4gSXQgaXMgc3ViamVj
dGl2ZSwgeWVzLCBidXQgaW4gc3VjaCBhIGNhc2UgeW91IGV2ZW4gbW9yZSBzbyBuZWVkIHRvCj4+
PiBkZW1vbnN0cmF0ZSBhIGNoYW5nZSBpcyBhbiBvdmVyYWxsIGltcHJvdmVtZW50Lgo+Pj4KPj4+
PiBFdmVuIHBvc3QgcHJvY2Vzc2luZyBvZiBwZXJmYyBvdXRwdXQgaXMgZWFzaWVyIGluIGNhc2Ug
b2YgZGVjaW1hbCAKPj4+PiB0aW1lc3RhbXBzLiBZb3Ugc2hvdWxkIG5vdCBwYXJzZSBoZXhlcyBh
bmQgb2RkIHNlcGFyYXRvcnMgdG8gY2FsY3VsYXRlIAo+Pj4+IHRoZSB0aW1lIGVsYXBzZWQgYmV0
d2VlbiB0d28gc2FtcGxlcy4KPj4+IFBvc3QgcHJvY2Vzc2luZyB1c3VhbGx5IHVzZXMgc2NyaXBz
IGZvciBwYXJzaW5nIC0gSSBkb24ndCB0aGluayBpdCdzCj4+PiBvdmVybHkgY29tcGxpY2F0ZWQg
dG8gaGF2ZSBhIHNjcmlwdCBjb252ZXJ0IHRoZSBudW1iZXIgaW50bwo+Pj4gYmFzaWNhbGx5IGFu
eSBmb3JtYXQgeW91IHdhbnQuCj4+Cj4+IFJpZ2h0LCBidXQgdGhpcyBwYXJ0aWN1bGFyIG1pcy1w
YXR0ZXJuIHdhbnRzIGZpeGluZy4gIEl0IGlzIHNpbXBseQo+PiBjb25mdXNpbmcgdG8gaGF2ZSBh
IHNpbmdsZSBudW1iZXIgZm9ybWF0dGVkIHdpdGggYSBjb2xvbiBpbmJldHdlZW4uCj4gCj4gV2hh
dCBvdGhlciBzZXBhcmF0b3IgZG8geW91IHN1Z2dlc3Q/IEkgY29uc2lkZXIgaXQgcXVpdGUgaGVs
cGZ1bAo+IHRvIGhhdmUgb25lIHdoZW4gdGhlcmUgYXJlIG1vcmUgdGhhbiBhYm91dCAxMCBkaWdp
dHMuIChJJ2QgYWxzbwo+IGJlIGZpbmUsIGJ0dywgdG8gaGF2ZSB0aGUgdGltZSBwcmludGVkIGlu
IGRlY2ltYWwsIGJ1dCB0aGVuCj4gcGVyaGFwcyB3aXRoIG1zIGdyYW51bGFyaXR5IGFuZCA2IGRp
Z2l0cyBmb3IgdGhlIGZyYWN0aW9uYWwgcGFydC4pCgoqIFdlIGNsZWFybHkgYWxyZWFkeSBoYXZl
IGEgc3RhbmRhcmQgd2F5IG9mIHByaW50aW5nIHN0aW1lCiogVGhlIHBsYWNlcyB3aGVyZSBhIGNv
bG9uIGlzIHVzZWQgYXJlIG5vbi1zdGFuZGFyZCwgYW5kIHRodXMgd3JvbmcKKiBIaXMgcGF0Y2gg
bWFrZXMgYW4gaW1wcm92ZW1lbnQgYnkgZml4aW5nIHRoZSBub24tc3RhbmRhcmQgdGltZXN0YW1w
CnByaW50aW5nLgoKSWYgeW91J3JlIG5vdCBoYXBweSB3aXRoIHRoZSBjdXJyZW50IFBSSV9zdGlt
ZSwgdGhlbiBpdCBzaG91bGQgYmUgb24geW91CnRvIHByb3Bvc2UgYW5kIGNvZGUgdXAgYSBjaGFu
Z2UsIG5vdCBBbmRyaWkgKHVubGVzcyBoZSBmZWVscwpwYXJ0aWN1bGFybHkgbW90aXZhdGVkIHRv
IGRvIHNvKS4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
