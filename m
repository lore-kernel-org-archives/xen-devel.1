From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v6 1/9] xen/evtchn: block
 speculative out-of-bound accesses
Date: Thu, 14 Feb 2019 14:10:50 +0100
Message-ID: <7fc2567a-03f8-2175-ae0e-b1e453bbe069@amazon.de>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-2-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CCEAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <5C62C5640200007800215E66@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tSEH=QV=amazon.de=prvs=9419de174=nmanthey@srs-us1.protection.inumbo.net>)
 id 1guGnG-0003e0-7D
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 13:11:10 +0000
In-Reply-To: <5C62C5640200007800215E66@prv1-mh.provo.novell.com>
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

Ck9uIDIvMTIvMTkgMTQ6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA4LjAyLjE5IGF0
IDE0OjQ0LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPj4gQEAgLTgxMyw2ICs4MTcsMTMg
QEAgaW50IHNldF9nbG9iYWxfdmlycV9oYW5kbGVyKHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90
IHZpcnEpCj4+ICAKPj4gICAgICBpZiAodmlycSA+PSBOUl9WSVJRUykKPj4gICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4+ICsKPj4gKyAgIC8qCj4+ICsgICAgKiBNYWtlIHN1cmUgdGhlIGd1ZXN0
IGNvbnRyb2xsZWQgdmFsdWUgdmlycSBpcyBib3VuZGVkIGV2ZW4gZHVyaW5nCj4+ICsgICAgKiBz
cGVjdWxhdGl2ZSBleGVjdXRpb24uCj4+ICsgICAgKi8KPj4gKyAgICB2aXJxID0gYXJyYXlfaW5k
ZXhfbm9zcGVjKHZpcnEsIEFSUkFZX1NJWkUoZ2xvYmFsX3ZpcnFfaGFuZGxlcnMpKTsKPj4gKwo+
PiAgICAgIGlmICghdmlycV9pc19nbG9iYWwodmlycSkpCj4+ICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+IERpZG4ndCB3ZSBhZ3JlZSBlYXJsaWVyIG9uIHRoYXQgdGhpcyBhZGRpdGlvbiBpcyBw
b2ludGxlc3MsIGFzIHRoZSBvbmx5Cj4gY2FsbGVyIGlzIHRoZSBYRU5fRE9NQ1RMX3NldF92aXJx
X2hhbmRsZXIgaGFuZGxlciwgYW5kIG1vc3QKPiBkb21jdGwtcyAoaW5jbHVkaW5nIHRoaXMgb25l
KSBhcmUgZXhjbHVkZWQgZnJvbSBzZWN1cml0eSBjb25zaWRlcmF0aW9ucwo+IGR1ZSB0byBYU0Et
Nzc/CkkgZG8gbm90IHJlY2FsbCBzdWNoIGEgY29tbWVudCwgYnV0IGFncmVlIHRoYXQgdGhpcyBo
dW5rIGNhbiBiZSBkcm9wcGVkLgo+Cj4+IEBAIC05NTUsMjIgKzk2NywyMiBAQCBsb25nIGV2dGNo
bl9iaW5kX3ZjcHUodW5zaWduZWQgaW50IHBvcnQsIHVuc2lnbmVkIGludCB2Y3B1X2lkKQo+PiAg
ICAgIHsKPj4gICAgICBjYXNlIEVDU19WSVJROgo+PiAgICAgICAgICBpZiAoIHZpcnFfaXNfZ2xv
YmFsKGNobi0+dS52aXJxKSApCj4+IC0gICAgICAgICAgICBjaG4tPm5vdGlmeV92Y3B1X2lkID0g
dmNwdV9pZDsKPj4gKyAgICAgICAgICAgIGNobi0+bm90aWZ5X3ZjcHVfaWQgPSB2LT52Y3B1X2lk
Owo+PiAgICAgICAgICBlbHNlCj4+ICAgICAgICAgICAgICByYyA9IC1FSU5WQUw7Cj4+ICAgICAg
ICAgIGJyZWFrOwo+PiAgICAgIGNhc2UgRUNTX1VOQk9VTkQ6Cj4+ICAgICAgY2FzZSBFQ1NfSU5U
RVJET01BSU46Cj4+IC0gICAgICAgIGNobi0+bm90aWZ5X3ZjcHVfaWQgPSB2Y3B1X2lkOwo+PiAr
ICAgICAgICBjaG4tPm5vdGlmeV92Y3B1X2lkID0gdi0+dmNwdV9pZDsKPj4gICAgICAgICAgYnJl
YWs7Cj4+ICAgICAgY2FzZSBFQ1NfUElSUToKPj4gLSAgICAgICAgaWYgKCBjaG4tPm5vdGlmeV92
Y3B1X2lkID09IHZjcHVfaWQgKQo+PiArICAgICAgICBpZiAoIGNobi0+bm90aWZ5X3ZjcHVfaWQg
PT0gdi0+dmNwdV9pZCApCj4+ICAgICAgICAgICAgICBicmVhazsKPj4gICAgICAgICAgdW5saW5r
X3BpcnFfcG9ydChjaG4sIGQtPnZjcHVbY2huLT5ub3RpZnlfdmNwdV9pZF0pOwo+PiAtICAgICAg
ICBjaG4tPm5vdGlmeV92Y3B1X2lkID0gdmNwdV9pZDsKPj4gKyAgICAgICAgY2huLT5ub3RpZnlf
dmNwdV9pZCA9IHYtPnZjcHVfaWQ7Cj4gUmlnaHQgbm93IHdlIHVuZGVyc3RhbmQgd2h5IGFsbCBv
ZiB0aGVzZSBjaGFuZ2VzIGFyZSBkb25lLCBidXQKPiB3aXRob3V0IGEgY29tbWVudCB0aGlzIGlz
IGxpYWJsZSB0byBiZSBjb252ZXJ0ZWQgYmFjayBhcyBhbgo+IG9wdGltaXphdGlvbiBkb3duIHRo
ZSByb2FkLgoKSSB3aWxsIGV4dGVuZCB0aGUgY29tbWl0IG1lc3NhZ2UgYWNjb3JkaW5nbHkuCgpC
ZXN0LApOb3JiZXJ0Cgo+Cj4gRXZlcnl0aGluZyBlbHNlIGhlcmUgbG9va3MgZmluZSB0byBtZSBu
b3cuCj4KPiBKYW4KPgo+CgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJI
CktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFu
IFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJh
Z2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
