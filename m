From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Tue, 13 Nov 2018 08:32:27 +0000
Message-ID: <036e4740-ae1a-e699-719f-966db8876089@citrix.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <1c5ca0ad-ee3d-2936-b57d-0ded1415176d@arm.com>
 <CAKPH-Nge2EMDLihthEVGAO0gY8EACksuN6ch1ZJV6+t1JeK=JQ@mail.gmail.com>
 <d24be446-af5a-7881-2db4-b25afac3e1f4@citrix.com>
 <d4dc12d3-2382-44d3-d078-faeb7c195eb4@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fay+=ny=citrix.com=prvs=848d83c09=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gMU7d-0000Wt-49
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 08:32:33 +0000
In-Reply-To: <d4dc12d3-2382-44d3-d078-faeb7c195eb4@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTEvMjAxOCAxOTo1NiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJldywKPgo+
IE9uIDExLzEyLzE4IDQ6NDEgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDEyLzExLzE4
IDE2OjM1LCBNaXJlbGEgU2ltb25vdmljIHdyb3RlOgo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4+Pj4+IGluZGV4IGU1OTRi
NDhkODEuLjdmODEwNTQ2NWMgMTAwNjQ0Cj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4u
Ywo+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMKPj4+Pj4gQEAgLTk3LDYgKzk3LDEx
IEBAIHN0YXRpYyB2b2lkIGN0eHRfc3dpdGNoX2Zyb20oc3RydWN0IHZjcHUgKnApCj4+Pj4+IMKg
wqDCoMKgwqDCoCBpZiAoIGlzX2lkbGVfdmNwdShwKSApCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybjsKPj4+Pj4KPj4+Pj4gK8KgwqDCoCAvKiBWQ1BVJ3MgY29udGV4dCBzaG91bGQg
bm90IGJlIHNhdmVkIGlmIGl0cyBkb21haW4gaXMKPj4+Pj4gc3VzcGVuZGVkICovCj4+Pj4+ICvC
oMKgwqAgaWYgKCBwLT5kb21haW4tPmlzX3NodXRfZG93biAmJgo+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgKHAtPmRvbWFpbi0+c2h1dGRvd25fY29kZSA9PSBTSFVURE9XTl9zdXNwZW5kKSApCj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+Pj4gU0hVVERPV05fc3VzcGVuZCBpcyB1c2VkIGlu
IFhlbiBmb3Igb3RoZXIgcHVycG9zZSAoc2VlCj4+Pj4gU0NIRURPUF9zaHV0ZG93bikuIFRoZSBv
dGhlciB1c2VyIG9mIHRoYXQgY29kZSByZWxpZXMgb24gYWxsIHRoZSBzdGF0ZQo+Pj4+IHRvIGJl
IHNhdmVkIG9uIHN1c3BlbmQuCj4+Pj4KPj4+IFdlIGp1c3QgbmVlZCBhIGZsYWcgdG8gbWFyayBh
IGRvbWFpbiBhcyBzdXNwZW5kZWQsIGFuZCBJIGRvIGJlbGlldmUKPj4+IFNIVVRET1dOX3N1c3Bl
bmQgaXMgbm90IHVzZWQgYW55d2hlcmUgZWxzZS4KPj4+IExldCdzIGNvbWUgYmFjayBvbiB0aGlz
Lgo+Pgo+PiBTSFVURE9XTl9zdXNwZW5kIGlzIHVzZWQgZm9yIG1pZ3JhdGlvbi7CoCBHcmVwIGZv
ciBpdCB0aHJvdWdoIHRoZSBYZW4KPj4gdHJlZSBhbmQgeW91J2xsIGZpbmQgc2V2ZXJhbCBwaWVj
ZXMgb2YgZG9jdW1lbnRhdGlvbiwgaW5jbHVkaW5nIHRoZQo+PiBkZXNjcmlwdGlvbiBvZiB3aGF0
IHRoaXMgc2h1dGRvd24gY29kZSBtZWFucy4KPj4KPj4gV2hhdCB5b3UgYXJlIGludHJvZHVjaW5n
IGhlcmUgaXMgbm90IGEgc2h1dGRvd24gLSBpdCBpcyBhIHN1c3BlbmQgd2l0aAo+PiB0aGUgaW50
ZW50IHRvIHJlc3VtZSBleGVjdXRpbmcgbGF0ZXIuwqAgQXMgc3VjaCwgaXQgc2hvdWxkbid0IHVz
ZSBYZW4ncwo+PiBzaHV0ZG93biBpbmZyYXN0cnVjdHVyZSwgd2hpY2ggZXhpc3RzIG1haW5seSB0
byBjb21tdW5pY2F0ZSB3aXRoIHRoZQo+PiB0b29sc3RhY2suCj4KPiBXb3VsZCBkb21haW4gcGF1
c2UvdW5wYXVzZSBiZSBhIGJldHRlciBzb2x1dGlvbj8KCkFjdHVhbGx5IHllcyAtIHRoYXQgc291
bmRzIGxpa2UgYSB2ZXJ5IG5lYXQgc29sdXRpb24uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
