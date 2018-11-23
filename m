From: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v1] mm/memory_hotplug: drop "online"
 parameter from add_memory_resource()
Date: Fri, 23 Nov 2018 14:07:19 +0100
Message-ID: <1542978439.6030.1.camel__21936.7230929949$1542979124$gmane$org@suse.de>
References: <20181123123740.27652-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ozpj=oc=suse.de=osalvador@srs-us1.protection.inumbo.net>)
 id 1gQBBN-0006Y9-Ut
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 13:07:41 +0000
In-Reply-To: <20181123123740.27652-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: Juergen Gross <jgross@suse.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, Mathieu Malaterre <malat@debian.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, Pavel Tatashin <pasha.tatashin@oracle.com>, Michal Hocko <mhocko@suse.com>, Arun KS <arunks@codeaurora.org>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyMDE4LTExLTIzIGF0IDEzOjM3ICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90
ZToKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4K
ClRoYW5rcyA7LSkKClJldmlld2VkLWJ5OiBPc2NhciBTYWx2YWRvciA8b3NhbHZhZG9yQHN1c2Uu
ZGU+CgotLSAKT3NjYXIgU2FsdmFkb3IKU1VTRSBMMwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
