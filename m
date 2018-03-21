From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v1 00/15] arm64: Mediate access to GICv3
 sysregs at EL2
Date: Wed, 21 Mar 2018 05:02:25 +0000
Message-ID: <f8a425e2-413f-508b-db36-be589b603ddb@arm.com>
References: <cover.1521200294.git.manish.jaggi@cavium.com>
 <c678e388-6d66-a744-d4f6-7cfdc62ff374@arm.com>
 <fa9fcde0-ac40-a950-920e-455815b924c7@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kbl4=gl=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eyVtS-0001xg-Im
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 05:02:34 +0000
In-Reply-To: <fa9fcde0-ac40-a950-920e-455815b924c7@caviumnetworks.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <mjaggi@caviumnetworks.com>, Manish Jaggi <manish.jaggi@cavium.com>, xen-devel@lists.xenproject.org, sstabellini@kernel.org, marc.zyngier@arm.com, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8yMS8yMDE4IDA0OjU4IEFNLCBNYW5pc2ggSmFnZ2kgd3JvdGU6Cj4gCj4gSGkgSnVs
aWVuLAo+IAo+IE9uIDAzLzIwLzIwMTggMDE6MTYgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4K
Pj4KPj4gT24gMDMvMTYvMjAxOCAxMTo1OCBBTSwgTWFuaXNoIEphZ2dpIHdyb3RlOgo+Pj4gVGhp
cyBwYXRjaHNldCBpcyBhIFhlbiBwb3J0IG9mIE1hcmMncyBwYXRjaHNldC4KPj4+IGFybTY0OiBL
Vk06IE1lZGlhdGUgYWNjZXNzIHRvIEdJQ3YzIHN5c3JlZ3MgYXQgRUwyIFsxXQo+Pj4KPj4+IFRo
ZSBjdXJyZW50IFJGQyBwYXRjaHNldCBpcyBhIHN1YnNldCBvZiBbMV0sIGFzIGl0IGhhbmRsZWlu
ZyBvbmx5IAo+Pj4gR3JvdXAxIHRyYXBzCj4+PiBhcyBhIFBvQy4gTW9zdCBvZiB0aGUgdHJhcCBj
b2RlIGlzIGFkZGVkIGluIHZzeXNyZWcuYy4gVHJhcCBoYW5kbGVyIAo+Pj4gZnVuY3Rpb24gaXMg
a2VwdAo+Pj4gaW5kZXBlbmRlbnQgb2YgdGhlIHVzdWFsIGd1ZXN0IHRyYXAgaGFuZGxpbmcgY29k
ZS4KPj4+IExvb2tpbmcgZm9yIGZlZWRiYWNrIG9uIHRoaXMgYXBwcm9hY2guCj4+Cj4+IFRoaXMg
Y292ZXIgbGV0dGVyIGRvZXMgbm90IHNlZW0gdG8gbWF0Y2ggdGhlIHNlcmllcy4gUGxlYXNlIHVw
ZGF0ZSBpdCAKPj4gb24gZXZlcnkgdGltZSB5b3Ugc2VuZCBhIHNlcmllcy4KPiAlcy92c3lzcmVn
LmMvdmdpYy12My1zci4uCgoiVGhlIGN1cnJlbnQgUkZDIHBhdGNoc2V0IGlzIGEgc3Vic2V0IG9m
IFsxXSwgYXMgaXQgaGFuZGxpbmcgb25seSBHcm91cCAKMSB0cmFwcyBhcyBhIFBvQyIuIFRoaXMg
aXMgY2xlYXJseSBub3QgYSBQb0MgYW55bW9yZSBub3Igb25seSBoYW5kbGluZyAKR3JvdXAgMS4K
Cj4gCj4gQ291bGQgeW91IHBsZWFzZSByZXZpZXcgdGhlIG90aGVyIHBhdGNoZXMgaW4gdGhlIHNl
cmllcywgc28gdGhhdCBJIGNhbiAKPiBzZW5kIHYyLgoKSXQgaXMgaW4gbXkgcXVldWUgb2YgcGF0
Y2ggdG8gcmV2aWV3LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
