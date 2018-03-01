From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC 3/3] xtf: add minimal HPET functionality
 test
Date: Thu, 1 Mar 2018 10:14:24 +0000
Message-ID: <20180301101424.ju3uwi4hb5h4oj4c@MacBook-Pro-de-Roger.local>
References: <20180223132743.59804-1-roger.pau@citrix.com>
 <20180223132743.59804-4-roger.pau@citrix.com>
 <20180223190718.pfbszon36aamqelb@citrix.com>
 <20180228153747.i7temuih37ssedu6@MacBook-Pro-de-Roger.local>
 <5A96E5B902000078001ACF24@prv-mh.provo.novell.com>
 <20180301095551.352sf4iolerddcwy@MacBook-Pro-de-Roger.local>
 <5A97DE3D02000078001AD2EA@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=p77i=fx=citrix.com=prvs=59130488e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1erLET-0000qP-O8
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 10:14:37 +0000
Content-Disposition: inline
In-Reply-To: <5A97DE3D02000078001AD2EA@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMDEsIDIwMTggYXQgMDM6MDQ6MjlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAxLjAzLjE4IGF0IDEwOjU1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBGZWIgMjgsIDIwMTggYXQgMDk6MjQ6MDlBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDI4LjAyLjE4IGF0IDE2OjM3LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gT24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMDc6MDc6MThQ
TSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+PiA+PiBPbiBGcmksIEZlYiAyMywgMjAxOCBhdCAw
MToyNzo0M1BNICswMDAwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4gPj4gPiAtLS0gYS9h
cmNoL3g4Ni9pbmNsdWRlL2FyY2gvbGliLmgKPiA+PiA+PiA+ICsrKyBiL2FyY2gveDg2L2luY2x1
ZGUvYXJjaC9saWIuaAo+ID4+ID4+ID4gQEAgLTM5Miw2ICszOTIsMjAgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIHdyaXRlX3hjcjAodWludDY0X3QgeGNyMCkKPiA+PiA+PiA+ICAgICAgeHNldGJ2KDAs
IHhjcjApOwo+ID4+ID4+ID4gIH0KPiA+PiA+PiA+ICAKPiA+PiA+PiA+ICtzdGF0aWMgaW5saW5l
IHVpbnQ2NF90IHJkdHNjKHZvaWQpCj4gPj4gPj4gPiArewo+ID4+ID4+ID4gKyAgICB1aW50MzJf
dCBsb3csIGhpZ2g7Cj4gPj4gPj4gPiArCj4gPj4gPj4gPiArICAgIGFzbSB2b2xhdGlsZSAoInJk
dHNjIiA6ICI9YSIgKGxvdyksICI9ZCIgKGhpZ2gpKTsKPiA+PiA+PiA+ICsKPiA+PiA+PiAKPiA+
PiA+PiBZb3UgcHJvYmFibHkgbmVlZCB0byBhZGQgbGZlbmNlIG9yIG1mZW5jZS4gU2VlIHJkdHNj
X29yZGVyZWQgaW4gWGVuLgo+ID4+ID4gCj4gPj4gPiBPaCwgT0sgdGhhdCdzIG5ld3MgdG8gbWUu
IEkgZ3Vlc3MganVzdCB1c2luZyBhIGxmZW5jZSBiZWZvcmUgaXQKPiA+PiA+IHNob3VsZCBiZSBm
aW5lLgo+ID4+IAo+ID4+IEV4Y2VwdCB0aGF0IG9uIEFNRCwgd2l0aG91dCBMRkVOQ0UgbWFkZSBk
aXNwYXRjaCBzZXJpYWxpemluZywKPiA+PiB5b3UnZCBuZWVkIE1GRU5DRS4KPiA+IAo+ID4gU28g
dXNpbmcganVzdCBNRkVOQ0Ugd2lsbCB3b3JrIGV2ZXJ5d2hlcmUgc2luY2UgdGhhdCdzIG1vcmUK
PiA+IHJlc3RyaWN0aXZlIHRoYW4gYSBsZmVuY2U/Cj4gCj4gU2FkbHkgbm8uIEkgdGhpbmsgdGhh
dCdzIGV4cGxhaW5lZCBpbiB0aGUgZGVzY3JpcHRpb24gb2YgdGhlCj4gaHlwZXJ2aXNvciBwYXRj
aGVzIGludHJvZHVjaW5nIHJkdHNjX29yZGVyZWQoKSwgYnV0IHlvdSBjYW4gYWxzbwo+IHNpbXBs
eSByZWFkIHVwIG9uIHRoZSBMRkVOQ0UvTUZFTkNFIHNwZWNpZmljcyBvbiB0aGUgSW50ZWwgU0RN
Cj4gaW5zdHJ1Y3Rpb24gZGVzY3JpcHRpb24uIEluIHBhcnRpY3VsYXI6ICJNRkVOQ0UgZG9lcyBu
b3Qgc2VyaWFsaXplCj4gdGhlIGluc3RydWN0aW9uIHN0cmVhbS4iIFlldCB0aGF0J3Mgd2hhdCB3
ZSdyZSBhZnRlciBoZXJlLiBNRkVOQ0UKPiBpcyBhIHNlcmlhbGl6aW5nIGluc3RydWN0aW9uIG9u
IEFNRCBoYXJkd2FyZSBvbmx5LgoKSG0sIG5pY2UuIFRoZW4gSSBiYXNpY2FsbHkgbmVlZCB0byBp
c3N1ZSBib3RoIGEgTEZFTkNFIGFuZCBNRkVOQ0UKYmVjYXVzZSBJIGRvbid0IHBsYW4gdG8gaW50
cm9kdWNlIGFuIGFsdGVybmF0aXZlcyBmcmFtZXdvcmsgdG8gWFRGCkFUTS4KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
