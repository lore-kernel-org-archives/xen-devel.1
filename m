From: Manish Jaggi <mjaggi@caviumnetworks.com>
Subject: Re: [PATCH v1 00/15] arm64: Mediate access to GICv3
 sysregs at EL2
Date: Wed, 21 Mar 2018 10:28:58 +0530
Message-ID: <fa9fcde0-ac40-a950-920e-455815b924c7@caviumnetworks.com>
References: <cover.1521200294.git.manish.jaggi@cavium.com>
 <c678e388-6d66-a744-d4f6-7cfdc62ff374@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=exj2=gl=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1eyVqD-00010R-Vp
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 04:59:14 +0000
In-Reply-To: <c678e388-6d66-a744-d4f6-7cfdc62ff374@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Manish Jaggi <manish.jaggi@cavium.com>, xen-devel@lists.xenproject.org, sstabellini@kernel.org, marc.zyngier@arm.com, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

CkhpIEp1bGllbiwKCk9uIDAzLzIwLzIwMTggMDE6MTYgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToK
Pgo+Cj4gT24gMDMvMTYvMjAxOCAxMTo1OCBBTSwgTWFuaXNoIEphZ2dpIHdyb3RlOgo+PiBUaGlz
IHBhdGNoc2V0IGlzIGEgWGVuIHBvcnQgb2YgTWFyYydzIHBhdGNoc2V0Lgo+PiBhcm02NDogS1ZN
OiBNZWRpYXRlIGFjY2VzcyB0byBHSUN2MyBzeXNyZWdzIGF0IEVMMiBbMV0KPj4KPj4gVGhlIGN1
cnJlbnQgUkZDIHBhdGNoc2V0IGlzIGEgc3Vic2V0IG9mIFsxXSwgYXMgaXQgaGFuZGxlaW5nIG9u
bHkgCj4+IEdyb3VwMSB0cmFwcwo+PiBhcyBhIFBvQy4gTW9zdCBvZiB0aGUgdHJhcCBjb2RlIGlz
IGFkZGVkIGluIHZzeXNyZWcuYy4gVHJhcCBoYW5kbGVyIAo+PiBmdW5jdGlvbiBpcyBrZXB0Cj4+
IGluZGVwZW5kZW50IG9mIHRoZSB1c3VhbCBndWVzdCB0cmFwIGhhbmRsaW5nIGNvZGUuCj4+IExv
b2tpbmcgZm9yIGZlZWRiYWNrIG9uIHRoaXMgYXBwcm9hY2guCj4KPiBUaGlzIGNvdmVyIGxldHRl
ciBkb2VzIG5vdCBzZWVtIHRvIG1hdGNoIHRoZSBzZXJpZXMuIFBsZWFzZSB1cGRhdGUgaXQgCj4g
b24gZXZlcnkgdGltZSB5b3Ugc2VuZCBhIHNlcmllcy4KJXMvdnN5c3JlZy5jL3ZnaWMtdjMtc3Iu
LgoKQ291bGQgeW91IHBsZWFzZSByZXZpZXcgdGhlIG90aGVyIHBhdGNoZXMgaW4gdGhlIHNlcmll
cywgc28gdGhhdCBJIGNhbiAKc2VuZCB2Mi4KPgo+IENoZWVycywKPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
