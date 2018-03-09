From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v1] getpageframeinfo3: replace hardcoded
 batchsize with constant
Date: Fri, 9 Mar 2018 16:30:43 +0000
Message-ID: <ae7b71fa-1493-a61e-1235-90fed2a926e7@citrix.com>
References: <20180309161720.17510-1-olaf@aepfle.de>
 <5AA2C39E02000078001B061D@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AA2C39E02000078001B061D@prv-mh.provo.novell.com>
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

T24gMDMvMDkvMjAxOCAwNDoyNSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDkuMDMu
MTggYXQgMTc6MTcsIDxvbGFmQGFlcGZsZS5kZT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRl
L3B1YmxpYy9kb21jdGwuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPj4g
QEAgLTEzNyw2ICsxMzcsOCBAQCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fZG9tY3RsX2dl
dGRvbWFpbmluZm9fdCk7Cj4+ICAjZGVmaW5lIFhFTl9ET01DVExfUEZJTkZPX0JST0tFTiAgKDB4
ZFU8PDI4KSAvKiBicm9rZW4gcGFnZSAqLwo+PiAgI2RlZmluZSBYRU5fRE9NQ1RMX1BGSU5GT19M
VEFCX01BU0sgKDB4ZlU8PDI4KQo+PiAgCj4+ICsjZGVmaW5lIFhFTl9HRVRQQUdFRlJBTUVJTkZP
M19NQVhfU0laRSAxMDI0VQo+IAo+IFRoaXMgaXMgYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsOyBp
dCBzaG91bGRuJ3QgYmUgbWFkZSBwYXJ0IG9mIHRoZQo+IHB1YmxpYyBpbnRlcmZhY2UuIElmIHRo
ZXJlJ3MgYSBuZWVkIGZvciB1c2VyIGxhbmQgdG8ga25vdyB0aGUgdmFsdWUsCj4gYW5kIGlmIHRo
ZXJlJ3MgY3VycmVudGx5IG5vIHdheSB0byBxdWVyeSBpdCwgdGhhdCdzIHdoYXQgeW91Cj4gd291
bGQgd2FudCB0byBhZGQuCgpCdXQgdGhlIGRvbWN0bCBpbnRlcmZhY2UgaXNuJ3Qgc3RhYmxlLCBy
aWdodD8gIFRoZXJlJ3Mgbm8gbmVlZCB0byBtYWtlIGEKZmxleGlibGUgYmFja3dhcmRzLWNvbXBh
dGlibGUgaW50ZXJmYWNlIGJldHdlZW4gbGlieGMgYW5kIFhlbjsgc2hhcmluZyBhCiNkZWZpbmUg
c2hvdWxkIGJlIGZpbmUsIGFzIGxvbmcgYXMgdGhlcmUncyBvbmx5IG9uZSBwbGFjZSB0byBjaGFu
Z2UgaXQuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
