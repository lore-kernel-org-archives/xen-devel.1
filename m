From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: Xen project CI systems and committer workflow
Date: Thu, 18 Apr 2019 16:33:25 -0500
Message-ID: <20190418213325.4e2ckrb44vgpzgyd@doug-macbook.localdomain>
References: <20190418123159.GD30543@zion.uk.xensource.com>
 <5b7cd86e-e664-d5f1-9262-f7671dc3395a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l666=SU=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1hHEeu-00048C-JK
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 21:33:28 +0000
Received: by mail-yb1-xb43.google.com with SMTP id n19so1370444ybf.10
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2019 14:33:27 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5b7cd86e-e664-d5f1-9262-f7671dc3395a@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Committers <committers@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMDI6NTk6MTdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOC8wNC8yMDE5IDEzOjMxLCBXZWkgTGl1IHdyb3RlOgo+ID4gSGkgYWxsCj4g
Pgo+ID4gV2Ugbm93IGhhdmUgR2l0bGFiIENJIGFzIGEgY29tcGxlbWVudGFyeSBzeXN0ZW0gdG8g
T3NzdGVzdCBhbmQgaGF2ZSBwbGFubmVkIHRvCj4gPiBhZGQgYm90cy4gSXQncyBoaWdoIHRpbWUg
d2UgdGhpbmsgYWJvdXQgaG93IHdlIGludGVncmF0ZSB0aGVtIGFuZCBob3cgaXQgbWF5Cj4gPiBp
bXByb3ZlIG91ciB3b3JrZmxvdy4KPiA+Cj4gPiAjIyBSZXF1aXJlbWVudHMKPiA+Cj4gPiAxLiBX
ZSB3YW50IHRvIGhhdmUgbGlnaHQgd2VpZ2h0IGJ1aWxkIHRlc3RzIGJlZm9yZSBhIHBhdGNoIHNl
cmllcyBpcyByZXZpZXdlZAo+ID4gb3IgY29tbWl0dGVkLgo+ID4KPiA+IDIuIFdlIGRvbid0IHdh
bnQgdG8gcHVzaCBicm9rZW4gcGF0Y2hlcyB0byBjZW50cmFsIHJlcG9zaXRvcnkgc3VjaCB0aGF0
Cj4gPiBldmVyeW9uZSBpcyBibG9ja2VkLgo+ID4KPiA+IDMuIFdlIGRvbid0IHdhbnQgdG8gc2ln
bmlmaWNhbnRseSBjaGFuZ2UgY29tbWl0dGVyIHdvcmtmbG93Lgo+ID4KPiA+IFJlcXVpcmVtZW50
IDIgbWVhbnMgdGhhdCBvdXIgY3VycmVudCBicmFuY2hpbmcgbW9kZWwgd2lsbCBuZWVkIHRvIGJl
IGNoYW5nZWQuCj4gPiBEZXRhaWxzIHdpbGwgZm9sbG93Lgo+IAo+IFdoaWxlIGV2ZXJ5dGhpbmcg
cHJlc2VudGVkIGhlcmUgaXMgZmluZSB0byBkbyBhcyBhIG1hdHRlciBvZiBwb2xpY3ksIHRoZQo+
IGNvbW1pdHRlcnMgc3RpbGwgbmVlZCB0byByZXRhaW4gdGhlIGFiaWxpdHkgdG8gYWN0dWFsbHkg
cHVzaCBkaXJlY3RseSB0bwo+IHRoZSBzdGFnaW5nIGJyYW5jaGVzIG9uIHhlbi5naXQKPiAKPiBU
aGUgc2VjdXJpdHkgdGVhbSBuZWVkcyB0byBiZSBhYmxlIHRvIG1ha2UgZW1iYXJnb2VkIGNvbnRl
bnQgYXBwZWFyIGF0Cj4gdGhlIHBvaW50IG9mIHB1YmxpYyBkaXNjbG9zdXJlLsKgIFRoZSBzZWN1
cml0eSB0ZWFtIGFscmVhZHkgdGFrZXMKPiByZXNwb25zaWJpbGl0eSBmb3IgYWxsIHRlc3Rpbmcg
b2YgdGhpcyBjb250ZW50IGJlZm9yZSB0aGUgcHVibGljIGVtYmFyZ28KPiBwb2ludCwgYW5kIHRo
aXMgcG9saWN5IHdpbGwgbmVlZCB0byBjb250aW51ZS4KPiAKPiB+QW5kcmV3CgpXaGF0IGFib3V0
IHRoZSBhYmlsaXR5IHRvIHB1c2ggYSBicmFuY2ggdG8gdGhlIENJIGxvb3Agd2l0aCB0aGUgaGln
aGVzdApwcmlvcml0eSBzbyB0aGF0IGl0cyBwaWNrZWQgdXAgaW1tZWRpYXRlbHk/IFRoZXJlIGhh
cyBiZWVuIG1vcmUgdGhhbiBvbmUKWFNBIHdoZXJlIHRoZSBwYXRjaGVzIHByb3ZpZGVkIGluIHRo
ZSBlbWFpbHMgZG9uJ3QgYXBwbHkgY2xlYW5seSBvcgpkb24ndCBidWlsZCBzbyBpdCBkb2VzIHNl
ZW0gdmFsdWFibGUgdG8gc3RpbGwgcnVuIHRoZSBDSSBsb29wLgoKLS0KRG91ZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
