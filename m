From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v1 00/15] arm64: Mediate access to GICv3
 sysregs at EL2
Date: Wed, 21 Mar 2018 08:45:05 +0000
Message-ID: <99bcf77a-7603-119b-0711-900f38f8ca55@arm.com>
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
 id 1eyZMt-0002af-NW
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 08:45:11 +0000
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
LmMvdmdpYy12My1zci4uCj4gCj4gQ291bGQgeW91IHBsZWFzZSByZXZpZXcgdGhlIG90aGVyIHBh
dGNoZXMgaW4gdGhlIHNlcmllcywgc28gdGhhdCBJIGNhbiAKPiBzZW5kIHYyLgoKSGVyZSB0aGUg
bWFqb3IgY29tbWVudHMgZm9yIHRoZSBzZXJpZXMgKGluY2x1ZGVkIHBhdGNoIG5vdCByZXZpZXdl
ZCk6CgkxKSBZb3Ugc2VlbSB0byBtaXNzIHNvbWUgcGF0Y2hlcyBmcm9tIExpbnV4LiBJIHdvdWxk
IGxpa2UgdG8gdW5kZXJzdGFuZCAKd2h5IHRoZXkgYXJlIG5vdCB0aGVyZS4KCTIpIFN0cmFuZ2Vs
eSBzb21lIGNvbW1pdHMgZG9lcyBub3QgbWF0Y2ggdGhlIExpbnV4IG9uZSBlaXRoZXIgaW4gb3Jk
ZXIgCmFuZCBjb250ZW50IChJIGFtIG5vdCBzcGVha2luZyBhYm91dCB0aGUgY2hhbmdlcyByZXF1
aXJlZCBieSBYZW4pLiBGb3IgCmluc3RhbmNlIHRoaXMgaXMgdGhlIGNhc2Ugb2YgcGF0Y2ggIzE0
ICJhcm02NDogdmdpYy12MzogQWRkIApJQ1ZfQVAoMC8xKVJuX0VMMSBoYW5kbGVyIi4gSWYgeW91
IHBvcnQgY29tbWl0IGZyb20gTGludXgsIHRoZW4geW91IApzaG91bGQgZm9sbG93IHRoZSBzYW1l
LiBUaGlzIGhlbHAgYSBsb3QgZm9yIHJldmlldy4KCTMpCgpDb2RlIG9yZ2FuaXphdGlvbjoKCTEp
IFBsZWFzZSBkcm9wIF9fIGZyb20gYWxsIGZ1bmN0aW9ucwoJMikgQWxsIGZ1bmN0aW9ucyBub3Qg
ZXhwb3J0ZWQgKnNob3VsZCogYmUgc3RhdGljLiBBdCB0aGUgc2FtZSB0aW1lIHlvdSAKbmVlZCB0
byBtYWtlIHN1cmUgdGhhdCB0aGUgc2VyaWVzIGFyZSBiaXNlY3RhYmxlLiBTbyB5b3UgcHJvYmFi
bHkgaG9vayAKdGhlIGZpbGUgaW4gdGhlIGJ1aWxkIHN5c3RlbSBhdCB0aGUgZW5kIHJhdGhlciB0
aGFuIGluICMzLgoKQ2hlZXJzLAoKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
