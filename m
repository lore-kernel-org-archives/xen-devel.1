From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/2] add xl command to get hypervisor .config
Date: Fri, 18 Jan 2019 13:36:47 +0100
Message-ID: <9b9b4dfd-d6b3-a77f-d9dc-58696566209f@suse.com>
References: <20190117145722.30311-1-jgross@suse.com>
 <17598871-31d9-2d79-f5f4-2cce3d9e9f56@suse.com>
 <4fff6efe-1b46-674e-42b6-e4206453351b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I88E=P2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gkTPF-0007Rt-8b
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 12:37:53 +0000
In-Reply-To: <4fff6efe-1b46-674e-42b6-e4206453351b@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDEvMjAxOSAxMjozOCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxLzE3LzE5IDM6
MjMgUE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDE3LzAxLzIwMTkgMTU6NTcsIEp1ZXJn
ZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBBZGQgInhsIGdldC1jb25maWciIHByaW50aW5nIHRoZSAuY29u
ZmlnIHVzZWQgdG8gYnVpbGQgdGhlIGN1cnJlbnRseQo+Pj4gcnVubmluZyBoeXBlcnZpc29yLgo+
Pgo+PiBCVFc6IEknZCBsaWtlIHRvIGhhdmUgZmVlZGJhY2sgZXNwZWNpYWxseSBpZiBzb21lb25l
IHRoaW5rcyB0aGlzIHNlcmllcwo+PiBzaG91bGQgYnkgYW55IG1lYW5zIGJlIHBhcnQgb2YgNC4x
Mi4gSWYgbm90IEknbGwgc2VuZCBvdXQgVjIgd2l0aAo+PiBidW1waW5nIHRoZSBzeXNjdGwgaW50
ZXJmYWNlIHZlcnNpb24uCj4gCj4gSWYgc29tZW9uZSAqZWxzZSogd291bGQgaGF2ZSBzZW5kIHRo
aXMgaW5zdGVhZCBvZiB5b3UsIHdvdWxkIHlvdSBoYXZlCj4gY29uc2lkZXJlZCBpbmNsdWRpbmcg
aXQsIG9yIHdvdWxkIHlvdSBoYXZlIHNhaWQgdGhhdCB0aGlzIGlzIHdheSBwYXN0Cj4gdGhlICJm
ZWF0dXJlIGZyZWV6ZSIgaW4gbWlkLURlY2VtYmVyLCBpdCB3aWxsIGJlIGp1c3QgZmluZSB0byB3
YWl0IHVudGlsCj4gNC4xMz8KCkl0IHdvdWxkIG5lZWQgYSByYXRoZXIgc3Ryb25nIHJlYXNvbiB0
byBiZSBhY2NlcHRlZC4KCj4gSWYgdGhlIGFuc3dlciBpcyAieWVzIiwgdGhlbiBpdCBiZWdzIHRo
ZSBxdWVzdGlvbiB3aGF0IHRoZSBwb2ludCBvZiB0aGUKPiBmZWF0dXJlIGZyZWV6ZSBpcywgaWYg
bmV3IGZlYXR1cmVzIGNhbiBiZSBpbnRyb2R1Y2VkIGFmdGVyIHRoZSAqY29kZQo+IGZyZWV6ZSou
Cj4gCj4gSWYgdGhlIGFuc3dlciBpcyAibm8iLCB0aGVuIHlvdSdyZSBiYXNpY2FsbHkgYWJ1c2lu
ZyB5b3VyIHBvc2l0aW9uIGFzCj4gcmVsZWFzZSBtYW5hZ2VyIHRvIGdldCB5b3VyIG93biBjb2Rl
IGluLgoKVGhhdCdzIGV4YWN0bHkgd2h5IEkgYXNrZWQgZm9yIHRoYXQgZmVlZGJhY2suCgpTb21l
b25lIHNheWluZyAiSSBkb24ndCBtaW5kIHRoaXMgZ29pbmcgaW4iIGlzIG5vdCBlbm91Z2guIEkg
c2FpZDoKIi4uLiBzaG91bGQgYnkgYW55IG1lYW5zIGJlIHBhcnQgb2YgNC4xMiIuCgpTbyB0aGVy
ZSB3b3VsZCBuZWVkIHRvIGJlIGEgc3Ryb25nIHJlYXNvbiBmb3IgdGhhdCByZXF1ZXN0LCBhbmQg
dXAgdG8Kbm93IEkgaGF2ZW4ndCBzZWVuIHRoYXQgcmVhc29uLgoKPiAqRXZlcnlvbmUqIHRoaW5r
cyB0aGF0IHRoZWlyIG93biBwYXRjaCBpcyBzdXBlci1pbXBvcnRhbnQgdG8gZ2V0IGluCj4gYmVm
b3JlIHRoZSBuZXh0IHJlbGVhc2UsIGFuZCBiYXNpY2FsbHkgcGVyZmVjdCBhbmQgbm90IGdvaW5n
IHRvIGNhdXNlCj4gYW55IHJlZ3Jlc3Npb25zLiAgSXQncyB0aGUgam9iIG9mIGEgcmVsZWFzZSBt
YW5hZ2VyIHRvIGJlIHRoZSAiYmFkIGd1eSIKPiBhbmQgdGVsbCB0aGVtIG5vOyBhbmQgYSByZWxl
YXNlIG1hbmFnZXIgc2hvdWxkIGJlIHN0cmljdGVyIHdpdGgKPiB0aGVtc2VsdmVzIHRoYW4gd2l0
aCBhbnlib2R5IGVsc2UuCgpJIGNvbXBsZXRlbHkgYWdyZWUgd2l0aCB5b3UgaGVyZS4KCgpKdWVy
Z2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
