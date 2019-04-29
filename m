From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Mon, 29 Apr 2019 17:29:37 +0100
Message-ID: <15941682-d84c-9991-40b7-bff5e0d5cf9b@citrix.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
 <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
 <4b3607ed-5596-496b-f6a6-19548703b773@citrix.com>
 <CABfawhk4AnVBMTssrqsDr7e9FB2GSiCn9iE13L5=sBKhQdiEeQ@mail.gmail.com>
 <5CC722F8020000780022A22C@prv1-mh.provo.novell.com>
 <CABfawh=z06LhrWsPn8ot2o55Rt4GJX0M08mABEK63cxwFH3Ajw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uN3R=S7=citrix.com=prvs=015486667=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hL99y-0005pP-QW
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:29:42 +0000
In-Reply-To: <CABfawh=z06LhrWsPn8ot2o55Rt4GJX0M08mABEK63cxwFH3Ajw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8yOS8xOSA1OjI2IFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gT24gTW9uLCBBcHIg
MjksIDIwMTkgYXQgMTA6MTQgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4+Pj4gT24gMjkuMDQuMTkgYXQgMTg6MDUsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3
cm90ZToKPj4+IE9uIE1vbiwgQXByIDI5LCAyMDE5IGF0IDk6NTIgQU0gR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4+PiBJIGhhdmVuJ3QgcmUtZ3Jva2tl
ZCB0aGUgY29kZSBoZXJlLCBidXQgYXNzdW1pbmcgSSB3YXMgY29ycmVjdCAyIHdlZWtzCj4+Pj4g
YWdvLCBpZiB5b3UgaGF2ZSB0aGUgQlVHX09OKCkgdGhlcmUsIHlvdSBjYW4gZ2V0IHJpZCBvZiB0
aGUgZXh0cmEKPj4+PiByZWZlcmVuY2VzLgo+Pj4KPj4+IFN1cmUsIGJ1dCBhZ2FpbiwgdGhlIG92
ZXJoZWFkIG9mIGhhdmluZyB0aGVtIGluLXBsYWNlIGlzIG5lZ2xpZ2libGUgc28KPj4+IG1pZ2h0
IGFzIHdlbGwganVzdCBrZWVwIGl0Lgo+Pgo+PiBUaGUgb3ZlcmhlYWQgaXMgb25seSBvbmUgYXNw
ZWN0IGhlcmUuIFBlb3BsZSBsb29raW5nIGF0IHRoZSBjb2RlCj4+IG1heSBhbHNvIGJlIG1pc2xl
YWQgaW50byB0cnlpbmcgdG8gZmlndXJlIG91dCB3aHkgdGhlIGhlY2sgdGhpcwo+PiBleHRyYSBy
ZWZlcmVuY2UgZ2V0cyBvYnRhaW5lZC4gUGx1cyBzdWItb3B0aW1hbCBjb2RlIHRlbmRzIHRvIGdl
dAo+PiBjbG9uZWQgLi4uCj4gCj4gWWVhLCBJJ20gd2l0aCB5b3UuLiBBbHJpZ2h0LCBpbiB0aGF0
IGNhc2UgQW5kcmV3IHB1bGxlZCBpbiB0aGF0Cj4gcHJldmlvdXMgcGF0Y2ggaW50byB4ODYtbmV4
dCBmb3Igbm8gZ29vZCByZWFzb24gYXMgdGhhdCB3aG9sZSB0aGluZyBpcwo+IGdvaW5nIHRvIGdl
dCBkcm9wcGVkIG5vdy4gQW5kcmV3IC0gaWYgeW91IGNhbiBqdXN0IGRyb3AgdGhhdCBwYXRjaAo+
IGZyb20geDg2LW5leHQgSSdsbCByZWJhc2Ugb24gc3RhZ2luZyBhbmQgcmVzZW5kIHdpdGhvdXQg
dGhhdCBwYXRjaC4KCkkgYXNzdW1lIGhlIHdhbnRzIHRoYXQgYnJhbmNoIHRvIGJlIGZhc3QtZm9y
d2FyZGluZzsgaWYgc28sIGhlIGNhbid0CnJlYWxseSBwdWxsIGl0IG91dC4KCiAtR2VvcmdlCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
