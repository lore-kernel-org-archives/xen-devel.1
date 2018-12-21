From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 v2 8/8] xen: Switch parameter in
 get_page_from_gfn to use typesafe gfn
Date: Fri, 21 Dec 2018 02:20:04 -0700
Message-ID: <5C1CB04402000078002086A6@prv1-mh.provo.novell.com>
References: <20181220192338.17526-1-julien.grall@arm.com>
 <20181220192338.17526-9-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gaGyW-0002kM-HY
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 09:20:08 +0000
In-Reply-To: <20181220192338.17526-9-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDIwOjIzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+IAo+IE9ubHkgcmVhc29uYWJsZSBjbGVh
bi11cHMgYXJlIGRvbmUgaW4gdGhpcyBwYXRjaC4gVGhlIHJlc3Qgd2lsbCB1c2UgX2dmbgo+IGZv
ciB0aGUgdGltZSBiZWluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
