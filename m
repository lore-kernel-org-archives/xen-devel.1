From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86/vtd: fix IOMMU share PT destruction
 path
Date: Thu, 11 Oct 2018 09:32:29 +0100
Message-ID: <20181011083229.b3q74zegdfr6jdum@zion.uk.xensource.com>
References: <20181009145708.23976-1-wei.liu2@citrix.com>
 <20181011082731.2geggfypuq4vquzj@zion.uk.xensource.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BDE4CF5@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pv6e=mx=citrix.com=prvs=815dbdced=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gAWOb-0008Kj-VB
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 08:32:37 +0000
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19BDE4CF5@SHSMSX101.ccr.corp.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBPY3QgMTEsIDIwMTggYXQgMDg6MzA6NTlBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBXZWkgTGl1IFttYWlsdG86d2VpLmxpdTJAY2l0cml4LmNvbV0KPiA+IFNl
bnQ6IFRodXJzZGF5LCBPY3RvYmVyIDExLCAyMDE4IDQ6MjggUE0KPiA+IAo+ID4gT24gVHVlLCBP
Y3QgMDksIDIwMTggYXQgMDM6NTc6MDhQTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPiA+ID4gQ29t
bWl0IDI5MTY5NTFjMSAoIm1tIC8gaW9tbXU6IGluY2x1ZGUgbmVlZF9pb21tdSgpIHRlc3QgaW4K
PiA+ID4gaW9tbXVfdXNlX2hhcF9wdCgpIikgaW5jbHVkZWQgbmVlZF9pb21tdSgpIGluIGlvbW11
X3VzZV9oYXBfcHQKPiA+IGFuZAo+ID4gPiA5MWQ0ZWNhN2FkZCAoIm1tIC8gaW9tbXU6IHNwbGl0
IG5lZWRfaW9tbXUoKSBpbnRvIGhhc19pb21tdV9wdCgpCj4gPiBhbmQKPiA+ID4gbmVlZF9pb21t
dV9wdF9zeW5jKCkiKSBtYWRlIHRoaW5ncyBmaW5lciBncmFpbiBieSBzcGxpdGluZyBuZWVkX2lv
bW11Cj4gPiA+IGludG8gdGhyZWUgc3RhdGVzLgo+ID4gPgo+ID4gPiBUaGUgZGVzdHJ1Y3Rpb24g
cGF0aCBjYW4ndCB1c2UgaW9tbXVfdXNlX2hhcF9wdCBiZWNhdXNlIGF0IHRoZSBwb2ludAo+ID4g
PiBwbGF0Zm9ybSBvcCBpcyBjYWxsZWQsIElPTU1VIGlzIGVpdGhlciBhbHJlYWR5IHN3aXRjaGVk
IHRvIG9yIGhhcwo+ID4gPiBhbHdheXMgYmVlbiBpbiBkaXNhYmxlZCBzdGF0ZSwgYW5kIHRoZSBz
aGFyZWQgUFQgdGVzdCB3b3VsZCBhbHdheXMgYmUKPiA+ID4gZmFsc2UuCj4gPiA+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiAKPiA+IEtldmlu
LCBjYW4geW91IGFjay9uYWNrIHRoaXMgcGF0Y2g/IFN0YWdpbmcgaXMgY3VycmVudGx5IGJsb2Nr
ZWQgYnkgYQo+ID4gYnVnIHdoaWNoIGlzIGZpeGVkIGJ5IHRoaXMgcGF0Y2guCj4gPiAKPiAKPiBT
b3JyeSBJIHRob3VnaHQgSSd2ZSBzZW50IHRoZSBhY2sgYnV0IGxvb2tzIG5vdDoKPiAKPiBBY2tl
ZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpUaGFuayB5b3UhCgpXZWku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
