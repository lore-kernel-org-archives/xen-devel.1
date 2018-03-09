From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v1] getpageframeinfo3: replace hardcoded
 batchsize with constant
Date: Fri, 9 Mar 2018 16:49:26 +0000
Message-ID: <8da306fb-a1e9-e15c-084e-87091cccef83@citrix.com>
References: <20180309161720.17510-1-olaf@aepfle.de>
 <5AA2C39E02000078001B061D@prv-mh.provo.novell.com>
 <ae7b71fa-1493-a61e-1235-90fed2a926e7@citrix.com>
 <5AA2C7D602000078001B067B@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AA2C7D602000078001B067B@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Olaf Hering <olaf@aepfle.de>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDkvMjAxOCAwNDo0MyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDkuMDMu
MTggYXQgMTc6MzAsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAwMy8w
OS8yMDE4IDA0OjI1IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA5LjAzLjE4IGF0
IDE3OjE3LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1
YmxpYy9kb21jdGwuaAo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+Pj4+
IEBAIC0xMzcsNiArMTM3LDggQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX2RvbWN0bF9n
ZXRkb21haW5pbmZvX3QpOwo+Pj4+ICAjZGVmaW5lIFhFTl9ET01DVExfUEZJTkZPX0JST0tFTiAg
KDB4ZFU8PDI4KSAvKiBicm9rZW4gcGFnZSAqLwo+Pj4+ICAjZGVmaW5lIFhFTl9ET01DVExfUEZJ
TkZPX0xUQUJfTUFTSyAoMHhmVTw8MjgpCj4+Pj4gIAo+Pj4+ICsjZGVmaW5lIFhFTl9HRVRQQUdF
RlJBTUVJTkZPM19NQVhfU0laRSAxMDI0VQo+Pj4KPj4+IFRoaXMgaXMgYW4gaW1wbGVtZW50YXRp
b24gZGV0YWlsOyBpdCBzaG91bGRuJ3QgYmUgbWFkZSBwYXJ0IG9mIHRoZQo+Pj4gcHVibGljIGlu
dGVyZmFjZS4gSWYgdGhlcmUncyBhIG5lZWQgZm9yIHVzZXIgbGFuZCB0byBrbm93IHRoZSB2YWx1
ZSwKPj4+IGFuZCBpZiB0aGVyZSdzIGN1cnJlbnRseSBubyB3YXkgdG8gcXVlcnkgaXQsIHRoYXQn
cyB3aGF0IHlvdQo+Pj4gd291bGQgd2FudCB0byBhZGQuCj4+Cj4+IEJ1dCB0aGUgZG9tY3RsIGlu
dGVyZmFjZSBpc24ndCBzdGFibGUsIHJpZ2h0PyAgVGhlcmUncyBubyBuZWVkIHRvIG1ha2UgYQo+
PiBmbGV4aWJsZSBiYWNrd2FyZHMtY29tcGF0aWJsZSBpbnRlcmZhY2UgYmV0d2VlbiBsaWJ4YyBh
bmQgWGVuOyBzaGFyaW5nIGEKPj4gI2RlZmluZSBzaG91bGQgYmUgZmluZSwgYXMgbG9uZyBhcyB0
aGVyZSdzIG9ubHkgb25lIHBsYWNlIHRvIGNoYW5nZSBpdC4KPiAKPiBXZWxsLCBzdHJpY3RseSBz
cGVha2luZyB0aGlzIGlzIGFuIG9wdGlvbi4gQnV0IEkgd291bGQgcHJlZmVyIGlmIHdlIGRpZG4n
dAo+IGFidXNlIHRoZSAiaXMgbm90IGEgc3RhYmxlIGludGVyZmFjZSIgcHJvcGVydHksIHdoaWNo
IHRoaXMgY2hhbmdlcwo+IGZlZWxzIGxpa2UgaXQgd291bGQuIAo+IAo+IEZ1cnRoZXJtb3JlIGl0
IGhhc24ndCBiZWNvbWUgY2xlYXIgdG8gbWUgd2h5LCBpZiB0aGlzIGhhcmQgY29kZWQKPiBudW1i
ZXIgaXMgZGVlbWVkIGEgcHJvYmxlbSwgd2UgZG9uJ3QgZ2V0IHJpZCBvZiBpdCBhbHRvZ2V0aGVy
Lgo+IERvbWN0bC1zIGhhdmUgbG9uZyBnYWluZWQgdGhlIGFiaWxpdHkgdG8gYmUgcHJlZW1wdGli
bGUgLSB0aGVyZQo+IHZhcmlvdXMgZXhhbXBsZXMuCgpZZXMsIG1ha2luZyBpdCBwcmVlbXB0aWJs
ZSBhbmQgcmVtb3ZpbmcgdGhlIGxpbWl0IGlzIHByb2JhYmx5IGEgYmV0dGVyCm9wdGlvbi4KCiAt
R2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
