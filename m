From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] x86/passthrough: move io.c to the x86
 subfolder
Date: Mon, 07 Jan 2019 05:45:50 -0700
Message-ID: <5C3349FE020000780020ADB2@prv1-mh.provo.novell.com>
References: <20190104103329.35741-1-roger.pau@citrix.com>
 <20190104103329.35741-3-roger.pau@citrix.com>
 <5C2F91D9020000780020A562@prv1-mh.provo.novell.com>
 <20190107121145.lcca7itc6otkefdh@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yoBP=PP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ggUI2-0000NN-51
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 12:45:58 +0000
In-Reply-To: <20190107121145.lcca7itc6otkefdh@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAxLjE5IGF0IDEzOjExLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgSmFuIDA0LCAyMDE5IGF0IDEwOjAzOjIxQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDQuMDEuMTkgYXQgMTE6MzMsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gSXQgbWFrZXMgbm8gc2Vuc2UgZm9yIGlvLmMgdG8gYmUgb24gdGhlIHRvcCBs
ZXZlbCBwYXNzdGhyb3VnaAo+PiA+IGRpcmVjdG9yeSwgc2luY2UgaXQncyB4ODYgc3BlY2lmaWMu
Cj4+IAo+PiBJJ20gbm90IHN1cmUgaXQgcmVhbGx5IGlzLiBJdCdzIGxhcmdlbHkgYWJvdXQgaW50
ZXJydXB0IGFycmFuZ2VtZW50cwo+PiBmb3IgZ3Vlc3RzLCB3aGljaCAoYmVpbmcgUENJLXJlbGF0
ZWQpIG1heSBvciBtYXkgbm90IGJlIHJlLQo+PiB1c2FibGUgYnkgQXJtIG9uY2UgdGhleSBnZXQg
dG8gc3VwcG9ydCBQQ0kuCj4gCj4gVGhlIGZpbGUgbWFrZXMgaGVhdnkgdXNhZ2Ugb2YgeDg2IG9u
bHkgY29uc3RydWN0cywgbGlrZQo+IGh2bV9waXJxX2RwY2ksIGh2bV9pcnFfZHBjaSBhbmQgYSBs
b3Qgb2YgeDg2IHNwZWNpZmljIEhWTSBmdW5jdGlvbnMuCj4gCj4gVGhpcyBjb3VsZCBpbmRlZWQg
YmUgdXNlZCBieSBBUk0gaW4gdGhlIGZ1dHVyZSBpZiBzdWNoIGZ1bmN0aW9ucyBhbmQKPiBzdHJ1
Y3R1cmVzIGFyZSBpbXBsZW1lbnRlZCBvbiBBUk0sIGJ1dCBpdCB3b3VsZCBjZXJ0YWlubHkgcmVx
dWlyZQo+IGEgbm9uLXRyaXZpYWwgYW1vdW50IG9mIGNoYW5nZXMgdG8gdGhpcyBmaWxlIGFuZCBv
dGhlciBjb2RlLgo+IAo+IEFzIGl0IHN0YW5kcyBub3cgdGhpcyBjb2RlIGlzIHg4NiBzcGVjaWZp
YywgYW5kIGFzIHN1Y2ggaXQgbWFrZXMgbW9yZQo+IHNlbnNlIElNTyB0byByZXNpZGUgaW4gdGhl
IHg4NiBzdWItZm9sZGVyLgoKV2VsbCwgYXMgc2FpZCAtIEknZCBsaWtlIHRvIGhlYXIgYW4gQXJt
IHNpZGUgb3BpbmlvbiBmaXJzdC4KCj4gSSBhZ3JlZSBpdCBtYWtlcyBzZW5zZSB0byByZW5hbWUs
IG1heWJlIHg4Ni9pcnEuYyBvciB4ODYvaW50ZXJydXB0LmM/CgpJIGhhdmUgYSBzbGlnaHQgcHJl
ZmVyZW5jZSBmb3IgdGhlIGZvcm1lci4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
