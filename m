From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Fri, 19 Oct 2018 10:07:55 +0200
Message-ID: <20181019080755.GK18839__17867.8921577104$1539936417$gmane$org@dhcp22.suse.cz>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
 <72215e75-6c7e-0aef-c06e-e3aba47cf806@suse.cz>
 <efb65160af41d0e18cb2dcb30c2fb86a@codeaurora.org>
 <20181010173334.GL5873@dhcp22.suse.cz>
 <a2d576a5fc82cdf54fc89409686e58f5@codeaurora.org>
 <20181011075503.GQ5873@dhcp22.suse.cz>
 <20181018191825.fcad6e28f32a3686f201acdf@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hyfu=m7=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1gDPpA-0004sZ-09
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 08:08:00 +0000
Content-Disposition: inline
In-Reply-To: <20181018191825.fcad6e28f32a3686f201acdf@linux-foundation.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: vatsa@codeaurora.org, linux-mm@kvack.org, Arun KS <arunks@codeaurora.org>, getarunks@gmail.com, kys@microsoft.com, dan.j.williams@intel.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, boris.ostrovsky@oracle.com, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1IDE4LTEwLTE4IDE5OjE4OjI1LCBBbmRyZXcgTW9ydG9uIHdyb3RlOgpbLi4uXQo+IFNv
IHRoaXMgcGF0Y2ggbmVlZHMgbW9yZSB3b3JrLCB5ZXM/CgpZZXMsIEkndmUgdGFsa2VkIHRvIEFy
dW4gKGhlIGlzIG9mZmxpbmUgdW50aWwgbmV4dCB3ZWVrKSBvZmZsaXN0IGFuZCBoZQp3aWxsIHBs
YXkgd2l0aCB0aGlzIHNvbWUgbW9yZS4KCi0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
