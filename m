From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: further post-Meltdown-bad-aid performance thoughts
Date: Mon, 22 Jan 2018 17:11:50 +0000
Message-ID: <a1124778-8a7d-66c3-d606-a1210c902334@citrix.com>
References: <5A6210B502000078001A06A5@prv-mh.provo.novell.com>
 <6134e80b-8fd0-8a7d-61c8-df5892685c63@citrix.com>
 <5A622C9602000078001A0847@prv-mh.provo.novell.com>
 <ec8366d4-ba2b-25da-a5d0-59a0cc404438@citrix.com>
 <5A65BC0102000078001A0ED5@prv-mh.provo.novell.com>
 <b1bde0ac-3c33-9337-1280-4add8545f75a@citrix.com>
 <5A65F57B02000078001A11B7@prv-mh.provo.novell.com>
 <6d6c7f70-1702-d9f7-a734-a5da0b71b66f@citrix.com>
 <5A6627CA02000078001A13A5@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=nyhs=er=citrix.com=prvs=5538ca437=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1edfdW-0000eg-Ez
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 17:11:58 +0000
In-Reply-To: <5A6627CA02000078001A13A5@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMjIvMjAxOCAwNTowNCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDEu
MTggYXQgMTY6MTUsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAwMS8y
Mi8yMDE4IDAxOjMwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDIyLjAxLjE4IGF0
IDEzOjMzLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4+PiBXaGF0IEknbSBw
cm9wb3NpbmcgaXMgc29tZXRoaW5nIGxpa2UgdGhpczoKPj4+Pgo+Pj4+ICogV2UgaGF2ZSBhICJn
bG9iYWwiIHJlZ2lvbiBvZiBYZW4gbWVtb3J5IHRoYXQgaXMgbWFwcGVkIGJ5IGFsbAo+Pj4+IHBy
b2Nlc3NvcnMuICBUaGlzIHdpbGwgY29udGFpbiBldmVyeXRoaW5nIHdlIGNvbnNpZGVyIG5vdCBz
ZW5zaXRpdmU7Cj4+Pj4gaW5jbHVkaW5nIFhlbiB0ZXh0IHNlZ21lbnRzLCBhbmQgbW9zdCBkb21h
aW4gYW5kIHZjcHUgZGF0YS4gIEJ1dCBpdCB3aWxsCj4+Pj4gKm5vdCogbWFwIGFsbCBvZiBob3N0
IG1lbW9yeSwgbm9yIGhhdmUgYWNjZXNzIHRvIHNlbnNpdGl2ZSBkYXRhLCBzdWNoIGFzCj4+Pj4g
dmNwdSByZWdpc3RlciBzdGF0ZS4KPj4+Pgo+Pj4+ICogV2UgaGF2ZSBwZXItY3B1ICJsb2NhbCIg
cmVnaW9ucy4gIEluIHRoaXMgcmVnaW9uIHdlIHdpbGwgbWFwLAo+Pj4+IG9uLWRlbWFuZCwgZ3Vl
c3QgbWVtb3J5IHdoaWNoIGlzIG5lZWRlZCB0byBwZXJmb3JtIGN1cnJlbnQgb3BlcmF0aW9ucy4K
Pj4+PiAoV2UgY2FuIGNvbnNpZGVyIGhvdyBzdHJpY3RseSB3ZSBuZWVkIHRvIHVubWFwIG1lbW9y
eSBhZnRlciB1c2luZyBpdC4pCj4+Pj4gV2Ugd2lsbCBhbHNvIG1hcCB0aGUgY3VycmVudCB2Y3B1
J3MgcmVnaXN0ZXJzLgo+Pj4+Cj4+Pj4gKiBPbiBlbnRyeSB0byBhIDY0LWJpdCBQViBndWVzdCwg
d2UgZG9uJ3QgY2hhbmdlIHRoZSBtYXBwaW5nIGF0IGFsbC4KPj4+Pgo+Pj4+IE5vdywgbm8gbWF0
dGVyIHdoYXQgdGhlIHNwZWN1bGF0aXZlIGF0dGFjayAtLSBTUDEsIFNQMiwgb3IgU1AzIC0tIGEg
dmNwdQo+Pj4+IGNhbiBvbmx5IGFjY2VzcyBpdHMgb3duIFJBTSBhbmQgcmVnaXN0ZXJzLiAgVGhl
cmUncyBubyBleHRyYSBvdmVyaGVhZCB0bwo+Pj4+IGNvbnRleHQgc3dpdGNoaW5nIGludG8gb3Ig
b3V0IG9mIHRoZSBoeXBlcnZpc29yLgo+Pj4KPj4+IEFuZCB3ZSB3b3VsZCBvcGVuIGJhY2sgdXAg
dGhlIFNQMyB2YXJpYW50IG9mIGd1ZXN0IHVzZXIgbW9kZQo+Pj4gYXR0YWNraW5nIGl0cyBvd24g
a2VybmVsIGJ5IGdvaW5nIHRocm91Z2ggdGhlIFhlbiBtYXBwaW5ncy4gSQo+Pj4gY2FuJ3QgZXhj
bHVkZSB0aGF0IHZhcmlhbnRzIG9mIFNQMSAobGVzcyBsaWtlbHkgU1AyKSBhbGxvd2luZyBpbmRp
cmVjdAo+Pj4gZ3Vlc3QtdXNlciAtPiBndWVzdC1rZXJuZWwgYXR0YWNrcyBjb3VsZG4ndCBiZSBm
b3VuZC4KPj4KPj4gSG93PyAgWGVuIGRvZXNuJ3QgaGF2ZSB0aGUgZ3Vlc3Qga2VybmVsIG1lbW9y
eSBtYXBwZWQgd2hlbiBpdCdzIG5vdAo+PiB1c2luZyBpdC4KPiAKPiBPaCwgc28geW91IG1lYW4g
dG8gZG8gYXdheSB3aXRoIHRoZSBkaXJlY3QgbWFwIGFsdG9nZXRoZXI/CgpZZXMuIDotKSAgVGhl
IGRpcmVjdCBtYXAgaXMgKnRoZSogY29yZSByZWFzb24gd2h5IHRoZSBTUCoKdnVsbmVyYWJpbGl0
aWVzIGFyZSBzbyBkYW5nZXJvdXMuICBJZiB0aGUgKm9ubHkqIHRoaW5nIHdlIGRpZCB3YXMgZ2V0
CnJpZCBvZiB0aGUgZGlyZWN0IG1hcCwgd2l0aG91dCBkb2luZyAqYW55dGhpbmcqIGVsc2UsIHdl
IHdvdWxkIGFsbW9zdAplbnRpcmVseSBtaXRpZ2F0ZSB0aGUgZWZmZWN0IG9mIGFsbCBvZiB0aGUg
YXR0YWNrcy4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
