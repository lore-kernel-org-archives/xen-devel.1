From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: update_runstate_area and Linux KPTI
Date: Fri, 2 Mar 2018 17:09:34 +0000
Message-ID: <dc80422f-80bb-bd37-ed41-bb6559f4d7d8@citrix.com>
References: <3a77a293-1a29-42ed-8fc0-a74bda213b92@arm.com>
 <9fa77816-a25c-c19b-cc26-e0d28cc2e160@citrix.com>
 <5A99877F02000078001ADF59@prv-mh.provo.novell.com>
 <95014a77-b690-997c-7430-ba8fa8e546eb@arm.com>
 <5A998F0502000078001AE011@suse.com>
 <cf3eb248-2aa0-2a6b-2385-52e497961fd2@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=prhv=fy=citrix.com=prvs=592350325=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eroBm-0004Uf-5F
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 17:09:46 +0000
In-Reply-To: <cf3eb248-2aa0-2a6b-2385-52e497961fd2@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, BorisOstrovsky <boris.ostrovsky@oracle.com>, osstest service owner <osstest-admin@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDMvMTggMTc6MDUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDIvMDMvMTggMTc6
NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwMi4wMy4xOCBhdCAxNzoyNSwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDAyLzAzLzE4IDE2OjE4LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+Pj4+PiBPbiAwMi4wMy4xOCBhdCAxNzowNCwgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+IHdyb3RlOgo+Pj4+PiBUaGUgcHJvcGVyIHdheSB0byBkbyB0aGlzIGlzIGluZGVl
ZCBieSBhIG5vbWluYXRlZCAoZ3Vlc3QpIHBoeXNpY2FsCj4+Pj4+IGFkZHJlc3MsIGF0IHdoaWNo
IHBvaW50IFhlbiBjYW4gbWFrZSBhbGwvYW55IHVwZGF0ZXMgYXQgdGltZXMgb2YgaXRzCj4+Pj4+
IGNob29zaW5nLCBhbmQgdGhlIGd1ZXN0cyBwYWdldGFibGUvcGVybWlzc2lvbnMgc3RhdGUgYXQg
YW4gaW5zdGFudGFuZW91cwo+Pj4+PiBtb21lbnQgZG9uJ3QgbWF0dGVyLgo+Pj4+Pgo+Pj4+PiBJ
ZiB5b3UndmUgZ290IHRpbWUgdG8gZG8gdGhpcywgdGhlbiBwbGVhc2UgZG8uICBJdCB3aWxsIGJl
IGEgZGVmaW5pdGUKPj4+Pj4gaW1wcm92ZW1lbnQuCj4+Pj4gSnVzdCB0byBiZSBhdm9pZCB1bm5l
Y2Vzc2FyeSBlZmZvcnQgaW4gdGhlIHdyb25nIGRpcmVjdGlvbjogSSBkb24ndAo+Pj4+IHRoaW5r
IHlvdSBjYW4gYWx0ZXIgdGhlIGN1cnJlbnQgaW50ZXJmYWNlLiBZb3UnZCBoYXZlIHRvIGFkZCBh
IG5ldwo+Pj4+IG9uZSwgYW5kIHdlIGNvdWxkIHRoZW4gZGVwcmVjYXRlIChidXQgbmV2ZXIgYWJh
bmRvbikgdGhlIGN1cnJlbnQKPj4+PiBvbmUuCj4+PiBJIHdhcyBvbmx5IHBsYW5uaW5nIHRvIHN0
b3JlIHRoZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIHJhdGhlciB0aGFuIHRoZSAKPj4+IHZpcnR1
YWwgYWRkcmVzcyBhcyB3ZSBkbyB0b2RheS4gSXMgdGhhdCBjb25zaWRlcmVkIGFzIGFuIGFsdGVy
YXRpb24gb2YgCj4+PiB0aGUgY3VycmVudCBpbnRlcmZhY2U/Cj4+IFllcywgaXQgaXMsIGFzIGFu
IGV4aXN0aW5nIFBWIGtlcm5lbCBjb3VsZCBkZWxpYmVyYXRlbHkgYWx0ZXIgdGhlCj4+IG1hcHBp
bmdzIHVuZGVybHlpbmcgdGhlIGxpbmVhciBhZGRyZXNzIGl0IGhhcyBoYW5kZWQgdXMuCj4gTGlu
dXggcHZvcHMga2VybmVsIGlzbid0IGRvaW5nIHRoaXMuIE1pbmktT1MgbmVpdGhlci4gSSBndWVz
cyBrZXJuZWwteGVuCj4gd291bGQgYmUgb2theSB3aXRoIHRoaXMsIHRvby4gQW5kIEkgYmV0IEJT
RCBpcyBhbHNvIGZpbmUuCj4KPiBTZXJpb3VzbHk6IGFueSBrZXJuZWwgcGxheWluZyBzdWNoIHRy
aWNrcyBpcyBhc2tpbmcgZm9yIHByb2JsZW1zLgo+Cj4gV2Ugc2hvdWxkbid0IHN1cHBvcnQgb3Bl
cmF0aW9uIG1vZGVzIHdoaWNoIG1ha2Ugbm8gc2Vuc2UganVzdCBmb3IgdGhlCj4gc2FrZSBvZiBj
b21wYXRpYmlsaXR5LCBJTU8uCgpJJ2QgbG92ZSB0byBkbyB0aGlzLCBidXQgd2UgY2FudC7CoCBP
bGRlciBMaW51eCB1c2VkIHRvIGhhdmUgYSB2aXJ0dWFsCmJ1ZmZlciBzcGFubmluZyBhIHBhZ2Ug
Ym91bmRhcnkuwqAgQ2hhbmdpbmcgdGhlIGJlaGF2aW91ciB1bmRlciB0aGF0IHdpbGwKY2F1c2Ug
b2xkZXIgc2V0dXBzIHRvIGV4cGxvZGUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
