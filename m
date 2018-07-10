From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Tue, 10 Jul 2018 17:35:09 +0200
Message-ID: <20180710153509.p4o2ffk22iqsqkif@mac.bytemobile.com>
References: <20180703160227.GF4670@olila.local.net-space.pl>
 <5B3C7E0602000078001D0DDC@prv1-mh.provo.novell.com>
 <20180704104900.GI4670@olila.local.net-space.pl>
 <20180705074757.s4ztvfm56crljopt@mac.bytemobile.com>
 <20180706134839.GJ26572@olila.local.net-space.pl>
 <20180709164516.3n5ht4qq5kjhp3mh@mac.bytemobile.com>
 <20180710110052.GY26572@olila.local.net-space.pl>
 <5B449CC702000078001D2A03@prv1-mh.provo.novell.com>
 <20180710134954.twd2cs6hhdfqumkq@mac.bytemobile.com>
 <5B44BE0202000078001D2B93@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vod0=j2=citrix.com=prvs=722e3bda8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fcufe-0003fW-LX
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 15:35:18 +0000
Content-Disposition: inline
In-Reply-To: <5B44BE0202000078001D2B93@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTAsIDIwMTggYXQgMDg6MDk6MDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA3LjE4IGF0IDE1OjQ5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVHVlLCBKdWwgMTAsIDIwMTggYXQgMDU6NDc6MTlBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDEwLjA3LjE4IGF0IDEzOjAwLCA8ZGFuaWVsLmtpcGVy
QG9yYWNsZS5jb20+IHdyb3RlOgo+ID4+ID4gT24gTW9uLCBKdWwgMDksIDIwMTggYXQgMDY6NDU6
MTZQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+PiA+PiBTb3JyeSBmb3IgYXNr
aW5nIHNvIG1hbnkgcXVlc3Rpb25zLCBidXQgSSB3b3VsZCBsaWtlIHRvIHRyeSB0byBhdm9pZAo+
ID4+ID4+IHRoZSBERUZJTkVEIGNvbmRpdGlvbmFsIGluIHRoZSBsaW5rZXIgc2NyaXB0IGlmIHBv
c3NpYmxlLgo+ID4+ID4gCj4gPj4gPiBJZiB5b3Ugd2lzaCB0byBkbyB0aGF0IHRoZW4gcHV0IGR1
bW15IGVmaSBzeW1ib2wgaW50byAKPiA+PiA+IHhlbi9hcmNoL3g4Ni9lZmkvc3R1Yi5jLgo+ID4+
IAo+ID4+IEkgdGhpbmsgSSd2ZSBjbGVhcmx5IG9iamVjdGVkIHRvIHRoYXQgYmVmb3JlIC0gSSBz
aW1wbHkgc2VlIG5vIG5lZWQgZm9yCj4gPj4gd2FzdGluZyB0aGUgc3BhY2UgaW4gYW4gRUZJLWlu
Y2FwYWJsZSBiaW5hcnkuCj4gPiAKPiA+IEJ1dCBzdWNoIHdhc3RlIGlzIGFsc28gYWRkZWQgcmVn
YXJkbGVzcyBvZiB3aGV0aGVyIHlvdSBkZWZpbmUgdGhlCj4gPiBzeW1ib2wgaXQgaW4gdGhlIGxp
bmtlciBzY3JpcHQgb3IgaW4gYSBDIGZpbGU/Cj4gCj4gSG93IHRoYXQ/IFRoZXJlJ3Mgbm8gc3Bh
Y2UgYXNzb2NpYXRlZCB3aXRoIHRoZSBzeW1ib2wgd2hlbiBkZWZpbmVkCj4gdGhpcyB3YXkuIEZy
b20gdGhlIHBlcnNwZWN0aXZlIG9mIHRoZSBiaW5hcnksIHRoZSBzcGFjZSBsaXZlcyBwYXN0IHRo
ZQo+IGVuZCBvZiB0aGUgaW1hZ2UsIGJ1dCBzaW5jZSB0aGUgc3ltYm9sIGlzIG5ldmVyIGFjY2Vz
c2VkIChvciBlbHNlIGNvZGUKPiBpcyBicm9rZW4gc29tZXdoZXJlKSBpbiB0aGUgbm9uLUVGSSBj
YXNlLCB0aGlzIGlzIG9rYXkuCgpPaCByaWdodCwgdGhhdCdzIG5vdCBpbnNpZGUgb2YgYW55IHNl
Y3Rpb24uCgpJJ3ZlIHRyaWVkIHBsYWNpbmcgYW4gZWZpIHN5bWJvbCBpbnNpZGUgb2YgdGhlIC5k
aXNjYXJkIHNlY3Rpb24gYnV0CnRoYXQgZG9lc24ndCB3b3JrLiBJJ20gb3BlbiB0byBzdWdnZXN0
aW9ucyBzaW5jZSBJIGRvbid0IGhhdmUgYW55IG1vcmUKaWRlYXMgYWJvdXQgaG93IHRvIGZpeCB0
aGlzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
