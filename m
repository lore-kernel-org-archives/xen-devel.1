From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/7] x86/hvm: introduce a define for the
 debug output IO port
Date: Tue, 30 Oct 2018 12:02:49 +0100
Message-ID: <20181030110249.h2367yo7xeeiosrn@mac.citrite.net>
References: <20181019152021.64607-1-roger.pau@citrix.com>
 <20181019152021.64607-3-roger.pau@citrix.com>
 <5BD73A7B02000078001F5F11@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlru=nk=citrix.com=prvs=8342f37c0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gHRne-0000nQ-Jk
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 11:03:06 +0000
Content-Disposition: inline
In-Reply-To: <5BD73A7B02000078001F5F11@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgMTA6NTE6MDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjEwLjE4IGF0IDE3OjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IFJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gd2l0aCBvbmUgcmVtYXJr
Ogo+IAo+ID4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L3hlbi5oCj4gPiArKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYveGVuLmgKPiA+IEBAIC0zNDYsNiArMzQ2LDEy
IEBAIHN0cnVjdCB4ZW5fYXJjaF9kb21haW5jb25maWcgewo+ID4gICNkZWZpbmUgWEVOX0NQVUlE
ICAgICAgICAgIFhFTl9FTVVMQVRFX1BSRUZJWCAiY3B1aWQiCj4gPiAgI2VuZGlmCj4gPiAgCj4g
PiArLyoKPiA+ICsgKiBEZWJ1ZyBjb25zb2xlIElPIHBvcnQsIGFsc28gY2FsbGVkICJwb3J0IEU5
IGhhY2siLiBFYWNoIGNoYXJhY3RlciB3cml0dGVuCj4gPiArICogdG8gdGhpcyBJTyBwb3J0IHdp
bGwgYmUgcHJpbnRlZCBvbiB0aGUgaHlwZXJ2aXNvciBjb25zb2xlLgo+ID4gKyAqLwo+ID4gKyNk
ZWZpbmUgWEVOX0hWTV9ERUJVR0NPTlNfSU9QT1JUIDB4ZTkKPiAKPiBQZXJoYXBzIGFtZW5kIHRo
ZSBjb21tZW50IHdpdGggIi4uLiwgc3ViamVjdCB0byBsb2cgbGV2ZWwKPiByZXN0cmljdGlvbnMi
PyBFYXNpbHkgZG9uZSB3aGlsZSBjb21taXR0aW5nLgoKWWVzLCB0aGF0IHNlZW1zIHNlbnNpYmxl
LCBmZWVsIGZyZWUgdG8gYWRkIGl0IGR1cmluZyBjb21taXQuCgo+IEZUUiBJJ20gYSBsaXR0bGUg
dW5lYXN5IGFib3V0IGFkZGluZyB0aGlzIHRvIHRoZSBwdWJsaWMKPiBpbnRlcmZhY2UsIGJ1dCBv
dG9oIGV4dGVybmFsIGNvbXBvbmVudHMgYWxyZWFkeSB1c2UgaXQgYXMKPiBpZiBpdCB3YXMgcGFy
dCBvZiBpdC4KCkdpdmVuIHRoZSBjdXJyZW50IHVzYWdlIEkgdGhpbmsgdGhpcyBzaG91bGQgYmUg
cGFydCBvZiB0aGUgcHVibGljCmhlYWRlcnMuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
