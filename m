From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
Date: Fri, 26 Apr 2019 03:26:24 -0600
Message-ID: <5CC2CEC002000078002295D3@prv1-mh.provo.novell.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJx7o-0004G5-0L
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 09:26:32 +0000
In-Reply-To: <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
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

Pj4+IE9uIDI1LjA0LjE5IGF0IDIxOjU3LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMTI6NTggUE0gQW5kcmV3IENvb3Blcgo+IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4KPj4gT24gMjUvMDQvMjAxOSAxNjozMiwgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOgo+PiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2
L21tLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPj4gPiBpbmRleCA2ZmFhNTYzMTY3Li41
OTRkZTYxNDhmIDEwMDY0NAo+PiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+PiA+
ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+PiA+IEBAIC0xMzMsNyArMTMzLDEwIEBA
IHN0cnVjdCBwYWdlX2luZm8KPj4gPiAgICAgICAgICAgKiBvZiBzaGFyaW5nIHNoYXJlIHRoZSB2
ZXJzaW9uIHRoZXkgZXhwZWN0IHRvLgo+PiA+ICAgICAgICAgICAqIFRoaXMgbGlzdCBpcyBhbGxv
Y2F0ZWQgYW5kIGZyZWVkIHdoZW4gYSBwYWdlIGlzIAo+IHNoYXJlZC91bnNoYXJlZC4KPj4gPiAg
ICAgICAgICAgKi8KPj4gPiAtICAgICAgICBzdHJ1Y3QgcGFnZV9zaGFyaW5nX2luZm8gKnNoYXJp
bmc7Cj4+ID4gKyAgICAgICAgc3RydWN0IHsKPj4gPiArICAgICAgICAgICAgc3RydWN0IHBhZ2Vf
c2hhcmluZ19pbmZvICppbmZvOwo+PiA+ICsgICAgICAgICAgICByd2xvY2tfdCBsb2NrOwo+PiA+
ICsgICAgICAgIH0gc2hhcmluZzsKPj4gPiAgICAgIH07Cj4+ID4KPj4gPiAgICAgIC8qIFJlZmVy
ZW5jZSBjb3VudCBhbmQgdmFyaW91cyBQR0NfeHh4IGZsYWdzIGFuZCBmaWVsZHMuICovCj4+Cj4+
IEknbSBhZnJhaWQgdGhpcyBpcyBhIG5vLWdvLCBidXQgZm9yIHNvbWUgcmVhc29ucyB3aGljaCBh
cmUgcmF0aGVyIG1vcmUKPj4gc3VidGxlIHRoYXQgdGhleSBhcHBlYXIgaGVyZS4KPj4KPj4gVGhl
cmUgaXMgb25lIHN0cnVjdCBwYWdlX2luZm8gcGVyIDRrIGZyYW1lLCBhbmQgeW91J3ZlIGFkZGVk
IGFuIGV4dHJhIDE2Cj4+IGJ5dGVzLCB0YWtpbmcgaXQgZnJvbSAzMiBieXRlcyB0byA0OCBieXRl
cy4KPj4KPj4gT3RoZXIgdGhhbiBtYWtpbmcgaXQgYSBub24tcG93ZXItb2YtMiAobmV0IGRpZmZz
dGF0IGdyb3cvc2hyaW5rOiAyNTYvMjcKPj4gdXAvZG93bjogNzc1MC8tNTY5NiAoMjA1NCkgZHVl
IHRvIGxlc3MgZWZmaWNpZW50IGFyaXRobWV0aWNbMV0pLCB0aGUKPj4gZnJhbXRhYmxlIGhhcyBh
IGZpeGVkIHZpcnR1YWwgc2l6ZSAoMTI4RyBieSBkZWZhdWx0KSwgc28geW91J3ZlIGVuZGVkIHVw
Cj4+IGRyb3BwaW5nIFhlbidzIG1lbW9yeSBsaW1pdCAoMTZUQiBieSBkZWZhdWx0KSBieSAxLzMu
Cj4gCj4gSW50ZXJlc3RpbmcsIEknbSBub3Qgc3VyZSBJIGNvbXBsZXRlbHkgZm9sbG93IGJ1dCBk
b2VzIHRoaXMgbWVhbiB0aGF0Cj4gdGhpcyBzdHJ1Y3R1cmUgaXMgbm93IG5vdCBhbGxvd2VkIHRv
IGdyb3csIGxpa2UgZXZlciwgb3IgdGhhdCBJIGp1c3QKPiBuZWVkIHRvIGFkZCBwYWRkaW5nIHRv
IGZpeCB1cCBpdHMgYWxpZ25tZW50PwoKSW4gYWRkaXRpb24gdG8gd2hhdCBBbmRyZXcgaGFzIHNh
aWQsIGFsc28gbm90aWNlIGhvdyB3ZSd2ZSBnb25lCnRocm91Z2ggZXh0cmEgaG9vcHMgdG8gYXZv
aWQgZ3Jvd2luZyB0aGUgc3RydWN0dXJlIGluIHRoZSBjb250ZXh0Cm9mIFhTQS0yODAuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
