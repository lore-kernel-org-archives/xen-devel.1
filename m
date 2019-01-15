From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools: only call git when necessary in OVMF
 Makefile
Date: Tue, 15 Jan 2019 11:33:16 +0000
Message-ID: <87617c2e-845a-ea82-ffe5-4a6ff51b466f@citrix.com>
References: <20190115110940.29403-1-wei.liu2@citrix.com>
 <04282240-35d1-ddaa-f202-fea9e60539d6@citrix.com>
 <20190115112938.wcvh67sokhtlpw6u@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3OYV=PX=citrix.com=prvs=91139fb13=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gjMz6-0000RV-2D
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 11:34:20 +0000
In-Reply-To: <20190115112938.wcvh67sokhtlpw6u@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDEvMjAxOSAxMToyOSwgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIEphbiAxNSwgMjAx
OSBhdCAxMToyNzoxMkFNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxNS8wMS8y
MDE5IDExOjA5LCBXZWkgTGl1IHdyb3RlOgo+Pj4gVXNlcnMgbWF5IGNob29zZSB0byBleHBvcnQg
YSBzbmFwc2hvdCBvZiBPVk1GIGFuZCBidWlsZCBpdAo+Pj4gd2l0aCB4ZW4uZ2l0IHN1cHBsaWVk
IG92bWYtbWFrZWZpbGUuIEluIHRoYXQgY2FzZSB3ZSBkb24ndAo+Pj4gbmVlZCB0byBjYWxsIGBn
aXQgc3VibW9kdWxlYC4KPj4+Cj4+PiBGaXhlcyBiMTYyODE4NzBlLgo+Pj4KPj4+IFJlcG9ydGVk
LWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+Pj4gLS0tCj4+PiAgdG9vbHMvZmlybXdhcmUvb3Zt
Zi1tYWtlZmlsZSB8IDIgKy0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtl
ZmlsZSBiL3Rvb2xzL2Zpcm13YXJlL292bWYtbWFrZWZpbGUKPj4+IGluZGV4IDNkZTJmYzAzMDAu
LjU1Zjk5OTIxNDUgMTAwNjQ0Cj4+PiAtLS0gYS90b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxl
Cj4+PiArKysgYi90b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxlCj4+PiBAQCAtMTYsNyArMTYs
NyBAQCBhbGw6IGJ1aWxkCj4+PiAgCj4+PiAgLlBIT05ZOiBidWlsZAo+Pj4gIGJ1aWxkOgo+Pj4g
LQkkKEdJVCkgc3VibW9kdWxlIHVwZGF0ZSAtLWluaXQgLS1yZWN1cnNpdmUKPj4+ICsJaWYgdGVz
dCAtZSAuZ2l0IDsgdGhlbiAkKEdJVCkgc3VibW9kdWxlIHVwZGF0ZSAtLWluaXQgLS1yZWN1cnNp
dmUgOyBmaQo+PiBZb3Ugd2FudCAtZCByYXRoZXIgdGhhbiAtZS4KPiBBbnRob255IHNhaWQgLmdp
dCBjb3VsZCBiZSBhIGxpbmsuCgpIbW0gLSBzbyBpdCBjYW4uLi4KCllvdSBnZXQgc29tZSB3ZWly
ZCBlZmZlY3RzIHdpdGggaXQgYmVpbmcgYSBsaW5rLCBidXQgZ2l0IGRvZXMgc2VlbSB0bwp0b2xl
cmF0ZSBpdC4KClNvcnJ5IGZvciB0aGUgbm9pc2UuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
