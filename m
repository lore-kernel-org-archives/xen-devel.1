From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 00/12] arm64: Mediate access to GICv3
	sysregs at EL2
Date: Mon, 12 Mar 2018 12:58:06 +0000
Message-ID: <c6c2b9cc-d6f4-215f-5d3b-2d0d4289fa40@arm.com>
References: <cover.1520857428.git.manish.jaggi@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fjgp=gc=arm.com=marc.zyngier@srs-us1.protection.inumbo.net>)
 id 1evN1n-0004Wd-6q
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 12:58:11 +0000
In-Reply-To: <cover.1520857428.git.manish.jaggi@cavium.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: mjaggi@caviumnetworks.com, julien.grall@linaro.org, sstabellini@kernel.org, jgross@suse.com, xen-devel@lists.xenproject.org
Cc: manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

TWFuaXNoLAoKT24gMTIvMDMvMTggMTI6NDIsIG1qYWdnaUBjYXZpdW1uZXR3b3Jrcy5jb20gd3Jv
dGU6Cj4gRnJvbTogTWFuaXNoIEphZ2dpIDxtYW5pc2guamFnZ2lAY2F2aXVtLmNvbT4KPiAKPiBU
aGlzIHBhdGNoc2V0IGlzIGEgWGVuIHBvcnQgb2YgTWFyYydzIHBhdGNoc2V0Lgo+IGFybTY0OiBL
Vk06IE1lZGlhdGUgYWNjZXNzIHRvIEdJQ3YzIHN5c3JlZ3MgYXQgRUwyIFsxXQo+IAo+IFRoZSBj
dXJyZW50IFJGQyBwYXRjaHNldCBpcyBhIHN1YnNldCBvZiBbMV0sIGFzIGl0IGhhbmRsZWluZyBv
bmx5IEdyb3VwMSB0cmFwcwo+IGFzIGEgUG9DLiBNb3N0IG9mIHRoZSB0cmFwIGNvZGUgaXMgYWRk
ZWQgaW4gdnN5c3JlZy5jLiBUcmFwIGhhbmRsZXIgZnVuY3Rpb24gaXMga2VwdAo+IGluZGVwZW5k
ZW50IG9mIHRoZSB1c3VhbCBndWVzdCB0cmFwIGhhbmRsaW5nIGNvZGUuIAo+IExvb2tpbmcgZm9y
IGZlZWRiYWNrIG9uIHRoaXMgYXBwcm9hY2guICAKV2h5IEdyb3VwLTEgb25seT8gQUZBSUssIEdy
b3VwLTAgaXMgYWZmZWN0ZWQgYXMgd2VsbCwgYW5kIHJlc3VsdHMgaW4gYQpEb1Mgb24gdGhlIHNl
Y3VyZSBzaWRlLiBPbmx5IGhhbmRsaW5nIEdyb3VwLTEgbWFrZXMgaXQgaGFyZCB0byBjb21wYXJl
CnRvIHRoZSByZWZlcmVuY2UgaW1wbGVtZW50YXRpb24gKHdoaWNoIGhhbmRsZXMgYm9vdGggZ3Jv
dXBzKSwgYW5kIHdpbGwKaW50cm9kdWNlIHBvaW50bGVzcyBjaHVybiBvbmNlIHlvdSBzdGFydCBh
ZGRpbmcgR3JvdXAtMCBoYW5kbGluZy4KCkFzIGl0IHN0YW5kcywgdGhpcyBzZXJpZXMgaXMgYSBi
aXQgcG9pbnRsZXNzLiBQbGVhc2UgY29uc2lkZXIgcG9zdGluZyBhCmNvbXBsZXRlIGZpeC4KClRo
YW5rcywKCglNLgotLSAKSmF6eiBpcyBub3QgZGVhZC4gSXQganVzdCBzbWVsbHMgZnVubnkuLi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
