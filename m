From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 7/7] npt/shadow: allow getting foreign
 page table entries
Date: Thu, 14 Feb 2019 13:16:45 +0100
Message-ID: <20190214121645.rlop5hs5wkpmgchc@mac>
References: <20190211174642.38046-1-roger.pau@citrix.com>
 <20190211174642.38046-8-roger.pau@citrix.com>
 <5C65534E0200007800216A5C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gB96=QV=citrix.com=prvs=941d1f7e8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1guFwm-0006ux-I7
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 12:16:56 +0000
Content-Disposition: inline
In-Reply-To: <5C65534E0200007800216A5C@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMTQsIDIwMTkgYXQgMDQ6Mzg6NTRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDExLjAyLjE5IGF0IDE4OjQ2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1wdC5jCj4gPiArKysgYi94ZW4vYXJj
aC94ODYvbW0vcDJtLXB0LmMKPiA+IEBAIC04NjUsNyArODY1LDggQEAgcG9kX3JldHJ5X2wxOgo+
ID4gICAgICB1bm1hcF9kb21haW5fcGFnZShsMWUpOwo+ID4gIAo+ID4gICAgICBBU1NFUlQobWZu
X3ZhbGlkKG1mbikgfHwgIXAybV9pc19yYW0oKnQpIHx8IHAybV9pc19wYWdpbmcoKnQpKTsKPiA+
IC0gICAgcmV0dXJuIChwMm1faXNfdmFsaWQoKnQpIHx8IHAybV9pc19ncmFudCgqdCkpID8gbWZu
IDogSU5WQUxJRF9NRk47Cj4gPiArICAgIHJldHVybiAocDJtX2lzX3ZhbGlkKCp0KSB8fCBwMm1f
aXNfZ3JhbnQoKnQpIHx8IHAybV9pc19mb3JlaWduKCp0KSkKPiA+ICsgICAgICAgICAgID8gbWZu
IDogSU5WQUxJRF9NRk47Cj4gPiAgfQo+IAo+IFdvdWxkbid0IHlvdSBiZXR0ZXIgYWx0ZXIgdGhl
IEFTU0VSVCgpIGFzIHdlbGwsIHVzaW5nIHAybV9pc19hbnlfcmFtKCkKPiBpbnN0ZWFkIG9mIHAy
bV9pc19yYW0oKSBub3c/IEdyYW50cyBzaG91bGQgaGF2ZSBiZWVuIGluY2x1ZGVkIHRoZXJlCj4g
YmVmb3JlLCBidXQgb21pdHRpbmcgZm9yZWlnbiBvbmVzIHRoZXJlIGJlZm9yZSB3YXMgYmVuaWdu
LgoKWWVzLCBJIGNvdWxkIHVzZSBwMm1faXNfYW55X3JhbSBib3RoIGluIHRoZSBhc3NlcnQgYW5k
IGluIHRoZSByZXR1cm4KY29uZGl0aW9uOgoKQVNTRVJUKG1mbl92YWxpZChtZm4pIHx8ICFwMm1f
aXNfYW55X3JhbSgqdCkgfHwgcDJtX2lzX3BhZ2luZygqdCkpOwpyZXR1cm4gKHAybV9pc192YWxp
ZCgqdCkgfHwgcDJtX2lzX2FueV9yYW0oKnQpKSA/IG1mbiA6IElOVkFMSURfTUZOOwoKVGhhbmtz
LCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
