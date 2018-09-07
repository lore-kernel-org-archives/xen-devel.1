From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 4/5] x86/pv: Drop {compat_,
 }create_bounce_frame() and use the C version instead
Date: Fri, 7 Sep 2018 15:17:46 +0100
Message-ID: <e35d87d0-227b-c2a4-f70f-ebba1cb41796@citrix.com>
References: <1519743036-11600-1-git-send-email-andrew.cooper3@citrix.com>
 <1519743036-11600-5-git-send-email-andrew.cooper3@citrix.com>
 <5A9D1B9202000078001AE6B4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A9D1B9202000078001AE6B4@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMTggMDk6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI3LjAyLjE4IGF0
IDE1OjUwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IC1jb21wYXRfY3Jl
YXRlX2JvdW5jZV9mcmFtZToKPj4gLSAgICAgICAgQVNTRVJUX0lOVEVSUlVQVFNfRU5BQkxFRAo+
PiAtICAgICAgICBtb3YgICAlZnMsJWVkaQo+PiAtICAgICAgICBBU01fU1RBQwo+PiAtICAgICAg
ICB0ZXN0YiAkMixVUkVHU19jcys4KCVyc3ApCj4+IC0gICAgICAgIGp6ICAgIDFmCj4+IC0gICAg
ICAgIC8qIFB1c2ggbmV3IGZyYW1lIGF0IHJlZ2lzdGVyZWQgZ3Vlc3QtT1Mgc3RhY2sgYmFzZS4g
Ki8KPj4gLSAgICAgICAgbW92bCAgVkNQVV9rZXJuZWxfc3AoJXJieCksJWVzaQo+PiAtLkxmdDE6
ICBtb3YgICBWQ1BVX2tlcm5lbF9zcyglcmJ4KSwlZnMKPiBOb3RlIGhvdyB3ZSBkaWQgdGFrZSBp
bnRvIGNvbnNpZGVyYXRpb24gdGhlIHNlZ21lbnQgYmFzZSBoZXJlOwo+IHB2X2NyZWF0ZV9ib3Vu
Y2VfZnJhbWUoKSBkb2Vzbid0LiBIZW5jZSB3aGlsZSB0aGUgcGF0Y2ggaGVyZQo+IGlzCj4gUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBJJ20gYWZyYWlkIEkg
aGF2ZSB0byB3aXRoZHJhdyB0aGUgcmVzcGVjdGl2ZSB0YWcgZm9yIHRoZSBlYXJsaWVyIG9uZQo+
IChkZXNwaXRlIHJlYWxpemluZyB0aGF0IHRoZXJlIGFyZSBvdGhlciBwbGFjZXMgd2hlcmUgd2Ug
W3dyb25nbHldCj4gYXNzdW1lIHN0YWNrIHNlZ21lbnRzIHRvIGJlIGZsYXQpLgoKRm9yIHRoZSBm
YWlsc2FmZSBjYWxsYmFjaywgJXNzIGlzIHNldCB0byBiZSBmbGF0LCBhbmQgdGhlbiBhIGJvdW5j
ZQpmcmFtZSBpcyBjcmVhdGVkIGF0IHRoZSBjdXJyZW50IGtlcm5lbF9zcC4KCkRlc3BpdGUgdGhl
IGltcHJlc3Npb24gdGhlIEFQSSBtaWdodCBnaXZlLCBhIDMyYml0IFBWIGtlcm5lbCBjYW5ub3Qg
dXNlCmEgbm9uLWZsYXQgc3RhY2sgc2VnbWVudC7CoCBObyBQViBndWVzdCAobm90IGV2ZW4gTWlu
aU9TKSB1c2VzIGEgbm9uLWZsYXQKbGF5b3V0LCBzbyB3aGlsZSB0aGlzIGlzIGEgY2hhbmdlIG9m
IGJlaGF2aW91ciwgaXRzIG5vdCBnb2luZyB0byBicmVhawphbnl0aGluZy4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
