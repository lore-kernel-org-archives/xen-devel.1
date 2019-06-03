From: chenbaodong <chenbaodong@mxnavi.com>
Subject: Re: [PATCH] xen: put cpupool's member 'n_dom' after
 'cpupool_id'
Date: Mon, 3 Jun 2019 18:06:17 +0800
Message-ID: <2e9898ab-d413-bdca-ecd4-102929d27ad8@mxnavi.com>
References: <9df204f9ae2cc9c80a6afde5ea82cb27@sslemail.net>
 <f3dbafae-4865-5233-3c8f-ede397c5f293@arm.com>
 <49547fa1-b1a9-55d8-68b4-d91ef35ce921@mxnavi.com>
 <3c06a4f6-b2f0-1298-b17f-a311fa4e7b67@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXjrE-00069W-Vd
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 10:06:25 +0000
In-Reply-To: <3c06a4f6-b2f0-1298-b17f-a311fa4e7b67@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDYvMy8xOSAxNzozMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+Cj4gT24gMDMvMDYv
MjAxOSAwMjo0OCwgY2hlbmJhb2Rvbmcgd3JvdGU6Cj4+Cj4+IE9uIDUvMzEvMTkgMTg6NTIsIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDUvMzEvMTkgNDoxOCBBTSwgQmFv
ZG9uZyBDaGVuIHdyb3RlOgo+Pj4+IFRodXMsIHNpemVvZihzdHJ1Y3QgY3B1cG9vbCkgd2lsbCBz
YXZlIDggYnl0ZXMgZm9yIDY0LWJpdCBzeXN0ZW0uCj4+Pgo+Pj4gSSBhbSBoYXBweSB3aXRoIHRo
ZSBjaGFuZ2UsIGFsdGhvdWdoIEFGQUlLIGNwdXBvb2wgaXMgbm90IAo+Pj4gaW5zdGFudGlhdGVk
IHRoYXQgb2Z0ZW4uIEFyZSB5b3UgcGxhbm5pbmcgdG8gaGF2ZSBtb3JlIGluc3RhbnRpYXRpb24g
Cj4+PiBvZiBpdD8KPj4+Cj4+PiBDaGVlcnMsCj4+Pgo+PiBObywgSSdtIG5vdCBwbGFubmluZyB0
byBjcmVhdGUgbG90cyBvZiBjcHVwb29sIGluc3RhbmNlLgo+Pgo+PiBJJ20gc3R1ZHlpbmcgeGVu
IGZvciBhIGZldyB3ZWVrcyBhbmQgbXkgcGxhbiBpczoKPj4KPj4gcnVuIHhlbiBmb3IgZW1iZWRl
ZCBhdXRvbW90aXZlIHVzZSBjYXNlIHdpdGggZG9tMGxlc3MsIG51bGwgCj4+IHNjaGVkdWxlciwg
c21hbGwgY29kZSBiYXNlIGZvciBzYWZldHkgY2VydGlmaWVkIG1heWJlIGEgcGx1cyhub3Qgc3Vy
ZSAKPj4gd2hldGhlciBjYW4gZG8gdGhpcykuCj4KPiBGV0lXLCB0aGVyZSBhcmUgZGlzY3Vzc2lv
biB0byBnZXQgWGVuIHNhZmV0eSBjZXJ0aWZpZWQuIFRoZXkgYXJlIAo+IGNhcHR1cmVkIG9uIFsx
XS4KPgo+IENoZWVycywKPgo+IFsxXSAKPiBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lr
aS9DYXRlZ29yeTpTYWZldHlfQ2VydGlmaWNhdGlvbi9GdVNhX1NJRwoKSGVsbG8gSnVsaWVuLCBU
aGFua3MgZm9yIHlvdXIgaW5mby4KCkkgd2lsbCBmb2xsb3cgdGhlIHdpa2kgbGluayBhbmQgc2Vl
IHdoYXQgaSBjYW4gZG8gYWJvdXQgc2FmZXR5IApjZXJ0aWZpY2F0aW9uLgoKPgo+Pgo+Pgo+Pj4+
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29t
Pgo+Pj4+IC0tLQo+Pj4+IMKgIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIHwgMiArLQo+Pj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+
Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIGIveGVuL2luY2x1ZGUv
eGVuL3NjaGVkLWlmLmgKPj4+PiBpbmRleCA5MmJjN2EwLi5mMGNmMjEwIDEwMDY0NAo+Pj4+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmgKPj4+PiBAQCAtMjEzLDkgKzIxMyw5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBz
Y2hlZF9mcmVlX2RvbWRhdGEoY29uc3QgCj4+Pj4gc3RydWN0IHNjaGVkdWxlciAqcywKPj4+PiDC
oCBzdHJ1Y3QgY3B1cG9vbAo+Pj4+IMKgIHsKPj4+PiDCoMKgwqDCoMKgIGludMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNwdXBvb2xfaWQ7Cj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnTCoMKg
wqDCoCBuX2RvbTsKPj4+PiDCoMKgwqDCoMKgIGNwdW1hc2tfdmFyX3TCoMKgwqAgY3B1X3ZhbGlk
O8KgwqDCoMKgwqAgLyogYWxsIGNwdXMgYXNzaWduZWQgdG8gcG9vbCAqLwo+Pj4+IMKgwqDCoMKg
wqAgc3RydWN0IGNwdXBvb2zCoMKgICpuZXh0Owo+Pj4+IC3CoMKgwqAgdW5zaWduZWQgaW50wqDC
oMKgwqAgbl9kb207Cj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3Qgc2NoZWR1bGVyICpzY2hlZDsKPj4+
PiDCoMKgwqDCoMKgIGF0b21pY190wqDCoMKgwqDCoMKgwqDCoCByZWZjbnQ7Cj4+Pj4gwqAgfTsK
Pj4+Pgo+Pj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
