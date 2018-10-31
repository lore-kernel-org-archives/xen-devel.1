From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 6/9] viridian: separate time related
 enlightenment implementations...
Date: Wed, 31 Oct 2018 15:43:19 +0000
Message-ID: <20181031154319.hdofmrzgrina5tyq@zion.uk.xensource.com>
References: <20181031124335.23867-1-paul.durrant@citrix.com>
 <20181031124335.23867-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qv1o=nl=citrix.com=prvs=835e3026f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHseb-0006TB-Pn
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 15:43:33 +0000
Content-Disposition: inline
In-Reply-To: <20181031124335.23867-7-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMzEsIDIwMTggYXQgMTI6NDM6MzJQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLmludG8gbmV3ICd0aW1lJyBtb2R1bGUuCj4gCj4gVGhpcyBwYXRjaCByZWR1Y2Vz
IHRoZSBzaXplIG9mIHRoZSBtYWluIHZpcmlkaWFuIHNvdXJjZSBtb2R1bGUgYnkKPiBtb3Zpbmcg
dGltZSByZWxhdGVkIGVubGlnaHRlbm1lbnRzIGludG8gdGhlaXIgb3duIHNvdXJjZSBtb2R1bGUu
IFRoaXMgaXMKPiBkb25lIGluIGFudGljaXBhdGlvbiBvZiBpbXBsZW1lbnRhdGlvbiBvZiBtb3Jl
IHN1Y2ggZW5pZ2h0ZW5tZW50cyBhbmQKPiBhIGRlc2lyZSB0byBub3QgZnVydGhlciBsZW5ndGhl
biB0aGUgbWFpbiBzb3VyY2UgbW9kdWxlIHdoZW4gdGhpcyB3b3JrCj4gaXMgZG9uZS4KPiAKPiBX
aGlsZSBtb3ZpbmcgdGhlIGNvZGU6Cj4gCj4gLSBNb3ZlIHRoZSBkZWNsYXJhdGlvbiBvZiBIVl9S
RUZFUkVOQ0VfVFNDX1BBR0UgZnJvbSB0aGUgaGVhZGVyIGZpbGUgaW50bwo+ICAgdGhlIG5ldyBz
b3VyY2UgbW9kdWxlLCBzaW5jZSBpdCBpcyBvbmx5IHVzZWQgdGhlcmUuCj4gLSBDbGVhbiB1cCBh
IGJvb2xfdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgpbLi4uXQo+ICtpbnQgdmlyaWRpYW5fdGltZV93cm1zcihzdHJ1Y3QgdmNwdSAq
diwgdWludDMyX3QgaWR4LCB1aW50NjRfdCB2YWwpCj4gK3sKPiArICAgIHN0cnVjdCBkb21haW4g
KmQgPSB2LT5kb21haW47Cj4gKwo+ICsgICAgc3dpdGNoICggaWR4ICkKPiArICAgIHsKPiArICAg
IGNhc2UgSFZfWDY0X01TUl9SRUZFUkVOQ0VfVFNDOgo+ICsgICAgICAgIGlmICggISh2aXJpZGlh
bl9mZWF0dXJlX21hc2soZCkgJiBIVk1QVl9yZWZlcmVuY2VfdHNjKSApCj4gKyAgICAgICAgICAg
IHJldHVybiBYODZFTVVMX0VYQ0VQVElPTjsKPiArCj4gKyAgICAgICAgZC0+YXJjaC5odm0udmly
aWRpYW4ucmVmZXJlbmNlX3RzYy5yYXcgPSB2YWw7Cj4gKyAgICAgICAgZHVtcF9yZWZlcmVuY2Vf
dHNjKGQpOwo+ICsgICAgICAgIGlmICggZC0+YXJjaC5odm0udmlyaWRpYW4ucmVmZXJlbmNlX3Rz
Yy5maWVsZHMuZW5hYmxlZCApCj4gKyAgICAgICAgICAgIHVwZGF0ZV9yZWZlcmVuY2VfdHNjKGQs
IHRydWUpOwo+ICsgICAgICAgIGJyZWFrOwo+ICsKPiArICAgIGRlZmF1bHQ6Cj4gKyAgICAgICAg
Z2RwcmludGsoWEVOTE9HX0lORk8sCj4gKyAgICAgICAgICAgICAgICAgIiVzOiB1bmltcGxlbWVu
dGVkIE1TUiAlI3ggKCUwMTYiUFJJeDY0IilcbiIsCgpJIGJlbGlldmUgdGhpcyBjYW4gZml0IGlu
dG8gcHJldmlvdXMgbGluZSBqdXN0IGZpbmUuCgpBbnl3YXksIGRvbid0IGxldCB0aGlzIG1pbm9y
IGJsb2NrIHRoaXMgcGF0Y2guCgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
