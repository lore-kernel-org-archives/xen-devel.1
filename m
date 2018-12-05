From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 v2 04/17] xen/arm: p2m: Introduce
 p2m_is_valid and use it
Date: Wed, 5 Dec 2018 09:46:48 +0000
Message-ID: <4838e4b5-51a5-5fbf-2fa3-1ce539ec3e74@arm.com>
References: <20181204202651.8836-1-julien.grall@arm.com>
 <20181204202651.8836-5-julien.grall@arm.com>
 <alpine.DEB.2.10.1812041549250.527@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=agku=oo=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gUTm6-0003eP-53
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 09:47:22 +0000
In-Reply-To: <alpine.DEB.2.10.1812041549250.527@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDA0LzEyLzIwMTggMjM6NTAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDQgRGVjIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gVGhlIExQQUUg
Zm9ybWF0IGFsbG93cyB0byBzdG9yZSBpbmZvcm1hdGlvbiBpbiBhbiBlbnRyeSBldmVuIHdpdGgg
dGhlCj4+IHZhbGlkIGJpdCB1bnNldC4gSW4gYSBmb2xsb3ctdXAgcGF0Y2gsIHdlIHdpbGwgdGFr
ZSBhZHZhbnRhZ2Ugb2YgdGhpcwo+PiBmZWF0dXJlIHRvIHJlLXB1cnBvc2UgdGhlIHZhbGlkIGJp
dCBmb3IgZ2VuZXJhdGluZyBhIHRyYW5zbGF0aW9uIGZhdWx0Cj4+IGV2ZW4gaWYgYW4gZW50cnkg
Y29udGFpbnMgdmFsaWQgaW5mb3JtYXRpb24uCj4+Cj4+IFNvIHdlIG5lZWQgYSBkaWZmZXJlbnQg
d2F5IHRvIGtub3cgd2hldGhlciBhbiBlbnRyeSBjb250YWlucyB2YWxpZAo+PiBpbmZvcm1hdGlv
bi4gSXQgaXMgcG9zc2libGUgdG8gdXNlIHRoZSBpbmZvcm1hdGlvbiBob2xkIGluIHRoZSBwMm1f
dHlwZQo+PiB0byBrbm93IGZvciB0aGF0IHB1cnBvc2UuIEluZGVlZCBhbGwgZW50cmllcyBjb250
YWluaW5nIHZhbGlkCj4+IGluZm9ybWF0aW9uIHdpbGwgaGF2ZSBhIHZhbGlkIHAybSB0eXBlIChp
LmUgcDJtX3R5cGUgIT0gcDJtX2ludmFsaWQpLgo+Pgo+PiBUaGlzIHBhdGNoIGludHJvZHVjZXMg
YSBuZXcgaGVscGVyIHAybV9pc192YWxpZCwgd2hpY2ggaW1wbGVtZW50cyB0aGF0Cj4+IGlkZWEs
IGFuZCByZXBsYWNlIG1vc3Qgb2YgbHBhZV9pc192YWxpZCBjYWxsIHdpdGggdGhlIG5ldyBoZWxw
ZXIuIFRoZSBvbmVzCj4+IHJlbWFpbmluZyBhcmUgZm9yIFRMQnMgaGFuZGxpbmcgYW5kIGVudHJp
ZXMgYWNjb3VudGluZy4KPj4KPj4gV2l0aCB0aGUgcmVuYW1pbmcgdGhlcmUgYXJlIDIgb3RoZXJz
IGNoYW5nZXMgcmVxdWlyZWQ6Cj4+ICAgICAgLSBHZW5lcmF0ZSB0YWJsZSBlbnRyeSB3aXRoIGEg
dmFsaWQgcDJtIHR5cGUKPj4gICAgICAtIERldGVjdCBuZXcgbWFwcGluZyBmb3IgcHJvcGVyIHN0
YXRzIGFjY291bnRpbmcKPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPgo+IAo+IChUaGlzIHBhdGNoIGRvZXNuJ3QgYXBwbHkgdG8gbWFz
dGVyLCBwbGVhc2UgcmViYXNlKQoKV2h5IGFyZSB5b3UgdHJ5aW5nIHRvIGFwcGx5IHRvIG1hc3Rl
cj8gVGhpcyBzZXJpZXMgKGFzIG1vc3Qgb2YgbXkgc2VyaWVzKSBhcmUgCmJhc2VkIG9uIHN0YWdp
bmcgYXQgdGhlIHRpbWUgaXQgd2FzIHNlbnQuIEkgdHJpZWQgdG8gYXBwbHkgdGhpcyBwYXRjaCB0
b2RheSBvbiAKc3RhZ2luZyBhbmQgSSBkaWRuJ3QgZmluZCBhbnkgaXNzdWUuCgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
