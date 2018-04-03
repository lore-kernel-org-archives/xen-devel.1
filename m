From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v19 05/11] x86/mm: add HYPERVISOR_memory_op
 to acquire guest resources
Date: Tue, 3 Apr 2018 15:05:01 +0100
Message-ID: <3694fcef-0891-8a1a-66fb-8b0d78fbba87@arm.com>
References: <20180329153616.2929-1-paul.durrant@citrix.com>
 <20180329153616.2929-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ifgk=gy=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1f3MYc-0000qN-Tk
 for xen-devel@lists.xenproject.org; Tue, 03 Apr 2018 14:05:06 +0000
In-Reply-To: <20180329153616.2929-6-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUGF1bCwKCk9uIDI5LzAzLzE4IDE2OjM2LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gQ2VydGFp
biBtZW1vcnkgcmVzb3VyY2VzIGFzc29jaWF0ZWQgd2l0aCBhIGd1ZXN0IGFyZSBub3QgbmVjZXNz
YXJpbHkKPiBwcmVzZW50IGluIHRoZSBndWVzdCBQMk0uCj4gCj4gVGhpcyBwYXRjaCBhZGRzIHRo
ZSBib2lsZXJwbGF0ZSBmb3IgbmV3IG1lbW9yeSBvcCB0byBhbGxvdyBzdWNoIGEgcmVzb3VyY2UK
PiB0byBiZSBwcml2LW1hcHBlZCBkaXJlY3RseSwgYnkgZWl0aGVyIGEgUFYgb3IgSFZNIHRvb2xz
IGRvbWFpbi4KPiAKPiBOT1RFOiBXaGlsc3QgdGhlIG5ldyBvcCBpcyBub3QgaW50cmluc2ljbHkg
c3BlY2lmaWMgdG8gdGhlIHg4NiBhcmNoaXRlY3R1cmUsCgpzL2ludHJpbnNpY2x5L2ludHJpbnNp
Y2FsbHkvIEkgdGhpbmsuCgpbLi5dCgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJt
L3AybS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wMm0uaAo+IGluZGV4IDQ1ZWYyY2Q1OGIuLjRk
MDM2YjYxMTIgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9wMm0uaAo+ICsrKyBi
L3hlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmgKPiBAQCAtMzQ0LDYgKzM0NCwxNiBAQCBzdGF0aWMg
aW5saW5lIGdmbl90IGdmbl9uZXh0X2JvdW5kYXJ5KGdmbl90IGdmbiwgdW5zaWduZWQgaW50IG9y
ZGVyKQo+ICAgICAgIHJldHVybiBnZm5fYWRkKGdmbiwgMVVMIDw8IG9yZGVyKTsKPiAgIH0KPiAg
IAo+ICtzdGF0aWMgaW5saW5lIGludCBzZXRfZm9yZWlnbl9wMm1fZW50cnkoc3RydWN0IGRvbWFp
biAqZCwgdW5zaWduZWQgbG9uZyBnZm4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtZm5fdCBtZm4pCj4gK3sKPiArICAgIC8qCj4gKyAgICAgKiBOT1RFOiBJZiB0
aGlzIGlzIGltcGxlbWVudGVkIHRoZW4gcHJvcGVyIHJlZmVyZW5jZSBjb3VudGluZyBvZgo+ICsg
ICAgICogICAgICAgZm9yZWlnbiBlbnRyaWVzIHdpbGwgbmVlZCB0byBiZSBpbXBtZW1lbnRlZC4K
CnMvaW1wbWVubWVudGVkL2ltcGxlbWVudGVkLwoKRm9yIEFSTS1iaXRzOgoKQWNrZWQtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgo+ICsgICAgICovCj4g
KyAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gK30KPiArCj4gICAjZW5kaWYgLyogX1hFTl9QMk1f
SCAqLwo+ICAgCj4gICAvKgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
