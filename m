From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/4] x86: further L1TF / XSA-289 guards
Date: Thu, 31 Jan 2019 15:16:13 +0100
Message-ID: <3088157f-a936-ce78-2543-ad4da2899fcc@suse.com>
References: <5C5301290200007800212C6B@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F1el=QH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gpD8d-0006zS-Iz
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 14:16:19 +0000
In-Reply-To: <5C5301290200007800212C6B@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Norbert Manthey <nmanthey@amazon.de>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDEvMjAxOSAxNTowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhpcyBnb2VzIGFsb25n
c2lkZSBOb3JiZXJ0J3Mgc2VyaWVzLCBkZWFsaW5nIHdpdGggYSBmZXcgbW9yZQo+IHBsYWNlcyB3
aGVyZSBJIGhhcHBlbmVkIHRvIGtub3cgKHdpdGhvdXQgYW55IGFuYWx5c2lzIHRvb2xzKQo+IGd1
ZXN0IGNvbnRyb2xsZWQgYXJyYXkgYWNjZXNzZXMgc2l0LiBJJ3ZlIGFkZGl0aW9uYWxseSBhbHNv
Cj4gY2hlY2tlZCBlbXVsLWk4MjU0LmMsIGFuZCBJIHRoaW5rIG5vIGFkanVzdG1lbnRzIGFyZSBu
ZWVkZWQKPiB0aGVyZSAodGhlcmUgYXJlIGEgZmV3IHBvc3NpYmxlIG92ZXJydW5zIGJ5IG9uZSwg
YnV0IGp1c3QgbGlrZQo+IGlzIHRoZSBjYXNlIGluIHBhdGNoIDIgSSBkb24ndCB0aGluayB0aGV5
IGFyZSBhY3R1YWwgaXNzdWVzKS4KPiAKPiAxOiB4ODZlbXVsOiBhdm9pZCBzcGVjdWxhdGl2ZSBv
dXQgb2YgYm91bmRzIGFjY2Vzc2VzCj4gMjogeDg2L3ZNU0k6IGF2b2lkIHNwZWN1bGF0aXZlIG91
dCBvZiBib3VuZHMgYWNjZXNzZXMKPiAzOiB4ODYvdlBJQzogYXZvaWQgc3BlY3VsYXRpdmUgb3V0
IG9mIGJvdW5kcyBhY2Nlc3Nlcwo+IDQ6IHg4Ni92TEFQSUM6IGF2b2lkIHNwZWN1bGF0aXZlIG91
dCBvZiBib3VuZHMgYWNjZXNzZXMKPiAKPiBKw7xyZ2VuLCBJJ3ZlIGNvcGllZCB5b3UgYW55d2F5
LCBidXQgSSBhc3N1bWUgeW91ciBnZW5lcmFsCj4gUmFiLXVudGlsLVJDMyB3b3VsZCBhcHBseSB0
byB0aGlzIHNlcmllcyAoYW5kIHBlcmhhcHMgdG8KPiBmdXJ0aGVyIG9uZXMsIHNob3VsZCBhbnlv
bmUgZmluZCB0aW1lKSBhcyBtdWNoIGFzIHRvIE5vcmJlcnQncy4KCllvdXIgYXNzdW1wdGlvbiBp
cyBjb3JyZWN0LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
