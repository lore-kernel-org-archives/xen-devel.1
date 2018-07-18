From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] tools: fix dependency for ipxe and rombios
Date: Wed, 18 Jul 2018 11:09:39 +0100
Message-ID: <23375.4579.316890.202974@mariner.uk.xensource.com>
References: <20180717080706.23885-1-wei.liu2@citrix.com>
 <23373.49811.244852.311725@mariner.uk.xensource.com>
 <20180717104741.3iid7z5zspwza5an@citrix.com>
 <20180717105438.upld3g5yujcj5s6w@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ndva=kc=citrix.com=prvs=7304e4abf=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ffjOx-0007N9-NA
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 10:09:43 +0000
In-Reply-To: <20180717105438.upld3g5yujcj5s6w@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIXSB0b29sczogZml4IGRlcGVuZGVuY3kgZm9yIGlw
eGUgYW5kIHJvbWJpb3MiKToKPiBPbiBUdWUsIEp1bCAxNywgMjAxOCBhdCAxMTo0Nzo0MUFNICsw
MTAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gVHVlLCBKdWwgMTcsIDIwMTggYXQgMTE6MTg6NTlB
TSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiA+IFNvIEknbSBzb3JyeSB0byBzYXkgdGhh
dCBJIHRoaW5rIHRoZSBhbnN3ZXIgaXMgdG8gcmV2ZXJ0IDAxZDYzMTAyOGEwMgo+ID4gPiBhbmQg
dG8gcmVwbGFjZSBpdCB3aXRoIGEgcGF0Y2ggd2hpY2ggaW50cm9kdWNlcwo+ID4gPiAgICAtLXdp
dGgtaXB4ZT0vUEFUSAo+ID4gPiAgICAtLXdpdGgtaXB4ZSAgICAgICAgICBsaWtlIC0tZW5hYmxl
LWlweGUsIGJ1dCBhbHNvIHNldHMgcGF0aCB0byAiIgo+ID4gPiAgICAtLXdpdGhvdXQtaXB4ZSAg
ICAgICBzYW1lIGFzIC0tZGlzYWJsZS1pcHhlCj4gCj4gRkFPRCBkbyB5b3Ugc3VnZ2VzdCB3ZSBn
ZXQgcmlkIG9mIC0td2l0aC1zeXN0ZW0taXB4ZT8gVGhhdCBzZWVtcyB0bwo+IGRldmlhdGUgZnJv
bSBvdGhlciBvcHRpb25zLgoKWWVzLgoKPiBJZiB3ZSBkb24ndCBkaXRjaCBpdCwgd2Ugd2lsbCBo
YXZlOgo+IAo+ICAgLS13aXRoLWlweGUgICAgICAgICBlbmFibGUgYnVpbGRpbmcgYW5kIHVzZSBp
bi10cmVlIGlweGUuCj4gICAtLXdpdGhvdXQtaXB4ZSAgICAgIGRpc2FibGUgaW4tdHJlZSBpcHhl
LCBubyBpcHhlIChpbi10cmVlIG9yIHN5c3RlbQo+ICAgICAgICAgICAgICAgICAgICAgICBwcm92
aWRlZCkgd2lsbCBiZSB1c2VkLgo+ICAgLS13aXRoLXN5c3RlbS1pcHhlPVBBVEggIGRpc2FibGUg
YnVpbGRpbmcgaW4tdHJlZSBpcHhlLCB1c2UgaXB4ZSBzcGVjaWZpZWQKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBieSB1c2VyLgo+IAo+IEJ1dCBob25lc3RseSBJIGRvbid0IHNlZSB0aGUg
YWR2YW50YWdlIG9mIHRoaXMgb3RoZXIgdGhhbiBrZWVwaW5nCj4gb3B0aW9ucyBjb25zaXN0ZW50
LgoKV2VsbCwgbm9ybWFsbHkgLS13aXRoLXN5c3RlbS1mb289UEFUSCB3b3VsZCBtZWFuIGJvdGgg
InBsZWFzZSB1c2UgUEFUSAp3aGVuIGJ1aWxkaW5nIiBhbmQgInBsZWFzZSBiYWtlIFBBVEggaW50
byB5b3VyIHByb2dyYW0iLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
