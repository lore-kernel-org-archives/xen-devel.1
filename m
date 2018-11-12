From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Mon, 12 Nov 2018 19:56:10 +0000
Message-ID: <d4dc12d3-2382-44d3-d078-faeb7c195eb4@arm.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <1c5ca0ad-ee3d-2936-b57d-0ded1415176d@arm.com>
 <CAKPH-Nge2EMDLihthEVGAO0gY8EACksuN6ch1ZJV6+t1JeK=JQ@mail.gmail.com>
 <d24be446-af5a-7881-2db4-b25afac3e1f4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d24be446-af5a-7881-2db4-b25afac3e1f4@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMTEvMTIvMTggNDo0MSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAxMi8xMS8xOCAxNjozNSwgTWlyZWxhIFNpbW9ub3ZpYyB3cm90ZToKPj4+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4+Pj4gaW5k
ZXggZTU5NGI0OGQ4MS4uN2Y4MTA1NDY1YyAxMDA2NDQKPj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
ZG9tYWluLmMKPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMKPj4+PiBAQCAtOTcsNiAr
OTcsMTEgQEAgc3RhdGljIHZvaWQgY3R4dF9zd2l0Y2hfZnJvbShzdHJ1Y3QgdmNwdSAqcCkKPj4+
PiAgICAgICAgaWYgKCBpc19pZGxlX3ZjcHUocCkgKQo+Pj4+ICAgICAgICAgICAgcmV0dXJuOwo+
Pj4+Cj4+Pj4gKyAgICAvKiBWQ1BVJ3MgY29udGV4dCBzaG91bGQgbm90IGJlIHNhdmVkIGlmIGl0
cyBkb21haW4gaXMgc3VzcGVuZGVkICovCj4+Pj4gKyAgICBpZiAoIHAtPmRvbWFpbi0+aXNfc2h1
dF9kb3duICYmCj4+Pj4gKyAgICAgICAgKHAtPmRvbWFpbi0+c2h1dGRvd25fY29kZSA9PSBTSFVU
RE9XTl9zdXNwZW5kKSApCj4+Pj4gKyAgICAgICAgcmV0dXJuOwo+Pj4gU0hVVERPV05fc3VzcGVu
ZCBpcyB1c2VkIGluIFhlbiBmb3Igb3RoZXIgcHVycG9zZSAoc2VlCj4+PiBTQ0hFRE9QX3NodXRk
b3duKS4gVGhlIG90aGVyIHVzZXIgb2YgdGhhdCBjb2RlIHJlbGllcyBvbiBhbGwgdGhlIHN0YXRl
Cj4+PiB0byBiZSBzYXZlZCBvbiBzdXNwZW5kLgo+Pj4KPj4gV2UganVzdCBuZWVkIGEgZmxhZyB0
byBtYXJrIGEgZG9tYWluIGFzIHN1c3BlbmRlZCwgYW5kIEkgZG8gYmVsaWV2ZQo+PiBTSFVURE9X
Tl9zdXNwZW5kIGlzIG5vdCB1c2VkIGFueXdoZXJlIGVsc2UuCj4+IExldCdzIGNvbWUgYmFjayBv
biB0aGlzLgo+IAo+IFNIVVRET1dOX3N1c3BlbmQgaXMgdXNlZCBmb3IgbWlncmF0aW9uLsKgIEdy
ZXAgZm9yIGl0IHRocm91Z2ggdGhlIFhlbgo+IHRyZWUgYW5kIHlvdSdsbCBmaW5kIHNldmVyYWwg
cGllY2VzIG9mIGRvY3VtZW50YXRpb24sIGluY2x1ZGluZyB0aGUKPiBkZXNjcmlwdGlvbiBvZiB3
aGF0IHRoaXMgc2h1dGRvd24gY29kZSBtZWFucy4KPiAKPiBXaGF0IHlvdSBhcmUgaW50cm9kdWNp
bmcgaGVyZSBpcyBub3QgYSBzaHV0ZG93biAtIGl0IGlzIGEgc3VzcGVuZCB3aXRoCj4gdGhlIGlu
dGVudCB0byByZXN1bWUgZXhlY3V0aW5nIGxhdGVyLsKgIEFzIHN1Y2gsIGl0IHNob3VsZG4ndCB1
c2UgWGVuJ3MKPiBzaHV0ZG93biBpbmZyYXN0cnVjdHVyZSwgd2hpY2ggZXhpc3RzIG1haW5seSB0
byBjb21tdW5pY2F0ZSB3aXRoIHRoZQo+IHRvb2xzdGFjay4KCldvdWxkIGRvbWFpbiBwYXVzZS91
bnBhdXNlIGJlIGEgYmV0dGVyIHNvbHV0aW9uPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
