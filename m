From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 13/16] x86: rearrange x86_64/entry.S
Date: Mon, 29 Oct 2018 08:57:19 -0600
Message-ID: <5BD71FCF02000078001F5DDE@prv1-mh.provo.novell.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <abc8b48947d241f0dfc75f1b7624d23a9dd76709.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m5uw=nj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gH8yr-00085r-UU
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 14:57:25 +0000
In-Reply-To: <abc8b48947d241f0dfc75f1b7624d23a9dd76709.1539959287.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEwLjE4IGF0IDE2OjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QEAgLTg0NSwxOSArODY1LDcgQEAgaGFuZGxlX2lzdF9leGNlcHRpb246Cj4gICAgICAgICAgLyog
V2Ugd2FudCB0byBnZXQgc3RyYWlnaHQgdG8gdGhlIElSRVQgb24gdGhlIE5NSSBleGl0IHBhdGgu
ICovCj4gICAgICAgICAgdGVzdGIgJDMsVVJFR1NfY3MoJXJzcCkKPiAgICAgICAgICBqeiAgICBy
ZXN0b3JlX2FsbF94ZW4KPiAtICAgICAgICBHRVRfQ1VSUkVOVChieCkKPiAtICAgICAgICAvKiBT
ZW5kIGFuIElQSSB0byBvdXJzZWx2ZXMgdG8gY292ZXIgZm9yIHRoZSBsYWNrIG9mIGV2ZW50IGNo
ZWNraW5nLiAqLwo+IC0gICAgICAgIG1vdmwgIFZDUFVfcHJvY2Vzc29yKCVyYngpLCVlYXgKPiAt
ICAgICAgICBzaGxsICAkSVJRU1RBVF9zaGlmdCwlZWF4Cj4gLSAgICAgICAgbGVhcSAgaXJxX3N0
YXQrSVJRU1RBVF9zb2Z0aXJxX3BlbmRpbmcoJXJpcCksJXJjeAo+IC0gICAgICAgIGNtcGwgICQw
LCglcmN4LCVyYXgsMSkKPiAtICAgICAgICBqZSAgICAxZgo+IC0gICAgICAgIG1vdmwgICRFVkVO
VF9DSEVDS19WRUNUT1IsJWVkaQo+IC0gICAgICAgIGNhbGwgIHNlbmRfSVBJX3NlbGYKPiAtMTog
ICAgICBtb3ZxICBWQ1BVX2RvbWFpbiglcmJ4KSwlcmF4Cj4gLSAgICAgICAgY21wYiAgJDAsRE9N
QUlOX2lzXzMyYml0X3B2KCVyYXgpCj4gLSAgICAgICAgamUgICAgcmVzdG9yZV9hbGxfZ3Vlc3QK
PiAtICAgICAgICBqbXAgICBjb21wYXRfcmVzdG9yZV9hbGxfZ3Vlc3QKPiArICAgICAgICBqbXAg
ICBzZWxmX2lwaV9yZXN0b3JlX2FsbF9ndWVzdAoKSSdtIGhhdmluZyBzb21lIHRyb3VibGUgdW5k
ZXJzdGFuZGluZyB3aHkgeW91IG1vdmUgdGhpcyBjb2RlOgpXaXRob3V0IENPTkZJR19QViBpdCBp
cyB1bnJlYWNoYWJsZS4gSSdkIHByZWZlciBpZiBpdCBzdGF5ZWQgaW4KcGxhY2UgYW5kIHNpbXBs
eSBnb3QgYW4gI2lmZGVmIGFyb3VuZCBpdC4gVGhlIG9uZSBhbHRlcm5hdGl2ZQpvcHRpb24gSSBj
b3VsZCBzZWUgaXMgdG8gbW92ZSB0aGUgcmVzdG9yZV9hbGxfeGVuIGNvZGUgYmxvY2sKcmlnaHQg
aGVyZSwgc28gdGhlIEpNUCB5b3UgcHV0IGluIGNvdWxkIGJlY29tZSBKTlouCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
