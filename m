From: Juergen Gross <jgross@suse.com>
Subject: Re: update_runstate_area and Linux KPTI
Date: Fri, 2 Mar 2018 18:25:40 +0100
Message-ID: <28f57e5f-7166-efae-0aaf-82edd96194fb@suse.com>
References: <3a77a293-1a29-42ed-8fc0-a74bda213b92@arm.com>
 <9fa77816-a25c-c19b-cc26-e0d28cc2e160@citrix.com>
 <5A99877F02000078001ADF59@prv-mh.provo.novell.com>
 <95014a77-b690-997c-7430-ba8fa8e546eb@arm.com>
 <5A998F0502000078001AE011@suse.com>
 <cf3eb248-2aa0-2a6b-2385-52e497961fd2@suse.com>
 <dc80422f-80bb-bd37-ed41-bb6559f4d7d8@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wrb9=fy=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eroRJ-0006ez-AW
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 17:25:49 +0000
In-Reply-To: <dc80422f-80bb-bd37-ed41-bb6559f4d7d8@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, BorisOstrovsky <boris.ostrovsky@oracle.com>, osstest service owner <osstest-admin@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDMvMTggMTg6MDksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDIvMDMvMTggMTc6
MDUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDAyLzAzLzE4IDE3OjUxLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+Pj4+IE9uIDAyLjAzLjE4IGF0IDE3OjI1LCA8anVsaWVuLmdyYWxsQGFybS5j
b20+IHdyb3RlOgo+Pj4+IE9uIDAyLzAzLzE4IDE2OjE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+
Pj4+Pj4gT24gMDIuMDMuMTggYXQgMTc6MDQsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3
cm90ZToKPj4+Pj4+IFRoZSBwcm9wZXIgd2F5IHRvIGRvIHRoaXMgaXMgaW5kZWVkIGJ5IGEgbm9t
aW5hdGVkIChndWVzdCkgcGh5c2ljYWwKPj4+Pj4+IGFkZHJlc3MsIGF0IHdoaWNoIHBvaW50IFhl
biBjYW4gbWFrZSBhbGwvYW55IHVwZGF0ZXMgYXQgdGltZXMgb2YgaXRzCj4+Pj4+PiBjaG9vc2lu
ZywgYW5kIHRoZSBndWVzdHMgcGFnZXRhYmxlL3Blcm1pc3Npb25zIHN0YXRlIGF0IGFuIGluc3Rh
bnRhbmVvdXMKPj4+Pj4+IG1vbWVudCBkb24ndCBtYXR0ZXIuCj4+Pj4+Pgo+Pj4+Pj4gSWYgeW91
J3ZlIGdvdCB0aW1lIHRvIGRvIHRoaXMsIHRoZW4gcGxlYXNlIGRvLiAgSXQgd2lsbCBiZSBhIGRl
ZmluaXRlCj4+Pj4+PiBpbXByb3ZlbWVudC4KPj4+Pj4gSnVzdCB0byBiZSBhdm9pZCB1bm5lY2Vz
c2FyeSBlZmZvcnQgaW4gdGhlIHdyb25nIGRpcmVjdGlvbjogSSBkb24ndAo+Pj4+PiB0aGluayB5
b3UgY2FuIGFsdGVyIHRoZSBjdXJyZW50IGludGVyZmFjZS4gWW91J2QgaGF2ZSB0byBhZGQgYSBu
ZXcKPj4+Pj4gb25lLCBhbmQgd2UgY291bGQgdGhlbiBkZXByZWNhdGUgKGJ1dCBuZXZlciBhYmFu
ZG9uKSB0aGUgY3VycmVudAo+Pj4+PiBvbmUuCj4+Pj4gSSB3YXMgb25seSBwbGFubmluZyB0byBz
dG9yZSB0aGUgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyByYXRoZXIgdGhhbiB0aGUgCj4+Pj4gdmly
dHVhbCBhZGRyZXNzIGFzIHdlIGRvIHRvZGF5LiBJcyB0aGF0IGNvbnNpZGVyZWQgYXMgYW4gYWx0
ZXJhdGlvbiBvZiAKPj4+PiB0aGUgY3VycmVudCBpbnRlcmZhY2U/Cj4+PiBZZXMsIGl0IGlzLCBh
cyBhbiBleGlzdGluZyBQViBrZXJuZWwgY291bGQgZGVsaWJlcmF0ZWx5IGFsdGVyIHRoZQo+Pj4g
bWFwcGluZ3MgdW5kZXJseWluZyB0aGUgbGluZWFyIGFkZHJlc3MgaXQgaGFzIGhhbmRlZCB1cy4K
Pj4gTGludXggcHZvcHMga2VybmVsIGlzbid0IGRvaW5nIHRoaXMuIE1pbmktT1MgbmVpdGhlci4g
SSBndWVzcyBrZXJuZWwteGVuCj4+IHdvdWxkIGJlIG9rYXkgd2l0aCB0aGlzLCB0b28uIEFuZCBJ
IGJldCBCU0QgaXMgYWxzbyBmaW5lLgo+Pgo+PiBTZXJpb3VzbHk6IGFueSBrZXJuZWwgcGxheWlu
ZyBzdWNoIHRyaWNrcyBpcyBhc2tpbmcgZm9yIHByb2JsZW1zLgo+Pgo+PiBXZSBzaG91bGRuJ3Qg
c3VwcG9ydCBvcGVyYXRpb24gbW9kZXMgd2hpY2ggbWFrZSBubyBzZW5zZSBqdXN0IGZvciB0aGUK
Pj4gc2FrZSBvZiBjb21wYXRpYmlsaXR5LCBJTU8uCj4gCj4gSSdkIGxvdmUgdG8gZG8gdGhpcywg
YnV0IHdlIGNhbnQuwqAgT2xkZXIgTGludXggdXNlZCB0byBoYXZlIGEgdmlydHVhbAo+IGJ1ZmZl
ciBzcGFubmluZyBhIHBhZ2UgYm91bmRhcnkuwqAgQ2hhbmdpbmcgdGhlIGJlaGF2aW91ciB1bmRl
ciB0aGF0IHdpbGwKPiBjYXVzZSBvbGRlciBzZXR1cHMgdG8gZXhwbG9kZS4KCkFkZGluZyBhIHNw
ZWNpYWwgcGVyLWRvbWFpbiBtYXBwaW5nIGZvciB0aGF0IHB1cnBvc2Ugd291bGQgd29yay4KCgpK
dWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
