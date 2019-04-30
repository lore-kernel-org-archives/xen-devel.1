From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
Date: Tue, 30 Apr 2019 08:46:33 -0600
Message-ID: <CABfawhn15m4n1OR95=-=-QRNfWaurShzV888GsUqtBoLr+LVHg@mail.gmail.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
 <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
 <5CC7F611020000780022A3DF@prv1-mh.provo.novell.com>
 <CABfawhnjK-6KtLQx_bKngHg6+nHdjEMDYoSGErOGL5581JyZHw@mail.gmail.com>
 <5CC80AE3020000780022A44D@prv1-mh.provo.novell.com>
 <3c95a2b1-11bf-faff-5c55-99e517c56a48@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9xZw=TA=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hLU2K-0000wx-Jb
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 14:47:12 +0000
Received: by mail-wm1-f50.google.com with SMTP id t76so251048wmt.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2019 07:47:10 -0700 (PDT)
In-Reply-To: <3c95a2b1-11bf-faff-5c55-99e517c56a48@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgODo0MyBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNC8zMC8xOSA5OjQ0IEFNLCBKYW4gQmV1bGlj
aCB3cm90ZToKPiA+Pj4+IE9uIDMwLjA0LjE5IGF0IDEwOjI4LCA8dGFtYXNAdGtsZW5neWVsLmNv
bT4gd3JvdGU6Cj4gPj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMToxNSBBTSBKYW4gQmV1bGlj
aCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+Pj4+PiBPbiAyOS4wNC4xOSBh
dCAxODozNSwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+ID4+Pj4gT24gTW9uLCBBcHIg
MjksIDIwMTkgYXQgOToxOCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+ID4+Pj4+Pj4+IE9uIDI2LjA0LjE5IGF0IDE5OjIxLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4g
d3JvdGU6Cj4gPj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gPj4+Pj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9tbS5jCj4gPj4+Pj4+IEBAIC0yMDMwLDEyICsyMDMwLDExIEBAIHN0YXRpYyBp
bmxpbmUgYm9vbAo+ID4+IGN1cnJlbnRfbG9ja2VkX3BhZ2VfbmVfY2hlY2soc3RydWN0IHBhZ2Vf
aW5mbyAqcGFnZSkgewo+ID4+Pj4+PiAgI2RlZmluZSBjdXJyZW50X2xvY2tlZF9wYWdlX25lX2No
ZWNrKHgpIHRydWUKPiA+Pj4+Pj4gICNlbmRpZgo+ID4+Pj4+Pgo+ID4+Pj4+PiAtaW50IHBhZ2Vf
bG9jayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQo+ID4+Pj4+PiArI2lmIGRlZmluZWQoQ09ORklH
X1BWKSB8fCBkZWZpbmVkKENPTkZJR19IQVNfTUVNX1NIQVJJTkcpCj4gPj4+Pj4+ICtzdGF0aWMg
aW50IF9wYWdlX2xvY2soc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKPiA+Pj4+Pgo+ID4+Pj4+IEFz
IHBlciBhYm92ZSwgcGVyc29uYWxseSBJJ20gYWdhaW5zdCBpbnRyb2R1Y2luZwo+ID4+Pj4+IHBh
Z2Vfeyx1bn1sb2NrX21lbXNocigpLCBhcyB0aGF0IG1ha2VzIHRoZSBhYnVzZSBldmVuIG1vcmUK
PiA+Pj4+PiBsb29rIGxpa2UgcHJvcGVyIHVzZS4gQnV0IGlmIHRoaXMgd2FzIHRvIGJlIGtlcHQg
dGhpcyB3YXksIG1heSBJCj4gPj4+Pj4gYXNrIHRoYXQgeW91IHN3aXRjaCBpbnQgLT4gYm9vbCBp
biB0aGUgcmV0dXJuIHR5cGVzIGF0IHRoaXMgb2NjYXNpb24/Cj4gPj4+Pgo+ID4+Pj4gU3dpdGNo
aW5nIHRoZW0gdG8gYm9vbCB3b3VsZCBiZSBmaW5lLiBSZXBsYWNpbmcgdGhlbSB3aXRoIHNvbWV0
aGluZwo+ID4+Pj4gc2FuZXIgaXMgdW5mb3J0dW5hdGVseSBvdXQtb2Ytc2NvcGUgYXQgdGhlIG1v
bWVudC4gVW5sZXNzIHNvbWVvbmUgaGFzCj4gPj4+PiBhIHNwZWNpZmljIHNvbHV0aW9uIHRoYXQg
Y2FuIGJlIHB1dCBpbiBwbGFjZS4gSSBkb24ndCBoYXZlIG9uZS4KPiA+Pj4KPiA+Pj4gSSd2ZSBv
dXRsaW5lZCBhIHNvbHV0aW9uIGFscmVhZHk6IE1ha2UgYSBtZW0tc2hhcmluZyBwcml2YXRlIHZh
cmlhbnQKPiA+Pj4gb2YgcGFnZV97LHVufWxvY2soKSwgZGVyaXZlZCBmcm9tIHRoZSBQViBvbmVz
IChidXQgd2l0aCBwaWVjZXMKPiA+Pj4gZHJvcHBlZCB5b3UgZG9uJ3Qgd2FudC9uZWVkKS4KPiA+
Pgo+ID4+IFdlbGwsIHRoYXQncyB3aGF0IEkgYWxyZWFkeSBkaWQgaGVyZSBpbiB0aGlzIHBhdGNo
LiBObz8KPiA+Cj4gPiBObyAtIHlvdSd2ZSByZXRhaW5lZCBhIHNoYXJlZCBfcGFnZV97LHVufWxv
Y2soKSwgd2hlcmVhcyBteQo+ID4gc3VnZ2VzdGlvbiB3YXMgdG8gaGF2ZSBhIGNvbXBsZXRlbHkg
aW5kZXBlbmRlbnQgcGFpciBvZgo+ID4gZnVuY3Rpb25zIGluIG1lbV9zaGFyaW5nLmMuIFRoZSBv
bmx5IHRoaW5nIG5lZWRlZCBieSBib3RoIFBWCj4gPiBhbmQgSFZNIHdvdWxkIHRoZW4gYmUgdGhl
IFBHVF9sb2NrZWQgZmxhZy4KPgo+IEJ1dCBpdCB3YXNuJ3Qgb2J2aW91cyB0byBtZSBob3cgdGhl
IGltcGxlbWVudGF0aW9ucyBvZiB0aGUgYWN0dWFsIGxvY2sKPiBmdW5jdGlvbiB3b3VsZCBiZSBi
ZSBkaWZmZXJlbnQuICBBbmQgdGhlcmUncyBubyBwb2ludCBpbiBoYXZpbmcgdHdvCj4gaWRlbnRp
Y2FsIGltcGxlbWVudGF0aW9uczsgaW4gZmFjdCwgaXQgd291bGQgYmUgaGFybWZ1bC4KCkkgYWxz
byB0aGluayBpdCdzIHdhc3RlZnVsIGFuZCBhbiBpbnZpdGF0aW9uIGZvciBmdXR1cmUgYnJlYWth
Z2UuIEJ1dApyaWdodCBub3cgSSBqdXN0IHdhbnQgdGhlIGZ1bmN0aW9ucyB3b3JraW5nIHdpdGhv
dXQgdGhlbSBpbnRlbnRpb25hbGx5CmNyYXNoaW5nIHRoZSBoeXBlcnZpc29yIHVuZGVyIG1lIC0g
d2hpY2ggaXMgdGhlIGNhc2UgcmlnaHQgbm93LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
