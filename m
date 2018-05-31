From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 00/10] Intel Processor Trace
 virtulization enabling
Date: Thu, 31 May 2018 10:10:18 +0100
Message-ID: <c0275588-9bcf-6ad1-e63a-03c38d836fca@arm.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <d4123fb7-293f-bf0e-1e7d-0d3184829023@arm.com>
 <82D7661F83C1A047AF7DC287873BF1E167FE1A5C@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <82D7661F83C1A047AF7DC287873BF1E167FE1A5C@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Kang, Luwei" <luwei.kang@intel.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>, "tim@xen.org" <tim@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAzMS8wNS8xOCAwMDoyOSwgS2FuZywgTHV3ZWkgd3JvdGU6Cj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IEp1bGllbiBHcmFsbCBbbWFpbHRvOmp1bGllbi5ncmFs
bEBhcm0uY29tXQo+PiBTZW50OiBXZWRuZXNkYXksIE1heSAzMCwgMjAxOCAxMToxNSBQTQo+PiBU
bzogS2FuZywgTHV3ZWkgPGx1d2VpLmthbmdAaW50ZWwuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhl
bi5vcmcKPj4gQ2M6IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb207IEdlb3JnZS5EdW5sYXBAZXUu
Y2l0cml4LmNvbTsgaWFuLmphY2tzb25AZXUuY2l0cml4LmNvbTsgamJldWxpY2hAc3VzZS5jb207
Cj4+IGtvbnJhZC53aWxrQG9yYWNsZS5jb207IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IHRpbUB4
ZW4ub3JnOyB3ZWkubGl1MkBjaXRyaXguY29tOyBOYWthamltYSwgSnVuIDxqdW4ubmFrYWppbWFA
aW50ZWwuY29tPjsgVGlhbiwKPj4gS2V2aW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+PiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyIDAwLzEwXSBJbnRlbCBQcm9jZXNzb3IgVHJhY2UgdmlydHVsaXph
dGlvbiBlbmFibGluZwo+Pgo+PiBIaSwKPj4KPj4gQ2FuIHlvdSBwbGVhc2UgYXZvaWQgQ0MgZXZl
cnlvbmUgb24gZWFjaCBwYXRjaD8gWW91IGNhbiB1c2Ugc2NyaXB0cy9nZXRfbWFpbnRhaW5lcnMu
cGwgb24gZWFjaCBwYXRjaCB0byBzZWUgd2hvIGlzIHJlcXVpcmVkIHRvIGJlCj4+IENDZWQuCj4g
Cj4gT0ssIGdldCBpdC4gSSB1c2Ugc2NyaXB0L2dldF9tYWludGFpbmVycy5wbCB0byBnZXQgdGhl
IHBlb3BsZSB3aG8gbmVlZCB0byBiZSBDQyBhbmQgaW5kZWVkIGRpZmZlcmVudCBwYXRjaCBtYXkg
aW5jbHVkZSBkaWZmZXJlbnQgcGVvcGxlcy4gSWYgc29tZWJvZHkgIGp1c3QgcmVjZWl2ZSBvbmUg
cGF0Y2ggb2YgdGhpcyBwYXRjaCBzZXQgbWF5IGZlZWwgYSBsaXR0bGUgc3RyYW5nZSBhbmQgZG9u
J3QgdW5kZXJzdGFuZCB0aGUgY29udGV4dC4gU28gSSBDQyBhbGwgdGhlIHBlb3BsZXMgd2hvIGlz
IG1lbnRpb25lZCBpbiB0aGlzIHBhdGNoIHNldC4KClRoYXQncyB1c3VhbGx5IHdoeSBJIENDIGV2
ZXJ5b25lIG9uIHRoZSBjb3ZlciBsZXR0ZXIuIFRoZW4gZm9yIGVhY2ggCnBhdGNoIEkgQ0Mgb25s
eSB0aGUgbmVjZXNzYXJ5IHBlcnNvbi4KClRoaXMgYXZvaWRzIG1haW50YWluZXJzIHRvIGhhdmUg
dG8gbG9vayBmb3Igd2hhdCB0aGV5IHNob3VsZCByZXZpZXcvYWNrLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
