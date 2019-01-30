From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH 09/15] x86/pv: Add Hygon Dhyana support to
 emulate MSRs access
Date: Wed, 30 Jan 2019 17:52:21 +0800
Message-ID: <fbb2d4f6-75d1-49ad-a037-a2f472ef1754@hygon.cn>
References: <cover.1545284932.git.puwen@hygon.cn>
 <93aea88af6dcc70b24b8d5195bef026629f52170.1545284932.git.puwen@hygon.cn>
 <5C4B40C602000078002113CA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8mM=QG=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gomcJ-0005Cm-2n
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 09:57:11 +0000
In-Reply-To: <5C4B40C602000078002113CA@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS8xLzI2IDE6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIwLjEyLjE4IGF0
IDE0OjE0LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+PiBUaGUgSHlnb24gRGh5YW5hIENQVSBz
dXBwb3J0cyBsb3RzIG9mIE1TUnMoc3VjaCBhcyBwZXJmIGV2ZW50IHNlbGVjdCBhbmQKPj4gY291
bnRlciBNU1JzLCBoYXJkd2FyZSBjb25maWd1cmF0aW9uIE1TUiwgTU1JTyBjb25maWd1cmF0aW9u
IGJhc2UgYWRkcmVzcwo+PiBNU1IsIE1QRVJGL0FQRVJGIE1TUnMpIGFzIEFNRCBDUFUgZG9lcywg
c28gYWRkIEh5Z29uIERoeWFuYSBzdXBwb3J0IHRvIHRoZQo+PiBQViBlbXVsYXRpb24gaW5mcmFz
dHJ1Y3R1cmUgYnkgdXNpbmcgdGhlIGNvZGUgcGF0aCBvZiBBTUQuCj4+Cj4+IEFzIGh5Z29uLmMg
bmVlZHMgdG8gd3JpdGUgdGhlIGxvYWQtc3RvcmUgY29uZmlndXJhdGlvbihMU19DRkcpIE1TUiwg
c28gYWRkCj4+IG5ldyBjYXNlIGluIHdyaXRlX21zciB0byBoYW5kbGUgdGhpcyBzaXR1YXRpb24u
Cj4gCj4gV2hpY2ggaHlnb24uYyBkbyB5b3UgbWVhbiBoZXJlPyBUaGlzIGFkZGl0aW9uLCBpZiB2
YWxpZCBhdCBhbGwsIGNsZWFybHkKCkkgbWVhbiBoeWdvbi5jIGZyb20gdGhlIGxpbnV4IGtlcm5l
bC4gQnV0IGluIGZhY3QgaXQncyBzb21lIG90aGVyIGtlcm5lbApwYXJ0IHdpbGwgd3JpdGUgTFNf
Q0ZHIE1TUi4gU28gdGhlIGRlc2NyaXB0aW9uIHdpbGwgYmUgcmVmaW5lZC4KCj4gbmVlZHMgaXRz
IG93biBwYXRjaCBhbmQganVzdGlmaWNhdGlvbiwgdGhlIG1vcmUgdGhhdCB5b3UgcGVybWl0IGFj
Y2VzcwoKVGhpcyBhZGRpdGlvbiBpcyBuZWVkZWQsIG90aGVyd2lzZSB0aGVyZSB3aWxsIGJlIHdh
cm5pbmdzIGxpa2U6CiIoWEVOKSBlbXVsLXByaXYtb3AuYzoxMTY1OmQwdjEyIERvbWFpbiBhdHRl
bXB0ZWQgV1JNU1IgYzAwMTEwMjAgZnJvbSAweDAyMDY4MDAwMDAwMDAwMDAgdG8gMHgwMjA2ODAw
MDAwMDAwNDAwIgoKWW91ciBzdWdnZXN0aW9uIGlzIGZpbmUsIHdpbGwgZGV2ZWxvcCBpdHMgb3du
IHBhdGNoIGFuZCBqdXN0aWZpY2F0aW9uIGluCm5leHQgdmVyc2lvbiBwYXRjaCBzZXQuCgo+IChl
dmVuIGlmIG9ubHkgZm9yIERvbTApIG9uIEFNRCBhcyB3ZWxsLgoKQXMgdGhlcmUgd2lsbCBiZSB0
aGUgc2FtZSB3YXJuaW5ncyBvbiBBTUQgcGxhdGZvcm1zLCBzbyBJIHBlcm1pdCBhY2Nlc3MKZm9y
IEFNRCBhcyB3ZWxsLiBJIGRvbid0IGtub3cgaWYgaXMgdGhpcyBPSz8gSWYgbm90LCBJJ2xsIHBl
cm1pdCBhY2Nlc3MKZm9yIEh5Z29uIG9ubHkuCgotLSAKUmVnYXJkcywKUHUgV2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
