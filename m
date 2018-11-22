From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] mm: fix LLVM code-generation issue
Date: Thu, 22 Nov 2018 06:36:53 -0700
Message-ID: <5BF6B0F502000078001FEE76@prv1-mh.provo.novell.com>
References: <20181122120327.66403-1-roger.pau@citrix.com>
 <c0b25df2-49ca-fbe1-804a-e1a9839bb854@citrix.com>
 <6fde305e-7f47-2577-d795-0291e2adc137@arm.com>
 <5BF6AEB602000078001FEE5D@prv1-mh.provo.novell.com>
 <9cd10d0c-8c1a-0c1f-39a1-c3a2bbd1d734@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kqx2=ob=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gPpA9-0008Ak-7f
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 13:36:57 +0000
In-Reply-To: <9cd10d0c-8c1a-0c1f-39a1-c3a2bbd1d734@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjExLjE4IGF0IDE0OjMxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gSSB0aGluayBKdWxpZW4ncyBwb2ludCBpcyB0aGF0IHdpdGhvdXQgZXhwbGljaXRseSBi
YXJyaWVycywgQ1BVMCdzCj4gdXBkYXRlIHRvIHN5c3RlbV9zdGF0ZSBtYXkgbm90IGJlIHZpc2li
bGUgb24gQ1BVMSwgZXZlbiB0aG91Z2ggdGhlCj4gbWFwcGluZ3MgaGF2ZSBiZWVuIHNob3QgZG93
bi4KPiAKPiBUaGVyZWZvcmUsIGZyb20gdGhlIHByb2Nlc3NvcnMgcG9pbnQgb2YgdmlldywgaXQg
ZGlkIGV2ZXJ5dGhpbmcKPiBjb3JyZWN0bHksIGFuZCBoaXQgYSByZWFsIHBhZ2VmYXVsdC4KCkJv
b3QgdGltZSB1cGRhdGVzIG9mIHN5c3RlbV9zdGF0ZSBzaG91bGQgYmUgb2Ygbm8gaW50ZXJlc3Qg
aGVyZSwKYXMgYXQgdGhhdCB0aW1lIHRoZSBBUHMgYXJlIGFsbCBpZGxpbmcuIFRoZSBvbmx5IG90
aGVyIHVwZGF0ZSBpcwpkdXJpbmcgUzMgc3VzcGVuZC9yZXN1bWUsIGluIHRoYXQgY2FzZSB0aGUg
bWFwcGluZ3MgaGF2ZSBiZWVuCnJlbW92ZWQgbG9uZyBhZ28uCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
