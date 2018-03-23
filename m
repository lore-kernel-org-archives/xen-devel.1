From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3a 14/39] ARM: new VGIC: Add GICv2 world
 switch backend
Date: Fri, 23 Mar 2018 00:49:37 +0000
Message-ID: <0fbc56a8-cf29-f981-3218-ea87597677bf@arm.com>
References: <20180322115649.5283-1-andre.przywara@linaro.org>
 <20180322115649.5283-3-andre.przywara@linaro.org>
 <c26e3506-e1aa-11cb-3757-7c66b6cf69e2@arm.com>
 <7557bce4-48dc-5fae-1530-ee4251a5b2ad@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0ldl=gn=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ezAts-0007xs-CL
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 00:49:44 +0000
In-Reply-To: <7557bce4-48dc-5fae-1530-ee4251a5b2ad@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMy8yMi8yMDE4IDAzOjEyIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBIaSwK
PiAKPiBPbiAyMi8wMy8xOCAxNDowNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBBbmRyZSwK
Pj4KPj4gT24gMDMvMjIvMjAxOCAxMTo1NiBBTSwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgLyogVGhlIGxvY2tpbmcgb3JkZXIgZm9yY2VzIHVzIHRvIGRyb3AgYW5k
IHJlLXRha2UgdGhlIGxvY2tzCj4+PiBoZXJlLiAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICgg
aXJxLT5odyApCj4+PiArwqDCoMKgwqDCoMKgwqAgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3Bpbl91bmxvY2soJmlycS0+aXJxX2xvY2spOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGVzYyA9IGlycV90b19kZXNjKGlycS0+aHdpbnRpZCk7Cj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzcGluX2xvY2soJmRlc2MtPmxvY2spOwo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc3Bpbl9sb2NrKCZpcnEtPmlycV9sb2NrKTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC8qIFRoaXMgaC93IElSUSBzaG91bGQgc3RpbGwgYmUgYXNzaWduZWQgdG8g
dGhlIHZpcnR1YWwKPj4+IElSUS4gKi8KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFTU0VS
VChpcnEtPmh3ICYmIGRlc2MtPmlycSA9PSBpcnEtPmh3aW50aWQpOwo+Pj4gKwo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaGF2ZV9kZXNjX2xvY2sgPSB0cnVlOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIH0KPj4KPj4gSSBhbSBhIGJpdCBjb25jZXJuZWQgb2YgdGhpcyBkYW5jZSBpbiBmb2xkX2xy
X3N0YXRlKCkuIFRoaXMgbG9va3MKPj4gYXdmdWxseSBjb21wbGV4IGJ1dCBJIGRvbid0IGhhdmUg
YmV0dGVyIHNvbHV0aW9uIGhlcmUuCj4gCj4gSSBhZ3JlZS4KCkkgc3RpbGwgaGF2ZSBtdWNoIGlk
ZWEgaG93IHRvIHNvbHZlIHRoYXQgbmljZWx5LiBNYXliZSBTdGVmYW5vIGhhcz8KCk1lYW53aGls
ZSwgSSB3b3VsZCBiZSBoYXBweSB0byBnZXQgdGhhdCBpbiBYZW46CgpBY2tlZC1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbS4KCj4gCj4+IEkgd2lsbCBoYXZlIGEgdGhpbmsg
ZHVyaW5nIHRoZSBuaWdodC4KPj4KPj4gSG93ZXZlciwgdGhpcyBpcyBub3QgZ29pbmcgdG8gc29s
dmUgdGhlIHJhY2UgY29uZGl0aW9uIEkgbWVudGlvbmVkCj4+IGJldHdlZW4gY2xlYXJpbmcgX0lS
UV9JTlBST0dSRVNTIGhlcmUgYW5kIHNldHRpbmcgX0lSUV9JTlBST0dSRVNTIGluCj4+IGRvX0lS
US4gVGhpcyBpcyBiZWNhdXNlIHlvdSBkb24ndCBrbm93IHRoZSBvcmRlciB0aGV5IGFyZSBnb2lu
ZyB0byBiZQo+PiBleGVjdXRlZC4KPj4KPj4gSSB3YW50ZWQgdG8gbWFrZSBzdXJlIHlvdSBkaWRu
J3QgaW50ZW5kIHRvIHNvbHZlIHRoYXQgb25lLiBBbSBJIGNvcnJlY3Q/Cj4gCj4gVGhpcyBpcyBy
aWdodCwgdGhpcyBpcyBvcnRob2dvbmFsIGFuZCBub3QgYWRkcmVzc2VkIGJ5IHRoaXMgcGF0Y2gu
IEkKPiBoYXZlIGEgaHVuY2ggd2UgbmVlZCB0byBzb2x2ZSB0aGlzIGluIGlycS5jIGluc3RlYWQu
CgpJIGd1ZXNzIHRoaXMgc2hvdWxkIGJlIGxvZ2dlZCBvbiBKaXJhIHdpdGggdGhlIHJlc3Qgb2Yg
dGhlIG9wZW4gaXRlbXMuCgo+IAo+IENoZWVycywKPiBBbmRyZS4KPiAKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
