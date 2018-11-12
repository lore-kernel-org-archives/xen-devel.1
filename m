From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC 09/16] xen/arm: p2m: Introduce a function to
 resolve translation fault
Date: Mon, 12 Nov 2018 17:59:58 +0000
Message-ID: <bada26b6-ca13-35eb-30aa-77356f114e4d@arm.com>
References: <20181008183352.16291-1-julien.grall@arm.com>
 <20181008183352.16291-10-julien.grall@arm.com>
 <alpine.DEB.2.10.1811021531060.18518@sstabellini-ThinkPad-X260>
 <ecb491ab-313d-de21-bc97-6e578aa6df77@arm.com>
 <alpine.DEB.2.10.1811050934140.18518@sstabellini-ThinkPad-X260>
 <21a4b3d5-b054-f215-2839-2a9f8fbaa01a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <21a4b3d5-b054-f215-2839-2a9f8fbaa01a@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andre.przywara@linaro.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDExLzYvMTggMjoyMCBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9u
IDA1LzExLzIwMTggMTc6NTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gT24gTW9uLCA1
IE5vdiAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAwMi8xMS8yMDE4IDIzOjI3LCBT
dGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+Pj4gT24gTW9uLCA4IE9jdCAyMDE4LCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4+Pj4KPj4+Pj4gK8KgwqDCoCAvKgo+Pj4+PiArwqDCoMKgwqAgKiBOb3cg
dGhhdCB0aGUgd29yayBvbiB0aGUgZW50cnkgaXMgZG9uZSwgc2V0IHRoZSB2YWxpZCBiaXQgdG8K
Pj4+Pj4gcHJldmVudAo+Pj4+PiArwqDCoMKgwqAgKiBhbm90aGVyIGZhdWx0IG9uIHRoYXQgZW50
cnkuCj4+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+PiArwqDCoMKgIHJlc29sdmVkID0gdHJ1ZTsKPj4+
Pj4gK8KgwqDCoCBlbnRyeS5wMm0udmFsaWQgPSAxOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgcDJt
X3dyaXRlX3B0ZSh0YWJsZSArIG9mZnNldHNbbGV2ZWxdLCBlbnRyeSwgcDJtLT5jbGVhbl9wdGUp
Owo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgLyoKPj4+Pj4gK8KgwqDCoMKgICogTm8gbmVlZCB0byBm
bHVzaCB0aGUgVExCcyBhcyB0aGUgbW9kaWZpZWQgZW50cnkgaGFkIHRoZSAKPj4+Pj4gdmFsaWQg
Yml0Cj4+Pj4+ICvCoMKgwqDCoCAqIHVuc2V0Lgo+Pj4+PiArwqDCoMKgwqAgKi8KPj4+Pj4gKwo+
Pj4+PiArb3V0X3VubWFwOgo+Pj4+PiArwqDCoMKgIHVubWFwX2RvbWFpbl9wYWdlKHRhYmxlKTsK
Pj4+Pj4gKwo+Pj4+PiArb3V0Ogo+Pj4+PiArwqDCoMKgIHAybV93cml0ZV91bmxvY2socDJtKTsK
Pj4+Pj4gKwo+Pj4+PiArwqDCoMKgIHJldHVybiByZXNvbHZlZDsKPj4+Pj4gK30KPj4+Pj4gKwo+
Pj4+PiDCoMKgIHN0YXRpYyBpbmxpbmUgaW50IHAybV9pbnNlcnRfbWFwcGluZyhzdHJ1Y3QgZG9t
YWluICpkLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ2ZuX3Qgc3RhcnRfZ2ZuLAo+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBuciwKPj4KPj4KPj4gV2UgcHJv
YmFibHkgd2FudCB0byB1cGRhdGUgdGhlIGNvbW1lbnQgb24gdG9wIG9mIHRoZSBjYWxsIHRvCj4+
IHAybV9yZXNvbHZlX3RyYW5zbGF0aW9uX2ZhdWx0Ogo+IAo+IFdob29wcy4gSSB3aWxsIGZpeCBp
dC4KCkxvb2tpbmcgYXQgdGhpcyBhZ2Fpbi4gSSB0aGluayB0aGUgY29tbWVudCBvbiB0b3Agb2Yg
dGhlIGNhbGwgdG8gCnAybV9yZXNvbHZlX3RyYW5zbGF0aW9uX2ZhdWx0IHN0aWxsIG1ha2VzIHNl
bnNlLiBGZWVsIGZyZWUgdG8gc3VnZ2VzdCBhbiAKdXBkYXRlIG9mIHRoZSBjb21tZW50IGlmIHlv
dSB0aGluayBpdCBpcyBub3QgZW5vdWdoLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
