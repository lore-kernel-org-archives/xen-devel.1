From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 0.5/5] arm/alternatives: Drop the
 !HAS_ALTERNATIVE infrastructure
Date: Wed, 31 Jan 2018 14:57:37 -0500
Message-ID: <20180131195737.GB22045@char.us.oracle.com>
References: <dde52f58-12cc-5d4c-e8bb-44ae68585d7e@arm.com>
 <1517310996-14249-1-git-send-email-andrew.cooper3@citrix.com>
 <aca49986-d840-51de-d128-e907ed2a6fe2@arm.com>
 <7f32d836-32b9-0641-ce36-aba53653dc40@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <7f32d836-32b9-0641-ce36-aba53653dc40@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMzAsIDIwMTggYXQgMTE6MzE6MjdBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAzMC8wMS8xOCAxMToyOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gSGkgQW5k
cmV3LAo+ID4KPiA+IFRoYW5rIHlvdSBmb3IgZG9pbmcgdGhlIGNsZWFuLXVwLgo+ID4KPiA+IE9u
IDMwLzAxLzE4IDExOjE2LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4+IEFSTSBub3cgdW5jb25k
aXRpb25hbGx5IHNlbGVjdHMgSEFTX0FMVEVSTkFUSVZFLCB3aGljaCBoYXMgY2F1c2VkIHRoZQo+
ID4+ICFIQVNfQUxURVJOQVRJVkUgY29kZSBpbiBpbmNsdWRlL2FzbS1hcm0vYWx0ZXJuYXRpdmUu
aCB0byBiaXRyb3QgdG8KPiA+PiB0aGUgcG9pbnQKPiA+PiBvZiBmYWlsaW5nIHRvIGNvbXBpbGUu
Cj4gPj4KPiA+PiBFeHBhbmQgYWxsIHRoZSBDT05GSUdfSEFTX0FMVEVSTkFUSVZFIHJlZmVyZW5j
ZXMgaW4gQVJNIGNvZGUuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4+IC0tLQo+ID4+IENDOiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gPj4gQ0M6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+Cj4gPj4gQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFk
LndpbGtAb3JhY2xlLmNvbT4KPiA+Pgo+ID4+IE4uQi4gT25seSBjb21waWxlIHRlc3RlZAo+ID4+
IC0tLQo+ID4+IMKgIHhlbi9hcmNoL2FybS94ZW4ubGRzLlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMiAtLQo+ID4+IMKgIHhlbi9pbmNsdWRlL2FzbS1hcm0vYWx0
ZXJuYXRpdmUuaMKgwqDCoMKgwqDCoMKgwqAgfCAxNSAtLS0tLS0tLS0tLS0tLS0KPiA+PiDCoCB4
ZW4vdGVzdC9saXZlcGF0Y2gveGVuX2hlbGxvX3dvcmxkX2Z1bmMuYyB8wqAgMiArLQo+ID4KPiA+
IFlvdSBmb3Jnb3Qgb24gaW4gaW5jbHVkZS9hc20tYXJtL2NwdWVycmF0YS5oIDopLgo+IAo+IE9v
cHMgLSBzbyBJIGRpZC7CoCBGb2xkZWQgdGhpcyBpbmNyZW1lbnRhbCBkaWZmLgpSZXZpZXdlZC1i
eTogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
