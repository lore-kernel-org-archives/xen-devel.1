From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v3 03/14] x86/cpu/vpmu: Add Hygon Dhyana and
 AMD Zen support for vPMU
Date: Wed, 27 Mar 2019 18:08:55 +0800
Message-ID: <3443a6b7-c8ea-3618-a8c8-4efc0a6d09bf@hygon.cn>
References: <cover.1553520193.git.puwen@hygon.cn>
 <babf13f907b9b85afe40cdffce4ee2cf17f67f11.1553520193.git.puwen@hygon.cn>
 <5C9A4EFD0200007800221FAC@prv1-mh.provo.novell.com>
 <54bb7b55-1d3c-5a36-d8f8-28be62f93635@hygon.cn>
 <5C9B365F020000780022211F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Vk7p=R6=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1h95Zb-0005y6-Cr
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 10:14:19 +0000
In-Reply-To: <5C9B365F020000780022211F@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS8zLzI3IDE2OjM4LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyNy4wMy4xOSBhdCAw
OToxNiwgPHB1d2VuQGh5Z29uLmNuPiB3cm90ZToKPj4gT24gMjAxOS8zLzI3IDA6MTAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4gT24gMjUuMDMuMTkgYXQgMTQ6MzAsIDxwdXdlbkBoeWdvbi5jbj4g
d3JvdGU6Cj4+Pj4gKyAgICBkZWZhdWx0Ogo+Pj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfV0FS
TklORyAiVlBNVTogVW5zdXBwb3J0ZWQgQ1BVIGZhbWlseSAlI3hcbiIsCj4+Pj4gKyAgICAgICAg
ICAgICAgIGN1cnJlbnRfY3B1X2RhdGEueDg2KTsKPj4+PiArICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPj4+PiAgICAgICAgfQo+Pj4KPj4+IFdoaWxlIEknbSBub3QgZ29pbmcgdG8gaW5zaXN0IGlu
IGNhc2VzIHdoZXJlIHlvdSBhZGQgdG8gZXhpc3RpbmcKPj4+IHN3aXRjaCgpLWVzIHdoaWNoIGxh
Y2sgc3VjaCBibGFuayBsaW5lcywgcGxlYXNlIGFkZCBhIGJsYW5rIGxpbmUKPj4+IGJldHdlZW4g
dGhlIGNhc2UgYmxvY2tzIGhlcmUuIFlldCB0aGVuIGFnYWluIEkgd29uZGVyIHdoZXRoZXIKPj4+
IHRoZSBkZWZhdWx0IGNhc2Ugd291bGRuJ3QgYmV0dGVyIG1vdmUgaW50byB0aGUgc2hhcmVkIGZ1
bmN0aW9uCj4+PiBhcyB3ZWxsLCBrZXlpbmcgb2ZmIG9mIGUuZy4gbnVtX2NvdW50ZXJzIHN0aWxs
IGJlaW5nIHplcm8uCj4+Cj4+IFRoZW4gYXMgdGhlcmUgaXMgb25seSBvbmUgY2FzZSBpbiBoeWdv
bl92cG11X2luaXQoKSwgaG93IGFib3V0IHJlbW92ZQo+PiBzd2l0Y2goKS1lcyBpbiB0aGlzIGZ1
bmN0aW9uPwo+IAo+IFdlbGwsIHBlcnNvbmFsbHkgSSdkIHByZWZlciB0byBrZWVwIHRoZSBzd2l0
Y2goKSwgYXMgdGhhdCB3aGF0J3MKPiBnb2luZyB0byBiZSBuZWVkZWQgb25jZSB5b3UgaW50cm9k
dWNlIGEgc2Vjb25kIG1vZGVsLCBidXQgSQo+IHdvbid0IGluc2lzdC4KCktlZXBpbmcgdGhlIHN3
aXRjaCgpIGlzIGFsc28gZmluZSB0byBtZS4KCi0tIApSZWdhcmRzLApQdSBXZW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
