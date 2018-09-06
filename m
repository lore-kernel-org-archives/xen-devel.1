From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 07/16] x86/p2m/pod: make it build with
 !CONFIG_HVM
Date: Thu, 6 Sep 2018 16:30:08 +0100
Message-ID: <d4be0ade-6d5b-5413-bde3-7982bfd01c17@citrix.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-8-wei.liu2@citrix.com>
 <0ffaa5f9-917c-677e-d9b3-e34e1b6d76f8@arm.com>
 <20180906105758.4bym7cj353m3wqjo@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tntk=lu=citrix.com=prvs=7808f5c86=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fxwEX-0002Ds-6W
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 15:30:13 +0000
In-Reply-To: <20180906105758.4bym7cj353m3wqjo@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDYvMjAxOCAxMTo1NyBBTSwgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIFNlcCAwNCwg
MjAxOCBhdCAwNjoyNDoyOFBNICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIFdlaSwK
Pj4KPj4gT24gMDkvMDQvMjAxOCAwNToxNSBQTSwgV2VpIExpdSB3cm90ZToKPj4+IFBvcHVsYXRl
LW9uLWRlbWFuZCBpcyBIVk0gb25seS4KPj4+Cj4+PiBQcm92aWRlIGEgYnVuY2ggb2Ygc3R1YnMg
Zm9yIGNvbW1vbiBwMm0gY29kZSBhbmQgZ3VhcmQgb25lIGludm9jYXRpb24KPj4+IG9mIGd1ZXN0
X3BoeXNtYXBfbWFya19wb3B1bGF0ZV9vbl9kZW1hbmQgd2l0aCBpc19odm1fZG9tYWluLgo+Pj4K
Pj4+IFB1dCByZWxldmFudCBmaWVsZHMgaW4gcDJtX2RvbWFpbiBhbmQgY29kZSB3aGljaCB0b3Vj
aGVzIHRob3NlIGZpZWxkcwo+Pj4gdW5kZXIgQ09ORklHX0hWTS4KPj4KPj4gQXJtIGRvZXMgbm90
IGhhdmUgYW55IFBPRCBzdXBwb3J0LiBXb3VsZCBpdCBiZSB3b3J0aCB0byBpbnRyb2R1Y2UgYQo+
PiBDT05GSUdfSEFTX1BPRCB0byBhdm9pZCBkdW1teSBmdW5jdGlvbiBvbiBBcm0/Cj4gCj4gVGhh
dCBzb3VuZHMgZmluZS4gVGhpcyB3aWxsIGhhdmUgdGhlIGVmZmVjdCBvZiBub3QgY29tcGlsaW5n
IFBvRCBvbiBBcm0KPiBhdCBhbGwsIHdoaWNoIGlzIGdvb2QuCgpBbm90aGVyIGFkdmFudGFnZSBv
ZiBDT05GSUdfSEFTX1BPRCBpcyB0aGF0IGl0IHdvdWxkIG1ha2UgaXQgZWFzaWVyIGF0CnNvbWUg
bGF0ZXIgcG9pbnQgdG8gY29tcGlsZSBvdXQsIGlmIHdlIGRlY2lkZWQgdGhhdCB3YXMgd29ydGgg
ZG9pbmcgLS0gSQp3YXMgZ29pbmcgdG8gc3VnZ2VzdCBpdCBqdXN0IHNvIGFzIG5vdCB0byBsb3Nl
IHRoZSAiaW5mb3JtYXRpb24iIGFscmVhZHkKY29udGFpbmVkIGluIHRoaXMgcGF0Y2ggYXMgd2hl
cmUgYWxsIHRoZSBQb0QtcmVsYXRlZCBjb2RlIHdhcy4KCiAtR2VvcmdlCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
