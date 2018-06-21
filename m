From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC] x86/resume: take care of fully eager
 FPU around system suspend
Date: Thu, 21 Jun 2018 00:46:54 -0600
Message-ID: <5B2B49DE02000078001CC911@prv1-mh.provo.novell.com>
References: <5B2622360200007800133021@prv1-mh.provo.novell.com>
 <e44ed979-efe7-ecae-4329-0f8be3b475f5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9rcu=jh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fVtMx-0001Aa-OW
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 06:46:59 +0000
In-Reply-To: <e44ed979-efe7-ecae-4329-0f8be3b475f5@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA2LjE4IGF0IDEwOjQ1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTcvMDYvMTggMTY6NTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4v
YXJjaC94ODYvYWNwaS9zdXNwZW5kLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2FjcGkvc3VzcGVu
ZC5jCj4+IEBAIC05Miw4ICs5MiwxMSBAQCB2b2lkIHJlc3RvcmVfcmVzdF9wcm9jZXNzb3Jfc3Rh
dGUodm9pZCkKPj4gICAgICAgICAgd3JpdGVfZGVidWdyZWcoNywgY3Vyci0+YXJjaC5kZWJ1Z3Jl
Z1s3XSk7Cj4+ICAgICAgfQo+PiAgCj4+IC0gICAgLyogUmVsb2FkIEZQVSBzdGF0ZSBvbiBuZXh0
IEZQVSB1c2UuICovCj4+IC0gICAgc3R0cygpOwo+PiArICAgIC8qIFJlbG9hZCBGUFUgc3RhdGUg
aW1tZWRpYXRlbHkgb3Igb24gbmV4dCBGUFUgdXNlLiAqLwo+PiArICAgIGlmICggY3Vyci0+YXJj
aC5mdWxseV9lYWdlcl9mcHUgKQo+PiArICAgICAgICB2Y3B1X3Jlc3RvcmVfZnB1X2VhZ2VyKGN1
cnIpOwo+PiArICAgIGVsc2UKPj4gKyAgICAgICAgc3R0cygpOwo+IAo+IEhtbSAtIHRoaW5raW5n
IGFib3V0IGl0LCB0aGlzIHNob3VsZCBlaXRoZXIgYmUgbm90aGluZywgb3IgYSBzdHJhaWdodAo+
IGNhbGwgdG8gdmNwdV9yZXN0b3JlX2ZwdV9lYWdlcihjdXJyKS4KPiAKPiBJZiBpdCBpcyBuZWNl
c3NhcnkgaGVyZSwgdGhlbiBJIGNhbnQgc2VlIGhvdyB0aGUgbm9uLWxhenkgeHNhdmUgc3RhdGVz
Cj4gY3VycmVudGx5IHdvcmsuCgpIbW0sIGluZGVlZCwgYW5kIHNhbWUgdGhlbiBpbiB0aGUgRUZJ
IGNhc2UuCgo+IE9UT0gsIHdlIGNvdWxkIHByb2JhYmx5IGRyb3AgYSBsYXJnZSBxdWFudGl0eSBv
ZiB0aGlzIGN1c3RvbQo+IHNhdmUvcmVzdG9yZSBsb2dpYyBpZiB3ZSBmb3JjZSBhIHRyYW5zaXRp
b24gdG8gZnVsbCBpZGxlIGJlZm9yZSB0YWtpbmcKPiB0aGUgUzMgcGF0aCwgYXQgd2hpY2ggcG9p
bnQgdGhlIG5vcm1hbCBjdHh0X3N3aXRjaF90bygpIHBhdGggc2hvdWxkIERUUlQuCgpSaWdodCwg
YnV0IHRoYXQncyBub3Qgc29tZXRoaW5nIEknZCBjb25zaWRlciBmb3IgNC4xMS4gSW4gcGFydGlj
dWxhciBJJ2QKd2FudCBzdWNoIGEgY2hhbmdlIHRvIGJlIHRocm91Z2hseSAob3ZlciBhbiBleHRl
bmRlZCBwZXJpb2Qgb2YgdGltZSkKdGVzdGVkIGJ5IHNvbWVvbmUgYWN0aXZlbHkgdXNpbmcgUzMu
IEl0IGFsc28gaXMgbm90IHJlYWxseSBhIGdvb2Qgb3B0aW9uCmZvciB0aGUgRUZJIHNpZGUgb2Yg
dGhpbmdzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
