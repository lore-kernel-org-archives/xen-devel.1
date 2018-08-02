From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v4 01/15] re-work commit 3e06b989 "IOMMU:
 make page table population preemptible"...
Date: Thu, 2 Aug 2018 08:02:30 +0000
Message-ID: <74e395deae9549c3a05fccb1241c35ae@AMSPEX02CL03.citrite.net>
References: <20180801134028.1654-1-paul.durrant@citrix.com>
 <20180801134028.1654-2-paul.durrant@citrix.com>
 <5B62B09A02000078001DA278@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pz2g=kr=citrix.com=prvs=7450d0d22=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fl8ZF-0002z4-1s
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 08:02:41 +0000
In-Reply-To: <5B62B09A02000078001DA278@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDIgQXVndXN0IDIwMTggMDg6MjAKPiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBDb29wZXIKPiA8QW5kcmV3LkNvb3BlcjNAY2l0
cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyBHZW9yZ2UKPiBEdW5sYXAg
PEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRy
aXguY29tPjsKPiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4
ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IEtvbnJhZCBSemVz
enV0ZWsgV2lsawo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgVGltIChYZW4ub3JnKSA8dGlt
QHhlbi5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwMS8xNV0gcmUtd29yayBjb21taXQg
M2UwNmI5ODkgIklPTU1VOiBtYWtlCj4gcGFnZSB0YWJsZSBwb3B1bGF0aW9uIHByZWVtcHRpYmxl
Ii4uLgo+IAo+ID4+PiBPbiAwMS4wOC4xOCBhdCAxNTo0MCwgPHBhdWwuZHVycmFudEBjaXRyaXgu
Y29tPiB3cm90ZToKPiA+IC4uLnRvIHNpbXBsaWZ5IHRoZSBpbXBsZW1lbnRhdGlvbiBhbmQgdHVy
biBuZWVkX2lvbW11IGJhY2sgaW50byBhCj4gYm9vbGVhbi4KPiA+Cj4gPiBBcyBub3RlZCBpbiBb
MV0gdGhlIHRyaS1zdGF0ZSBuYXR1cmUgb2YgbmVlZF9pb21tdSBhZnRlciBjb21taXQgM2UwNmI5
ODkKPiBpcwo+ID4gY29uZnVzaW5nLCBhcyBpcyB0aGUgaW1wbGVtZW50YXRpb24gb2YgcHJlLWVt
cHRpb24gdXNpbmcgcmVsbWVtX2xpc3QuCj4gPgo+ID4gVGhpcyBwYXRjaCBpbnN0ZWFkIHVzZXMg
YSBzaW1wbGUgY291bnQgb2YgcGFnZXMgYWxyZWFkeSBwb3B1bGF0ZWQgc3RvcmVkIGluCj4gPiB0
aGUgeDg2IHZhcmlhbnQgb2Ygc3RydWN0IGFyY2hfaW9tbXUgYW5kIHNraXBzIG92ZXIgdGhhdCBu
dW1iZXIgb2YgcGFnZXMKPiA+IGlmIGFyY2hfaW9tbXVfcG9wdWxhdGVfcGFnZV90YWJsZSgpIGlz
IHJlLWludm9rZWQgYWZ0ZXIgcHJlLWVtcHRpb24uCj4gCj4gV2VsbCwgeWVzLCBJIHdvdWxkIGhh
dmUgdXNlZCB0aGF0IG1vZGVsIGluIHNhaWQgY29tbWl0IGlmIGl0IHdhcyByZWxpYWJsZSwKPiBi
dXQgaXQgaXNuJ3Q6IFdoYXQgaWYgdGhlIGxpc3Qgb2YgcGFnZXMgY2hhbmdlZCBiZXR3ZWVuIHR3
byAocmUtKWludm9jYXRpb25zPwoKSXMgdGhhdCByZWFsbHkgZ29pbmcgdG8gaGFwcGVuPyBUaGlz
IGlzIHRoZSByZXN1bHQgb2YgYSBkb21jdGwsIHdoaWNoIGlzIGEgdG9vbHMtb25seSBoeXBlcmNh
bGwgcmlnaHQ/Cgo+IEZ1cnRoZXJtb3JlLCB3aXRoIGh1Z2UgZW5vdWdoIGEgZ3Vlc3QgZXZlbiB0
aGUgc2tpcHBpbmcgb2YgdGhlIGFscmVhZHkKPiBwcm9jZXNzZWQgc2V2ZXJhbCBtaWxsaW9uIHBh
Z2VzIG1heSBleGhhdXN0IHRoZSB0aW1lIGFjY2VwdGFibGUgYmV0d2Vlbgo+IHByZWVtcHRpb24g
cG9pbnRzLgoKT2ssIEknbGwga2VlcCBhIHBvaW50ZXIgaW50byB0aGUgcGFnZSBsaXN0IGluc3Rl
YWQuCgogIFBhdWwKCj4gCj4gSmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
