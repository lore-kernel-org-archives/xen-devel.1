From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/8] x86: NOP out XPTI entry/exit code
 when it's not in use
Date: Mon, 09 Apr 2018 02:28:05 -0600
Message-ID: <5ACB403502000078001B967C@prv1-mh.provo.novell.com>
References: <5AAFC9E202000078001B36F7@prv-mh.provo.novell.com>
 <5AAFCB4202000078001B3707@suse.com>
 <c4ae0f15-8320-17ca-1ead-db709fafc8e4@suse.com>
 <48ea57ad-537c-9196-bf49-17a6708a7a45@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=shlr=g6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f5S9r-0003dK-Oo
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 08:28:11 +0000
In-Reply-To: <48ea57ad-537c-9196-bf49-17a6708a7a45@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA0LjE4IGF0IDA4OjA3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
My8wNC8xOCAxOTo0OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTkvMDMvMTggMTQ6Mzcs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gSW50cm9kdWNlIGEgc3ludGhldGljIGZlYXR1cmUgZmxh
ZyB0byB1c2UgYWx0ZXJuYXRpdmUgaW5zdHJ1Y3Rpb24KPj4+IHBhdGNoaW5nIHRvIE5PUCBvdXQg
YWxsIGNvZGUgb24gZW50cnkvZXhpdCBwYXRocy4gSGF2aW5nIE5PUHMgaGVyZSBpcwo+Pj4gZ2Vu
ZXJhbGx5IGJldHRlciB0aGFuIHVzaW5nIGNvbmRpdGlvbmFsIGJyYW5jaGVzLgo+Pj4KPj4+IEFs
c28gY2hhbmdlIHRoZSBsaW1pdCBvbiB0aGUgbnVtYmVyIG9mIGJ5dGVzIHdlIGNhbiBwYXRjaCBp
biBvbmUgZ28gdG8KPj4+IHRoYXQgcmVzdWx0aW5nIGZyb20gdGhlIGVuY29kaW5nIGluIHN0cnVj
dCBhbHRfaW5zdHIgLSB0aGVyZSdzIG5vIHBvaW50Cj4+PiByZWR1Y2luZyBpdCBiZWxvdyB0aGF0
IGxpbWl0LCBhbmQgd2l0aG91dCBhIGNoZWNrIGJlaW5nIGluIHBsYWNlIHRoYXQKPj4+IHRoZSBs
aW1pdCBpc24ndCBhY3R1YWxseSBleGNlZWRlZCwgc3VjaCBhbiBhcnRpZmljaWFsIGJvdW5kYXJ5
IGlzIGEKPj4+IGxhdGVudCByaXNrLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gCj4+IEp1c3QgZGlkIGEgcGFyYWxsZWwgbWFrZSBvZiB0
aGUgaHlwZXJ2aXNvciB3aXRoIGFuZCB3aXRob3V0IHRoZSBwYXRjaCwKPj4gd2l0aCB4cHRpPXRy
dWUgYW5kIHdpdGggeHB0aT1mYWxzZSAodmFsdWVzIGluIGJyYWNlcyBhcmUgc3RkZGV2KS4KPiAK
PiBUaGUgdW5wYXRjaGVkIHZlcnNpb24gd2FzIGNvbmZpZ3VyZWQgZGlmZmVyZW50bHkgdGhhbiB0
aGUgcGF0Y2hlZCBvbmUuCj4gU28gdGhlIHJlYWwgbnVtYmVycyBhcmU6Cj4gCj4gICAgICAgICAg
ICAgICAgICAgICAgICBlbGFwc2VkICAgICAgICAgc3lzdGVtICAgICAgICAgIHVzZXIKPiB1bnBh
dGNoZWQsIHhwdGk9ZmFsc2U6ICA4OS45NiAoIDguMDcpICAgOTcuMDUgKCA1LjY5KSAgMTc4LjY0
ICggMi4zOSkKPiB1bnBhdGNoZWQsIHhwdGk9dHJ1ZSA6IDExMy40MiAoIDkuODApICAxNjUuOTkg
KDE1LjEwKSAgMTgwLjk5ICggMi42NikKPiBwYXRjaGVkLCAgIHhwdGk9ZmFsc2U6ICA5MC42NSAo
IDYuNjMpICAgOTkuNTAgKDE0Ljc5KSAgMTgwLjM1ICggNS45NykKPiBwYXRjaGVkLCAgIHhwdGk9
dHJ1ZSA6IDExMS42OSAoIDkuOTMpICAxNjMuNjMgKDEzLjA1KSAgMTgxLjIyICggMy43MSkKPiAK
PiBTbyB0aGUgWFBUSSBjYXNlIGlzIGEgbGl0dGxlIGJpdCBmYXN0ZXIgd2l0aCB0aGUgcGF0Y2gs
IHdoaWxlIHRoZQo+IG5vbi1YUFRJIGNhc2UgaXMgYSBsaXR0bGUgYml0IHNsb3dlci4KClRoYXQn
cyByYXRoZXIgY291bnRlcmludHVpdGl2ZSBhIHJlc3VsdC4KCkphbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
