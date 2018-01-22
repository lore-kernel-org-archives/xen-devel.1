From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: further post-Meltdown-bad-aid performance thoughts
Date: Mon, 22 Jan 2018 10:04:58 -0700
Message-ID: <5A6627CA02000078001A13A5@prv-mh.provo.novell.com>
References: <5A6210B502000078001A06A5@prv-mh.provo.novell.com>
 <6134e80b-8fd0-8a7d-61c8-df5892685c63@citrix.com>
 <5A622C9602000078001A0847@prv-mh.provo.novell.com>
 <ec8366d4-ba2b-25da-a5d0-59a0cc404438@citrix.com>
 <5A65BC0102000078001A0ED5@prv-mh.provo.novell.com>
 <b1bde0ac-3c33-9337-1280-4add8545f75a@citrix.com>
 <5A65F57B02000078001A11B7@prv-mh.provo.novell.com>
 <6d6c7f70-1702-d9f7-a734-a5da0b71b66f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwx6=er=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edfWw-0008FM-1i
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 17:05:10 +0000
In-Reply-To: <6d6c7f70-1702-d9f7-a734-a5da0b71b66f@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAxLjE4IGF0IDE2OjE1LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwMS8yMi8yMDE4IDAxOjMwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24g
MjIuMDEuMTggYXQgMTM6MzMsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4g
V2hhdCBJJ20gcHJvcG9zaW5nIGlzIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+Pgo+Pj4gKiBXZSBo
YXZlIGEgImdsb2JhbCIgcmVnaW9uIG9mIFhlbiBtZW1vcnkgdGhhdCBpcyBtYXBwZWQgYnkgYWxs
Cj4+PiBwcm9jZXNzb3JzLiAgVGhpcyB3aWxsIGNvbnRhaW4gZXZlcnl0aGluZyB3ZSBjb25zaWRl
ciBub3Qgc2Vuc2l0aXZlOwo+Pj4gaW5jbHVkaW5nIFhlbiB0ZXh0IHNlZ21lbnRzLCBhbmQgbW9z
dCBkb21haW4gYW5kIHZjcHUgZGF0YS4gIEJ1dCBpdCB3aWxsCj4+PiAqbm90KiBtYXAgYWxsIG9m
IGhvc3QgbWVtb3J5LCBub3IgaGF2ZSBhY2Nlc3MgdG8gc2Vuc2l0aXZlIGRhdGEsIHN1Y2ggYXMK
Pj4+IHZjcHUgcmVnaXN0ZXIgc3RhdGUuCj4+Pgo+Pj4gKiBXZSBoYXZlIHBlci1jcHUgImxvY2Fs
IiByZWdpb25zLiAgSW4gdGhpcyByZWdpb24gd2Ugd2lsbCBtYXAsCj4+PiBvbi1kZW1hbmQsIGd1
ZXN0IG1lbW9yeSB3aGljaCBpcyBuZWVkZWQgdG8gcGVyZm9ybSBjdXJyZW50IG9wZXJhdGlvbnMu
Cj4+PiAoV2UgY2FuIGNvbnNpZGVyIGhvdyBzdHJpY3RseSB3ZSBuZWVkIHRvIHVubWFwIG1lbW9y
eSBhZnRlciB1c2luZyBpdC4pCj4+PiBXZSB3aWxsIGFsc28gbWFwIHRoZSBjdXJyZW50IHZjcHUn
cyByZWdpc3RlcnMuCj4+Pgo+Pj4gKiBPbiBlbnRyeSB0byBhIDY0LWJpdCBQViBndWVzdCwgd2Ug
ZG9uJ3QgY2hhbmdlIHRoZSBtYXBwaW5nIGF0IGFsbC4KPj4+Cj4+PiBOb3csIG5vIG1hdHRlciB3
aGF0IHRoZSBzcGVjdWxhdGl2ZSBhdHRhY2sgLS0gU1AxLCBTUDIsIG9yIFNQMyAtLSBhIHZjcHUK
Pj4+IGNhbiBvbmx5IGFjY2VzcyBpdHMgb3duIFJBTSBhbmQgcmVnaXN0ZXJzLiAgVGhlcmUncyBu
byBleHRyYSBvdmVyaGVhZCB0bwo+Pj4gY29udGV4dCBzd2l0Y2hpbmcgaW50byBvciBvdXQgb2Yg
dGhlIGh5cGVydmlzb3IuCj4+IAo+PiBBbmQgd2Ugd291bGQgb3BlbiBiYWNrIHVwIHRoZSBTUDMg
dmFyaWFudCBvZiBndWVzdCB1c2VyIG1vZGUKPj4gYXR0YWNraW5nIGl0cyBvd24ga2VybmVsIGJ5
IGdvaW5nIHRocm91Z2ggdGhlIFhlbiBtYXBwaW5ncy4gSQo+PiBjYW4ndCBleGNsdWRlIHRoYXQg
dmFyaWFudHMgb2YgU1AxIChsZXNzIGxpa2VseSBTUDIpIGFsbG93aW5nIGluZGlyZWN0Cj4+IGd1
ZXN0LXVzZXIgLT4gZ3Vlc3Qta2VybmVsIGF0dGFja3MgY291bGRuJ3QgYmUgZm91bmQuCj4gCj4g
SG93PyAgWGVuIGRvZXNuJ3QgaGF2ZSB0aGUgZ3Vlc3Qga2VybmVsIG1lbW9yeSBtYXBwZWQgd2hl
biBpdCdzIG5vdAo+IHVzaW5nIGl0LgoKT2gsIHNvIHlvdSBtZWFuIHRvIGRvIGF3YXkgd2l0aCB0
aGUgZGlyZWN0IG1hcCBhbHRvZ2V0aGVyPwoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
