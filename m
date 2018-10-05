From: Bharat Bhushan <bharat.bhushan@nxp.com>
Subject: ARM64: PCIe in DOM0
Date: Fri, 5 Oct 2018 08:39:25 +0000
Message-ID: <VI1PR04MB484573C0CBE5BB093697DD6A9AEB0@VI1PR04MB4845.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ywb5=mr=nxp.com=bharat.bhushan@srs-us1.protection.inumbo.net>)
 id 1g8Le3-0008EV-T4
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 08:39:36 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Xen-devel@lists.xenproject.org" <Xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgQWxsLAoKSSBhbSBib290aW5nIFhFTiBmb3IgdGhlIGZpcnN0IHRpbWUgb24gbXkgcGxhdGZv
cm0gYW5kIG9ic2VydmluZyB0aGF0IFBDSWUgYXJlIG5vdCB3b3JraW5nLgoKSGVyZSBhcmUgbXkg
b2JzZXJ2YXRpb25zIG9uIHRoaXMuCgoxKSAiZ2l0LWl0cyIgbm9kZSAoYmVsb3cpIGZyb20gZGV2
aWNlIHRyZWUgaXMgbm90IGF2YWlsYWJsZSBpbiBET00wIGRldmljZSB0cmVlLgoKICAgICAgICAg
ICAgICAgIGl0czogZ2ljLWl0c0A2MDIwMDAwIHsKICAgICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJhcm0sZ2ljLXYzLWl0cyI7CiAgICAgICAgICAgICAgICAgICAgICAgIG1zaS1j
b250cm9sbGVyOwogICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4NjAyMDAwMCAw
IDB4MjAwMDA+OwogICAgICAgICAgICAgICAgfTsKCiAgV2UgaGF2ZSAibXNpLXBhcmVudCIgcHJv
cGVydHkgaW4gUENJZSBjb250cm9sbGVyIG5vZGUgd2hpY2ggcHJvdmlkZXMgcGhhbmRsZSBvZiBh
Ym92ZSBtZW50aW9uZWQgbm9kZS4KICBMaW51eCAoRE9NMCkgZXJyb3Igb3V0IGlmIGl0IGRvZXMg
ZmluZCBhIHZhbGlkIG1zaS1wYXJlbnQuCgpGaXJzdCBxdWVzdGlvbiBJIGhhdmUgaXMsIFdoYXQg
aXMgdGhlIHJlYXNvbiBmb3IgcmVtb3ZpbmcgZ2ljLWl0cyBub2RlPwoKMikgVXNlIExlZ2FjeSBp
bnRlcnJ1cHRzIHJhdGhlciB0aGFuIE1TSQoKICBVc2VkICJwY2k9bm9tc2kiIGluIERPTTAgYm9v
dGFyZ3MgdG8gbW92ZSBhd2F5IGZyb20gTVNJcywKICAKIExlZ2FjeSBpbnRlcnJ1cHRzIGFyZSBh
bHNvIG5vdCByZWNlaXZlZCBhbmQgc2VlIG5ldGRldi13YXRjaGRvZy4KCkNhbiBzb21lb25lIHBs
ZWFzZSBoZWxwIG9uIHdoYXQncyB3cm9uZyBJIGFtIGRvaW5nLgoKVGhhbmtzCi1CaGFyYXQKCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
