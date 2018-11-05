From: Arun KS <arunks@codeaurora.org>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Mon, 05 Nov 2018 15:12:27 +0530
Message-ID: <beaa1acf7423da7ee0f9bbc4cee2d14a__48719.2373876043$1541410877$gmane$org@codeaurora.org>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
 <72215e75-6c7e-0aef-c06e-e3aba47cf806@suse.cz>
 <efb65160af41d0e18cb2dcb30c2fb86a@codeaurora.org>
 <20181010173334.GL5873@dhcp22.suse.cz>
 <a2d576a5fc82cdf54fc89409686e58f5@codeaurora.org>
 <20181011075503.GQ5873@dhcp22.suse.cz>
 <20181018191825.fcad6e28f32a3686f201acdf@linux-foundation.org>
 <20181019080755.GK18839@dhcp22.suse.cz>
 <c6289fada694462ed708174f9a1f3b6c@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dwfx=nq=codeaurora.org=arunks@srs-us1.protection.inumbo.net>)
 id 1gJbOv-0001Se-UH
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 09:42:29 +0000
In-Reply-To: <c6289fada694462ed708174f9a1f3b6c@codeaurora.org>
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

T24gMjAxOC0xMC0yMiAxNjowMywgQXJ1biBLUyB3cm90ZToKPiBPbiAyMDE4LTEwLTE5IDEzOjM3
LCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4+IE9uIFRodSAxOC0xMC0xOCAxOToxODoyNSwgQW5kcmV3
IE1vcnRvbiB3cm90ZToKPj4gWy4uLl0KPj4+IFNvIHRoaXMgcGF0Y2ggbmVlZHMgbW9yZSB3b3Jr
LCB5ZXM/Cj4+IAo+PiBZZXMsIEkndmUgdGFsa2VkIHRvIEFydW4gKGhlIGlzIG9mZmxpbmUgdW50
aWwgbmV4dCB3ZWVrKSBvZmZsaXN0IGFuZCAKPj4gaGUKPj4gd2lsbCBwbGF5IHdpdGggdGhpcyBz
b21lIG1vcmUuCj4gCj4gQ29udmVydGVkIHRvdGFsaGlnaF9wYWdlcywgdG90YWxyYW1fcGFnZXMg
YW5kIHpvbmUtPm1hbmFnZWRfcGFnZSB0bwo+IGF0b21pYyBhbmQgdGVzdGVkIGhvdCBhZGQuIExh
dGVuY3kgaXMgbm90IGVmZmVjdGVkIHdpdGggdGhpcyBjaGFuZ2UuCj4gV2lsbCBzZW5kIG91dCBh
IHNlcGFyYXRlIHBhdGNoIG9uIHRvcCBvZiB0aGlzIG9uZS4KSGVsbG8gQW5kcmV3L01pY2hhbCwK
CldpbGwgdGhpcyBiZSBnb2luZyBpbiBzdWJzZXF1ZW50IC1yY3M/CgpSZWdhcmRzLApBcnVuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
