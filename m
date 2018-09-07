From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/5] x86/pv: Drop {compat_,
 }create_bounce_frame() and use the C version instead
Date: Fri, 07 Sep 2018 09:49:23 -0600
Message-ID: <5B929E0302000078001E679C@prv1-mh.provo.novell.com>
References: <1519743036-11600-1-git-send-email-andrew.cooper3@citrix.com>
 <1519743036-11600-5-git-send-email-andrew.cooper3@citrix.com>
 <5A9D1B9202000078001AE6B4@prv-mh.provo.novell.com>
 <e35d87d0-227b-c2a4-f70f-ebba1cb41796@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <e35d87d0-227b-c2a4-f70f-ebba1cb41796@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA5LjE4IGF0IDE2OjE3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDUvMDMvMTggMDk6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNy4w
Mi4xOCBhdCAxNTo1MCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gLWNv
bXBhdF9jcmVhdGVfYm91bmNlX2ZyYW1lOgo+Pj4gLSAgICAgICAgQVNTRVJUX0lOVEVSUlVQVFNf
RU5BQkxFRAo+Pj4gLSAgICAgICAgbW92ICAgJWZzLCVlZGkKPj4+IC0gICAgICAgIEFTTV9TVEFD
Cj4+PiAtICAgICAgICB0ZXN0YiAkMixVUkVHU19jcys4KCVyc3ApCj4+PiAtICAgICAgICBqeiAg
ICAxZgo+Pj4gLSAgICAgICAgLyogUHVzaCBuZXcgZnJhbWUgYXQgcmVnaXN0ZXJlZCBndWVzdC1P
UyBzdGFjayBiYXNlLiAqLwo+Pj4gLSAgICAgICAgbW92bCAgVkNQVV9rZXJuZWxfc3AoJXJieCks
JWVzaQo+Pj4gLS5MZnQxOiAgbW92ICAgVkNQVV9rZXJuZWxfc3MoJXJieCksJWZzCj4+IE5vdGUg
aG93IHdlIGRpZCB0YWtlIGludG8gY29uc2lkZXJhdGlvbiB0aGUgc2VnbWVudCBiYXNlIGhlcmU7
Cj4+IHB2X2NyZWF0ZV9ib3VuY2VfZnJhbWUoKSBkb2Vzbid0LiBIZW5jZSB3aGlsZSB0aGUgcGF0
Y2ggaGVyZQo+PiBpcwo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+PiBJJ20gYWZyYWlkIEkgaGF2ZSB0byB3aXRoZHJhdyB0aGUgcmVzcGVjdGl2ZSB0YWcg
Zm9yIHRoZSBlYXJsaWVyIG9uZQo+PiAoZGVzcGl0ZSByZWFsaXppbmcgdGhhdCB0aGVyZSBhcmUg
b3RoZXIgcGxhY2VzIHdoZXJlIHdlIFt3cm9uZ2x5XQo+PiBhc3N1bWUgc3RhY2sgc2VnbWVudHMg
dG8gYmUgZmxhdCkuCj4gCj4gRm9yIHRoZSBmYWlsc2FmZSBjYWxsYmFjaywgJXNzIGlzIHNldCB0
byBiZSBmbGF0LCBhbmQgdGhlbiBhIGJvdW5jZQo+IGZyYW1lIGlzIGNyZWF0ZWQgYXQgdGhlIGN1
cnJlbnQga2VybmVsX3NwLgo+IAo+IERlc3BpdGUgdGhlIGltcHJlc3Npb24gdGhlIEFQSSBtaWdo
dCBnaXZlLCBhIDMyYml0IFBWIGtlcm5lbCBjYW5ub3QgdXNlCj4gYSBub24tZmxhdCBzdGFjayBz
ZWdtZW50LiAgTm8gUFYgZ3Vlc3QgKG5vdCBldmVuIE1pbmlPUykgdXNlcyBhIG5vbi1mbGF0Cj4g
bGF5b3V0LCBzbyB3aGlsZSB0aGlzIGlzIGEgY2hhbmdlIG9mIGJlaGF2aW91ciwgaXRzIG5vdCBn
b2luZyB0byBicmVhawo+IGFueXRoaW5nLgoKV2VsbCwgYXQgdGhlIHZlcnkgbGVhc3Qgc3VjaCBh
IGNoYW5nZSBpbiBiZWhhdmlvciBuZWVkcyB0byBiZSBjYWxsZWQKb3V0IHZlcnkgcHJvbWluZW50
bHkgaW4gdGhlIGRlc2NyaXB0aW9uLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
