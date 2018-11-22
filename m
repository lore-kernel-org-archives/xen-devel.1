From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] mm: fix LLVM code-generation issue
Date: Thu, 22 Nov 2018 12:23:05 +0000
Message-ID: <20181122122305.b2kbw6l5fkmmomkd@zion.uk.xensource.com>
References: <20181122120327.66403-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NKve=OB=citrix.com=prvs=857cca76a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gPo0k-0001MR-89
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 12:23:10 +0000
Content-Disposition: inline
In-Reply-To: <20181122120327.66403-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDE6MDM6MjdQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IExMVk0gY29kZSBnZW5lcmF0aW9uIGNhbiBhdHRlbXB0IHRvIHBlcmZvcm0gYSBs
b2FkIGZyb20gYSB2YXJpYWJsZSBpbgo+IHRoZSBuZXh0IGNvbmRpdGlvbiBvZiBhbiBleHByZXNz
aW9uIHVuZGVyIGNlcnRhaW4gY2lyY3Vtc3RhbmNlcywgdGh1cwo+IHR1cm5pbmcgdGhlIGZvbGxv
d2luZyBjb25kaXRpb246Cj4gCj4gaWYgKCBzeXN0ZW1fc3RhdGUgPCBTWVNfU1RBVEVfYWN0aXZl
ICYmIG9wdF9ib290c2NydWIgPT0gQk9PVFNDUlVCX0lETEUgKQo+IAo+IEludG86Cj4gCj4gMHhm
ZmZmODJkMDgwMjIzOTY3IDwrMTAzPjogY21wbCAgICQweDMsMHgzN2IwMzIoJXJpcCkgIyAweGZm
ZmY4MmQwODA1OWU5YTAgPHN5c3RlbV9zdGF0ZT4KPiAweGZmZmY4MmQwODAyMjM5NmUgPCsxMTA+
OiBzZXRiICAgLTB4MjkoJXJicCkKPiAweGZmZmY4MmQwODAyMjM5NzIgPCsxMTQ+OiBjbXBsICAg
JDB4MiwweDIyOGE4YiglcmlwKSAjIDB4ZmZmZjgyZDA4MDQ0YzQwNCA8b3B0X2Jvb3RzY3J1Yj4K
PiAKPiBTdWNoIGNvZGUgd2lsbCB0cmlnZ2VyIGEgcGFnZSBmYXVsdCBpZiBzeXN0ZW1fc3RhdGUg
Pj0KPiBTWVNfU1RBVEVfYWN0aXZlLgo+IAo+IEluIG9yZGVyIHRvIHByZXZlbnQgc3VjaCBvcHRp
bWl6YXRpb24gc2lnbmFsIHRvIHRoZSBjb21waWxlciB0aGF0Cj4gYWNjZXNzaW5nIG9wdF9ib290
c2NydWIgY2FuIGhhdmUgc2lkZSBlZmZlY3RzIGJ5IHVzaW5nIEFDQ0VTU19PTkNFLgo+IFRoaXMg
aGFzIGJlZW4gcmVwb3J0ZWQgYW5kIGRpc2N1c3NlZCB3aXRoIHVwc3RyZWFtIExMVk06Cj4gCj4g
aHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9pZD0zOTcwNwo+IAo+IEkgaGF2ZW4n
dCBiZWVuIGFibGUgdG8gZmluZCBhbnkgb3RoZXIgaW5zdGFuY2VzIG9mIHN1Y2ggY29uZGl0aW9u
YWwKPiBleHByZXNzaW9uIHRoYXQgdXNlcyBzeXN0ZW1fc3RhdGUgdG9nZXRoZXIgd2l0aCBhbiBp
bml0IHZhcmlhYmxlIG9yCj4gZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KCkkgdGhpbmsgbG9uZyB0ZXJtIHdlIHNob3VsZCBpbnZlbnQgLyBhZG9w
dCBzb21lIHN5c3RlbWF0aWNhbCBhcHByb2FjaCwKYnV0IHRoaXMgd2lsbCBkbyBmb3Igbm93LgoK
SSBoYXZlIHdyaXR0ZW4gYSBRRU1VIGJhc2VkIHNtb2tlIHRlc3Qgd2hpY2ggd2lsbCBob3BlZnVs
bHkgaGVscCB1cwpjYXRjaCBmdXJ0aGVyIGlzc3VlcyBxdWlja2x5LgoKV2VpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
