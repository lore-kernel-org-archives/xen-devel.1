From: "Natarajan, Janakarajan" <jnataraj@amd.com>
Subject: Re: [PATCH v2 07/10] x86/SVM: Add interrupt management
 code via AVIC
Date: Wed, 30 May 2018 14:47:17 -0500
Message-ID: <b0e0a2a1-d830-08a2-81ad-3c126c09d5c6@amd.com>
References: <20180507210753.2280-1-Janakarajan.Natarajan@amd.com>
 <20180507210753.2280-8-Janakarajan.Natarajan@amd.com>
 <5AFD969A02000078001C3AD9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AFD969A02000078001C3AD9@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8xNy8yMDE4IDk6NTAgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA3LjA1LjE4
IGF0IDIzOjA3LCA8SmFuYWthcmFqYW4uTmF0YXJhamFuQGFtZC5jb20+IHdyb3RlOgo+PiArdm9p
ZCBzdm1fYXZpY19kZWxpdmVyX3Bvc3RlZF9pbnRyKHN0cnVjdCB2Y3B1ICp2LCB1OCB2ZWMpCj4+
ICt7Cj4+ICsgICAgc3RydWN0IHZsYXBpYyAqdmxhcGljID0gdmNwdV92bGFwaWModik7Cj4+ICsK
Pj4gKyAgICAvKiBGYWxsYmFjayB0byB1c2Ugbm9uLUFWSUMgaWYgdmNwdSBpcyBub3QgZW5hYmxl
ZCB3aXRoIEFWSUMuICovCj4+ICsgICAgaWYgKCAhc3ZtX2F2aWNfdmNwdV9lbmFibGVkKHYpICkK
Pj4gKyAgICB7Cj4+ICsgICAgICAgIGlmICggIXZsYXBpY190ZXN0X2FuZF9zZXRfdmVjdG9yKHZl
YywgJnZsYXBpYy0+cmVncy0+ZGF0YVtBUElDX0lSUl0pICkKPj4gKyAgICAgICAgICAgIHZjcHVf
a2ljayh2KTsKPj4gKyAgICAgICAgcmV0dXJuOwo+PiArICAgIH0KPj4gKwo+PiArICAgIC8qIElm
IGludGVycnVwdCBpcyBkaXNhYmxlZCwgZG8gbm90IGlnbm9yZSB0aGUgaW50ZXJydXB0ICovCj4+
ICsgICAgaWYgKCAhKGd1ZXN0X2NwdV91c2VyX3JlZ3MoKS0+ZWZsYWdzICYgWDg2X0VGTEFHU19J
RikgKQo+PiArICAgICAgICByZXR1cm47Cj4gSXQgc2VlbXMgdG8gbWUgdGhhdCBJIGRpZCBjb21t
ZW50IG9uIHRoaXMgYmVmb3JlIC0gSSBkb24ndCB0aGluayBFRkxBR1MuSUYKPiBzaG91bGQgYmUg
Y29uc2lkZXJlZCBoZXJlOgo+Cj4+ICsgICAgaWYgKCB2bGFwaWNfdGVzdF9hbmRfc2V0X3ZlY3Rv
cih2ZWMsICZ2bGFwaWMtPnJlZ3MtPmRhdGFbQVBJQ19JUlJdKSApCj4+ICsgICAgICAgIHJldHVy
bjsKPiBMYXRjaGluZyB0aGUgaW50ZXJydXB0IGludG8gSVJSIG91Z2h0IHRvIGtlZXAgaXQgcGVu
ZGluZyB1bnRpbCB0aGUgZ3Vlc3Qgc2V0cwo+IEVGTEFHUy5JRiBhZ2Fpbi4KCk15IGFwb2xvZ2ll
cy4gSSB0aG91Z2h0IEkgcmVtb3ZlZCB0aGF0IGlmIGNoZWNrLiBJJ2xsIHJlbW92ZSBpdC4KClRo
YW5rcywKSmFuYWsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
