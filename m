From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v6 3/9] x86/hvm: block
 speculative out-of-bound accesses
Date: Fri, 15 Feb 2019 11:50:47 +0100
Message-ID: <2c93384c-bca4-c38e-ecf8-877d16637068@amazon.de>
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
 <5C667E830200007800216E73@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/T2h=QW=amazon.de=prvs=942e4f81c=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gub5J-0006ms-BD
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 10:51:09 +0000
In-Reply-To: <5C667E830200007800216E73@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xNS8xOSAwOTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTUuMDIuMTkgYXQg
MDk6MDUsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiBPbiAyLzEyLzE5IDE1OjE0LCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDEyLjAyLjE5IGF0IDE1OjA1LCA8bm1hbnRoZXlA
YW1hem9uLmRlPiB3cm90ZToKPj4+PiBPbiAyLzEyLzE5IDE0OjI1LCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+Pj4+Pj4gT24gMDguMDIuMTkgYXQgMTQ6NDQsIDxubWFudGhleUBhbWF6b24uZGU+IHdy
b3RlOgo+Pj4+Pj4gQEAgLTQxMDQsNiArNDEwOCwxMiBAQCBzdGF0aWMgaW50IGh2bW9wX3NldF9w
YXJhbSgKPj4+Pj4+ICAgICAgaWYgKCBhLmluZGV4ID49IEhWTV9OUl9QQVJBTVMgKQo+Pj4+Pj4g
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+PiAgCj4+Pj4+PiArICAgIC8qCj4+Pj4+PiAr
ICAgICAqIE1ha2Ugc3VyZSB0aGUgZ3Vlc3QgY29udHJvbGxlZCB2YWx1ZSBhLmluZGV4IGlzIGJv
dW5kZWQgZXZlbiBkdXJpbmcKPj4+Pj4+ICsgICAgICogc3BlY3VsYXRpdmUgZXhlY3V0aW9uLgo+
Pj4+Pj4gKyAgICAgKi8KPj4+Pj4+ICsgICAgYS5pbmRleCA9IGFycmF5X2luZGV4X25vc3BlYyhh
LmluZGV4LCBIVk1fTlJfUEFSQU1TKTsKPj4+Pj4+ICsKPj4+Pj4+ICAgICAgZCA9IHJjdV9sb2Nr
X2RvbWFpbl9ieV9hbnlfaWQoYS5kb21pZCk7Cj4+Pj4+PiAgICAgIGlmICggZCA9PSBOVUxMICkK
Pj4+Pj4+ICAgICAgICAgIHJldHVybiAtRVNSQ0g7Cj4+Pj4+PiBAQCAtNDM3MCw2ICs0MzgwLDEy
IEBAIHN0YXRpYyBpbnQgaHZtb3BfZ2V0X3BhcmFtKAo+Pj4+Pj4gICAgICBpZiAoIGEuaW5kZXgg
Pj0gSFZNX05SX1BBUkFNUyApCj4+Pj4+PiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+Pj4+
ICAKPj4+Pj4+ICsgICAgLyoKPj4+Pj4+ICsgICAgICogTWFrZSBzdXJlIHRoZSBndWVzdCBjb250
cm9sbGVkIHZhbHVlIGEuaW5kZXggaXMgYm91bmRlZCBldmVuIGR1cmluZwo+Pj4+Pj4gKyAgICAg
KiBzcGVjdWxhdGl2ZSBleGVjdXRpb24uCj4+Pj4+PiArICAgICAqLwo+Pj4+Pj4gKyAgICBhLmlu
ZGV4ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGEuaW5kZXgsIEhWTV9OUl9QQVJBTVMpOwo+Pj4+PiAu
Li4gdGhlIHVzZWZ1bG5lc3Mgb2YgdGhlc2UgdHdvLiBUbyBtYWtlIGZvcndhcmQgcHJvZ3Jlc3Mg
aXQgbWF5Cj4+Pj4+IGJlIHdvcnRod2hpbGUgdG8gc3BsaXQgb2ZmIHRoZXNlIHR3byBjaGFuZ2Vz
IGludG8gYSBzZXBhcmF0ZSBwYXRjaC4KPj4+Pj4gSWYgeW91J3JlIGZpbmUgd2l0aCB0aGlzLCBJ
IGNvdWxkIHN0cmlwIHRoZXNlIHR3byBiZWZvcmUgY29tbWl0dGluZywKPj4+Pj4gaW4gd2hpY2gg
Y2FzZSB0aGUgcmVtYWluaW5nIGNoYW5nZSBpcwo+Pj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+IFRha2luZyBhcGFydCB0aGUgY29tbWl0IGlzIGZp
bmUgd2l0aCBtZS4gSSB3aWxsIHN1Ym1pdCBhIGZvbGxvdyB1cAo+Pj4+IGNoYW5nZSB0aGF0IGRv
ZXMgbm90IHVwZGF0ZSB0aGUgdmFsdWVzIGJ1dCBmaXhlcyB0aGUgcmVhZHMuCj4+PiBBcyBwb2lu
dGVkIG91dCBkdXJpbmcgdGhlIHY1IGRpc2N1c3Npb24sIEknbSB1bmNvbnZpbmNlZCB0aGF0IGlm
Cj4+PiB5b3UgZG8gc28gdGhlIGNvbXBpbGVyIGNhbid0IHJlLWludHJvZHVjZSB0aGUgaXNzdWUg
dmlhIENTRS4gSSdkCj4+PiByZWFsbHkgbGlrZSBhIHJlbGlhYmxlIHNvbHV0aW9uIHRvIGJlIGRl
dGVybWluZWQgZmlyc3QuCj4+IEkgY2Fubm90IGdpdmUgYSBndWFyYW50ZWUgd2hhdCBmdXR1cmUg
Y29tcGlsZXJzIG1pZ2h0IGRvLiBGdXJ0aGVybW9yZSwgSQo+PiBkbyBub3Qgd2FudCB0byB3YWl0
IHVudGlsIGFsbC9tb3N0IGNvbXBpbGVycyBzaGlwIHdpdGggc3VjaCBhCj4+IGNvbnRyb2xsYWJs
ZSBndWFyYW50ZWUuCj4gR3VhcmFudGVlPyBGdXR1cmUgY29tcGlsZXJzIGFyZSAoaG9wZWZ1bGx5
KSBnb2luZyB0byBnZXQgYmV0dGVyIGF0Cj4gb3B0aW1pemluZywgYW5kIGhlbmNlIGFyZSAoYWdh
aW4gaG9wZWZ1bGx5KSBnb2luZyB0byBmaW5kIG1vcmUKPiBvcHBvcnR1bml0aWVzIGZvciBDU0Uu
IFNvIHRoZSBwcm9ibGVtIGlzIGdvaW5nIHRvIGdldCB3b3JzZSByYXRoZXIKPiB0aGFuIGJldHRl
ciwgYW5kIHRoZSBjaGFuZ2VzIHlvdSdyZSBwcm9wb3NpbmcgdG8gcmUtaW5zdGF0ZSBhcmUKPiB0
aGVyZWZvcmUgbW9yZSBsaWtlIGZhbHNlIHByb21pc2VzLgoKSSBkbyBub3Qgd2FudCB0byBkaXZl
IGludG8gY29tcGlsZXJzIGZ1dHVyZSBoZXJlLiBJIHdvdWxkIGxpa2UgdG8gZml4CnRoZSBpc3N1
ZSBmb3IgdG9kYXlzIGNvbXBpbGVycyBub3cgYW5kIG5vdCB3YWl0IHVudGlsIGNvbXBpbGVycyBl
dm9sdmVkCm9uZSB3YXkgb3IgYW5vdGhlci4gRm9yIHRoaXMgcGF0Y2gsIHRoZSByZWxldmFudCBp
bmZvcm1hdGlvbiBpcyB3aGV0aGVyCml0IHNob3VsZCBnbyBpbiBsaWtlIHRoaXMsIG9yIHdoZXRo
ZXIgeW91IHdhbnQgbWUgdG8gcHJvdGVjdCBhbGwgdGhlCnJlYWRzIGluc3RlYWQuIElzIHRoZXJl
IG1vcmUgZGF0YSBJIHNoYWxsIHByb3ZpZGUgdG8gaGVscCBtYWtlIHRoaXMKZGVjaXNpb24/CgpC
ZXN0LApOb3JiZXJ0Cgo+Cj4gSmFuCj4KPgoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBH
ZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVy
OiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4
NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBC
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
