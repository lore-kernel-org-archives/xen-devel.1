From: Arun KS <arunks@codeaurora.org>
Subject: Re: [PATCH v2] memory_hotplug: Free pages as higher
 order
Date: Wed, 26 Sep 2018 16:27:08 +0530
Message-ID: <bdba4200b69f560af36967e2d23dde8f__19800.0398850583$1537959358$gmane$org@codeaurora.org>
References: <1537854158-9766-1-git-send-email-arunks@codeaurora.org>
 <ccdbaf76-cbdd-759e-c6de-c5b738f156e9@suse.cz>
 <20180925181826.GW18685@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/7cl=mi=codeaurora.org=arunks@srs-us1.protection.inumbo.net>)
 id 1g57VI-0000xz-4C
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 10:57:12 +0000
In-Reply-To: <20180925181826.GW18685@dhcp22.suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: jgross@suse.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, malat@debian.org, vatsa@codeaurora.org, haiyangz@microsoft.com, dan.j.williams@intel.com, linux-kernel@vger.kernel.org, getarunks@gmail.com, yasu.isimatu@gmail.com, linux-mm@kvack.org, vinmenon@codeaurora.org, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, boris.ostrovsky@oracle.com, kys@microsoft.com, akpm@linux-foundation.org, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC0wOS0yNSAyMzo0OCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+IE9uIFR1ZSAyNS0wOS0x
OCAxMTo1OTowOSwgVmxhc3RpbWlsIEJhYmthIHdyb3RlOgo+IFsuLi5dCj4+IFRoaXMgc2VlbXMg
bGlrZSBhbG1vc3QgY29tcGxldGUgY29weSBvZiBfX2ZyZWVfcGFnZXNfYm9vdF9jb3JlKCksIAo+
PiBjb3VsZAo+PiB5b3UgZG8gc29tZSBjb2RlIHJldXNlIGluc3RlYWQ/IEkgdGhpbmsgTWljaGFs
IEhvY2tvIGFsc28gc3VnZ2VzdGVkIAo+PiB0aGF0Lgo+IAo+IFllcywgcGxlYXNlIHRyeSB0byBy
ZXVzZSBhcyBtdWNoIGNvZGUgYXMgcG9zc2libGUKU3VyZSwgV2lsbCBhZGRyZXNzIGluIG5leHQg
c3Bpbi4KClJlZ2FyZHMsCkFydW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
