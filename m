From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xentrace: handle sparse cpu ids correctly
 in xen trace buffer handling
Date: Mon, 10 Sep 2018 05:48:39 -0600
Message-ID: <5B965A1702000078001E6B62@prv1-mh.provo.novell.com>
References: <20180830075214.11807-1-jgross@suse.com>
 <5B87AA5202000078001E3677@suse.com>
 <222d0135-0c6f-2327-2539-3479e938ec6c@suse.com>
 <f1aef429-e0a8-0066-3c61-25a26f51794f@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=emay=ly=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzKgP-0005lu-SR
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 11:48:45 +0000
In-Reply-To: <f1aef429-e0a8-0066-3c61-25a26f51794f@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA5LjE4IGF0IDEzOjM0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAz
MC8wOC8xOCAxMToyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMzAvMDgvMTggMTA6MjYs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMzAuMDguMTggYXQgMDk6NTIsIDxqZ3Jvc3NA
c3VzZS5jb20+IHdyb3RlOgo+Pj4+IEBAIC0yMDIsNyArMjAyLDcgQEAgc3RhdGljIGludCBhbGxv
Y190cmFjZV9idWZzKHVuc2lnbmVkIGludCBwYWdlcykKPj4+PiAgICAgICAqIEFsbG9jYXRlIGJ1
ZmZlcnMgZm9yIGFsbCBvZiB0aGUgY3B1cy4KPj4+PiAgICAgICAqIElmIGFueSBmYWlscywgZGVh
bGxvY2F0ZSB3aGF0IHlvdSBoYXZlIHNvIGZhciBhbmQgZXhpdC4KPj4+PiAgICAgICAqLwo+Pj4+
IC0gICAgZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCj4+Pj4gKyAgICBmb3JfZWFjaF9wcmVzZW50
X2NwdShjcHUpCj4+Pj4gICAgICB7Cj4+Pj4gICAgICAgICAgb2Zmc2V0ID0gdF9pbmZvX2ZpcnN0
X29mZnNldCArIChjcHUgKiBwYWdlcyk7Cj4+Pj4gICAgICAgICAgdF9pbmZvLT5tZm5fb2Zmc2V0
W2NwdV0gPSBvZmZzZXQ7Cj4+Pgo+Pj4gRG9lc24ndCB0aGlzIGdvIGEgbGl0dGxlIHRvbyBmYXI/
IFdoeSB3b3VsZCB5b3UgYWxsb2NhdGUgYnVmZmVycyBmb3IgQ1BVcwo+Pj4gd2hpY2ggY2FuIG5l
dmVyIGJlIGJyb3VnaHQgb25saW5lPyBUaGVyZSBvdWdodCB0byBiZSBhIG1pZGRsZSBncm91bmQs
Cj4+PiB3aGVyZSBvbmxpbmUtYWJsZSBDUFVzIGhhdmUgYnVmZmVycyBhbGxvY2F0ZWQsIGJ1dCBu
b24tb25saW5lLWFibGUgb25lcwo+Pj4gd29uJ3QuIE9uIGxhcmdlciBzeXN0ZW1zIEkgZ3Vlc3Mg
dGhlIGRpZmZlcmVuY2UgbWF5IGJlIHF1aXRlIG5vdGljYWJsZS4KPj4gCj4+IEFjY29yZGluZyB0
byB0aGUgY29tbWVudHMgaW4gaW5jbHVkZS94ZW4vY3B1bWFzay5oIGNwdV9wcmVzZW50X21hcAo+
PiByZXByZXNlbnRzIHRoZSBwb3B1bGF0ZWQgY3B1cy4KPj4gCj4+IEkga25vdyB0aGF0IGN1cnJl
bnRseSB0aGVyZSBpcyBubyBzdXBwb3J0IGZvciBvbmxpbmluZyBhIHBhcmtlZCBjcHUKPj4gYWdh
aW4sIGJ1dCBJIHRoaW5rIGhhdmluZyB0byB0aGluayBhYm91dCBYZW50cmFjZSBidWZmZXIgYWxs
b2NhdGlvbiBpbgo+PiBjYXNlIG9ubGluaW5nIG9mIHBhcmtlZCBjcHVzIGlzIGFkZGVkIHdvdWxk
IGJlIGEgbmVhcmx5IDEwMCUgY2hhbmNlIHRvCj4+IGludHJvZHVjZSBhIGJ1Zy4KPj4gCj4+IFhl
bnRyYWNlIGlzIHVzZWQgZm9yIHRlc3RpbmcgcHVycG9zZXMgb25seS4gU28gSU1ITyBhbGxvY2F0
aW5nIHNvbWUgbW9yZQo+PiBtZW1vcnkgaXMgYWNjZXB0YWJsZS4KPiAKPiBBcmUgeW91IGZpbmUg
d2l0aCBteSByZWFzb25pbmcgb3IgZG8geW91IHN0aWxsIHdhbnQgbWUgdG8gYXZvaWQgYnVmZmVy
Cj4gYWxsb2NhdGlvbiBmb3Igb2ZmbGluZSBjcHVzPwoKSSBkb24ndCBvYmplY3QgdG8gaXQsIGJ1
dCBJJ20gYWxzbyBub3Qgb3Zlcmx5IGhhcHB5LiBJT1cgLSBJJ2QgbGlrZSB0byBsZWF2ZQppdCB0
byBHZW9yZ2UgYXMgdGhlIG1haW50YWluZXIgb2YgdGhlIGNvZGUgKHdobyBpbiB0dXJuIG1pZ2h0
IGxlYXZlIGl0IHRvCnlvdSkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
