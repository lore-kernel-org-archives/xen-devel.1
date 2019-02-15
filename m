From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v6 3/9] x86/hvm: block
 speculative out-of-bound accesses
Date: Fri, 15 Feb 2019 01:55:31 -0700
Message-ID: <5C667E830200007800216E73@prv1-mh.provo.novell.com>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-4-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CE6AAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <5C62C9600200007800215EA7@prv1-mh.provo.novell.com>
 <64fdf4b6-69be-d262-b4e4-1dd0d424a777@amazon.de>
 <5C62D4CC0200007800215F79@prv1-mh.provo.novell.com>
 <b31ae117-9a5f-3260-bb9f-b7208da40bc7@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1guZHR-000505-9N
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 08:55:33 +0000
In-Reply-To: <b31ae117-9a5f-3260-bb9f-b7208da40bc7@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAyLjE5IGF0IDA5OjA1LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biAyLzEyLzE5IDE1OjE0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTIuMDIuMTkgYXQg
MTU6MDUsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+Pj4gT24gMi8xMi8xOSAxNDoyNSwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMDguMDIuMTkgYXQgMTQ6NDQsIDxubWFudGhl
eUBhbWF6b24uZGU+IHdyb3RlOgo+Pj4+PiBAQCAtNDEwNCw2ICs0MTA4LDEyIEBAIHN0YXRpYyBp
bnQgaHZtb3Bfc2V0X3BhcmFtKAo+Pj4+PiAgICAgIGlmICggYS5pbmRleCA+PSBIVk1fTlJfUEFS
QU1TICkKPj4+Pj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+ICAKPj4+Pj4gKyAgICAv
Kgo+Pj4+PiArICAgICAqIE1ha2Ugc3VyZSB0aGUgZ3Vlc3QgY29udHJvbGxlZCB2YWx1ZSBhLmlu
ZGV4IGlzIGJvdW5kZWQgZXZlbiBkdXJpbmcKPj4+Pj4gKyAgICAgKiBzcGVjdWxhdGl2ZSBleGVj
dXRpb24uCj4+Pj4+ICsgICAgICovCj4+Pj4+ICsgICAgYS5pbmRleCA9IGFycmF5X2luZGV4X25v
c3BlYyhhLmluZGV4LCBIVk1fTlJfUEFSQU1TKTsKPj4+Pj4gKwo+Pj4+PiAgICAgIGQgPSByY3Vf
bG9ja19kb21haW5fYnlfYW55X2lkKGEuZG9taWQpOwo+Pj4+PiAgICAgIGlmICggZCA9PSBOVUxM
ICkKPj4+Pj4gICAgICAgICAgcmV0dXJuIC1FU1JDSDsKPj4+Pj4gQEAgLTQzNzAsNiArNDM4MCwx
MiBAQCBzdGF0aWMgaW50IGh2bW9wX2dldF9wYXJhbSgKPj4+Pj4gICAgICBpZiAoIGEuaW5kZXgg
Pj0gSFZNX05SX1BBUkFNUyApCj4+Pj4+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+PiAg
Cj4+Pj4+ICsgICAgLyoKPj4+Pj4gKyAgICAgKiBNYWtlIHN1cmUgdGhlIGd1ZXN0IGNvbnRyb2xs
ZWQgdmFsdWUgYS5pbmRleCBpcyBib3VuZGVkIGV2ZW4gZHVyaW5nCj4+Pj4+ICsgICAgICogc3Bl
Y3VsYXRpdmUgZXhlY3V0aW9uLgo+Pj4+PiArICAgICAqLwo+Pj4+PiArICAgIGEuaW5kZXggPSBh
cnJheV9pbmRleF9ub3NwZWMoYS5pbmRleCwgSFZNX05SX1BBUkFNUyk7Cj4+Pj4gLi4uIHRoZSB1
c2VmdWxuZXNzIG9mIHRoZXNlIHR3by4gVG8gbWFrZSBmb3J3YXJkIHByb2dyZXNzIGl0IG1heQo+
Pj4+IGJlIHdvcnRod2hpbGUgdG8gc3BsaXQgb2ZmIHRoZXNlIHR3byBjaGFuZ2VzIGludG8gYSBz
ZXBhcmF0ZSBwYXRjaC4KPj4+PiBJZiB5b3UncmUgZmluZSB3aXRoIHRoaXMsIEkgY291bGQgc3Ry
aXAgdGhlc2UgdHdvIGJlZm9yZSBjb21taXR0aW5nLAo+Pj4+IGluIHdoaWNoIGNhc2UgdGhlIHJl
bWFpbmluZyBjaGFuZ2UgaXMKPj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+Pj4gVGFraW5nIGFwYXJ0IHRoZSBjb21taXQgaXMgZmluZSB3aXRoIG1lLiBJ
IHdpbGwgc3VibWl0IGEgZm9sbG93IHVwCj4+PiBjaGFuZ2UgdGhhdCBkb2VzIG5vdCB1cGRhdGUg
dGhlIHZhbHVlcyBidXQgZml4ZXMgdGhlIHJlYWRzLgo+PiBBcyBwb2ludGVkIG91dCBkdXJpbmcg
dGhlIHY1IGRpc2N1c3Npb24sIEknbSB1bmNvbnZpbmNlZCB0aGF0IGlmCj4+IHlvdSBkbyBzbyB0
aGUgY29tcGlsZXIgY2FuJ3QgcmUtaW50cm9kdWNlIHRoZSBpc3N1ZSB2aWEgQ1NFLiBJJ2QKPj4g
cmVhbGx5IGxpa2UgYSByZWxpYWJsZSBzb2x1dGlvbiB0byBiZSBkZXRlcm1pbmVkIGZpcnN0Lgo+
IAo+IEkgY2Fubm90IGdpdmUgYSBndWFyYW50ZWUgd2hhdCBmdXR1cmUgY29tcGlsZXJzIG1pZ2h0
IGRvLiBGdXJ0aGVybW9yZSwgSQo+IGRvIG5vdCB3YW50IHRvIHdhaXQgdW50aWwgYWxsL21vc3Qg
Y29tcGlsZXJzIHNoaXAgd2l0aCBzdWNoIGEKPiBjb250cm9sbGFibGUgZ3VhcmFudGVlLgoKR3Vh
cmFudGVlPyBGdXR1cmUgY29tcGlsZXJzIGFyZSAoaG9wZWZ1bGx5KSBnb2luZyB0byBnZXQgYmV0
dGVyIGF0Cm9wdGltaXppbmcsIGFuZCBoZW5jZSBhcmUgKGFnYWluIGhvcGVmdWxseSkgZ29pbmcg
dG8gZmluZCBtb3JlCm9wcG9ydHVuaXRpZXMgZm9yIENTRS4gU28gdGhlIHByb2JsZW0gaXMgZ29p
bmcgdG8gZ2V0IHdvcnNlIHJhdGhlcgp0aGFuIGJldHRlciwgYW5kIHRoZSBjaGFuZ2VzIHlvdSdy
ZSBwcm9wb3NpbmcgdG8gcmUtaW5zdGF0ZSBhcmUKdGhlcmVmb3JlIG1vcmUgbGlrZSBmYWxzZSBw
cm9taXNlcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
