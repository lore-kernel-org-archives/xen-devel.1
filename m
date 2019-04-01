From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 17/49] xen/sched: move some per-vcpu
 items to struct sched_item
Date: Mon, 1 Apr 2019 10:44:12 +0200
Message-ID: <398bd377-e0a1-b18a-f946-863f275d35dc@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-18-jgross@suse.com>
 <ad9f514b-7325-0759-0a80-c8195e8c0b64@citrix.com>
 <cd2b85ff-ccc7-e261-a4b5-6a5f56e98e2a@suse.com>
 <5CA1C55302000078002236D8@prv1-mh.provo.novell.com>
 <73ff246a-82bb-a4bf-cbee-6b37a9bbafa8@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hAsYF-0004ZE-En
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 08:44:19 +0000
In-Reply-To: <73ff246a-82bb-a4bf-cbee-6b37a9bbafa8@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMjAxOSAxMDozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8wNC8yMDE5
IDA5OjAxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMzAuMDMuMTkgYXQgMTA6NTksIDxq
Z3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gT24gMjkvMDMvMjAxOSAyMjozMywgQW5kcmV3IENv
b3BlciB3cm90ZToKPj4+PiBJZiBhdCBhbGwgcG9zc2libGUsIEknZCBwcmVmZXIgdG8gc2VlIGFi
b3V0IGRpc2VudGFuZ2xpbmcgdGhlIGJpdHMgd2hpY2gKPj4+PiBhY3R1YWxseSBuZWVkIGV4dGVy
bmFsIHVzZSwgYW5kIHB1dHRpbmcgdGhlbSBpbiBzY2hlZC5oLCBhbmQgbWFraW5nCj4+Pj4gc2No
ZWQtaWYuaCBwcm9wZXJseSBwcml2YXRlIHRvIHRoZSBzY2hlZHVsZXJzLiAgSSBhY3R1YWxseSBl
dmVuIHN0YXJ0ZWQKPj4+PiBhIGNsZWFudXAgc2VyaWVzIHdoaWNoIG1vdmVkIGFsbCBvZiB0aGUg
c2NoZWR1bGVyIGluZnJhc3RydWN0dXJlIGludG8KPj4+PiBjb21tb24vc2NoZWQvLCBidXQgZm91
bmQgYSBkaXNhcHBvaW50aW5nIHF1YW50aXR5IG9mIHNjaGVkLWlmLmggYmVpbmcKPj4+PiByZWZl
cmVuY2VkIGV4dGVybmFsbHkuCj4+PiBJIGNhbiBhZGQgc29tZXRoaW5nIGxpa2UgdGhhdCB0byBt
eSBzZXJpZXMgaWYgeW91IHdhbnQuIFNvOgo+Pj4KPj4+IC0gbW92aW5nIHNjaGVkdWxlLmMsIHNj
aGVkXyouYyBhbmQgY3B1cG9vbC5jIHRvIGNvbW1vbi9zY2hlZC8KPj4+IC0gbW92ZSBzdHVmZiBm
cm9tIHNjaGVkLWlmLmggdG8gc2NoZWQuaCBpZiBuZWVkZWQgb3V0c2lkZSBvZgo+Pj4gICBjb21t
b24vc2NoZWQvCj4+PiAtIG1vdmUgc2NoZWQtaWYuaCB0byBjb21tb24vc2NoZWQvCj4+IEJlZm9y
ZSBmdXJ0aGVyIGdlbmVyYWwgY29kZSByZS13b3JrIGdldHMgYWRkZWQgdG8gdGhpcyBhbHJlYWR5
Cj4+IGxvbmcgc2VyaWVzLCBtYXkgSSBhc2sgd2hhdCB0aGUgYmFja3BvcnRpbmcgaW50ZW50aW9u
cyBhcmU/Cj4gCj4gSSBkb24ndCBzZWUgdGhpcyBhcyBhIHZpYWJsZSBiYWNrcG9ydCBjYW5kaWRh
dGUuwqAgSXQgaXMgYSBjb21wbGV0ZQo+IHJld3JpdGUgb2YgdGhlIHNjaGVkdWxlciBpbnRlcmZh
Y2UsIGFsb25nIHdpdGggc29tZSBzdWJzdGFudGlhbCBjaGFuZ2VzCj4gb24gdGhlIGNvbnRleHQg
c3dpdGNoIHBhdGguCj4gCj4gUGVvcGxlIHdhbnRpbmcgdG8gdXNlIGl0IHdpbGwgYWxtb3N0IGNl
cnRhaW5seSBiZSBzYWZlciBtb3ZpbmcgdG8gWGVuIDQuMTMuCgpJIHRoaW5rIHNvLCB0b28uIE9U
T0ggZG9pbmcgdGhlIGNvcmUgc2NoZWR1bGluZyBzZXJpZXMgZmlyc3QgYW5kIHRoZQpjbGVhbnVw
IGxhdGVyIHdvbid0IGhhdmUgYW55IG5lZ2F0aXZlIGltcGFjdCBJTU8uCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
