From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 4/4] x86/mem_sharing: compile mem_sharing
 subsystem only when kconfig is enabled
Date: Mon, 29 Apr 2019 09:32:00 -0600
Message-ID: <5CC718F0020000780022A18A@prv1-mh.provo.novell.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-4-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL8GE-0007ej-N6
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:32:06 +0000
In-Reply-To: <20190426172138.14669-4-tamas@tklengyel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA0LjE5IGF0IDE5OjIxLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L0tjb25maWcKPiArKysgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwo+
IEBAIC0xNyw3ICsxNyw2IEBAIGNvbmZpZyBYODYKPiAgCXNlbGVjdCBIQVNfS0VYRUMKPiAgCXNl
bGVjdCBNRU1fQUNDRVNTX0FMV0FZU19PTgo+ICAJc2VsZWN0IEhBU19NRU1fUEFHSU5HCj4gLQlz
ZWxlY3QgSEFTX01FTV9TSEFSSU5HCj4gIAlzZWxlY3QgSEFTX05TMTY1NTAKPiAgCXNlbGVjdCBI
QVNfUEFTU1RIUk9VR0gKPiAgCXNlbGVjdCBIQVNfUENJCj4gQEAgLTE5OCw2ICsxOTcsMTMgQEAg
Y29uZmlnIFBWX1NISU1fRVhDTFVTSVZFCj4gIAkgIGZpcm13YXJlLCBhbmQgd2lsbCBub3QgZnVu
Y3Rpb24gY29ycmVjdGx5IGluIG90aGVyIHNjZW5hcmlvcy4KPiAgCj4gIAkgIElmIHVuc3VyZSwg
c2F5IE4uCj4gKwo+ICtjb25maWcgTUVNX1NIQVJJTkcKPiArICAgIGJvb2wKPiArICAgIGRlZmF1
bHQgbgo+ICsgICAgZGVwZW5kcyBvbiBIVk0KPiArICAgIHByb21wdCAiWGVuIG1lbW9yeSBzaGFy
aW5nIHN1cHBvcnQiIGlmIEVYUEVSVCA9ICJ5Igo+ICsKCkFzIHBlciBhbGwgdGhlIGNvbnRleHQg
YWJvdmUsIHBsZWFzZSB1c2UgcHJvcGVyICh0YWIpIGluZGVudGF0aW9uLgpBbHNvIHBsZWFzZSBv
bWl0IHRoZSBwb2ludGxlc3MgImRlZmF1bHQgbiIuIEFuZCB0aGVuIHRoZSAiYm9vbCIKYW5kICJw
cm9tcHQgLi4uIiBjYW4gKGFuZCBoZW5jZSBzaG91bGQpIGJlIGNvbWJpbmVkIGludG8gYQpzaW5n
bGUgbGluZS4KCkkgYWxzbyB3b25kZXIgd2hldGhlciB0aGlzIHNob3VsZG4ndCBiZSBpbiBjb21t
b24vS2NvbmZpZywgYnV0CnRoZW4gYWdhaW4gaXQgY2FuIGJlIG1vdmVkIHRoZXJlIGlmIEFybSB3
b3VsZCBldmVyIGdhaW4KbWVtLXNoYXJpbmcgc3VwcG9ydC4KCj4gQEAgLTk4LDQgKzEwMCwzMyBA
QCB2b2lkIG1lbV9zaGFyaW5nX2luaXQodm9pZCk7Cj4gICAqLwo+ICBpbnQgcmVsaW5xdWlzaF9z
aGFyZWRfcGFnZXMoc3RydWN0IGRvbWFpbiAqZCk7Cj4gIAo+ICsjZWxzZQo+ICsKPiArc3RhdGlj
IGlubGluZSB1bnNpZ25lZCBpbnQgbWVtX3NoYXJpbmdfZ2V0X25yX3NhdmVkX21mbnModm9pZCkK
PiArewo+ICsgICAgcmV0dXJuIDA7Cj4gK30KPiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQg
bWVtX3NoYXJpbmdfZ2V0X25yX3NoYXJlZF9tZm5zKHZvaWQpCj4gK3sKPiArICAgIHJldHVybiAw
Owo+ICt9CgpJIGZvbGxvdyB5b3UgZm9yIHRoZXNlLgoKPiArc3RhdGljIGlubGluZSBpbnQgbWVt
X3NoYXJpbmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBkb21haW4gKmQsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGdmbiwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IGZsYWdzKQo+ICt7
Cj4gKyAgICByZXR1cm4gMDsKPiArfQoKQnV0IHNob3VsZG4ndCB0aGlzIG9uZSAoanVzdCBhcyBh
biBleGFtcGxlLCB0aGVyZSBtYXkgYmUgbW9yZQpiZWxvdykgcmV0dXJuIC1FT1BOT1RTVVBQPwoK
QW5kIGluIGdlbmVyYWwgLSBpZiB0aGVzZSBpbmxpbmUgZnVuY3Rpb25zIGFyZSBuZWVkZWQsIHNo
b3VsZG4ndAphbGwgb2YgdGhlbSAob3IgYXQgbGVhc3Qgc29tZSkgZ2FpbiBBU1NFUlRfVU5SRUFD
SEFCTEUoKSwgYXMgd2UKZG8gZWxzZXdoZXJlPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
