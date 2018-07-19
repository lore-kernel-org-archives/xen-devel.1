From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] VMX: fix vmx_{find,del}_msr() build
Date: Thu, 19 Jul 2018 01:43:11 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19126FC66@SHSMSX101.ccr.corp.intel.com>
References: <5B4CCBD302000078001D4907@prv1-mh.provo.novell.com>
 <20180718093635.6xj53gmrpezy5p2t@citrix.com>
 <5B4F0AC802000078001D552B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vdwy=kd=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1ffxyQ-0001pn-J8
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 01:43:18 +0000
In-Reply-To: <5B4F0AC802000078001D552B@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFdl
ZG5lc2RheSwgSnVseSAxOCwgMjAxOCA1OjM5IFBNCj4gCj4gPj4+IE9uIDE4LjA3LjE4IGF0IDEx
OjM2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiBPbiBNb24sIEp1bCAxNiwgMjAx
OCBhdCAxMDo0NjoxMUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+PiBGb3IgYSByZWFz
b24gdGhhdCBJIGNhbid0IGV4cGxhaW4sIGl0IGlzIG9ubHkgdGhlIHNoaW0gYnVpbGQgdGhhdCBm
YWlscwo+ID4+IGZvciBtZSB3aXRoIGFuIG9sZGVyIGdjYyBkdWUgdG8gdGhlIGNvbXBpbGVyIG5v
dCByZWNvZ25pemluZyB0aGF0Cj4gPj4gYXBwYXJlbnRseSB1bmluaXRpYWxpemVkIHZhcmlhYmxl
cyBhcmVuJ3QgcmVhbGx5IHVuaW5pdGlhbGl6ZWQuIFB1bGwgb3V0Cj4gPj4gdGhlIGFzc2lnbm1l
bnRzIHVzZWQgYnkgdHdvIG9mIHRoZSB0aHJlZSBjYXNlIGJsb2NrcyBhbmQgbWFrZSB0aGVtCj4g
Pj4gaW5pdGlhbGl6ZXJzIG9mIHRoZSB2YXJpYWJsZXMsIGFzIEkgdGhpbmsgSSBoYWQgc3VnZ2Vz
dGVkIGR1cmluZyByZXZpZXcuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gPgo+ID4gQ29kZToKPiA+Cj4gPiBSZXZpZXdlZC1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+Cj4gPiBCdXQgcGxlYXNlIHVwZGF0ZSB0aGUg
Y29tbWl0IG1lc3NhZ2UgdG8gc2F5IGl0IGlzIGNhdXNlZCBieSBjb21waWxlcgo+ID4gb3B0aW1p
c2F0aW9uIGxldmVsLgo+IAo+IFN1cmUsIG5vdyB0aGF0IGl0J3MgY2xlYXIgd2hhdCB0aGUgcmVh
c29uIGlzLiBJdCBub3cgcmVhZHM6Cj4gCj4gT2xkZXIgZ2NjIGF0IC1PMiAoYW5kIHBlcmhhcHMg
aGlnaGVyKSBkb2VzIG5vdCByZWNvZ25pemUgdGhhdCBhcHBhcmVudGx5Cj4gdW5pbml0aWFsaXpl
ZCB2YXJpYWJsZXMgYXJlbid0IHJlYWxseSB1bmluaXRpYWxpemVkLiBQdWxsIG91dCB0aGUKPiBh
c3NpZ25tZW50cyB1c2VkIGJ5IHR3byBvZiB0aGUgdGhyZWUgY2FzZSBibG9ja3MgYW5kIG1ha2Ug
dGhlbQo+IGluaXRpYWxpemVycyBvZiB0aGUgdmFyaWFibGVzLCBhcyBJIHRoaW5rIEkgaGFkIHN1
Z2dlc3RlZCBkdXJpbmcgcmV2aWV3Lgo+IAoKQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRp
YW5AaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
