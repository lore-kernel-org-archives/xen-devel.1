From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2] xen/timers: Fix memory leak with cpu
 unplug/plug
Date: Mon, 8 Apr 2019 14:53:24 +0100
Message-ID: <317eff62-0a5f-5356-fb08-6e6d46121652@arm.com>
References: <1554716396-3764-1-git-send-email-andrew.cooper3@citrix.com>
 <5394e8aa-bae4-8a27-327a-b0dcd0996477@arm.com>
 <ddb84ed5-b986-a9eb-be71-e3d0b5060cad@citrix.com>
 <2801a3f5-5899-5730-4466-f4e32d111a8e@arm.com>
 <a3c82fc1-2424-9b30-5d6e-15c98ec2090c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a3c82fc1-2424-9b30-5d6e-15c98ec2090c@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gNC84LzE5IDE6MDkgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24g
MDgvMDQvMjAxOSAxMjozOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gNC84
LzE5IDExOjQ3IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMDgvMDQvMjAxOSAxMToz
OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gT24gNC84LzE5IDEwOjM5
IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+PiArwqDCoMKgIGNhc2UgQ1BVX1JFU1VNRV9G
QUlMRUQ6Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoICFwYXJrX29mZmxpbmVfY3B1cyAmJiBz
eXN0ZW1fc3RhdGUgIT0KPj4+Pj4gU1lTX1NUQVRFX3N1c3BlbmQgKQo+Pj4+Cj4+Pj4gVGhpcyBw
YXRjaCBicmVha3MgY29tcGlsYXRpb24gb24gYXJtMzIvYXJtNjQgYmVjYXVzZSBwYXJrX29mZmxp
bmVfY3B1cwo+Pj4+IGlzIG5vdCBkZWZpbmVkOgo+Pj4+Cj4+Pj4gdGltZXIuYzogSW4gZnVuY3Rp
b24gJ2NwdV9jYWxsYmFjayc6Cj4+Pj4gdGltZXIuYzo2NTE6MTU6IGVycm9yOiAncGFya19vZmZs
aW5lX2NwdXMnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbgo+Pj4+IHRoaXMgZnVuY3Rpb24pCj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoICFwYXJrX29mZmxpbmVfY3B1cyAmJiBzeXN0ZW1f
c3RhdGUgIT0KPj4+PiBTWVNfU1RBVEVfc3VzcGVuZCApCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fgo+Pj4+Cj4+Pj4gV2hhdCBpcyB0aGUgcHVy
cG9zZSBvZiBwYXJrX29mZmxpbmVfY3B1cz8KPj4+Cj4+PiBTb3JyeS7CoCBJIHNob3VsZCBoYXZl
IHdhaXRlZCBmb3IgYSBmdWxsIGJ1aWxkIHRlc3QgZmlyc3QuCj4+Pgo+Pj4gcGFya19vZmZsaW5l
X2NwdXMgaXMgYSB3b3JrYXJvdW5kIGZvciBJbnRlbCdzIE1DRSBiZWhhdmlvdXIsIHdoZXJlIHRo
ZQo+Pj4gc3lzdGVtIHdpbGwgc2h1dCBkb3duIHJhdGhlciB0aGFuIGRlbGl2ZXIgYW4gI01DIGlm
IG1hY2hpbmUgY2hlY2tpbmcKPj4+IGlzbid0IGNvbmZpZ3VyZWQgb24gYWxsIENQVXMuCj4+Pgo+
Pj4gQXMgYSByZXN1bHQsIHdlIGhhdmUgdG8gc3RhcnQgYWxsIENQVXMsIGV2ZW4gYmV5b25kIG1h
eGNwdXM9IGFuZCBzZXQgdXAKPj4+IG1hY2hpbmUgY2hlY2sgaGFuZGxpbmcsIGFuZCBuZXZlciBl
dmVyIGZyZWUgdGhlaXIgc3RhY2tzLCBldmVuIGlmIHdlJ2QKPj4+IHByZWZlciB0aGUgQ1BVcyB0
byBiZSBvZmZsaW5lLgo+Pgo+PiBJIGFtIGEgYml0IGNvbmZ1c2VkLCB3aHkgdGhpcyBpcyBuZWNl
c3Nhcnkgbm93IGZvciB0aGUgdGltZXIgYW5kIG5vdAo+PiBpbiBvdGhlciBwbGFjZXMgb2YgdGhl
IGNvbW1vbiBjb2RlPwo+Pgo+Pj4KPj4+IEFyZSB5b3UgaGFwcHkgd2l0aCBhCj4+Pgo+Pj4gI2Rl
ZmluZSBwYXJrX29mZmxpbmVfY3B1cyBmYWxzZSA+Cj4+PiBpbiBBUk0/Cj4+Cj4+IFRoZSBuYW1l
IGlzIGZhaXJseSBjb25mdXNpbmcgaWYgeW91IGRvbid0IGtub3cgdGhlIGJhY2tncm91bmQuCj4+
Cj4+IEJ1dCBJIGhhdmUgdG8gYWRtaXQgdGhhdCBldmVuIHdpdGggeW91ciBleHBsYW5hdGlvbiBh
Ym92ZSwgSSBzdGlsbAo+PiBkb24ndCB1bmRlcnN0YW5kIHdoeSB5b3UgbmVlZCB0byBjaGVjayBw
YXJrX29mZmxpbmVfY3B1cyBpbiB0aGUgdGltZXJzLgo+IAo+IEl0IGlzIGFsbCB0byBkbyB3aXRo
IGhvdy93aGVuIHdlIGZyZWUgcGVyLWNwdSBkYXRhLgo+IAo+IFRlY2huaWNhbGx5IHNwZWFraW5n
ICh3aXRoIHRoZSBtZW1vcnkgbGVhayBmaXhlZCkgdGhlIG9sZCBhcnJhbmdlbWVudAo+IG91Z2h0
IHRvIGZ1bmN0aW9uIGNvcnJlY3RseSwgYnV0IHRoZSBuZXcgYXJyYW5nZW1lbnQgaXMgbW9yZSBl
ZmZpY2llbnQuCldoZXJlIHdvdWxkIHRoZSBmcmVlIGhhcHBlbiBpbiB0aGUgImxlc3MgZWZmaWNp
ZW50IiB3YXk/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
