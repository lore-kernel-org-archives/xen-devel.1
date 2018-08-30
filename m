From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/mm: Drop {HAP,SHADOW}_ERROR() wrappers
Date: Thu, 30 Aug 2018 09:26:19 -0600
Message-ID: <5B880C9B02000078001E39A7@prv1-mh.provo.novell.com>
References: <1535479914-30520-1-git-send-email-andrew.cooper3@citrix.com>
 <5B8809F702000078001E397A@prv1-mh.provo.novell.com>
 <fd03094d-f02d-327e-2118-fac497a5fcb8@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <fd03094d-f02d-327e-2118-fac497a5fcb8@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA4LjE4IGF0IDE3OjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzAvMDgvMTggMTY6MTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyOC4w
OC4xOCBhdCAyMDoxMSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gQEAg
LTI0NzgsOSArMjQ3OCw3IEBAIHNoX21hcF9hbmRfdmFsaWRhdGVfZ2w0ZShzdHJ1Y3QgdmNwdSAq
diwgbWZuX3QgZ2w0bWZuLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2hh
ZG93X2w0X2luZGV4LAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsaWRh
dGVfZ2w0ZSk7Cj4+PiAgI2Vsc2UgLy8gISBHVUVTVF9QQUdJTkdfTEVWRUxTID49IDQKPj4+IC0g
ICAgU0hBRE9XX0VSUk9SKCJjYWxsZWQgaW4gd3JvbmcgcGFnaW5nIG1vZGUhXG4iKTsKPj4+IC0g
ICAgQlVHKCk7Cj4+PiAtICAgIHJldHVybiAwOwo+Pj4gKyAgICBCVUcoKTsgLyogQ2FsbGVkIGlu
IHdyb25nIHBhZ2luZyBtb2RlISAqLwo+Pj4gICNlbmRpZgo+Pj4gIH0KPj4gSXNuJ3QgdGhpcyBn
b2luZyB0byBicmVhayB0aGUgYnVpbGQgZm9yIGNlcnRhaW4gb2xkZXIgZ2NjIHZlcnNpb25zPwo+
PiBJU1RSIHNvbWUgc2ltaWxhciBwcm9ibGVtcyBpbiB0aGUgcGFzdC4KPiAKPiBQZXJoYXBzLCBi
dXQgc2luY2UgdGhpcyBjb2RlIHdhcyB3cml0dGVuLCBCVUcoKSBoYXMgZ2FpbmVkIGFuCj4gdW5y
ZWFjaGFibGUoKSBoaW50LiAgQXMgb3RoZXIgZXhhbXBsZXMgb2YgdGhpcyBjb2RlIGxpa2UgdGhp
cyBjb21waWxlLCBJCj4gZG9uJ3QgdGhpbmsgdGhpcyBpcyBnb2luZyB0byBiZSBhIHByb2JsZW0u
CgpUaGUgcHJvYmxlbShzKSBJIHRoaW5rIEkgcmVjYWxsIGNlcnRhaW5seSBwb3N0LWRhdGUgdGhl
IGludHJvZHVjdGlvbiBvZgp1bnJlYWNoYWJsZSgpLiBQZXJoYXBzIHdoZXRoZXIgYSBjb21waWxl
ciB3b3VsZCBwcm9kdWNlIGEKZGlhZ25vc3RpYyBkZXBlbmRzIG9uIG90aGVyIGZhY3RvcnMgYXMg
d2VsbC4gSSdtIG5vdCBvYmplY3RpbmcgdG8gdGhpcwpnb2luZyBpbiB1bmNoYW5nZWQ7IGluIHRo
ZSB3b3JzdCBjYXNlIHdlJ2xsIGhhdmUgdG8gcmUtaW50cm9kdWNlIHRoZQoicmV0dXJuIiBsYXRl
ciBvbi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
