From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v6 3/9] x86/hvm: block
 speculative out-of-bound accesses
Date: Tue, 12 Feb 2019 07:14:36 -0700
Message-ID: <5C62D4CC0200007800215F79@prv1-mh.provo.novell.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtYpg-0005EH-W7
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 14:14:45 +0000
In-Reply-To: <64fdf4b6-69be-d262-b4e4-1dd0d424a777@amazon.de>
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

Pj4+IE9uIDEyLjAyLjE5IGF0IDE1OjA1LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biAyLzEyLzE5IDE0OjI1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDguMDIuMTkgYXQg
MTQ6NDQsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+Pj4gQEAgLTQxMDQsNiArNDEwOCwx
MiBAQCBzdGF0aWMgaW50IGh2bW9wX3NldF9wYXJhbSgKPj4+ICAgICAgaWYgKCBhLmluZGV4ID49
IEhWTV9OUl9QQVJBTVMgKQo+Pj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+PiAgCj4+PiAr
ICAgIC8qCj4+PiArICAgICAqIE1ha2Ugc3VyZSB0aGUgZ3Vlc3QgY29udHJvbGxlZCB2YWx1ZSBh
LmluZGV4IGlzIGJvdW5kZWQgZXZlbiBkdXJpbmcKPj4+ICsgICAgICogc3BlY3VsYXRpdmUgZXhl
Y3V0aW9uLgo+Pj4gKyAgICAgKi8KPj4+ICsgICAgYS5pbmRleCA9IGFycmF5X2luZGV4X25vc3Bl
YyhhLmluZGV4LCBIVk1fTlJfUEFSQU1TKTsKPj4+ICsKPj4+ICAgICAgZCA9IHJjdV9sb2NrX2Rv
bWFpbl9ieV9hbnlfaWQoYS5kb21pZCk7Cj4+PiAgICAgIGlmICggZCA9PSBOVUxMICkKPj4+ICAg
ICAgICAgIHJldHVybiAtRVNSQ0g7Cj4+PiBAQCAtNDM3MCw2ICs0MzgwLDEyIEBAIHN0YXRpYyBp
bnQgaHZtb3BfZ2V0X3BhcmFtKAo+Pj4gICAgICBpZiAoIGEuaW5kZXggPj0gSFZNX05SX1BBUkFN
UyApCj4+PiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+ICAKPj4+ICsgICAgLyoKPj4+ICsg
ICAgICogTWFrZSBzdXJlIHRoZSBndWVzdCBjb250cm9sbGVkIHZhbHVlIGEuaW5kZXggaXMgYm91
bmRlZCBldmVuIGR1cmluZwo+Pj4gKyAgICAgKiBzcGVjdWxhdGl2ZSBleGVjdXRpb24uCj4+PiAr
ICAgICAqLwo+Pj4gKyAgICBhLmluZGV4ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGEuaW5kZXgsIEhW
TV9OUl9QQVJBTVMpOwo+PiAuLi4gdGhlIHVzZWZ1bG5lc3Mgb2YgdGhlc2UgdHdvLiBUbyBtYWtl
IGZvcndhcmQgcHJvZ3Jlc3MgaXQgbWF5Cj4+IGJlIHdvcnRod2hpbGUgdG8gc3BsaXQgb2ZmIHRo
ZXNlIHR3byBjaGFuZ2VzIGludG8gYSBzZXBhcmF0ZSBwYXRjaC4KPj4gSWYgeW91J3JlIGZpbmUg
d2l0aCB0aGlzLCBJIGNvdWxkIHN0cmlwIHRoZXNlIHR3byBiZWZvcmUgY29tbWl0dGluZywKPj4g
aW4gd2hpY2ggY2FzZSB0aGUgcmVtYWluaW5nIGNoYW5nZSBpcwo+PiBSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFRha2luZyBhcGFydCB0aGUgY29tbWl0
IGlzIGZpbmUgd2l0aCBtZS4gSSB3aWxsIHN1Ym1pdCBhIGZvbGxvdyB1cAo+IGNoYW5nZSB0aGF0
IGRvZXMgbm90IHVwZGF0ZSB0aGUgdmFsdWVzIGJ1dCBmaXhlcyB0aGUgcmVhZHMuCgpBcyBwb2lu
dGVkIG91dCBkdXJpbmcgdGhlIHY1IGRpc2N1c3Npb24sIEknbSB1bmNvbnZpbmNlZCB0aGF0IGlm
CnlvdSBkbyBzbyB0aGUgY29tcGlsZXIgY2FuJ3QgcmUtaW50cm9kdWNlIHRoZSBpc3N1ZSB2aWEg
Q1NFLiBJJ2QKcmVhbGx5IGxpa2UgYSByZWxpYWJsZSBzb2x1dGlvbiB0byBiZSBkZXRlcm1pbmVk
IGZpcnN0LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
