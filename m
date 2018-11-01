From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v1] x86/hvm: Clean up may_defer from hvm_*
 helpers
Date: Thu, 01 Nov 2018 08:10:00 -0600
Message-ID: <5BDB093802000078001424F5@prv1-mh.provo.novell.com>
References: <20181024091849.15572-1-aisaila@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE2B9E0@SHSMSX101.ccr.corp.intel.com>
 <73ab7fcd-59da-f160-3eda-a799349585a3@bitdefender.com>
 <5BDB069D02000078001424DF@prv1-mh.provo.novell.com>
 <33ee939f-4aa5-2791-267d-5ddc6756ddaa@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mjq2=nm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gIDfh-0000C2-9M
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 14:10:05 +0000
In-Reply-To: <33ee939f-4aa5-2791-267d-5ddc6756ddaa@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: rcojocaru@bitdefender.com
Cc: kevin.tian@intel.com, tamas@tklengyel.com, wei.liu2@citrix.com, jun.nakajima@intel.com, andrew.cooper3@citrix.com, paul.durrant@citrix.com, suravee.suthikulpanit@amd.com, aisaila@bitdefender.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gMTEvMDEvMTgg
MzowNCBQTSA+Pj4KPk9uIDExLzEvMTggMzo1OCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+
IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gMTEvMDEvMTggMTE6
MzEgQU0gPj4+Cj4+PiBPbiAxMC8zMC8xOCA4OjE5IEFNLCBUaWFuLCBLZXZpbiB3cm90ZToKPj4+
Pj4gRnJvbTogQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgW21haWx0bzphaXNhaWxhQGJpdGRlZmVu
ZGVyLmNvbV0KPj4+Pj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDI0LCAyMDE4IDU6MTkgUE0K
Pj4+Pj4KPj4+Pj4gVGhlIG1heV9kZWZlciB2YXIgd2FzIGxlZnQgd2l0aCB0aGUgb2xkZXIgYm9v
bF90IHR5cGUuIFRoaXMgcGF0Y2gKPj4+Pj4gY2hhbmdlcyB0aGUgdHlwZSB0byBib29sLgo+Pj4+
Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVu
ZGVyLmNvbT4KPj4+Pgo+Pj4+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4KPj4+Cj4+PiBJIHRoaW5rIHRoaXMgdHJpdmlhbCBwYXRjaCBoYXMgYWxsIHRoZSBh
Y2tzIGl0IG5lZWRzIHRvIGdvIGluPwo+PiAKPj4gSXQgYmVpbmcgdHJpdmlhbCwgSSB3YXMgY29u
c2lkZXJpbmcgdG8gaWdub3JlIHRoZSBuZWVkIGZvciBQYXVsJ3MgYWNrIGluIHRoaXMKPj4gY2Fz
ZSAod2hpY2ggaWlyYyBoYXMgbm90IGJlZW4gZ2l2ZW4gc28gZmFyKSwgYnV0IHNpbmNlIHlvdSBh
c2sgLSBkaWQgeW91Cj4+IGNoZWNrIGJlZm9yZSBhc2tpbmc/IEkgY2FuIG9ubHkgcmUtaXRlcmF0
ZSB0aGF0IGdlbmVyYWxseSBpdCBpcyB0aGUgc3VibWl0dGVyCj4+IHRvIGNoYXNlIGFja3MsIG5v
dCBhbnkgb2YgdGhlIHBvdGVudGlhbCBjb21taXR0ZXJzLgo+Cj5Tb3JyeSwgSSB3YXMgbm90IGF3
YXJlIFBhdWwncyBhY2sgd2FzIHN0aWxsIG5lZWRlZC4gQnkgY2hlY2ssIGRvIHlvdQo+bWVhbiB0
YWtlIHRoZSByZWNpcGllbnRzIGxpc3QgKHRoYXQgSSBoYXZlIGZyb20gZ2V0X21haW50YWluZXIu
cGwpIGFuZAo+bWF0Y2ggaXQgdG8gdGhlIE1BSU5UQUlORVJTIGZpbGUgdG8gc2VlIGlmIHRoZXJl
J3Mgbm8gYWNrIGZyb20gYW55Cj5wYXJ0aWN1bGFyIHN1YmNhdGVnb3J5PwoKIkNoZWNrIiBtZWFu
cyBieSB3aGF0ZXZlciBhcHByb2FjaCB5b3UgcHJlZmVyLCBidXQgeWVzLCB1bHRpbWF0ZWx5IGl0
CndvdWxkIGJlIHRvIGNvbXBhcmUgYWdhaW5zdCB3aGF0IC4vTUFJTlRBSU5FUlMgaGFzIHRvIHNh
eSBmb3IgZXZlcnkKb25lIG9mIHRoZSBmaWxlcyBjaGFuZ2VkIGluIGEgcGF0Y2guIFlvdSdkIHRo
ZW4gbm90aWNlIHRoYXQgYSBiYXNpYyB4ODYKYWNrIGlzIG1pc3NpbmcgdG9vLCBidXQgSSdtIGNl
cnRhaW5seSBpbiB0aGUgcG9zaXRpb24gdG8gZGVhbCB3aXRoIHRoYXQgaWYKZXZlcnl0aGluZyBl
bHNlIHdhcyByZWFkeSBmb3IgY29tbWl0dGluZy4KCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
