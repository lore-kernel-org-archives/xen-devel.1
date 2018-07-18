From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools: fix dependency for ipxe and rombios
Date: Wed, 18 Jul 2018 11:18:41 +0100
Message-ID: <20180718101841.s32n65h766ny3rqz@citrix.com>
References: <20180717080706.23885-1-wei.liu2@citrix.com>
 <23373.49811.244852.311725@mariner.uk.xensource.com>
 <20180717104741.3iid7z5zspwza5an@citrix.com>
 <20180717105438.upld3g5yujcj5s6w@citrix.com>
 <23375.4579.316890.202974@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ab30=kc=citrix.com=prvs=730fbb136=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ffjXh-0008Ew-LW
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 10:18:45 +0000
Content-Disposition: inline
In-Reply-To: <23375.4579.316890.202974@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTgsIDIwMTggYXQgMTE6MDk6MzlBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIXSB0b29sczogZml4IGRlcGVuZGVuY3kg
Zm9yIGlweGUgYW5kIHJvbWJpb3MiKToKPiA+IE9uIFR1ZSwgSnVsIDE3LCAyMDE4IGF0IDExOjQ3
OjQxQU0gKzAxMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSnVsIDE3LCAyMDE4IGF0
IDExOjE4OjU5QU0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gPiA+IFNvIEknbSBzb3Jy
eSB0byBzYXkgdGhhdCBJIHRoaW5rIHRoZSBhbnN3ZXIgaXMgdG8gcmV2ZXJ0IDAxZDYzMTAyOGEw
Mgo+ID4gPiA+IGFuZCB0byByZXBsYWNlIGl0IHdpdGggYSBwYXRjaCB3aGljaCBpbnRyb2R1Y2Vz
Cj4gPiA+ID4gICAgLS13aXRoLWlweGU9L1BBVEgKPiA+ID4gPiAgICAtLXdpdGgtaXB4ZSAgICAg
ICAgICBsaWtlIC0tZW5hYmxlLWlweGUsIGJ1dCBhbHNvIHNldHMgcGF0aCB0byAiIgo+ID4gPiA+
ICAgIC0td2l0aG91dC1pcHhlICAgICAgIHNhbWUgYXMgLS1kaXNhYmxlLWlweGUKPiA+IAo+ID4g
RkFPRCBkbyB5b3Ugc3VnZ2VzdCB3ZSBnZXQgcmlkIG9mIC0td2l0aC1zeXN0ZW0taXB4ZT8gVGhh
dCBzZWVtcyB0bwo+ID4gZGV2aWF0ZSBmcm9tIG90aGVyIG9wdGlvbnMuCj4gCj4gWWVzLgo+IAo+
ID4gSWYgd2UgZG9uJ3QgZGl0Y2ggaXQsIHdlIHdpbGwgaGF2ZToKPiA+IAo+ID4gICAtLXdpdGgt
aXB4ZSAgICAgICAgIGVuYWJsZSBidWlsZGluZyBhbmQgdXNlIGluLXRyZWUgaXB4ZS4KPiA+ICAg
LS13aXRob3V0LWlweGUgICAgICBkaXNhYmxlIGluLXRyZWUgaXB4ZSwgbm8gaXB4ZSAoaW4tdHJl
ZSBvciBzeXN0ZW0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBwcm92aWRlZCkgd2lsbCBiZSB1
c2VkLgo+ID4gICAtLXdpdGgtc3lzdGVtLWlweGU9UEFUSCAgZGlzYWJsZSBidWlsZGluZyBpbi10
cmVlIGlweGUsIHVzZSBpcHhlIHNwZWNpZmllZAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYnkgdXNlci4KPiA+IAo+ID4gQnV0IGhvbmVzdGx5IEkgZG9uJ3Qgc2VlIHRoZSBhZHZhbnRh
Z2Ugb2YgdGhpcyBvdGhlciB0aGFuIGtlZXBpbmcKPiA+IG9wdGlvbnMgY29uc2lzdGVudC4KPiAK
PiBXZWxsLCBub3JtYWxseSAtLXdpdGgtc3lzdGVtLWZvbz1QQVRIIHdvdWxkIG1lYW4gYm90aCAi
cGxlYXNlIHVzZSBQQVRICj4gd2hlbiBidWlsZGluZyIgYW5kICJwbGVhc2UgYmFrZSBQQVRIIGlu
dG8geW91ciBwcm9ncmFtIi4KCkFuZCB0aGF0J3MgZXhhY3RseSB3aGF0IHdlIHdhbnQgaGVyZSwg
cmlnaHQ/IElmIC0td2l0aC1zeXN0ZW0taXB4ZT0vUEFUSCBpcwpzcGVjaWZpZWQsIHRoZSBQQVRI
IGlzIGJha2VkIGludG8gbGlieGwuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
