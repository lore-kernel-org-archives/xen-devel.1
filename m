From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.12 v2 8/8] xen: Switch parameter in
 get_page_from_gfn to use typesafe gfn
Date: Fri, 21 Dec 2018 16:36:53 +0000
Message-ID: <fe2abf82-049d-b66e-3fad-d2eecd932e30@citrix.com>
References: <20181220192338.17526-1-julien.grall@arm.com>
 <20181220192338.17526-9-julien.grall@arm.com>
 <65c542ff-fda4-df0c-5e98-023bd3963008@citrix.com>
 <e89f17e5-4a28-7e88-5d99-f6135aa92a8d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J7vb=O6=citrix.com=prvs=88664d7ea=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gaNnG-000866-KR
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 16:36:58 +0000
In-Reply-To: <e89f17e5-4a28-7e88-5d99-f6135aa92a8d@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMTIvMjAxOCAxNjoyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCj4+
PiBpbmRleCAzMzA0OTIxOTkxLi4xZWZiYzA3MWM1IDEwMDY0NAo+Pj4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9wMm0uaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAo+Pj4g
QEAgLTQ5MSwxOCArNDkxLDIxIEBAIHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFnZV9mcm9t
X2dmbihzdHJ1Y3QKPj4+IHAybV9kb21haW4gKnAybSwgZ2ZuX3QgZ2ZuLAo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwMm1fcXVlcnlfdCBxKTsKPj4+IMKgIMKgIHN0YXRpYyBpbmxpbmUg
c3RydWN0IHBhZ2VfaW5mbyAqZ2V0X3BhZ2VfZnJvbV9nZm4oCj4+PiAtwqDCoMKgIHN0cnVjdCBk
b21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuLCBwMm1fdHlwZV90ICp0LCBwMm1fcXVlcnlfdCBx
KQo+Pj4gK8KgwqDCoCBzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIHAybV90eXBlX3QgKnQs
IHAybV9xdWVyeV90IHEpCj4+PiDCoCB7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBwYWdlX2luZm8g
KnBhZ2U7Cj4+PiArwqDCoMKgIG1mbl90IG1mbjsKPj4+IMKgIMKgwqDCoMKgwqAgaWYgKCBwYWdp
bmdfbW9kZV90cmFuc2xhdGUoZCkgKQo+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBwMm1fZ2V0
X3BhZ2VfZnJvbV9nZm4ocDJtX2dldF9ob3N0cDJtKGQpLCBfZ2ZuKGdmbiksCj4+PiB0LCBOVUxM
LCBxKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcDJtX2dldF9wYWdlX2Zyb21fZ2ZuKHAy
bV9nZXRfaG9zdHAybShkKSwgZ2ZuLCB0LAo+Pj4gTlVMTCwgcSk7Cj4+PiDCoCDCoMKgwqDCoMKg
IC8qIE5vbi10cmFuc2xhdGVkIGd1ZXN0cyBzZWUgMS0xIFJBTSAvIE1NSU8gbWFwcGluZ3MKPj4+
IGV2ZXJ5d2hlcmUgKi8KPj4+IMKgwqDCoMKgwqAgaWYgKCB0ICkKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCAqdCA9IGxpa2VseShkICE9IGRvbV9pbykgPyBwMm1fcmFtX3J3IDogcDJtX21taW9fZGly
ZWN0Owo+Pj4gLcKgwqDCoCBwYWdlID0gbWZuX3RvX3BhZ2UoX21mbihnZm4pKTsKPj4+IC3CoMKg
wqAgcmV0dXJuIG1mbl92YWxpZChfbWZuKGdmbikpICYmIGdldF9wYWdlKHBhZ2UsIGQpID8gcGFn
ZSA6IE5VTEw7Cj4+PiArCj4+PiArwqDCoMKgIG1mbiA9IF9tZm4oZ2ZuX3goZ2ZuKSk7Cj4+PiAr
wqDCoMKgIHBhZ2UgPSBtZm5fdG9fcGFnZShtZm4pOwo+Pj4gK8KgwqDCoCByZXR1cm4gbWZuX3Zh
bGlkKG1mbikgJiYgZ2V0X3BhZ2UocGFnZSwgZCkgPyBwYWdlIDogTlVMTDsKPj4KPj4gVGhpcyB1
bmZvcnR1bmF0ZWx5IHByb3BhZ2F0ZXMgc29tZSBiYWQgYmVoYXZpb3VyLCBiZWNhdXNlIGl0IGlz
IG5vdCBzYWZlCj4+IHRvIHVzZSBtZm5fdG9fcGFnZShtZm4pOyBiZWZvcmUgbWZuX3ZhbGlkKG1m
bikgc3VjY2VlZHMuwqAgKEluIHByYWN0aWNlCj4+IGl0IHdvcmtzIGJlY2F1c2UgbWZuX3RvX3Bh
Z2UoKSBpcyBqdXN0IHBvaW50ZXIgYXJpdGhtZXRpYy4pCj4+Cj4+IFBsZWFzIGNhbiB5b3UgZXhw
cmVzcyB0aGlzIGFzOgo+Pgo+PiByZXR1cm4gKG1mbl92YWxpZChtZm4pICYmCj4+IMKgwqDCoMKg
wqDCoMKgwqAgKHBhZ2UgPSBtZm5fdG9fcGFnZShtZm4pLCBnZXRfcGFnZShwYWdlLCBkKSkpID8g
cGFnZSA6IE5VTEw7Cj4+Cj4+IHdoaWNoIGF0IGxlYXN0IGdldHMgdGhlIG9yZGVyIG9mIG9wZXJh
dGlvbnMgaW4gdGhlIGNvcnJlY3Qgb3JkZXIgZnJvbQo+PiBDJ3MgcG9pbnQgb2Ygdmlldy4KPj4K
Pj4gQWx0ZXJuYXRpdmVseSwgYW5kIHBlcmhhcHMgZWFzaWVyIHRvIGZvbGxvdzoKPj4KPj4gaWYg
KCAhbWZuX3ZhbGlkKG1mbikgKQo+PiDCoMKgwqDCoCByZXR1cm4gTlVMTDsKPj4KPj4gcGFnZSA9
IG1mbl90b19wYWdlKG1mbik7Cj4+Cj4+IHJldHVybiBnZXRfcGFnZShwYWdlLCBkKSA/IHBhZ2Ug
OiBOVUxMOwo+Cj4gSSBhbSBoYXBweSB0byBmaXggdGhhdC4gSG93ZXZlciwgc2hvdWxkbid0IHRo
aXMgYmUgaGFuZGxlZCBpbiBhCj4gc2VwYXJhdGUgcGF0Y2g/IEFmdGVyIGFsbCwgdGhlIGNvZGUg
aXMgbm90IHdvcnN0IHRoYW4gaXQgY3VycmVudGx5IGlzLgoKSSBkb24ndCB0aGluayBpdHMgd29y
dGh5IG9mIGEgc2VwYXJhdGUgcGF0Y2guwqAgWW91J3JlIHRvdWNoaW5nIHRoZSBjb2RlCmFueXdh
eSwgc28gbWlnaHQgYXMgd2VsbCBkbyBpdCBhbGwgaW4gb25lIGdvLgoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
