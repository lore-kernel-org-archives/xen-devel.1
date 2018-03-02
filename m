From: Juergen Gross <jgross@suse.com>
Subject: Re: update_runstate_area and Linux KPTI
Date: Fri, 2 Mar 2018 17:56:52 +0100
Message-ID: <3b029f33-cd2d-b704-eae4-2227a865356d@suse.com>
References: <3a77a293-1a29-42ed-8fc0-a74bda213b92@arm.com>
 <9fa77816-a25c-c19b-cc26-e0d28cc2e160@citrix.com>
 <5A99877F02000078001ADF59@prv-mh.provo.novell.com>
 <95014a77-b690-997c-7430-ba8fa8e546eb@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wrb9=fy=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ernzR-0002c1-QQ
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 16:57:01 +0000
In-Reply-To: <95014a77-b690-997c-7430-ba8fa8e546eb@arm.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, BorisOstrovsky <boris.ostrovsky@oracle.com>, osstest service owner <osstest-admin@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDMvMTggMTc6MjUsIEp1bGllbiBHcmFsbCB3cm90ZToKPiAKPiAKPiBPbiAwMi8wMy8x
OCAxNjoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAyLjAzLjE4IGF0IDE3OjA0LCA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBUaGUgcHJvcGVyIHdheSB0byBk
byB0aGlzIGlzIGluZGVlZCBieSBhIG5vbWluYXRlZCAoZ3Vlc3QpIHBoeXNpY2FsCj4+PiBhZGRy
ZXNzLCBhdCB3aGljaCBwb2ludCBYZW4gY2FuIG1ha2UgYWxsL2FueSB1cGRhdGVzIGF0IHRpbWVz
IG9mIGl0cwo+Pj4gY2hvb3NpbmcsIGFuZCB0aGUgZ3Vlc3RzIHBhZ2V0YWJsZS9wZXJtaXNzaW9u
cyBzdGF0ZSBhdCBhbiBpbnN0YW50YW5lb3VzCj4+PiBtb21lbnQgZG9uJ3QgbWF0dGVyLgo+Pj4K
Pj4+IElmIHlvdSd2ZSBnb3QgdGltZSB0byBkbyB0aGlzLCB0aGVuIHBsZWFzZSBkby7CoCBJdCB3
aWxsIGJlIGEgZGVmaW5pdGUKPj4+IGltcHJvdmVtZW50Lgo+Pgo+PiBKdXN0IHRvIGJlIGF2b2lk
IHVubmVjZXNzYXJ5IGVmZm9ydCBpbiB0aGUgd3JvbmcgZGlyZWN0aW9uOiBJIGRvbid0Cj4+IHRo
aW5rIHlvdSBjYW4gYWx0ZXIgdGhlIGN1cnJlbnQgaW50ZXJmYWNlLiBZb3UnZCBoYXZlIHRvIGFk
ZCBhIG5ldwo+PiBvbmUsIGFuZCB3ZSBjb3VsZCB0aGVuIGRlcHJlY2F0ZSAoYnV0IG5ldmVyIGFi
YW5kb24pIHRoZSBjdXJyZW50Cj4+IG9uZS4KPiAKPiBJIHdhcyBvbmx5IHBsYW5uaW5nIHRvIHN0
b3JlIHRoZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIHJhdGhlciB0aGFuIHRoZQo+IHZpcnR1YWwg
YWRkcmVzcyBhcyB3ZSBkbyB0b2RheS4gSXMgdGhhdCBjb25zaWRlcmVkIGFzIGFuIGFsdGVyYXRp
b24gb2YKPiB0aGUgY3VycmVudCBpbnRlcmZhY2U/CgpJIGRvbid0IHRoaW5rIHNvLiBJdCBzaG91
bGQgYmUgcGVyZmVjdGx5IGZpbmUgdG8gYXNzdW1lIHRoZSBtYXBwaW5nIG9mCnRoZSByZWdpc3Rl
cmVkIHZpcnR1YWwgYWRkcmVzcyBpc24ndCBjaGFuZ2VkIGJ5IHRoZSBndWVzdC4KCj4gSW4gb3Ro
ZXIgd29yZHMsIHRoZSBjdXJyZW50IHZlcnNpb24gKGUuZyBzdG9yZSB2aXJ0dWFsIGFkZHJlc3Mp
IGlzIGp1c3QKPiBicm9rZW4gYW5kIGdvaW5nIHRvIGJlIHdvcnN0IHdpdGggS1BUSSBrZXJuZWwu
IEkgY2FuJ3Qgc2VlIGhvdyB0aGlzCj4gY291bGQgZXZlciB3b3JrIHByb3Blcmx5IG9uIE9TIHdp
dGggZGlmZmVyZW50IHNldCBvZiBwYWdlLXRhYmxlcy4KCm1hcF92Y3B1X2luZm8oKSBzZWVtcyB0
byBiZSBhIG5pY2UgZXhhbXBsZSBob3cgdGhpcyBzaG91bGQgYmUgZG9uZS4KVGhpcyBzaG91bGQg
bWFrZSB1cGRhdGVfcnVuc3RhdGVfYXJlYSgpIHNpbXBsZXIgYW5kIGZhc3Rlci4KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
