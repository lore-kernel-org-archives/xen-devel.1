From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] ARM: GICv3: copy Dom0 GICv3 reg property
	from host DT
Date: Tue, 30 Jan 2018 11:14:58 +0000
Message-ID: <d51c152e-ee60-7907-5336-f911f834e417@arm.com>
References: <20180130093505.14362-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zbpm=ez=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1egTsa-000158-Po
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2018 11:15:08 +0000
In-Reply-To: <20180130093505.14362-1-andre.przywara@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Amit Tomer <amittomer25@gmail.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAzMC8wMS8xOCAwOTozNSwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gQEAg
LTExNzMsMjcgKzExNzIsMjEgQEAgc3RhdGljIGludCBnaWN2M19tYWtlX2h3ZG9tX2R0X25vZGUo
Y29uc3Qgc3RydWN0IGRvbWFpbiAqZCwKPiAgICAgICBpZiAoIHJlcyApCj4gICAgICAgICAgIHJl
dHVybiByZXM7Cj4gICAKPiAtICAgIGxlbiA9IGR0X2NlbGxzX3RvX3NpemUoZHRfbl9hZGRyX2Nl
bGxzKGdpYykgKyBkdF9uX3NpemVfY2VsbHMoZ2ljKSk7Cj4gKyAgICBuZXdfbGVuID0gZHRfY2Vs
bHNfdG9fc2l6ZShkdF9uX2FkZHJfY2VsbHMoZ2ljKSArIGR0X25fc2l6ZV9jZWxscyhnaWMpKTsK
PiAgICAgICAvKgo+ICAgICAgICAqIEdJQyBoYXMgdHdvIG1lbW9yeSByZWdpb25zOiBEaXN0cmli
dXRvciArIHJkaXN0IHJlZ2lvbnMKPiAgICAgICAgKiBDUFUgaW50ZXJmYWNlIGFuZCB2aXJ0dWFs
IGNwdSBpbnRlcmZhY2VzIGFjY2Vzc2VzZWQgYXMgU3lzdGVtIHJlZ2lzdGVycwo+ICAgICAgICAq
IFNvIGNlbGxzIGFyZSBjcmVhdGVkIG9ubHkgZm9yIERpc3RyaWJ1dG9yIGFuZCByZGlzdCByZWdp
b25zCj4gICAgICAgICovCj4gLSAgICBsZW4gPSBsZW4gKiAoZC0+YXJjaC52Z2ljLm5yX3JlZ2lv
bnMgKyAxKTsKPiAtICAgIG5ld19jZWxscyA9IHh6YWxsb2NfYnl0ZXMobGVuKTsKPiAtICAgIGlm
ICggbmV3X2NlbGxzID09IE5VTEwgKQo+IC0gICAgICAgIHJldHVybiAtRkRUX0VSUl9YRU4oRU5P
TUVNKTsKPiAtCj4gLSAgICB0bXAgPSBuZXdfY2VsbHM7Cj4gLQo+IC0gICAgZHRfc2V0X3Jhbmdl
KCZ0bXAsIGdpYywgZC0+YXJjaC52Z2ljLmRiYXNlLCBTWl82NEspOwo+ICsgICAgbmV3X2xlbiA9
IG5ld19sZW4gKiAoZC0+YXJjaC52Z2ljLm5yX3JlZ2lvbnMgKyAxKTsKPiAgIAo+IC0gICAgZm9y
ICggaSA9IDA7IGkgPCBkLT5hcmNoLnZnaWMubnJfcmVnaW9uczsgaSsrICkKPiAtICAgICAgICBk
dF9zZXRfcmFuZ2UoJnRtcCwgZ2ljLCBkLT5hcmNoLnZnaWMucmRpc3RfcmVnaW9uc1tpXS5iYXNl
LAo+IC0gICAgICAgICAgICAgICAgICAgICBkLT5hcmNoLnZnaWMucmRpc3RfcmVnaW9uc1tpXS5z
aXplKTsKPiArICAgIGh3X3JlZyA9IGR0X2dldF9wcm9wZXJ0eShnaWMsICJyZWciLCAmbGVuKTsK
PiArICAgIGlmICggIWh3X3JlZyApCj4gKyAgICAgICAgcmV0dXJuIC1GRFRfRVJSX1hFTihFTk9F
TlQpOwo+ICsgICAgaWYgKCBuZXdfbGVuID4gbGVuICkKPiArCXJldHVybiAtRkRUX0VSUl9YRU4o
RVJBTkdFKTsKClRoZSBpbmRlbnRhdGlvbiBsb29rcyB3cm9uZyBoZXJlLgoKV2l0aCB0aGF0IGZp
eGVkOgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
