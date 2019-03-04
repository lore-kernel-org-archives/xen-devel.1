From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH for-next] CODING_STYLE: Document how to
 handle unexpected conditions
Date: Mon, 04 Mar 2019 03:03:54 -0700
Message-ID: <5C7CF80A020000780014FA21@prv1-mh.provo.novell.com>
References: <20190228184905.9377-1-george.dunlap@citrix.com>
 <5C7967EC020000780014F8C1@prv1-mh.provo.novell.com>
 <1840dbab-cf66-ffde-c4b6-248df68ee230@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rzrJ=RH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h0kRz-0004xw-EC
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2019 10:03:59 +0000
In-Reply-To: <1840dbab-cf66-ffde-c4b6-248df68ee230@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, andrew.cooper3@citrix.com, tim@xen.org, julien.grall@arm.com, ian.jackson@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4gMDMvMDEvMTkgNjoz
OSBQTSA+Pj4KPk9uIDMvMS8xOSA1OjEyIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiAwMi8yOC8xOSA3OjUwIFBNID4+
Pgo+Pj4gKyogUHJvZ3JhbW1lcnMgY2FuIHVzZSBBU1NFUlQoKSwgd2hpY2ggd2lsbCBjYXVzZSB0
aGUgY2hlY2sgdG8gYmUKPj4+ICtleGVjdXRlZCBpbiBERUJVRyBidWlsZHMsIGFuZCBjYXVzZSB0
aGUgaHlwZXJ2aXNvciB0byBjcmFzaCBpZiBpdCdzCj4+PiArdmlvbGF0ZWQKPj4gCj4+IElzIGl0
IHBlcmhhcHMgd29ydGggY2FsbGluZyBvdXQgZXhwbGljaXRseSB0aGF0IHRoZSBzdXBwb3NlZCBj
cmFzaCBtYXkgb2NjdXIKPj4gbXVjaCBsYXRlciwgaW4gYSBkaWZmZXJlbnQgY29udGV4dCwgYW5k
IGhlbmNlIGJlIHBlcmhhcHMgcmF0aGVyIGRpZmZpY3VsdCB0bwo+PiBhbmFseXplL2RlYnVnPwo+
Cj5Tb3JyeSwgSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHRoaXMgLS0gd2hlbiB5b3UgdHJpZ2dl
ciBhbiBBU1NFUlQoKSBpdAo+Y3Jhc2hlcyByaWdodCBhd2F5IGxhc3QgdGltZSBJIGNoZWNrZWQu
ICBEaWQgeW91IG1lYW4gaW5zdGVhZCB0byByZXBseQo+dG8gdGhlIEFTU0VSVCgpIHNlY3Rpb24g
b2YgdGhlIEdVSURFTElORVMsIHdoaWNoIHNheXMgeW91IGNhbiB1c2UgQVNTRVJUCj5pZiBpdCBt
YXkgaGF2ZSBhbiBlZmZlY3QgbGF0ZXIgd2hvc2UgYmFkbmVzcyBpcyBlcXVhbCB0byBvciBsZXNz
IHRoYW4gYQo+aG9zdCBjcmFzaD8KCkkgZGlkIGluZGVlZCBwaWNrIHRoZSB3cm9uZyBjb250ZXh0
IGZvciBteSByZXBseSwgYW5kIGhhZCBtZWFudCB0aGF0Cm90aGVyIHBsYWNlIGluc3RlYWQuCgoK
Pkl0IGFsc28gb2NjdXJzIHRvIG1lIHRoYXQgQVNTRVJUKClzIGFyZSByZWFsbHkgb3J0aG9nb25h
bCB0byB0aGUgb3RoZXIKPnRocmVlOiBBdCBlYWNoIHBvaW50LCB5b3Ugc2hvdWxkIGNvbnNpZGVy
IHdoZXRoZXIgaW4gYSBwcm9kdWN0aW9uCj5oeXBlcnZpc29yIHlvdSBzaG91bGQgMSkgZG8gbm90
aGluZywgMikgcmV0dXJuIGFuIGVycm9yLCAzKSBjcmFzaCB0aGUKPmRvbWFpbiwgb3IgNCkgY3Jh
c2ggdGhlIGh5cGVydmlzb3I7IGFuZCBpbiB0aGUgY2FzZSBvZiAxLTMsIHlvdSBtaWdodAo+YWxz
byB3YW50IHRvIGFkZCBhbiBBU1NFUlQgdG8gbW92ZSB0aGUgZGV0ZWN0aW9uIG9mIHVuZXhwZWN0
ZWQgc3RhdGUKPmNsb3NlciB0byB0aGUgcG9pbnQgd2hlcmUgaXQgaGFwcGVucy4KCkFncmVlZC4K
CkphbgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
