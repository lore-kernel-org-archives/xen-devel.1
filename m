From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2] x86/vtd: fix IOMMU share PT destruction
 path
Date: Thu, 11 Oct 2018 08:30:59 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BDE4CF5@SHSMSX101.ccr.corp.intel.com>
References: <20181009145708.23976-1-wei.liu2@citrix.com>
 <20181011082731.2geggfypuq4vquzj@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rfni=mx=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gAWNP-0008FZ-6H
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 08:31:23 +0000
In-Reply-To: <20181011082731.2geggfypuq4vquzj@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBXZWkgTGl1IFttYWlsdG86d2VpLmxpdTJAY2l0cml4LmNvbV0KPiBTZW50OiBUaHVy
c2RheSwgT2N0b2JlciAxMSwgMjAxOCA0OjI4IFBNCj4gCj4gT24gVHVlLCBPY3QgMDksIDIwMTgg
YXQgMDM6NTc6MDhQTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPiA+IENvbW1pdCAyOTE2OTUxYzEg
KCJtbSAvIGlvbW11OiBpbmNsdWRlIG5lZWRfaW9tbXUoKSB0ZXN0IGluCj4gPiBpb21tdV91c2Vf
aGFwX3B0KCkiKSBpbmNsdWRlZCBuZWVkX2lvbW11KCkgaW4gaW9tbXVfdXNlX2hhcF9wdAo+IGFu
ZAo+ID4gOTFkNGVjYTdhZGQgKCJtbSAvIGlvbW11OiBzcGxpdCBuZWVkX2lvbW11KCkgaW50byBo
YXNfaW9tbXVfcHQoKQo+IGFuZAo+ID4gbmVlZF9pb21tdV9wdF9zeW5jKCkiKSBtYWRlIHRoaW5n
cyBmaW5lciBncmFpbiBieSBzcGxpdGluZyBuZWVkX2lvbW11Cj4gPiBpbnRvIHRocmVlIHN0YXRl
cy4KPiA+Cj4gPiBUaGUgZGVzdHJ1Y3Rpb24gcGF0aCBjYW4ndCB1c2UgaW9tbXVfdXNlX2hhcF9w
dCBiZWNhdXNlIGF0IHRoZSBwb2ludAo+ID4gcGxhdGZvcm0gb3AgaXMgY2FsbGVkLCBJT01NVSBp
cyBlaXRoZXIgYWxyZWFkeSBzd2l0Y2hlZCB0byBvciBoYXMKPiA+IGFsd2F5cyBiZWVuIGluIGRp
c2FibGVkIHN0YXRlLCBhbmQgdGhlIHNoYXJlZCBQVCB0ZXN0IHdvdWxkIGFsd2F5cyBiZQo+ID4g
ZmFsc2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KPiAKPiBLZXZpbiwgY2FuIHlvdSBhY2svbmFjayB0aGlzIHBhdGNoPyBTdGFnaW5nIGlzIGN1
cnJlbnRseSBibG9ja2VkIGJ5IGEKPiBidWcgd2hpY2ggaXMgZml4ZWQgYnkgdGhpcyBwYXRjaC4K
PiAKClNvcnJ5IEkgdGhvdWdodCBJJ3ZlIHNlbnQgdGhlIGFjayBidXQgbG9va3Mgbm90OgoKQWNr
ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKVGhhbmtzCktldmluCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
