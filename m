From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH RFC v2 00/12] xen/x86: use per-vcpu stacks
 for 64 bit pv domains
Date: Tue, 23 Jan 2018 17:33:57 +0000
Message-ID: <ec981907-eeb7-a697-adb7-3fffe5185d77@citrix.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <5A65EC0A02000078001A1118@suse.com>
 <068bc63f-f79c-627c-4f48-ca8cdef166d9@suse.com>
 <5A6601D302000078001A1230@suse.com>
 <1a670986-d36b-3530-3b12-15ac2faa302e@suse.com>
 <5A6607DB02000078001A127B@suse.com>
 <ad9fe5e8-76b1-3a61-4696-f6d3708cd404@suse.com>
 <5A6624A602000078001A1375@prv-mh.provo.novell.com>
 <1484b1c8-6140-323e-9933-e1120f1e2a0d@citrix.com>
 <d1ddec7e-6e00-bf38-f105-8e5522721cc4@citrix.com>
 <afd747ee-804a-1350-7823-e362562aea79@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gxrj=es=citrix.com=prvs=554f78a13=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ee2SQ-0001Bx-TI
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 17:34:02 +0000
In-Reply-To: <afd747ee-804a-1350-7823-e362562aea79@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMjMvMjAxOCAwNDo1NiBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyMy8wMS8x
OCAxNzo0NSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMDEvMjIvMjAxOCAwNjozOSBQTSwg
QW5kcmV3IENvb3BlciB3cm90ZToKPj4+IEp1ZXJnZW46IHlvdSdyZSBub3cgYWRkaW5nIGEgTFRS
IGludG8gdGhlIGNvbnRleHQgc3dpdGNoIHBhdGggd2hpY2gKPj4+IHRlbmRzIHRvIGJlIHZlcnkg
c2xvdy7CoCBJLmUuIEFzIGN1cnJlbnRseSBwcmVzZW50ZWQsIHRoaXMgc2VyaWVzCj4+PiBuZWNl
c3NhcmlseSBoYXMgYSBoaWdoZXIgcnVudGltZSBvdmVyaGVhZCB0aGFuIEphbidzIFhQVEkuCj4+
Cj4+IFNvIGhlcmUgYXJlIGEgcmVwZWF0IG9mIHRoZSAiaHlwZXJ2aXNvciBjb21waWxlIiB0ZXN0
cyBJIGRpZCwgY29tcGFyaW5nCj4+IHRoZSBkaWZmZXJlbnQgWFBUSS1saWtlIHNlcmllcyBzbyBm
YXIuCj4+Cj4+ICMgRXhwZXJpbWVudGFsIHNldHVwOgo+PiBIb3N0Ogo+PiAgLSBJbnRlbChSKSBY
ZW9uKFIpIENQVSBFNTYzMCAgQCAyLjUzR0h6Cj4+ICAtIDQgcGNwdXMKPj4gIC0gTWVtb3J5OiA0
R2lCCj4+IEd1ZXN0Ogo+PiAgLSA0dmNwdXMsIDUxMk1pQiwgYmxrYmFjayB0byByYXcgZmlsZQo+
PiAgLSBDZW50T1MgNiB1c2Vyc3BhY2UKPj4gIC0gTGludXggNC4xNCBrZXJuZWwgd2l0aCBQViAv
IFBWSCAvIFBWSFZNIC8gS1ZNIGd1ZXN0IHN1cHBvcnQgKGFsb25nCj4+IHdpdGggZXhwZWN0ZWQg
ZHJpdmVycykgYnVpbHQtaW4KPj4gVGVzdDoKPj4gIC0gY2QgeGVuLTQuMTAuMAo+PiAgLSBtYWtl
IC1DIHhlbiBjbGVhbgo+PiAgLSB0aW1lIG1ha2UgLWogNCB4ZW4KPj4KPiAKPiAuLi4KPiAKPj4g
KiBTdGFnaW5nICsgSnVlcmdlbidzIHYyIHNlcmllcwo+PiByZWFsICAgIDFtMy4wMThzCj4+IHVz
ZXIgICAgMm01Mi4yMTdzCj4+IHN5cyAgICAgMG00MC4zNTdzCj4+Cj4+IFJlc3VsdDogNjNzICgw
JSBvdmVyaGVhZCkKPj4KPj4gVW5mb3J0dW5hdGVseSwgSSBjYW4ndCByZWFsbHkgdmVyaWZ5IHRo
YXQgSnVlcmdlbidzIHBhdGNoZXMgYXJlIGhhdmluZwo+PiBhbnkgZWZmZWN0OyB0aGVyZSdzIG5v
IHByaW50ayBpbmRpY2F0aW5nIHdoZXRoZXIgaXQncyBlbmFibGluZyB0aGUKPj4gbWl0aWdhdGlv
biBvciBub3QuICBJIGhhdmUgdmVyaWZpZWQgdGhhdCB0aGUgY2hhbmdlc2V0IHJlcG9ydGVkIGlu
IGB4bAo+PiBkbWVzZ2AgY29ycmVzcG9uZHMgdG8gdGhlIGJyYW5jaCBJIGhhdmUgd2l0aCB0aGUg
cGF0Y2hlcyBhcHBsaWVkLgo+Pgo+PiBTbyBpdCdzICpwb3NzaWJsZSogc29tZXRoaW5nIGhhcyBn
b3R0ZW4gbWl4ZWQgdXAsIGFuZCB0aGUgbWl0aWdhdGlvbgo+PiBpc24ndCBiZWluZyBhcHBsaWVk
OyBidXQgaWYgaXQgKmlzKiBhcHBsaWVkLCB0aGUgcGVyZm9ybWFuY2UgaXMKPj4gc2lnbmlmaWNh
bnRseSBiZXR0ZXIgdGhhbiB0aGUgImJhbmQtYWlkIiBYUFRJLgo+IAo+IEFzIHRoZXJlIGlzIG5v
IHJlYWwgbWl0aWdhdGlvbiBpbiBwbGFjZSwgYnV0IG9ubHkgdGhlIG5lZWRlZCByZXdvcmsgb2YK
PiB0aGUgaW50ZXJydXB0IGhhbmRsaW5nIGFuZCBjb250ZXh0IHN3aXRjaGluZywgYW55dGhpbmcg
bm90IG5leHQgdG8KPiB4cHRpPW9mZiB3b3VsZCBoYXZlIGJlZW4gZGlzYXBwb2ludGluZyBmb3Ig
bWUuIDotKQo+IAo+IEknbGwgYWRkIHNvbWUgc3RhdGlzdGljcyBpbiB0aGUgbmV4dCBwYXRjaGVz
IHNvIGl0IGNhbiBiZSB2ZXJpZmllZCB0aGUKPiBwYXRjaGVzIGFyZSByZWFsbHkgZG9pbmcgc29t
ZXRoaW5nLgoKV2VsbCBhdCB2ZXJ5IGxlYXN0IHRoZXJlIHNob3VsZCBiZSBzb21ldGhpbmcgaW4g
dGhlIGJvb3Qgc2Nyb29sIHRoYXQKc2F5cywgIkVuYWJsaW5nIFhlbiBQYWdldGFibGUgcHJvdGVj
dGlvbiAoWFBUSSkgZm9yIFBWIGd1ZXN0cyIgb3IKc29tZXRoaW5nLiAgKFRoYXQgZ29lcyBmb3Ig
dGhlIGN1cnJlbnQgcm91bmQgb2YgWFBUSSBhcyB3ZWxsIHJlYWxseS4pCgogLUdlb3JnZQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
