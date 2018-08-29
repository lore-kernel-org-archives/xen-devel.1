From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] x86/alt: Fix build when CONFIG_LIVEPATCH is
 disabled
Date: Wed, 29 Aug 2018 09:25:30 -0400
Message-ID: <20180829132530.GA7598@char.us.oracle.com>
References: <1535540222-11439-1-git-send-email-andrew.cooper3@citrix.com>
 <20180829131512.wt7wngejcrfs52tb@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180829131512.wt7wngejcrfs52tb@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjksIDIwMTggYXQgMDI6MTU6MTJQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIEF1ZyAyOSwgMjAxOCBhdCAxMTo1NzowMkFNICswMTAwLCBBbmRyZXcgQ29vcGVy
IHdyb3RlOgo+ID4gYy9zIGIyOGNkMjFjMzYyOCAieDg2L2J1aWxkOiBVc2UgbmV3IC5ub3BzIGRp
cmVjdGl2ZSB3aGVuIGF2YWlsYWJsZSIKPiA+IGludHJvZHVjZWQgYSBfX3JlYWRfbW9zdGx5IGJv
b2xlYW4gd2hpY2ggaXMgaW5jbHVkZWQgaWYgdGhlIHRvb2xjaGFpbiBzdXBwb3J0cwo+ID4gdGhl
IC5ub3BzIGRpcmVjdGl2ZS4KPiA+IAo+ID4gV2hlbiBDT05GSUdfTElWRVBBVENIIGlzIGNvbXBp
bGVkIG91dCwgYWx0ZXJuYXRpdmUubyBpcyBleHBlY3RlZCB0byBiZSBhIGZ1bGx5Cj4gPiBpbml0
IG1vZHVsZSwgYW5kIHRvb2xjaGFpbl9ub3BzX2FyZV9pZGVhbCB0cmlwcyB0aGUgYnVpbGQgc3lz
dGVtIGNoZWNrOgo+ID4gCj4gPiAgIEVycm9yOiBzaXplIG9mIGFsdGVybmF0aXZlLm86LmRhdGEu
cmVhZF9tb3N0bHkgaXMgMHgwMQo+ID4gICAvbG9jYWwveGVuLmdpdC94ZW4vUnVsZXMubWs6MjA2
OiByZWNpcGUgZm9yIHRhcmdldCAnYWx0ZXJuYXRpdmUuaW5pdC5vJyBmYWlsZWQKPiA+ICAgbWFr
ZVszXTogKioqIFthbHRlcm5hdGl2ZS5pbml0Lm9dIEVycm9yIDEyCj4gPiAKPiA+IEludHJvZHVj
ZSBpbml0X29yX2xpdmVwYXRjaF9yZWFkX21vc3RseSBhbmQgc3dpdGNoIHRoZSBhbm5vdGF0aW9u
IGZvcgo+ID4gdG9vbGNoYWluX25vcHNfYXJlX2lkZWFsLgo+ID4gCj4gPiBSZXBvcnRlZC1ieTog
T2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCgpSZXZpZXdlZC1ieTogS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgoKVGhhbmsgeW91IQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
