From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 3/7] x86/pvh: allow PVH Dom0 to use the
 debug IO port console
Date: Tue, 30 Oct 2018 12:09:46 +0100
Message-ID: <20181030110946.6tmyr5nspl5iliao@mac.citrite.net>
References: <20181019152021.64607-1-roger.pau@citrix.com>
 <20181019152021.64607-4-roger.pau@citrix.com>
 <47ce00b7-6f15-90f6-3ce3-b9316fae9845@citrix.com>
 <5BD73D6902000078001F5F56@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlru=nk=citrix.com=prvs=8342f37c0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gHRuO-0001Y0-T1
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 11:10:04 +0000
Content-Disposition: inline
In-Reply-To: <5BD73D6902000078001F5F56@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgMTE6MDM6MzdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI5LjEwLjE4IGF0IDE3OjUzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBPbiAxOS8xMC8xOCAxNjoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+
ID4+IEFkZCBhbiBvcHRpb24gdG8gYWxsb3cgdHJhcHBpbmcgYWNjZXNzZXMgdG8gSU8gcG9ydCAw
eGU5IGZvciBhIFBWSAo+ID4+IERvbTAsIHNvIGl0IGNhbiBwcmludCB0byB0aGUgSFZNIGRlYnVn
IGNvbnNvbGUuIE5vdGUgdGhpcyBpcyBub3QKPiA+PiBlbmFibGVkIGJ5IGRlZmF1bHQgaW4gb3Jk
ZXIgdG8gcHJldmVudCBjbGFzaGVzIHdpdGggaGFyZHdhcmUgb24gdGhlCj4gPj4gc3lzdGVtIHVz
aW5nIDB4ZTkuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPiA+PiAtLS0KPiA+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+ID4+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgo+ID4+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4+IC0tLQo+ID4+
IENoYW5nZXMgc2luY2UgdjE6Cj4gPj4gIC0gVXNlIGEgZGVmaW5lIGZvciAweGU5Lgo+ID4+ICAt
IEV4cGFuZCAnTGlzdCBvZicgaW4gdGhlIFhlbiBjb21tYW5kIGRvYy4KPiA+IAo+ID4gQXMgc2Fp
ZCBkdXJpbmcgdjEsIG1ha2UgdGhpcyB1bmNvbmRpdGlvbmFsIGFuZCBkbyBhd2F5IHRoZSBjb21t
YW5kIGxpbmUKPiA+IG9wdGlvbi4KPiA+IAo+ID4gTm9vbmUgd2l0aCBhIFBWSCBkb20wIGlzIGdv
aW5nIHRvIGhhdmUgYSByZWFsIENvWmV0IEluZm8gUEMgcmFkaW8gb24gYW4KPiA+IElTQSBidXMu
Cj4gCj4gT2gsIEknbSBzb3JyeSAtIEkgaGFkIGZvcmdvdHRlbiBhYm91dCB0aGF0IHJlcXVlc3Qg
b2YgeW91cnMsIGFuZAo+IHNob3VsZCBoZW5jZSBub3QgaGF2ZSBnaXZlbiBteSBSLWIuCgpJJ20g
bWlzcmVhZCBBbmR5J3MgY29tbWVudCwgd2lsbCByZXNlbmQgd2l0aCB0aGUgZGVidWcgcG9ydCBh
bHdheXMgb24uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
