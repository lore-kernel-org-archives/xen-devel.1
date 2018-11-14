From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Wed, 14 Nov 2018 12:49:30 +0000
Message-ID: <e8bd7b71-743e-898c-b4bc-030833ff7b6d@arm.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <1c5ca0ad-ee3d-2936-b57d-0ded1415176d@arm.com>
 <CAKPH-Nge2EMDLihthEVGAO0gY8EACksuN6ch1ZJV6+t1JeK=JQ@mail.gmail.com>
 <d24be446-af5a-7881-2db4-b25afac3e1f4@citrix.com>
 <d4dc12d3-2382-44d3-d078-faeb7c195eb4@arm.com>
 <036e4740-ae1a-e699-719f-966db8876089@citrix.com>
 <8ac0ae95-f696-4b5d-0b18-e96cfc0fcc13@aggios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aca3=nz=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gMubv-0003mw-CM
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 12:49:35 +0000
In-Reply-To: <8ac0ae95-f696-4b5d-0b18-e96cfc0fcc13@aggios.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

SGkgTWlyZWxhLAoKT24gMTQvMTEvMjAxOCAxMjowOCwgTWlyZWxhIFNpbW9ub3ZpYyB3cm90ZToK
PiAKPiAKPiBPbiAxMS8xMy8yMDE4IDA5OjMyIEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBP
biAxMi8xMS8yMDE4IDE5OjU2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSBBbmRyZXcsCj4+
Pgo+Pj4gT24gMTEvMTIvMTggNDo0MSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+PiBPbiAx
Mi8xMS8xOCAxNjozNSwgTWlyZWxhIFNpbW9ub3ZpYyB3cm90ZToKPj4+Pj4+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4+Pj4+Pj4g
aW5kZXggZTU5NGI0OGQ4MS4uN2Y4MTA1NDY1YyAxMDA2NDQKPj4+Pj4+PiAtLS0gYS94ZW4vYXJj
aC9hcm0vZG9tYWluLmMKPj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMKPj4+Pj4+
PiBAQCAtOTcsNiArOTcsMTEgQEAgc3RhdGljIHZvaWQgY3R4dF9zd2l0Y2hfZnJvbShzdHJ1Y3Qg
dmNwdSAqcCkKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpZiAoIGlzX2lkbGVfdmNwdShwKSApCj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+Pj4+Pj4KPj4+Pj4+PiArwqDC
oMKgIC8qIFZDUFUncyBjb250ZXh0IHNob3VsZCBub3QgYmUgc2F2ZWQgaWYgaXRzIGRvbWFpbiBp
cwo+Pj4+Pj4+IHN1c3BlbmRlZCAqLwo+Pj4+Pj4+ICvCoMKgwqAgaWYgKCBwLT5kb21haW4tPmlz
X3NodXRfZG93biAmJgo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAocC0+ZG9tYWluLT5zaHV0ZG93
bl9jb2RlID09IFNIVVRET1dOX3N1c3BlbmQpICkKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuOwo+Pj4+Pj4gU0hVVERPV05fc3VzcGVuZCBpcyB1c2VkIGluIFhlbiBmb3Igb3RoZXIgcHVy
cG9zZSAoc2VlCj4+Pj4+PiBTQ0hFRE9QX3NodXRkb3duKS4gVGhlIG90aGVyIHVzZXIgb2YgdGhh
dCBjb2RlIHJlbGllcyBvbiBhbGwgdGhlIHN0YXRlCj4+Pj4+PiB0byBiZSBzYXZlZCBvbiBzdXNw
ZW5kLgo+Pj4+Pj4KPj4+Pj4gV2UganVzdCBuZWVkIGEgZmxhZyB0byBtYXJrIGEgZG9tYWluIGFz
IHN1c3BlbmRlZCwgYW5kIEkgZG8gYmVsaWV2ZQo+Pj4+PiBTSFVURE9XTl9zdXNwZW5kIGlzIG5v
dCB1c2VkIGFueXdoZXJlIGVsc2UuCj4+Pj4+IExldCdzIGNvbWUgYmFjayBvbiB0aGlzLgo+Pj4+
IFNIVVRET1dOX3N1c3BlbmQgaXMgdXNlZCBmb3IgbWlncmF0aW9uLsKgIEdyZXAgZm9yIGl0IHRo
cm91Z2ggdGhlIFhlbgo+Pj4+IHRyZWUgYW5kIHlvdSdsbCBmaW5kIHNldmVyYWwgcGllY2VzIG9m
IGRvY3VtZW50YXRpb24sIGluY2x1ZGluZyB0aGUKPj4+PiBkZXNjcmlwdGlvbiBvZiB3aGF0IHRo
aXMgc2h1dGRvd24gY29kZSBtZWFucy4KPj4+Pgo+Pj4+IFdoYXQgeW91IGFyZSBpbnRyb2R1Y2lu
ZyBoZXJlIGlzIG5vdCBhIHNodXRkb3duIC0gaXQgaXMgYSBzdXNwZW5kIHdpdGgKPj4+PiB0aGUg
aW50ZW50IHRvIHJlc3VtZSBleGVjdXRpbmcgbGF0ZXIuwqAgQXMgc3VjaCwgaXQgc2hvdWxkbid0
IHVzZSBYZW4ncwo+Pj4+IHNodXRkb3duIGluZnJhc3RydWN0dXJlLCB3aGljaCBleGlzdHMgbWFp
bmx5IHRvIGNvbW11bmljYXRlIHdpdGggdGhlCj4+Pj4gdG9vbHN0YWNrLgo+Pj4gV291bGQgZG9t
YWluIHBhdXNlL3VucGF1c2UgYmUgYSBiZXR0ZXIgc29sdXRpb24/Cj4+IEFjdHVhbGx5IHllcyAt
IHRoYXQgc291bmRzIGxpa2UgYSB2ZXJ5IG5lYXQgc29sdXRpb24uCj4gCj4gSSBiZWxpZXZlIGRv
bWFpbiBwYXVzZSB3aWxsIG5vdCB3b3JrIGhlcmUgLSBhIGRvbWFpbiBjYW5ub3QgcGF1c2UgaXRz
ZWxmLCBpLmUuIAo+IGN1cnJlbnQgZG9tYWluIGNhbm5vdCBiZSBwYXVzZWQuIFRoaXMgZnVuY3Rp
b25hbGl0eSBzZWVtcyB0byBhc3N1bWUgdGhhdCBhIAo+IGRvbWFpbiBpcyBwYXVzaW5nIGFub3Ro
ZXIgZG9tYWluLiBPciBJIG1pc3NlZCB0aGUgcG9pbnQuCgpZZXMgZG9tYWluIHBhdXNlL3VucGF1
c2Ugd2lsbCBub3Qgd29yay4gSG93ZXZlciwgeW91IGNhbiBpbnRyb2R1Y2UgYSBib29sZWFuIHRv
IAp0ZWxsIHlvdSB3aGV0aGVyIHRoZSBkb21haW4gd2FzIHN1c3BlbmQuCgpJIGFjdHVhbGx5IHF1
aXRlIGxpa2UgaG93IHN1c3BlbmQgd29yayBmb3IgeDg2IEhWTS4gVGhpcyBpcyBiYXNlZCBvbiAK
cGF1c2UvdW5wYXVzZS4gSGF2ZSBhIGxvb2sgYXQgaHZtX3MzX3tzdXNwZW5kL3Jlc3VtZX0uCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
