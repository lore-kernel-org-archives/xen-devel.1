From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] viridian: fix the
 HvFlushVirtualAddress/List hypercall implementation
Date: Thu, 14 Feb 2019 13:42:23 +0000
Message-ID: <9a42e26f-22c7-190e-1baf-f79605a58a87@citrix.com>
References: <20190214121004.2193-1-paul.durrant@citrix.com>
 <5c1ad5ef-0150-87b2-1bc4-2e3e7bb0c353@suse.com>
 <c799e58a8fb3451b8157cb4d8c008ea8@AMSPEX02CL03.citrite.net>
 <5C65692B0200007800216B37@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CfJi=QV=citrix.com=prvs=941bb452b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1guHHX-0006jN-E4
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 13:42:27 +0000
In-Reply-To: <5C65692B0200007800216B37@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDIvMjAxOSAxMzoxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTQuMDIuMTkg
YXQgMTM6MzgsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBGcm9tOiBKdWVy
Z2VuIEdyb3NzIFttYWlsdG86amdyb3NzQHN1c2UuY29tXQo+Pj4gU2VudDogMTQgRmVicnVhcnkg
MjAxOSAxMjozNQo+Pj4KPj4+IE9uIDE0LzAyLzIwMTkgMTM6MTAsIFBhdWwgRHVycmFudCB3cm90
ZToKPj4+PiB2MjoKPj4+PiAgLSBVc2UgY3B1bWFza19zY3JhdGNoCj4+PiBUaGF0J3Mgbm90IGEg
Z29vZCBpZGVhLiBjcHVtYXNrX3NjcmF0Y2ggbWF5IGJlIHVzZWQgZnJvbSBvdGhlciBjcHVzIGFz
Cj4+PiBsb25nIGFzIHRoZSByZXNwZWN0aWNlIHNjaGVkdWxlciBsb2NrIGlzIGJlaW5nIGhlbGQu
IFNlZSB0aGUgY29tbWVudCBpbgo+Pj4gaW5jbHVkZS94ZW4vc2NoZWQtaWYuaDoKPj4+Cj4+PiAv
Kgo+Pj4gICogU2NyYXRjaCBzcGFjZSwgZm9yIGF2b2lkaW5nIGhhdmluZyB0b28gbWFueSBjcHVt
YXNrX3Qgb24gdGhlIHN0YWNrLgo+Pj4gICogV2l0aGluIGVhY2ggc2NoZWR1bGVyLCB3aGVuIHVz
aW5nIHRoZSBzY3JhdGNoIG1hc2sgb2Ygb25lIHBDUFU6Cj4+PiAgKiAtIHRoZSBwQ1BVIG11c3Qg
YmVsb25nIHRvIHRoZSBzY2hlZHVsZXIsCj4+PiAgKiAtIHRoZSBjYWxsZXIgbXVzdCBvd24gdGhl
IHBlci1wQ1BVIHNjaGVkdWxlciBsb2NrIChhLmsuYS4gcnVucXVldWUKPj4+ICAqICAgbG9jayku
Cj4+PiAgKi8KPj4+Cj4+PiBTbyBwbGVhc2UgZG9uJ3QgdXNlIGNwdW1hc2tfc2NyYXRjaCBvdXRz
aWRlIHRoZSBzY2hlZHVsZXIhCj4+IEFoLCB5ZXMsIGl0J3MgYmVjYXVzZSBvZiBjcHVtYXNrX3Nj
cmF0Y2hfY3B1KCkuLi4gSSdkIGluZGVlZCBtaXNzZWQgdGhhdC4gSW4gCj4+IHdoaWNoIGNhc2Ug
YSBkZWRpY2F0ZWQgZmx1c2hfY3B1bWFzayBpcyBzdGlsbCByZXF1aXJlZC4KPiBBbmQgSSBkaWRu
J3QgcmVjYWxsIHRoaXMgYXNwZWN0IGVpdGhlciAtIEknbSBzb3JyeSBmb3IgbWlzZ3VpZGluZyB5
b3UuCj4gU28gSsO8cmdlbiAtIHRoYW5rcyBmb3Igc3BvdHRpbmchCgpDYW4gY3B1bWFza19zY3Jh
dGNoIG1vdmUgaW50byBhIHNjaGVkdWxlciBwcml2YXRlIGhlYWRlciBmaWxlIHNvIHRoZQpjb21w
aWxlciB3b24ndCBsZXQgdXMgYWNjaWRlbnRhbGx5IG1ha2UgdGhpcyBtaXN0YWtlIGFnYWluPwoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
