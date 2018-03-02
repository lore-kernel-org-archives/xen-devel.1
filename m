From: Julien Grall <julien.grall@arm.com>
Subject: Re: update_runstate_area and Linux KPTI
Date: Fri, 2 Mar 2018 16:25:58 +0000
Message-ID: <95014a77-b690-997c-7430-ba8fa8e546eb@arm.com>
References: <3a77a293-1a29-42ed-8fc0-a74bda213b92@arm.com>
 <9fa77816-a25c-c19b-cc26-e0d28cc2e160@citrix.com>
 <5A99877F02000078001ADF59@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qa/0=fy=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ernVY-0006uP-1U
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 16:26:08 +0000
In-Reply-To: <5A99877F02000078001ADF59@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, BorisOstrovsky <boris.ostrovsky@oracle.com>, osstest service owner <osstest-admin@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMi8wMy8xOCAxNjoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDIuMDMuMTgg
YXQgMTc6MDQsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gVGhlIHByb3Bl
ciB3YXkgdG8gZG8gdGhpcyBpcyBpbmRlZWQgYnkgYSBub21pbmF0ZWQgKGd1ZXN0KSBwaHlzaWNh
bAo+PiBhZGRyZXNzLCBhdCB3aGljaCBwb2ludCBYZW4gY2FuIG1ha2UgYWxsL2FueSB1cGRhdGVz
IGF0IHRpbWVzIG9mIGl0cwo+PiBjaG9vc2luZywgYW5kIHRoZSBndWVzdHMgcGFnZXRhYmxlL3Bl
cm1pc3Npb25zIHN0YXRlIGF0IGFuIGluc3RhbnRhbmVvdXMKPj4gbW9tZW50IGRvbid0IG1hdHRl
ci4KPj4KPj4gSWYgeW91J3ZlIGdvdCB0aW1lIHRvIGRvIHRoaXMsIHRoZW4gcGxlYXNlIGRvLiAg
SXQgd2lsbCBiZSBhIGRlZmluaXRlCj4+IGltcHJvdmVtZW50Lgo+IAo+IEp1c3QgdG8gYmUgYXZv
aWQgdW5uZWNlc3NhcnkgZWZmb3J0IGluIHRoZSB3cm9uZyBkaXJlY3Rpb246IEkgZG9uJ3QKPiB0
aGluayB5b3UgY2FuIGFsdGVyIHRoZSBjdXJyZW50IGludGVyZmFjZS4gWW91J2QgaGF2ZSB0byBh
ZGQgYSBuZXcKPiBvbmUsIGFuZCB3ZSBjb3VsZCB0aGVuIGRlcHJlY2F0ZSAoYnV0IG5ldmVyIGFi
YW5kb24pIHRoZSBjdXJyZW50Cj4gb25lLgoKSSB3YXMgb25seSBwbGFubmluZyB0byBzdG9yZSB0
aGUgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyByYXRoZXIgdGhhbiB0aGUgCnZpcnR1YWwgYWRkcmVz
cyBhcyB3ZSBkbyB0b2RheS4gSXMgdGhhdCBjb25zaWRlcmVkIGFzIGFuIGFsdGVyYXRpb24gb2Yg
CnRoZSBjdXJyZW50IGludGVyZmFjZT8KCkluIG90aGVyIHdvcmRzLCB0aGUgY3VycmVudCB2ZXJz
aW9uIChlLmcgc3RvcmUgdmlydHVhbCBhZGRyZXNzKSBpcyBqdXN0IApicm9rZW4gYW5kIGdvaW5n
IHRvIGJlIHdvcnN0IHdpdGggS1BUSSBrZXJuZWwuIEkgY2FuJ3Qgc2VlIGhvdyB0aGlzIApjb3Vs
ZCBldmVyIHdvcmsgcHJvcGVybHkgb24gT1Mgd2l0aCBkaWZmZXJlbnQgc2V0IG9mIHBhZ2UtdGFi
bGVzLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
