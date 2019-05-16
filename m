From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/4] x86/IRQ: don't keep EOI timer running
 without need
Date: Thu, 16 May 2019 12:32:38 +0200
Message-ID: <20190516103238.pm6ducegde3xw5wz@Air-de-Roger>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2CFA1020000780022CCA6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wixq=TQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hRDh2-0004lF-B6
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 10:32:56 +0000
Content-Disposition: inline
In-Reply-To: <5CD2CFA1020000780022CCA6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDY6NDY6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIHRpbWVyIG5lZWRzIHRvIHJlbWFpbiBhY3RpdmUgb25seSB1bnRpbCBhbGwgcGVu
ZGluZyBJUlEgaW5zdGFuY2VzCj4gaGF2ZSBzZWVuIEVPSXMgZnJvbSB0aGVpciByZXNwZWN0aXZl
IGRvbWFpbnMuIFN0b3AgaXQgd2hlbiB0aGUgaW4tZmxpZ2h0Cj4gY291bnQgaGFzIHJlYWNoZWQg
emVybyBpbiBkZXNjX2d1ZXN0X2VvaSgpLiBOb3RlIHRoYXQgdGhpcyBpcyByYWNlIGZyZWUKPiAo
d2l0aCBfX2RvX0lSUV9ndWVzdCgpKSwgYXMgdGhlIElSUSBkZXNjcmlwdG9yIGxvY2sgaXMgYmVp
bmcgaGVsZCBhdAo+IHRoYXQgcG9pbnQuCj4gCj4gQWxzbyBwdWxsIHVwIHN0b3BwaW5nIG9mIHRo
ZSB0aW1lciBpbiBfX2RvX0lSUV9ndWVzdCgpIGl0c2VsZjogSW5zdGVhZAo+IG9mIHN0b3BwaW5n
IGl0IGltbWVkaWF0ZWx5IGJlZm9yZSByZS1zZXR0aW5nLCBzdG9wIGl0IGFzIHNvb24gYXMgd2Un
dmUKPiBtYWRlIGl0IHBhc3QgYW55IGVhcmx5IHJldHVybnMgZnJvbSB0aGUgZnVuY3Rpb24gKGFu
ZCBoZW5jZSB3ZSdyZSBzdXJlCj4gaXQnbGwgZ2V0IHNldCBhZ2FpbikuCj4gCj4gRmluYWxseSBi
YWlsIGZyb20gdGhlIGFjdHVhbCB0aW1lciBoYW5kbGVyIGluIGNhc2Ugd2UgZmluZCB0aGUgdGlt
ZXIKPiBhbHJlYWR5IGFjdGl2ZSBhZ2FpbiBieSB0aGUgdGltZSB3ZSd2ZSBtYW5hZ2VkIHRvIGFj
cXVpcmUgdGhlIElSUQo+IGRlc2NyaXB0b3IgbG9jay4gV2l0aG91dCB0aGlzIHdlIG1heSBmb3Jj
aWJseSBFT0kgYW4gSVJRIGltbWVkaWF0ZWx5Cj4gYWZ0ZXIgaXQgZ290IHNlbnQgdG8gYSBndWVz
dC4gRm9yIHRoaXMsIHRpbWVyX2lzX2FjdGl2ZSgpIGdldHMgc3BsaXQgb3V0Cj4gb2YgYWN0aXZl
X3RpbWVyKCksIGRlbGliZXJhdGVseSBtb3ZpbmcganVzdCBvbmUgb2YgdGhlIHR3byBBU1NFUlQo
KXMgKHRvCj4gYWxsb3cgdGhlIGZ1bmN0aW9uIHRvIGJlIHVzZWQgYWxzbyBvbiBhIG5ldmVyIGlu
aXRpYWxpemVkIHRpbWVyKS4KCkFGQUlDVCB0aW1lcl9pc19hY3RpdmUgaXMgZXhjbHVzaXZlbHkg
dXNlZCBpbiBpcnFfZ3Vlc3RfZW9pX3RpbWVyX2ZuLAp3aGljaCBtdXN0IGhhdmUgaW5pdGlhbGl6
ZWQgdGhlIHRpbWVyIGluIG9yZGVyIGZvcgppcnFfZ3Vlc3RfZW9pX3RpbWVyX2ZuIHRvIGJlIGNh
bGxlZCwgYW5kIGhlbmNlIEknbSBub3Qgc3VyZSB3aHkgeW91Cm5lZWQgdG8gYmUgYWJsZSB0byBj
YWxsIHRpbWVyX2lzX2FjdGl2ZSB3aXRoIGFuIHVuaW5pdGlhbGl6ZWQgdGltZXIuCgpJcyB0aGlz
IG1heWJlIHVzZWQgYnkgb3RoZXIgcGF0Y2hlcz8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
