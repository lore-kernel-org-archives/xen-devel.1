From: "Wei, Gang" <gang.wei@intel.com>
Subject: Re: [PATCH] build: remove tboot make targets
Date: Tue, 28 Aug 2018 01:56:41 +0000
Message-ID: <395BA049-B131-43F9-8BB7-232C6E2A5707@intel.com>
References: <20180819022205.22024-1-cardoe@cardoe.com>
 <5B7A7CC602000078001DFCE2@prv1-mh.provo.novell.com>,
 <20180827162344.45gcfxqvoknyggki@doug-macbook.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8uxu=ll=intel.com=gang.wei@srs-us1.protection.inumbo.net>)
 id 1fuTFV-0004ib-DC
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 01:56:53 +0000
In-Reply-To: <20180827162344.45gcfxqvoknyggki@doug-macbook.localdomain>
Content-Language: zh-CN
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, "Wang,
 Shane" <shane.wang@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

5ZyoIDIwMTjlubQ45pyIMjjml6XvvIzkuIrljYgxMjoyNO+8jERvdWcgR29sZHN0ZWluIDxjYXJk
b2VAY2FyZG9lLmNvbT4g5YaZ6YGT77yaCj4gCj4gT24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMDI6
MzM6MTBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE5LjA4LjE4IGF0IDA0
OjIyLCA8Y2FyZG9lQGNhcmRvZS5jb20+IHdyb3RlOgo+Pj4gVGhlIHRib290IHRhcmdldHMgYXJl
IHdvZWZ1bGx5IG91dCBvZiBkYXRlLiBUaGVzZSBzaG91bGQgcmVhbGx5IGJlCj4+PiByZXRpcmVk
IGJlY2F1c2Ugc2V0dGluZyB1cCB0Ym9vdCBpcyBtb3JlIGNvbXBsZXggdGhhbiB0aGUgYnVpbGQg
cHJvY2Vzcwo+Pj4gZm9yIGl0Lgo+Pj4gCj4+PiBTaWduZWQtb2ZmLWJ5OiBEb3VnIEdvbGRzdGVp
biA8Y2FyZG9lQGNhcmRvZS5jb20+Cj4+IAo+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+PiAKPj4gQnV0IEkgdGhpbmsgeW91IHdvdWxkIGJldHRlciBoYXZlIENj
LWVkIHRoZSBUWFQvVEJPT1QgbWFpbnRhaW5lcnMKPj4gKG5vdyBkb25lKSwgYXMgaXQgd2FzIHBy
ZXN1bWFibHkgdGhlbSBoYXZpbmcgaW50cm9kdWNlZCB0aGVzZQo+PiB0YXJnZXRzLiBFdmVuIGlm
IHRoZSBjaGFuY2UgaWYgaGlnaCB0byBub3Qgc2VlIGFueSByZXNwb25zZSwgd2UKPj4gc2hvdWxk
IGF0IGxlYXN0IGdpdmUgdGhlbSBhIGNoYW5jZSB0byBjaGltZSBpbi4KPiAKPiBKdXN0IGEgb25l
IHdlZWsgcGluZy4KCkFja2VkLWJ5OiBHYW5nIFdlaSA8Z2FuZy53ZWlAaW50ZWwuY29tPgoKSSBh
Z3JlZSB0aGF0IHJlZmVycmluZyB0byB0aGUgZG9jdW1lbnQgdG8gZG8gdGhlIHRib290IGRlcGxv
eW1lbnQgZm9yIFhlbiB3aWxsIGJlIGJldHRlci4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
