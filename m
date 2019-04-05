From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 01/15] x86/cpu: Create Hygon Dhyana
 architecture support file
Date: Fri, 05 Apr 2019 01:49:24 -0600
Message-ID: <5CA708840200007800224C6E@prv1-mh.provo.novell.com>
References: <cover.1554382869.git.puwen@hygon.cn>
 <0d6839a65753c60f4fd1738560a551ca7df7b1e8.1554382869.git.puwen@hygon.cn>
 <614b4eab-065a-c911-7759-2663ab6a9657@citrix.com>
 <8f23051d-a8b5-a25b-af4a-acf045c31cd2@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCJbN-0005Wn-Hw
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 07:49:29 +0000
In-Reply-To: <8f23051d-a8b5-a25b-af4a-acf045c31cd2@hygon.cn>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA0LjE5IGF0IDE4OjM5LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvNC80IDIyOjA3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBUaGlzIG5lZWRzIHRoZSBmb2xs
b3dpbmcgaHVuayBmb2xkaW5nIGluCj4+IAo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdHMvY3B1
LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYwo+PiBiL3Rvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvdGVz
dC1jcHUtcG9saWN5LmMKPj4gaW5kZXggYmVjZWQ1ZS4uODhmNTEyMSAxMDA2NDQKPj4gLS0tIGEv
dG9vbHMvdGVzdHMvY3B1LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYwo+PiArKysgYi90b29scy90
ZXN0cy9jcHUtcG9saWN5L3Rlc3QtY3B1LXBvbGljeS5jCj4+IEBAIC0zNSw2ICszNSw3IEBAIHN0
YXRpYyB2b2lkIHRlc3RfdmVuZG9yX2lkZW50aWZpY2F0aW9uKHZvaWQpCj4+ICAgICAgICAgICB7
IHsgIkF1dGhlbnRpY0FNRCIgfSwgWDg2X1ZFTkRPUl9BTUQgfSwKPj4gICAgICAgICAgIHsgeyAi
Q2VudGF1ckhhdWxzIiB9LCBYODZfVkVORE9SX0NFTlRBVVIgfSwKPj4gICAgICAgICAgIHsgeyAi
ICBTaGFuZ2hhaSAgIiB9LCBYODZfVkVORE9SX1NIQU5HSEFJIH0sCj4+ICsgICAgICAgIHsgeyAi
SHlnb25HZW51aW5lIiB9LCBYODZfVkVORE9SX0hZR09OIH0sCj4+ICAgCj4+ICAgICAgICAgICB7
IHsgIiIgICAgICAgICAgICAgfSwgWDg2X1ZFTkRPUl9VTktOT1dOIH0sCj4+ICAgICAgICAgICB7
IHsgIiAgICAgICAgICAgICIgfSwgWDg2X1ZFTkRPUl9VTktOT1dOIH0sCj4gCj4gSSdtIHNvcnJ5
IGZvciBtaXNzaW5nIHRoaXMgZmlsZS4KPiAKPj4gd2hpY2ggY2FuIGJlIGRvbmUgb24gY29tbWl0
IHRvIGF2b2lkIHNlbmRpbmcgeWV0IGFub3RoZXIgdmVyc2lvbi4KPiAKPiBEbyB5b3UgbWVhbiBJ
IG5lZWQgdG8gc2VuZCBhIGluZGl2aWR1YWwgcGF0Y2ggZm9yIHRoaXMgZmlsZSBpbnN0ZWFkIG9m
IAo+IHJld29ya2luZyB0aGUgd2hvbGUgc2VyaWVzPwoKSSBkb24ndCB0aGluayB0aGF0J3MgbmVj
ZXNzYXJ5LCB1bmxlc3Mgb3RoZXIgcmVhc29ucyBhcmlzZSBmb3IgdGhlcmUKdG8gYmUgeWV0IGFu
b3RoZXIgcm91bmQgbmVjZXNzYXJ5LiBBcyBBbmRyZXcgc2F5cyAtIHRoaXMgY2FuIGVhc2lseQpi
ZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
