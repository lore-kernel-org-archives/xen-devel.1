From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 03/12] x86/IRQ: avoid UB (or worse) in
 trace_irq_mask()
Date: Mon, 13 May 2019 11:42:41 +0100
Message-ID: <765d6542-734a-5255-73a4-74ccce7f4ee8@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
 <5CD2D489020000780022CD34@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fllF=TN=citrix.com=prvs=029ba87d2=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hQ8Px-0005N4-Ga
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 10:42:49 +0000
In-Reply-To: <5CD2D489020000780022CD34@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS84LzE5IDI6MDcgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IER5bmFtaWNhbGx5IGFsbG9j
YXRlZCBDUFUgbWFzayBvYmplY3RzIG1heSBiZSBzbWFsbGVyIHRoYW4gY3B1bWFza190LCBzbwo+
IGNvcHlpbmcgaGFzIHRvIGJlIHJlc3RyaWN0ZWQgdG8gdGhlIGFjdHVhbCBhbGxvY2F0aW9uIHNp
emUuIFRoaXMgaXMKPiBwYXJ0aWN1bGFyeSBpbXBvcnRhbnQgc2luY2UgdGhlIGZ1bmN0aW9uIGRv
ZXNuJ3QgYmFpbCBlYXJseSB3aGVuIHRyYWNpbmcKPiBpcyBub3QgYWN0aXZlLCBzbyBldmVuIHBy
b2R1Y3Rpb24gYnVpbGRzIHdvdWxkIGJlIGFmZmVjdGVkIGJ5IHBvdGVudGlhbAo+IG1pc2JlaGF2
aW9yIGhlcmUuCj4gCj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28KPiAtIHVzZSBpbml0
aWFsaXplcnMgaW5zdGVhZCBvZiBhc3NpZ25tZW50ICsgbWVtc2V0KCksCj4gLSBjb25zdGlmeSB0
aGUgY3B1bWFza190IGlucHV0IHBvaW50ZXIsCj4gLSB1MzIgLT4gdWludDMyX3QuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IHYyOiBO
ZXcuCj4gLS0tCj4gVEJEOiBJIHdvbmRlciB3aGV0aGVyIHRoZSBmdW5jdGlvbiBzaG91bGRuJ3Qg
Z2FpbiBhbiBlYXJseSB0Yl9pbml0X2RvbmUKPiAgICAgIGNoZWNrLCBsaWtlIG1hbnkgb3RoZXIg
dHJhY2VfKigpIGhhdmUuCgpZZWFoLCBhdm9pZGluZyB0aGVzZSBtZW1jb3BpZXMgd2hlbiB0cmFj
aW5nIGlzIG5vdCBlbmFibGVkIHNlZW1zIGxpa2UgYQpnb29kIHRoaW5nLgoKRWl0aGVyIHdheToK
CkFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cgo+IAo+
IEdlb3JnZSwgZGVzcGl0ZSB5b3VyIGdlbmVyYWwgcmVxdWVzdCB0byBiZSBjb3BpZWQgb24gZW50
aXJlIHNlcmllcwo+IHJhdGhlciB0aGFuIGluZGl2aWR1YWwgcGF0Y2hlcywgSSB0aG91Z2h0IGl0
IHdvdWxkIGJlIGJldHRlciB0byBjb3B5Cj4geW91IG9uIGp1c3QgdGhpcyBvbmUgKGZvciBpdHMg
dHJhY2luZyBhc3BlY3QpLCBhcyB0aGUgcGF0Y2ggaGVyZSBpcwo+IGluZGVwZW5kZW50IG9mIHRo
ZSByZXN0IG9mIHRoZSBzZXJpZXMsIGJ1dCBhdCBsZWFzdCBvbmUgbGF0ZXIgcGF0Y2gKPiBkZXBl
bmRzIG9uIHRoZSBwYXJhbWV0ZXIgY29uc3RpZmljYXRpb24gZG9uZSBoZXJlLgoKWWVzLCBJIHRo
aW5rIGluIHRoaXMgY2FzZSB0aGlzIHdhcyB0aGUgZWFzaWVzdCB0aGluZyBmb3IgbWUuICBUaGFu
a3MuIDotKQoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
