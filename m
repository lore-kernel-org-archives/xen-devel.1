From: Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Mon, 29 Oct 2018 10:06:10 +0000
Message-ID: <2090f5b4-22ff-38bc-3d47-6dbb6d7fccfb@epam.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <20181023181709.11883-2-julien.grall@arm.com>
 <6098937f-98de-bff9-6c48-5575a45875e0@epam.com>
 <57ee191b-be21-701e-ef19-4ed4df1cf289@arm.com>
 <77f72cc9-6548-afd9-3766-23326b3551d9@epam.com>
 <6acf65ef-4302-c403-32ba-1d88ab954265@epam.com>
 <22f7ebc8-c74b-0d8e-4847-9d3df9bcf5db@arm.com>
 <3622e468-8f44-1e31-138f-db58ca3835ff@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3622e468-8f44-1e31-138f-db58ca3835ff@epam.com>
Content-Language: en-US
Content-ID: <20D4DFAF355D3E4EAA330F16755CAF06@EPAM.onmicrosoft.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "andre.przywara@arm.com" <andre.przywara@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKClNvcnJ5IGZvciB0aGUgcHJldmlvdXMgZW1haWwgc2VudCBhcyBodG1s
LgoKCk9uIDI3LjEwLjE4IDE1OjE0LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPj4+IGluZGV4
IGY2ZjZkZTMuLjk4NTE5MmIgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+
Pj4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPj4+IEBAIC0yMDk1LDYgKzIwOTUsNyBAQCBz
dGF0aWMgdm9pZCBlbnRlcl9oeXBlcnZpc29yX2hlYWQoc3RydWN0Cj4+PiBjcHVfdXNlcl9yZWdz
ICpyZWdzKQo+Pj4gwqAgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIGN1cnJlbnQtPmFyY2guaGNyX2Vs
MiAmIEhDUl9WQSApCj4+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3VycmVudC0+YXJj
aC5oY3JfZWwyID0gUkVBRF9TWVNSRUcoSENSX0VMMik7Cj4+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKg
IGdpY19zdG9yZV9scnMoKTsKPj4KPj4gZ2ljX2NsZWFyX2xycyguLi4pIG1heSByZXdyaXRlIHRo
ZSBMUnMuIFRvIGNvbmZpcm0gdGhpcyBzdGFsbCBMUnMgYXJlIAo+PiBub3QgZHVlIGJ5IHRoaXMg
ZnVuY3Rpb24sIGNhbiB5b3UgbW92ZSB0aGF0IGFmdGVyIGdpY19jbGVhcl9scnMoKT8KPiBSaWdo
dCB5b3UgYXJlLCBnaWNfY2xlYXJfbHJzKCksIGluIDQuMTAgY29kZWJhc2UsIHJld3JpdGVzIExS
cy4gQnV0IGl0IAo+IGRvZXMgbm90IGNoYW5nZSBQRU5ESU5HIHRvIElOVkFMSUQgdW5kZXIgbm8g
Y2lyY3Vtc3RhbmNlcyBmcm9tIG9uZSAKPiBoYW5kLiBGcm9tIGFub3RoZXIgaGFuZCwgYWxsIGNo
YW5nZXMgdG8gTFJzIGFyZSBtYWRlIHRocm91Z2ggZ2ljIAo+IHNwZWNpZmljIG9wZXJhdGlvbnMg
Z2ljX2h3X29wcy0+Li4uIHdoaWNoIGFyZSB0cmFja2VkIGJ5IG1lLiBZb3UgY2FuIAo+IHNlZSwg
aW4gdGhlIGNvZGUgYWJvdmUsIHRoYXQgSSBjb3B5IGFsbCB1cGRhdGVzIHRvIHRoZSBwaHlzaWNh
bCBMUiAKPiBpc3N1ZWQgYnkgaHlwZXJ2aXNvciBpbnRvIHRoZSBzdG9yZWQgTFJzLiBTbyBpdCBu
b3QgdGhlIGNhc2UuIEJ1dCBJJ2xsIAo+IGNoZWNrIG9uIE1vbmRheS4KCkluIDQuMTItdW5zdGFi
bGUgY29kZSBiYXNlIEkgbW92ZWQgZ2ljX3N0b3JlX2xycygpIGFmdGVyIHZnaWNfc3luY19mcm9t
X2xycygpwqAgYW5kIHNlZSBzaWduaWZpY2FudCBjaGFuZ2VzLsKgIE5vdyBzdGFsZSBsaW5lcyBh
cmUgcHJpbnRlZCBhdCB2ZXJ5IGhpZ2ggcmF0ZSwgYW5kIGl0IGlzIHRoZSBwcm9wZXIgYmVoYXZp
b3IuIEJlY2F1c2UgdGhlIGNvcnJlc3BvbmRlbnQgY2hlY2sgKHBlcmZvcm1lZCB3aGVuIHZnaWNf
c3luY19mcm9tX2xycygpIHJlYWRzIExScykgZGV0ZWN0cyB0aGF0IFZNIHByb2Nlc3NlcyBpbnRl
cnJ1cHRzIGFuZCBMUiB2YWx1ZXMgYXJlIGNoYW5nZWQgY29tcGFyaW5nIHRvIHRob3NlIHNldCBi
eSBoeXBlcnZpc29yIGxhdGVseS4KClNvIG5vdyBpdCBpcyB0aGUgcXVlc3Rpb24sIHdoeSBjb3Vs
ZCBJIGRldGVjdCBzcHVyaW91cyBjaGFuZ2VzIGluIExScyB3aXRob3V0IGV4aXRpbmcgdG8gVk0/
CgoKLS0gCgoqQW5kcmlpIEFuaXNvdioKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
