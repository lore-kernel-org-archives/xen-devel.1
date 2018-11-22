From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] mm: fix LLVM code-generation issue
Date: Thu, 22 Nov 2018 12:23:22 +0000
Message-ID: <c0b25df2-49ca-fbe1-804a-e1a9839bb854@citrix.com>
References: <20181122120327.66403-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=76BK=OB=citrix.com=prvs=857ae18cf=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gPo1H-0001Oe-SW
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 12:23:43 +0000
In-Reply-To: <20181122120327.66403-1-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMTEvMjAxOCAxMjowMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IExMVk0gY29kZSBn
ZW5lcmF0aW9uIGNhbiBhdHRlbXB0IHRvIHBlcmZvcm0gYSBsb2FkIGZyb20gYSB2YXJpYWJsZSBp
bgo+IHRoZSBuZXh0IGNvbmRpdGlvbiBvZiBhbiBleHByZXNzaW9uIHVuZGVyIGNlcnRhaW4gY2ly
Y3Vtc3RhbmNlcywgdGh1cwo+IHR1cm5pbmcgdGhlIGZvbGxvd2luZyBjb25kaXRpb246Cj4KPiBp
ZiAoIHN5c3RlbV9zdGF0ZSA8IFNZU19TVEFURV9hY3RpdmUgJiYgb3B0X2Jvb3RzY3J1YiA9PSBC
T09UU0NSVUJfSURMRSApCj4KPiBJbnRvOgo+Cj4gMHhmZmZmODJkMDgwMjIzOTY3IDwrMTAzPjog
Y21wbCAgICQweDMsMHgzN2IwMzIoJXJpcCkgIyAweGZmZmY4MmQwODA1OWU5YTAgPHN5c3RlbV9z
dGF0ZT4KPiAweGZmZmY4MmQwODAyMjM5NmUgPCsxMTA+OiBzZXRiICAgLTB4MjkoJXJicCkKPiAw
eGZmZmY4MmQwODAyMjM5NzIgPCsxMTQ+OiBjbXBsICAgJDB4MiwweDIyOGE4YiglcmlwKSAjIDB4
ZmZmZjgyZDA4MDQ0YzQwNCA8b3B0X2Jvb3RzY3J1Yj4KCllvdSdyZSBhY3R1YWxseSBtaXNzaW5n
IHR3byBwaWVjZXMgaGVyZS7CoCBJZiBJIHJlY2FsbCB0aGUgZGlzYXNzZW1ibHkKY29ycmVjdGx5
LCB0aGVyZSB3YXMgYSBgc2V0ZSAlYWxgLCBhbmQgYW4gYGFuZCAlYWwsIC0weDI5KCVyYnApYCB3
aGljaApoYWQgdGhlIGN1bXVsYXRpdmUgZWZmZWN0IG9mIGNhbGN1bGF0aW5nIGBpZGxlX3NjcnVi
YCBicmFuY2hsZXNzbHkKKHdoaWNoIGlzIG5vIGRvdWJ0IHRoZSBpbnRlbmRlZCBvcHRpbWlzYXRp
b24pLgoKPgo+IFN1Y2ggY29kZSB3aWxsIHRyaWdnZXIgYSBwYWdlIGZhdWx0IGlmIHN5c3RlbV9z
dGF0ZSA+PQo+IFNZU19TVEFURV9hY3RpdmUuCj4KPiBJbiBvcmRlciB0byBwcmV2ZW50IHN1Y2gg
b3B0aW1pemF0aW9uIHNpZ25hbCB0byB0aGUgY29tcGlsZXIgdGhhdAo+IGFjY2Vzc2luZyBvcHRf
Ym9vdHNjcnViIGNhbiBoYXZlIHNpZGUgZWZmZWN0cyBieSB1c2luZyBBQ0NFU1NfT05DRS4KPiBU
aGlzIGhhcyBiZWVuIHJlcG9ydGVkIGFuZCBkaXNjdXNzZWQgd2l0aCB1cHN0cmVhbSBMTFZNOgo+
Cj4gaHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9pZD0zOTcwNwo+Cj4gSSBoYXZl
bid0IGJlZW4gYWJsZSB0byBmaW5kIGFueSBvdGhlciBpbnN0YW5jZXMgb2Ygc3VjaCBjb25kaXRp
b25hbAo+IGV4cHJlc3Npb24gdGhhdCB1c2VzIHN5c3RlbV9zdGF0ZSB0b2dldGhlciB3aXRoIGFu
IGluaXQgdmFyaWFibGUgb3IKPiBmdW5jdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVG8gdW5ibG9jayB0aGUgQ2xhbmcgYnVp
bGQsIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyCjxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiwg
YWx0aG91Z2ggaWRlYWxseSB3aXRoIHRoZSBleHBhbmRlZCBkaXNhc3NlbWJseS4KCkkgc3RpbGwg
dGhpbmsgdGhhdCBsb25ndGVybSwgd2UgbmVlZCB0byByZWNvbnNpZGVyIG91ciBwb3NpdGlvbiBv
ZgpyZWZlcmVuY2luZyBfX2luaXQgdGhpbmdzIGZyb20gbm9uLV9faW5pdCBmdW5jdGlvbnMuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
