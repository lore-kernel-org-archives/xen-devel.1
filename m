From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 3/3] xtf: add minimal HPET functionality
 test
Date: Thu, 01 Mar 2018 03:04:29 -0700
Message-ID: <5A97DE3D02000078001AD2EA@prv-mh.provo.novell.com>
References: <20180223132743.59804-1-roger.pau@citrix.com>
 <20180223132743.59804-4-roger.pau@citrix.com>
 <20180223190718.pfbszon36aamqelb@citrix.com>
 <20180228153747.i7temuih37ssedu6@MacBook-Pro-de-Roger.local>
 <5A96E5B902000078001ACF24@prv-mh.provo.novell.com>
 <20180301095551.352sf4iolerddcwy@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ib05=fx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1erL4n-0008E9-AY
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 10:04:37 +0000
In-Reply-To: <20180301095551.352sf4iolerddcwy@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjAzLjE4IGF0IDEwOjU1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgRmViIDI4LCAyMDE4IGF0IDA5OjI0OjA5QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjguMDIuMTggYXQgMTY6MzcsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMDc6MDc6MThQTSArMDAwMCwgV2Vp
IExpdSB3cm90ZToKPj4gPj4gT24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMDE6Mjc6NDNQTSArMDAw
MCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiA+PiA+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUv
YXJjaC9saWIuaAo+PiA+PiA+ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXJjaC9saWIuaAo+PiA+
PiA+IEBAIC0zOTIsNiArMzkyLDIwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB3cml0ZV94Y3IwKHVp
bnQ2NF90IHhjcjApCj4+ID4+ID4gICAgICB4c2V0YnYoMCwgeGNyMCk7Cj4+ID4+ID4gIH0KPj4g
Pj4gPiAgCj4+ID4+ID4gK3N0YXRpYyBpbmxpbmUgdWludDY0X3QgcmR0c2Modm9pZCkKPj4gPj4g
PiArewo+PiA+PiA+ICsgICAgdWludDMyX3QgbG93LCBoaWdoOwo+PiA+PiA+ICsKPj4gPj4gPiAr
ICAgIGFzbSB2b2xhdGlsZSAoInJkdHNjIiA6ICI9YSIgKGxvdyksICI9ZCIgKGhpZ2gpKTsKPj4g
Pj4gPiArCj4+ID4+IAo+PiA+PiBZb3UgcHJvYmFibHkgbmVlZCB0byBhZGQgbGZlbmNlIG9yIG1m
ZW5jZS4gU2VlIHJkdHNjX29yZGVyZWQgaW4gWGVuLgo+PiA+IAo+PiA+IE9oLCBPSyB0aGF0J3Mg
bmV3cyB0byBtZS4gSSBndWVzcyBqdXN0IHVzaW5nIGEgbGZlbmNlIGJlZm9yZSBpdAo+PiA+IHNo
b3VsZCBiZSBmaW5lLgo+PiAKPj4gRXhjZXB0IHRoYXQgb24gQU1ELCB3aXRob3V0IExGRU5DRSBt
YWRlIGRpc3BhdGNoIHNlcmlhbGl6aW5nLAo+PiB5b3UnZCBuZWVkIE1GRU5DRS4KPiAKPiBTbyB1
c2luZyBqdXN0IE1GRU5DRSB3aWxsIHdvcmsgZXZlcnl3aGVyZSBzaW5jZSB0aGF0J3MgbW9yZQo+
IHJlc3RyaWN0aXZlIHRoYW4gYSBsZmVuY2U/CgpTYWRseSBuby4gSSB0aGluayB0aGF0J3MgZXhw
bGFpbmVkIGluIHRoZSBkZXNjcmlwdGlvbiBvZiB0aGUKaHlwZXJ2aXNvciBwYXRjaGVzIGludHJv
ZHVjaW5nIHJkdHNjX29yZGVyZWQoKSwgYnV0IHlvdSBjYW4gYWxzbwpzaW1wbHkgcmVhZCB1cCBv
biB0aGUgTEZFTkNFL01GRU5DRSBzcGVjaWZpY3Mgb24gdGhlIEludGVsIFNETQppbnN0cnVjdGlv
biBkZXNjcmlwdGlvbi4gSW4gcGFydGljdWxhcjogIk1GRU5DRSBkb2VzIG5vdCBzZXJpYWxpemUK
dGhlIGluc3RydWN0aW9uIHN0cmVhbS4iIFlldCB0aGF0J3Mgd2hhdCB3ZSdyZSBhZnRlciBoZXJl
LiBNRkVOQ0UKaXMgYSBzZXJpYWxpemluZyBpbnN0cnVjdGlvbiBvbiBBTUQgaGFyZHdhcmUgb25s
eS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
