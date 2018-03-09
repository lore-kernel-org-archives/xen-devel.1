From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] getpageframeinfo3: replace hardcoded
 batchsize with constant
Date: Fri, 09 Mar 2018 09:43:50 -0700
Message-ID: <5AA2C7D602000078001B067B@prv-mh.provo.novell.com>
References: <20180309161720.17510-1-olaf@aepfle.de>
 <5AA2C39E02000078001B061D@prv-mh.provo.novell.com>
 <ae7b71fa-1493-a61e-1235-90fed2a926e7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ae7b71fa-1493-a61e-1235-90fed2a926e7@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>, George Dunlap <george.dunlap@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAzLjE4IGF0IDE3OjMwLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwMy8wOS8yMDE4IDA0OjI1IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24g
MDkuMDMuMTggYXQgMTc6MTcsIDxvbGFmQGFlcGZsZS5kZT4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4v
aW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21j
dGwuaAo+Pj4gQEAgLTEzNyw2ICsxMzcsOCBAQCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5f
ZG9tY3RsX2dldGRvbWFpbmluZm9fdCk7Cj4+PiAgI2RlZmluZSBYRU5fRE9NQ1RMX1BGSU5GT19C
Uk9LRU4gICgweGRVPDwyOCkgLyogYnJva2VuIHBhZ2UgKi8KPj4+ICAjZGVmaW5lIFhFTl9ET01D
VExfUEZJTkZPX0xUQUJfTUFTSyAoMHhmVTw8MjgpCj4+PiAgCj4+PiArI2RlZmluZSBYRU5fR0VU
UEFHRUZSQU1FSU5GTzNfTUFYX1NJWkUgMTAyNFUKPj4gCj4+IFRoaXMgaXMgYW4gaW1wbGVtZW50
YXRpb24gZGV0YWlsOyBpdCBzaG91bGRuJ3QgYmUgbWFkZSBwYXJ0IG9mIHRoZQo+PiBwdWJsaWMg
aW50ZXJmYWNlLiBJZiB0aGVyZSdzIGEgbmVlZCBmb3IgdXNlciBsYW5kIHRvIGtub3cgdGhlIHZh
bHVlLAo+PiBhbmQgaWYgdGhlcmUncyBjdXJyZW50bHkgbm8gd2F5IHRvIHF1ZXJ5IGl0LCB0aGF0
J3Mgd2hhdCB5b3UKPj4gd291bGQgd2FudCB0byBhZGQuCj4gCj4gQnV0IHRoZSBkb21jdGwgaW50
ZXJmYWNlIGlzbid0IHN0YWJsZSwgcmlnaHQ/ICBUaGVyZSdzIG5vIG5lZWQgdG8gbWFrZSBhCj4g
ZmxleGlibGUgYmFja3dhcmRzLWNvbXBhdGlibGUgaW50ZXJmYWNlIGJldHdlZW4gbGlieGMgYW5k
IFhlbjsgc2hhcmluZyBhCj4gI2RlZmluZSBzaG91bGQgYmUgZmluZSwgYXMgbG9uZyBhcyB0aGVy
ZSdzIG9ubHkgb25lIHBsYWNlIHRvIGNoYW5nZSBpdC4KCldlbGwsIHN0cmljdGx5IHNwZWFraW5n
IHRoaXMgaXMgYW4gb3B0aW9uLiBCdXQgSSB3b3VsZCBwcmVmZXIgaWYgd2UgZGlkbid0CmFidXNl
IHRoZSAiaXMgbm90IGEgc3RhYmxlIGludGVyZmFjZSIgcHJvcGVydHksIHdoaWNoIHRoaXMgY2hh
bmdlcwpmZWVscyBsaWtlIGl0IHdvdWxkLiAKCkZ1cnRoZXJtb3JlIGl0IGhhc24ndCBiZWNvbWUg
Y2xlYXIgdG8gbWUgd2h5LCBpZiB0aGlzIGhhcmQgY29kZWQKbnVtYmVyIGlzIGRlZW1lZCBhIHBy
b2JsZW0sIHdlIGRvbid0IGdldCByaWQgb2YgaXQgYWx0b2dldGhlci4KRG9tY3RsLXMgaGF2ZSBs
b25nIGdhaW5lZCB0aGUgYWJpbGl0eSB0byBiZSBwcmVlbXB0aWJsZSAtIHRoZXJlCnZhcmlvdXMg
ZXhhbXBsZXMuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
