From: Julien Grall <julien.grall@arm.com>
Subject: Re: update_runstate_area and Linux KPTI
Date: Sun, 11 Mar 2018 19:21:51 +0000
Message-ID: <c59e13db-8023-1219-e938-74fc72c5dc32@arm.com>
References: <3a77a293-1a29-42ed-8fc0-a74bda213b92@arm.com>
 <9fa77816-a25c-c19b-cc26-e0d28cc2e160@citrix.com>
 <5A99877F02000078001ADF59@prv-mh.provo.novell.com>
 <95014a77-b690-997c-7430-ba8fa8e546eb@arm.com>
 <5A998F0502000078001AE011@suse.com>
 <cf3eb248-2aa0-2a6b-2385-52e497961fd2@suse.com>
 <dc80422f-80bb-bd37-ed41-bb6559f4d7d8@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yupc=gb=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ev6Xh-0005yB-MW
 for xen-devel@lists.xenproject.org; Sun, 11 Mar 2018 19:22:01 +0000
In-Reply-To: <dc80422f-80bb-bd37-ed41-bb6559f4d7d8@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, BorisOstrovsky <boris.ostrovsky@oracle.com>, osstest service owner <osstest-admin@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMDMvMDIvMjAxOCAwNTowOSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToK
PiBPbiAwMi8wMy8xOCAxNzowNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDIvMDMvMTgg
MTc6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDIuMDMuMTggYXQgMTc6MjUsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gT24gMDIvMDMvMTggMTY6MTgsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+PiBPbiAwMi4wMy4xOCBhdCAxNzowNCwgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+Pj4gVGhlIHByb3BlciB3YXkgdG8gZG8gdGhpcyBp
cyBpbmRlZWQgYnkgYSBub21pbmF0ZWQgKGd1ZXN0KSBwaHlzaWNhbAo+Pj4+Pj4gYWRkcmVzcywg
YXQgd2hpY2ggcG9pbnQgWGVuIGNhbiBtYWtlIGFsbC9hbnkgdXBkYXRlcyBhdCB0aW1lcyBvZiBp
dHMKPj4+Pj4+IGNob29zaW5nLCBhbmQgdGhlIGd1ZXN0cyBwYWdldGFibGUvcGVybWlzc2lvbnMg
c3RhdGUgYXQgYW4gaW5zdGFudGFuZW91cwo+Pj4+Pj4gbW9tZW50IGRvbid0IG1hdHRlci4KPj4+
Pj4+Cj4+Pj4+PiBJZiB5b3UndmUgZ290IHRpbWUgdG8gZG8gdGhpcywgdGhlbiBwbGVhc2UgZG8u
ICBJdCB3aWxsIGJlIGEgZGVmaW5pdGUKPj4+Pj4+IGltcHJvdmVtZW50Lgo+Pj4+PiBKdXN0IHRv
IGJlIGF2b2lkIHVubmVjZXNzYXJ5IGVmZm9ydCBpbiB0aGUgd3JvbmcgZGlyZWN0aW9uOiBJIGRv
bid0Cj4+Pj4+IHRoaW5rIHlvdSBjYW4gYWx0ZXIgdGhlIGN1cnJlbnQgaW50ZXJmYWNlLiBZb3Un
ZCBoYXZlIHRvIGFkZCBhIG5ldwo+Pj4+PiBvbmUsIGFuZCB3ZSBjb3VsZCB0aGVuIGRlcHJlY2F0
ZSAoYnV0IG5ldmVyIGFiYW5kb24pIHRoZSBjdXJyZW50Cj4+Pj4+IG9uZS4KPj4+PiBJIHdhcyBv
bmx5IHBsYW5uaW5nIHRvIHN0b3JlIHRoZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIHJhdGhlciB0
aGFuIHRoZQo+Pj4+IHZpcnR1YWwgYWRkcmVzcyBhcyB3ZSBkbyB0b2RheS4gSXMgdGhhdCBjb25z
aWRlcmVkIGFzIGFuIGFsdGVyYXRpb24gb2YKPj4+PiB0aGUgY3VycmVudCBpbnRlcmZhY2U/Cj4+
PiBZZXMsIGl0IGlzLCBhcyBhbiBleGlzdGluZyBQViBrZXJuZWwgY291bGQgZGVsaWJlcmF0ZWx5
IGFsdGVyIHRoZQo+Pj4gbWFwcGluZ3MgdW5kZXJseWluZyB0aGUgbGluZWFyIGFkZHJlc3MgaXQg
aGFzIGhhbmRlZCB1cy4KPj4gTGludXggcHZvcHMga2VybmVsIGlzbid0IGRvaW5nIHRoaXMuIE1p
bmktT1MgbmVpdGhlci4gSSBndWVzcyBrZXJuZWwteGVuCj4+IHdvdWxkIGJlIG9rYXkgd2l0aCB0
aGlzLCB0b28uIEFuZCBJIGJldCBCU0QgaXMgYWxzbyBmaW5lLgo+Pgo+PiBTZXJpb3VzbHk6IGFu
eSBrZXJuZWwgcGxheWluZyBzdWNoIHRyaWNrcyBpcyBhc2tpbmcgZm9yIHByb2JsZW1zLgo+Pgo+
PiBXZSBzaG91bGRuJ3Qgc3VwcG9ydCBvcGVyYXRpb24gbW9kZXMgd2hpY2ggbWFrZSBubyBzZW5z
ZSBqdXN0IGZvciB0aGUKPj4gc2FrZSBvZiBjb21wYXRpYmlsaXR5LCBJTU8uCj4gCj4gSSdkIGxv
dmUgdG8gZG8gdGhpcywgYnV0IHdlIGNhbnQuwqAgT2xkZXIgTGludXggdXNlZCB0byBoYXZlIGEg
dmlydHVhbAo+IGJ1ZmZlciBzcGFubmluZyBhIHBhZ2UgYm91bmRhcnkuwqAgQ2hhbmdpbmcgdGhl
IGJlaGF2aW91ciB1bmRlciB0aGF0IHdpbGwKPiBjYXVzZSBvbGRlciBzZXR1cHMgdG8gZXhwbG9k
ZS4KCkZvciBjb25maXJtYXRpb24sIGJ5IG9sZGVyIHlvdSBtZWFuIGFueSBjdXJyZW50IExpbnV4
PyAgTG9va2luZyBhdCB0aGVtIAp0aGUgcnVuc3RhdGUgaXMgY29taW5nIGZyb20gdGhlIHBlcmNw
dSByZWdpb24uIEkgY2FuJ3QgZmluZCBpbiB0aGUgY29kZSAKYW55dGhpbmcgcHJvbWlzaW5nIHRv
IGhhdmUgdGhlIHJ1bnN0YXRlIHBhZ2UtYWxpZ25lZC4gRGlkIEkgbWlzcyBhbnl0aGluZz8KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
