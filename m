From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Tue, 9 Oct 2018 11:29:38 +0200
Message-ID: <20181009092938.GH8528__904.214991214935$1539077314$gmane$org@dhcp22.suse.cz>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mbow=mv=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1g9oKm-00045L-FF
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 09:29:44 +0000
Content-Disposition: inline
In-Reply-To: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arun KS <arunks@codeaurora.org>
Cc: vatsa@codeaurora.org, linux-mm@kvack.org, getarunks@gmail.com, kys@microsoft.com, boris.ostrovsky@oracle.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, dan.j.williams@intel.com, akpm@linux-foundation.org, vbabka@suse.cz, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpIDA1LTEwLTE4IDEzOjQwOjA1LCBBcnVuIEtTIHdyb3RlOgo+IFdoZW4gZnJlZSBwYWdl
cyBhcmUgZG9uZSB3aXRoIGhpZ2hlciBvcmRlciwgdGltZSBzcGVuZCBvbgo+IGNvYWxlc2Npbmcg
cGFnZXMgYnkgYnVkZHkgYWxsb2NhdG9yIGNhbiBiZSByZWR1Y2VkLiBXaXRoCj4gc2VjdGlvbiBz
aXplIG9mIDI1Nk1CLCBob3QgYWRkIGxhdGVuY3kgb2YgYSBzaW5nbGUgc2VjdGlvbgo+IHNob3dz
IGltcHJvdmVtZW50IGZyb20gNTAtNjAgbXMgdG8gbGVzcyB0aGFuIDEgbXMsIGhlbmNlCj4gaW1w
cm92aW5nIHRoZSBob3QgYWRkIGxhdGVuY3kgYnkgNjAlLiBNb2RpZnkgZXh0ZXJuYWwKPiBwcm92
aWRlcnMgb2Ygb25saW5lIGNhbGxiYWNrIHRvIGFsaWduIHdpdGggdGhlIGNoYW5nZS4KCkFja2Vk
LWJ5OiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KClRoYW5rcyBmb3IgeW91ciBwYXRp
ZW5jZSB3aXRoIGFsbCB0aGUgcmVzdWJtaXNzaW9uLgotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFi
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
