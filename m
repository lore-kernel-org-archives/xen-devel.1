From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 00/10] arm: add one kconfig option per
 platform
Date: Tue, 28 Aug 2018 17:44:26 +0100
Message-ID: <91d83221-1877-e069-f503-f7702fbeda6a@arm.com>
References: <alpine.DEB.2.10.1808231631270.14449@sstabellini-ThinkPad-X260>
 <76a28ae9-516c-4120-dbcc-55494831ce92@arm.com>
 <alpine.DEB.2.10.1808241235310.14449@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ec/y=ll=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fuh6V-0002wM-5Q
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 16:44:31 +0000
In-Reply-To: <alpine.DEB.2.10.1808241235310.14449@sstabellini-ThinkPad-X260>
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
Cc: xen-devel@lists.xenproject.org, andrii_anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNC8wOC8xOCAyMDozOCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIEZy
aSwgMjQgQXVnIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMjQvMDgvMTggMDA6MzMs
IFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IEhpIGFsbCwKPj4KPj4gSGksCj4+Cj4+Pgo+
Pj4gVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBvbmUga2NvbmZpZyBvcHRpb24gZm9yIGVh
Y2ggcmVtYWluZwo+Pj4gcGxhdGZvcm0gdW5kZXIgcGxhdGZvcm1zLy4gIEVhY2gga2NvbmZpZyBv
cHRpb24gZW5hYmxlcyB0aGUgcmVxdWlyZWQKPj4+IGRyaXZlcnMgaW4gWGVuLgo+Pj4KPj4+IENo
ZWVycywKPj4+Cj4+PiBTdGVmYW5vCj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+IC0gcmVtb3Zl
IGFsbCBwbGF0Zm9ybSBvcHRpb25zIGV4Y2VwdCBmb3IgdGh1bmRlcngsIHN1bnhpLCByY2FyMiwg
b21hcDUKPj4KPj4gQXMgd2UgZGlzY3Vzc2VkIHllc3RlcmRheSwgSSB3b3VsZCByYXRoZXIgbm90
IGludHJvZHVjZSBwZXItcGxhdGZvcm0gY29uZmlnCj4+IHVudGlsIHdlIGhhdmUgYSByZWFsIHVz
ZS1jYXNlLgo+Pgo+PiBJdCBtYWtlcyBzZW5zZSB0byBoYXZlIGEgcGVyLXBsYXRmb3JtIGNvbmZp
ZyBmb3IgT21hcDUgYW5kIFJjYXIyLiBCdXQgSSBkb24ndAo+PiBzZWUgYSB1c2UtY2FzZSBmb3Ig
VGh1bmRlci1YL1N1bnhpLgo+IAo+IFRoZXJlIGlzIGFuIGFyZ3VtZW50IHRoYXQgVGh1bmRlci1Y
IGlzIGEgc2VydmVyIHBsYXRmb3JtLCBoZW5jZSwgdGhlcmUKPiBpcyBubyBuZWVkIHRvIGRvIGEg
dGFpbG9yZWQga2NvbmZpZyBmb3IgaXQuCj4gCj4gQnV0IEkgdGhpbmsgdGhhdCBTdW54aSB3b3Vs
ZCBiZSBuaWNlIHRvIGhhdmUgYXMgdGhlcmUgYXJlIHNldmVyYWwKPiBlbWJlZGRlZCBib2FyZHMg
b3V0IHRoZXJlIHVzaW5nIGl0LiBJIGtub3cgb2YgYSBmZXcgcGVvcGxlIHVzaW5nIFN1bnhpCj4g
ZW1iZWRkZWQgYm9hcmRzIHdpdGggWGVuIHRvZGF5IGluIHRoZWlyIGJ1c2luZXNzLgo+IAo+IFdo
YXQgaWYgSSByZW1vdmUgdGhlIFRodW5kZXItWCBzcGVjaWZpYyBvcHRpb24gYnV0IEkga2VlcCB0
aGUgU3VueGkKPiBvcHRpb24/CgpJIGd1ZXNzIEkgY291bGQgYmUgY29udmluY2VkIHdpdGggU3Vu
eGkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
