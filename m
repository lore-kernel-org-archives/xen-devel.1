From: Arun KS <arunks@codeaurora.org>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Mon, 22 Oct 2018 16:03:08 +0530
Message-ID: <c6289fada694462ed708174f9a1f3b6c__7983.98318370364$1540204326$gmane$org@codeaurora.org>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
 <72215e75-6c7e-0aef-c06e-e3aba47cf806@suse.cz>
 <efb65160af41d0e18cb2dcb30c2fb86a@codeaurora.org>
 <20181010173334.GL5873@dhcp22.suse.cz>
 <a2d576a5fc82cdf54fc89409686e58f5@codeaurora.org>
 <20181011075503.GQ5873@dhcp22.suse.cz>
 <20181018191825.fcad6e28f32a3686f201acdf@linux-foundation.org>
 <20181019080755.GK18839@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jtgs=nc=codeaurora.org=arunks@srs-us1.protection.inumbo.net>)
 id 1gEXWK-00071t-3z
 for xen-devel@lists.xenproject.org; Mon, 22 Oct 2018 10:33:12 +0000
In-Reply-To: <20181019080755.GK18839@dhcp22.suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: vatsa@codeaurora.org, linux-mm@kvack.org, getarunks@gmail.com, kys@microsoft.com, boris.ostrovsky@oracle.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, dan.j.williams@intel.com, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC0xMC0xOSAxMzozNywgTWljaGFsIEhvY2tvIHdyb3RlOgo+IE9uIFRodSAxOC0xMC0x
OCAxOToxODoyNSwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPiBbLi4uXQo+PiBTbyB0aGlzIHBhdGNo
IG5lZWRzIG1vcmUgd29yaywgeWVzPwo+IAo+IFllcywgSSd2ZSB0YWxrZWQgdG8gQXJ1biAoaGUg
aXMgb2ZmbGluZSB1bnRpbCBuZXh0IHdlZWspIG9mZmxpc3QgYW5kIGhlCj4gd2lsbCBwbGF5IHdp
dGggdGhpcyBzb21lIG1vcmUuCgpDb252ZXJ0ZWQgdG90YWxoaWdoX3BhZ2VzLCB0b3RhbHJhbV9w
YWdlcyBhbmQgem9uZS0+bWFuYWdlZF9wYWdlIHRvIAphdG9taWMgYW5kIHRlc3RlZCBob3QgYWRk
LiBMYXRlbmN5IGlzIG5vdCBlZmZlY3RlZCB3aXRoIHRoaXMgY2hhbmdlLgpXaWxsIHNlbmQgb3V0
IGEgc2VwYXJhdGUgcGF0Y2ggb24gdG9wIG9mIHRoaXMgb25lLgoKUmVnYXJkcywKQXJ1bgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
