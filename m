From: Alexey G <x1917x@gmail.com>
Subject: Re: [RFC PATCH 11/12] hvmloader: use libacpi to build
 MCFG table
Date: Wed, 21 Mar 2018 06:53:44 +1000
Message-ID: <20180321065344.0000797f@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <d9da7e43b56986b7aca9c84ee93e41587f9d5ac1.1520867741.git.x1917x@gmail.com>
 <20180319174909.wrvclevtvttybuhi@MacBook-Pro-de-Roger.local>
 <20180320072053.0000138d@gmail.com>
 <5AB0E44902000078001B3D54@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=yhyb=gk=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1eyOGa-0008Lz-Q3
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 20:53:56 +0000
Received: by mail-lf0-x235.google.com with SMTP id x205-v6so4703614lfa.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Mar 2018 13:53:54 -0700 (PDT)
In-Reply-To: <5AB0E44902000078001B3D54@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau =?UTF-8?Q?Monn?= =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMCBNYXIgMjAxOCAwMzozNjo1NyAtMDYwMAoiSmFuIEJldWxpY2giIDxKQmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6Cgo+Pj4+IE9uIDE5LjAzLjE4IGF0IDIyOjIwLCA8eDE5MTd4QGdt
YWlsLmNvbT4gd3JvdGU6ICAKPj4gT24gTW9uLCAxOSBNYXIgMjAxOCAxNzo0OTowOSArMDAwMAo+
PiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6ICAKPj4+T24g
VHVlLCBNYXIgMTMsIDIwMTggYXQgMDQ6MzM6NTZBTSArMTAwMCwgQWxleGV5IEdlcmFzaW1lbmtv
IHdyb3RlOiAgCj4+Pj4gLS0tIGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3V0aWwuYwo+Pj4+
ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmMKPj4+PiBAQCAtNzgyLDYgKzc4
Miw2OSBAQCBpbnQgZ2V0X3BjX21hY2hpbmVfdHlwZSh2b2lkKQo+Pj4+ICAgICAgcmV0dXJuIG1h
Y2hpbmVfdHlwZTsKPj4+PiAgfQo+Pj4+ICAKPj4+PiArI2RlZmluZSBQQ0lFWEJBUl9BRERSX01B
U0tfNjRNQiAgICAgKH4oKDFVTEwgPDwgMjYpIC0gMSkpCj4+Pj4gKyNkZWZpbmUgUENJRVhCQVJf
QUREUl9NQVNLXzEyOE1CICAgICh+KCgxVUxMIDw8IDI3KSAtIDEpKQo+Pj4+ICsjZGVmaW5lIFBD
SUVYQkFSX0FERFJfTUFTS18yNTZNQiAgICAofigoMVVMTCA8PCAyOCkgLSAxKSkKPj4+PiArI2Rl
ZmluZSBQQ0lFWEJBUl9MRU5HVEhfQklUUyhyZWcpICAgKCgocmVnKSA+PiAxKSAmIDMpCj4+Pj4g
KyNkZWZpbmUgUENJRVhCQVJFTiAgICAgICAgICAgICAgICAgIDEgICAgCj4+Pgo+Pj5QQ0lFWEJB
Ul9FTkFCTEUgbWF5YmU/ICAKPj4gCj4+IFBDSUVYQkFSRU4gaXMganVzdCBhbiBvZmZpY2lhbCBu
YW1lIG9mIHRoaXMgYml0IGZyb20gdGhlCj4+IEludGVsIGRhdGFzaGVldC4gOikgT0ssIHdpbGwg
cmVuYW1lIGl0IHRvIFBDSUVYQkFSX0VOQUJMRS4gIAo+Cj5JIHRoaW5rIHVzaW5nIG5hbWVzIGZy
b20gdGhlIGRhdGFzaGVldCAod2hlcmUgdGhleSBleGlzdCkgaXMKPnByZWZlcmFibGUgaW4gY2Fz
ZXMgbGlrZSB0aGlzIG9uZS4KCkxlYXZpbmcgaXQgaW50YWN0IHRoZW4uCgo+Pj4+ICsgICAgc3dp
dGNoIChQQ0lFWEJBUl9MRU5HVEhfQklUUyhyZWcpKQo+Pj4+ICsgICAgewo+Pj4+ICsgICAgY2Fz
ZSAwOgo+Pj4+ICsgICAgICAgIGJhc2UgJj0gUENJRVhCQVJfQUREUl9NQVNLXzI1Nk1COwo+Pj4+
ICsgICAgICAgIGJyZWFrOwo+Pj4+ICsgICAgY2FzZSAxOgo+Pj4+ICsgICAgICAgIGJhc2UgJj0g
UENJRVhCQVJfQUREUl9NQVNLXzEyOE1COwo+Pj4+ICsgICAgICAgIGJyZWFrOwo+Pj4+ICsgICAg
Y2FzZSAyOgo+Pj4+ICsgICAgICAgIGJhc2UgJj0gUENJRVhCQVJfQUREUl9NQVNLXzY0TUI7Cj4+
Pj4gKyAgICAgICAgYnJlYWs7ICAgIAo+Pj4KPj4+TWlzc2luZyBuZXdsaW5lcywgcGx1cyB0aGlz
IGxvb2tzIGxpa2UgaXQgd2FudHMgdG8gdXNlIHRoZSBkZWZpbmVzCj4+PmludHJvZHVjZWQgaW4g
cGF0Y2ggNyAoUENJRVhCQVJfezY0LDEyOCwyNTZ9X0JVU0VTKS4gQWxzbyBhbnkgcmVhc29uCj4+
PnRoaXMgcGF0Y2ggYW5kIHBhdGNoIDcgY2Fubm90IGJlIHB1dCBzZXF1ZW50aWFsbHk/ICAKPj4g
Cj4+IEkgdGhpbmsgYWxsIHRoZXNlICNkZWZpbmVzIHNob3VsZCBmaW5kIGEgd2F5IHRvIHBjaV9y
ZWdzLmgsIGl0IHNlZW1zCj4+IGxpa2UgYW4gYXBwcm9wcmlhdGUgcGxhY2UgZm9yIHRoZW0uICAK
Pgo+SSBkb24ndCB0aGluayBkZXZpY2Ugc3BlY2lmaWMgZGVmaW5lcyBiZWxvbmcgaW50byBwY2lf
cmVncy5oLgoKV2lsbCBnYXRoZXIgYWxsIHRoZXNlICNkZWZpbmVzIGFuZCBtYWNyb3MgaW4gdGhl
IG5ldyBwY2lfcmVnc19xMzUuaApmaWxlLiBJdCBzaG91bGQgbm90IGhhcm0gdG8gaW5jbHVkZSBp
dCBmcm9tIHBjaV9yZWdzLmggSSB0aGluaywgaW4Kb3JkZXIgdG8gaW5jbHVkZSBwY2lfcmVncy5o
IG9ubHkgaW4gKi5jLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
