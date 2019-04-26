From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
Date: Fri, 26 Apr 2019 07:12:22 -0600
Message-ID: <5CC303B60200007800229748@prv1-mh.provo.novell.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
 <495a1395-06d4-2ce3-7216-1417ba41fe07@citrix.com>
 <CABfawhm8KxHwY4PB8u-EBqw0K+G1Hv9S9iTC_RYaqOY15bxX4A@mail.gmail.com>
 <5CC2CE3D02000078002295C7@prv1-mh.provo.novell.com>
 <CABfawh=fLVp+b-K_Que5UEDDzMoYysEtVP8itb+cWoXAJdToSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hK0eU-0006gi-N1
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 13:12:30 +0000
In-Reply-To: <CABfawh=fLVp+b-K_Que5UEDDzMoYysEtVP8itb+cWoXAJdToSA@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA0LjE5IGF0IDE0OjI0LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMzoyNCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pgo+PiA+Pj4gT24gMjYuMDQuMTkgYXQgMDI6MTIsIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPiB3cm90ZToKPj4gPiBJIHdvdWxkIGJlIE9LIHdpdGggcHV0dGluZyB0aGUgd2hv
bGUgdGhpbmcgYmVoaW5kCj4+ID4gQ09ORklHX0hBU19NRU1fU0hBUklORyBhbmQgaGF2aW5nIHRo
YXQgYmUgb2ZmIGJ5IGRlZmF1bHQuIElzIHRoYXQgYQo+PiA+IGZlYXNpYmxlIHJvdXRlIGZyb20g
eW91ciBQT1Y/Cj4+Cj4+IFNvIGlzIHRoZXJlIGFueXRoaW5nIHdyb25nIHdpdGggbXkgZWFybGll
ciBzdWdnZXN0aW9uIG9mCj4+IHJlLXB1cnBvc2luZyB0aGUgc2hhcmluZyBmaWVsZCB0byBhdHRh
Y2ggYSBzdHJ1Y3R1cmUgdG8gdGhlIHBhZ2UKPj4gd2hpY2ggY29udGFpbnMgdGhlIG5lY2Vzc2Fy
eSBsb2NrPyBJLmUuIGluIHRoZSBzaW1wbGVzdCBjYXNlIGJ5Cj4+IGFkZGluZyB0aGUgbG9jayB0
byBzdHJ1Y3QgcGFnZV9zaGFyaW5nX2luZm8gaXRzZWxmPwo+IAo+IFllcywgdGhhdCB3b24ndCB3
b3JrIHVuZm9ydHVuYXRlbHkuIFRoZSBsb2NrIGlzIHN1cHBvc2VkIHRvIHByb3RlY3QKPiB1cGRh
dGVzIG1hZGUgdG8gdGhlIHN0cnVjdHVyZSBidXQgYWxzbyBmcmVlaW5nIGl0LiBJZiB0aGUgbG9j
ayBsaXZlcwo+IHdpdGhpbiB0aGUgc3RydWN0dXJlIGl0IG9idmlvdXNseSB3b3VsZCBoYXZlIHRv
IGJlIHVubG9ja2VkIGJlZm9yZSBpdHMKPiBmcmVlZCwgYnV0IGlmIGl0cyB1bmxvY2tlZCBiZWZv
cmUgZnJlZWQgdGhlbiBhbm90aGVyIHRocmVhZCB3YWl0aW5nIG9uCj4gaXQgY291bGQgY29udGlu
dWUgd2l0aG91dCByZWFsaXppbmcgaXQgaXMgYmVpbmcgZnJlZWQuCgpDYW4ndCB5b3UgUkNVLWZy
ZWUgdGhlIHN0cnVjdHVyZSBpbnN0ZWFkLCBhZnRlciBkZXRhY2hpbmcgaXQgZnJvbQp0aGUgbWFp
biBzdHJ1Y3QgcGFnZV9pbmZvIGluc3RhbmNlPyBPZiBjb3Vyc2UgYWxsIGludm9sdmVkIHBhcnRp
ZXMKdGhlbiBuZWVkIHRvIGJlIGF3YXJlIHRoYXQgb25jZSB0aGV5J3ZlIGFjcXVpcmVkIHRoZSBs
b2NrLCB0aGUKcG9pbnRlciBpbiBzdHJ1Y3QgcGFnZV9pbmZvIG1heSBoYXZlIGJlY29tZSBOVUxM
LCB3aGljaApwcmVzdW1hYmx5IHdvdWxkIGRpcmVjdCB0aGVtIHRvIGRyb3AgdGhlIGxvY2sgYWdh
aW4gcmlnaHQgYXdheS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
