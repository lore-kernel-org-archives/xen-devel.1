From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.12 v2 4/7] pvh/dom0: warn when
 dom0_mem is not set
Date: Wed, 13 Feb 2019 18:13:51 +0100
Message-ID: <20190213171351.ts3m54hup2536xgq@mac>
References: <20190211174642.38046-1-roger.pau@citrix.com>
 <20190211174642.38046-5-roger.pau@citrix.com>
 <5C643F430200007800216632@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d1Bz=QU=citrix.com=prvs=9402cd06a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gty7k-0000mW-Qw
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 17:15:04 +0000
Content-Disposition: inline
In-Reply-To: <5C643F430200007800216632@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMTMsIDIwMTkgYXQgMDk6MDE6MDdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDExLjAyLjE5IGF0IDE4OjQ2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gVGhlcmUgaGF2ZSBiZWVuIHNldmVyYWwgcmVwb3J0cyBvZiB0aGUgZG9tMCBidWls
ZGVyIHJ1bm5pbmcgb3V0IG9mCj4gPiBtZW1vcnkgd2hlbiBidWlsZGluZyBhIFBWSCBkb20wIHdp
dGhvdXQgaGF2aW5nIHNwZWNpZmllZCBhIGRvbTBfbWVtCj4gPiB2YWx1ZS4gUHJpbnQgYSB3YXJu
aW5nIG1lc3NhZ2UgaWYgZG9tMF9tZW0gaXMgbm90IHNldCB3aGVuIGJvb3RpbmcgaW4KPiA+IFBW
SCBtb2RlLgo+ID4gCj4gPiBUaGlzIGlzIGEgdGVtcG9yYXJ5IHdvcmthcm91bmQgdW50aWwgYWNj
b3VudGluZyBmb3IgaW50ZXJuYWwgbWVtb3J5Cj4gPiByZXF1aXJlZCBieSBYZW4gKGllOiBwYWdp
bmcgc3RydWN0dXJlcykgaXMgaW1wcm92ZWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IEFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gSSB0YWtlIGl0IHRoYXQgLi4uCj4gCj4gPiAt
LS0gYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvZG9t
MF9idWlsZC5jCj4gPiBAQCAtMzc4LDggKzM3OCwxOCBAQCB1bnNpZ25lZCBsb25nIF9faW5pdCBk
b20wX2NvbXB1dGVfbnJfcGFnZXMoCj4gPiAgICAgICAgICAgKiBtYXhpbXVtIG9mIDEyOE1CLgo+
ID4gICAgICAgICAgICovCj4gPiAgICAgICAgICBpZiAoICFucl9wYWdlcyApCj4gPiArICAgICAg
ICB7Cj4gPiAgICAgICAgICAgICAgbnJfcGFnZXMgPSBhdmFpbCAtIChwdl9zaGltID8gcHZfc2hp
bV9tZW0oYXZhaWwpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBtaW4o
YXZhaWwgLyAxNiwgMTI4VUwgPDwgKDIwIC0gUEFHRV9TSElGVCkpKTsKPiA+ICsgICAgICAgICAg
ICBpZiAoIGlzX2h2bV9kb21haW4oZCkgKQo+ID4gKyAgICAgICAgICAgICAgICAvKgo+ID4gKyAg
ICAgICAgICAgICAgICAgKiBUZW1wb3Jhcnkgd29ya2Fyb3VuZCBtZXNzYWdlIHVudGlsIGludGVy
bmFsIChwYWdpbmcpIG1lbW9yeQo+ID4gKyAgICAgICAgICAgICAgICAgKiBhY2NvdW50aW5nIHJl
cXVpcmVkIHRvIGJ1aWxkIGEgcHZoIGRvbTAgaXMgaW1wcm92ZWQuCj4gPiArICAgICAgICAgICAg
ICAgICAqLwo+ID4gKyAgICAgICAgICAgICAgICBwcmludGsoIldBUk5JTkc6IFBWSCBkb20wIHdp
dGhvdXQgZG9tMF9tZW0gc2V0IGlzIHN0aWxsIHVuc3RhYmxlLiAiCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAiSWYgeW91IGdldCBjcmFzaGVzIGR1cmluZyBib290LCB0cnkgYWRkaW5nIGEg
ZG9tMF9tZW0gcGFyYW1ldGVyXG4iKTsKPiA+ICsgICAgICAgIH0KPiAKPiAuLi4geW91IGNvbnNp
ZGVyIGl0IGFjY2VwdGFibGUgZm9yIHRoZSBtZXNzYWdlIHRvIGJlIGxvZ2dlZCB0d2ljZQo+IGlu
IGNlcnRhaW4gY2FzZXM/CgpSaWdodCwgbnJfcGFnZXMgY291bGQgYmUgc2V0IHRvIDAgYWdhaW4g
aWYgdGhlcmUgYXJlIDIgaXRlcmF0aW9ucyBvZgp0aGUgcGFyZW50IGZvciBsb29wLCBpbiB3aGlj
aCBjYXNlIHVzaW5nIGEgYm9vbGVhbiB3b3VsZCBiZSBiZXR0ZXIuIEkKY2FuIGZpeCB0aGlzIGlu
IHRoZSBuZXh0IHZlcnNpb24uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
