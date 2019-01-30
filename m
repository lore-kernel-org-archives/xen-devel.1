From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 09/15] x86/pv: Add Hygon Dhyana support to
 emulate MSRs access
Date: Wed, 30 Jan 2019 03:08:34 -0700
Message-ID: <5C5177A20200007800212384@prv1-mh.provo.novell.com>
References: <cover.1545284932.git.puwen@hygon.cn>
 <93aea88af6dcc70b24b8d5195bef026629f52170.1545284932.git.puwen@hygon.cn>
 <5C4B40C602000078002113CA@prv1-mh.provo.novell.com>
 <fbb2d4f6-75d1-49ad-a037-a2f472ef1754@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gomnO-0006kt-1z
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 10:08:38 +0000
In-Reply-To: <fbb2d4f6-75d1-49ad-a037-a2f472ef1754@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAxLjE5IGF0IDEwOjUyLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvMS8yNiAxOjQ4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjAuMTIuMTggYXQgMTQ6
MTQsIDxwdXdlbkBoeWdvbi5jbj4gd3JvdGU6Cj4+PiBUaGUgSHlnb24gRGh5YW5hIENQVSBzdXBw
b3J0cyBsb3RzIG9mIE1TUnMoc3VjaCBhcyBwZXJmIGV2ZW50IHNlbGVjdCBhbmQKPj4+IGNvdW50
ZXIgTVNScywgaGFyZHdhcmUgY29uZmlndXJhdGlvbiBNU1IsIE1NSU8gY29uZmlndXJhdGlvbiBi
YXNlIGFkZHJlc3MKPj4+IE1TUiwgTVBFUkYvQVBFUkYgTVNScykgYXMgQU1EIENQVSBkb2VzLCBz
byBhZGQgSHlnb24gRGh5YW5hIHN1cHBvcnQgdG8gdGhlCj4+PiBQViBlbXVsYXRpb24gaW5mcmFz
dHJ1Y3R1cmUgYnkgdXNpbmcgdGhlIGNvZGUgcGF0aCBvZiBBTUQuCj4+Pgo+Pj4gQXMgaHlnb24u
YyBuZWVkcyB0byB3cml0ZSB0aGUgbG9hZC1zdG9yZSBjb25maWd1cmF0aW9uKExTX0NGRykgTVNS
LCBzbyBhZGQKPj4+IG5ldyBjYXNlIGluIHdyaXRlX21zciB0byBoYW5kbGUgdGhpcyBzaXR1YXRp
b24uCj4+IAo+PiBXaGljaCBoeWdvbi5jIGRvIHlvdSBtZWFuIGhlcmU/IFRoaXMgYWRkaXRpb24s
IGlmIHZhbGlkIGF0IGFsbCwgY2xlYXJseQo+IAo+IEkgbWVhbiBoeWdvbi5jIGZyb20gdGhlIGxp
bnV4IGtlcm5lbC4gQnV0IGluIGZhY3QgaXQncyBzb21lIG90aGVyIGtlcm5lbAo+IHBhcnQgd2ls
bCB3cml0ZSBMU19DRkcgTVNSLiBTbyB0aGUgZGVzY3JpcHRpb24gd2lsbCBiZSByZWZpbmVkLgo+
IAo+PiBuZWVkcyBpdHMgb3duIHBhdGNoIGFuZCBqdXN0aWZpY2F0aW9uLCB0aGUgbW9yZSB0aGF0
IHlvdSBwZXJtaXQgYWNjZXNzCj4gCj4gVGhpcyBhZGRpdGlvbiBpcyBuZWVkZWQsIG90aGVyd2lz
ZSB0aGVyZSB3aWxsIGJlIHdhcm5pbmdzIGxpa2U6Cj4gIihYRU4pIGVtdWwtcHJpdi1vcC5jOjEx
NjU6ZDB2MTIgRG9tYWluIGF0dGVtcHRlZCBXUk1TUiBjMDAxMTAyMCBmcm9tIAo+IDB4MDIwNjgw
MDAwMDAwMDAwMCB0byAweDAyMDY4MDAwMDAwMDA0MDAiCgpCdXQgdGhhdCdzIGFuIGlzc3VlIHRv
IGJlIHRha2VuIGNhcmUgb2YgaW4ga2VybmVsIGNvZGUsIG5vdCBieQptYWtpbmcgWGVuIHBlcm1p
dCB0aGUgd3JpdGUuIFRoZXJlIGFyZSBvdGhlciBNU1JzIHdoZXJlIHRoZQprZXJuZWwgc2ltaWxh
cmx5IHRyaWVzIGFjY2Vzc2VzIHdoaWNoIGl0IHNob3VsZG4ndCB0cnkgd2hlbiBydW4gaW4KUFYg
bW9kZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
