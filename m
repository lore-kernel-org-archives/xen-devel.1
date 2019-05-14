From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: how to disable build of pv-shim?
Date: Tue, 14 May 2019 10:55:18 +0200
Message-ID: <20190514085518.g3wdf7h3tka25cb6@Air-de-Roger>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
 <20190513152812.GC3977@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8Y9=TO=citrix.com=prvs=0309661e3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQTDh-00048T-Ob
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 08:55:33 +0000
Content-Disposition: inline
In-Reply-To: <20190513152812.GC3977@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6Mjg6MTJQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAwNToyMDowNVBNICswMjAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6NTM6MjFQTSArMDIwMCwg
T2xhZiBIZXJpbmcgd3JvdGU6Cj4gPiA+IFdoYXQgaXMgdGhlIHJlY29tbWVuZGVkIHdheSB0byBk
aXNhYmxlIENPTkZJR19QVl9TSElNLCB3aGljaCBpcyBzZXQgaW4KPiA+ID4gdG9vbHMvZmlybXdh
cmUvTWFrZWZpbGU/IEZyb20gbXkgdW5kZXJzdGFuZGluZyB0aGVyZSBpcyBubyB3YXkgdG8gaW5m
bHVlbmNlCj4gPiA+IGl0cyB2YWx1ZSBmcm9tIG91dHNpZGUsIHdoaWNoIG1lYW5zIHRoZSBidWls
ZCBhbHdheXMgZW50ZXJzIHhlbi1kaXIvLgo+ID4gCj4gPiBJIHRoaW5rIHRoZSBmb2xsb3dpbmcg
c2hvdWxkIGRvIHRoZSB0cmljay4KPiA+IAo+ID4gTGV0IG1lIGtub3cgaWYgdGhhdCB3b3JrcyBm
b3IgeW91IGFuZCBJIHdpbGwgc3VibWl0IGl0IGZvcm1hbGx5Lgo+ID4gCj4gPiBUaGFua3MhCj4g
PiAKPiA+IC0tLTg8LS0tCj4gPiBkaWZmIC0tZ2l0IGEvY29uZmlnL1Rvb2xzLm1rLmluIGIvY29u
ZmlnL1Rvb2xzLm1rLmluCj4gPiBpbmRleCA5ODI0NWY2M2M5Li44NGRkYjFhNTQyIDEwMDY0NAo+
ID4gLS0tIGEvY29uZmlnL1Rvb2xzLm1rLmluCj4gPiArKysgYi9jb25maWcvVG9vbHMubWsuaW4K
PiA+IEBAIC03NSwzICs3NSw1IEBAIFRJTkZPX0xJQlMgICAgICAgICAgOj0gQFRJTkZPX0xJQlNA
Cj4gPiAgQVJHUF9MREZMQUdTICAgICAgICA6PSBAYXJncF9sZGZsYWdzQAo+ID4gIAo+ID4gIEZJ
TEVfT0ZGU0VUX0JJVFMgICAgOj0gQEZJTEVfT0ZGU0VUX0JJVFNACj4gPiArCj4gPiArQ09ORklH
X1BWX1NISU0gICAgICA6PSBAcHZzaGltQAo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2NvbmZpZ3Vy
ZS5hYyBiL3Rvb2xzL2NvbmZpZ3VyZS5hYwo+ID4gaW5kZXggYzlmZDY5ZGRmYS4uOGRmMmZkNjA0
YiAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL2NvbmZpZ3VyZS5hYwo+ID4gKysrIGIvdG9vbHMvY29u
ZmlndXJlLmFjCj4gPiBAQCAtNDkyLDQgKzQ5MiwxNSBAQCBBQ19BUkdfRU5BQkxFKFs5cGZzXSwK
PiA+ICAKPiA+ICBBQ19TVUJTVChuaW5lcGZzKQo+ID4gIAo+ID4gK0FDX0FSR19FTkFCTEUoW3B2
c2hpbV0sCj4gPiArICAgIEFTX0hFTFBfU1RSSU5HKFstLWRpc2FibGUtcHZzaGltXSwgW0Rpc2Fi
bGUgcHZzaGltIGJ1aWxkICh4ODYgb25seSwgZW5hYmxlZCBieSBkZWZhdWx0KV0pLAo+ID4gKyAg
ICBbQVNfSUYoW3Rlc3QgIngkZW5hYmxlX3B2c2hpbSIgPSAieG5vIl0sIFtwdnNoaW09bl0sIFtw
dnNoaW09eV0pXSwgWwo+ID4gKyAgICBjYXNlICIkaG9zdF9jcHUiIGluCj4gPiArICAgICAgICBp
W1szNDU2XV04Nnx4ODZfNjQpCj4gPiArICAgICAgICAgICBwdnNoaW09InkiOzsKPiAKPiBTaW5j
ZSB4ZW4gZG9lc24ndCBidWlsZCBvbiAzMmJpdCBhbnltb3JlIHlvdSBtYXkgd2FudCB0byBleGNs
dWRlCj4gaVszNDU2XTg2IGhlcmU/CgpPaCwgSSBkaWRuJ3QgcmVhbGl6ZSB0aGlzLiBJcyBpdCB0
cnVlIGZvciBhbGwgZGlzdHJvcz8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
