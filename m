From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 09/14] mm / iommu: include need_iommu()
 test in iommu_use_hap_pt()
Date: Fri, 07 Sep 2018 05:20:18 -0600
Message-ID: <5B925EF202000078001E655B@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-10-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=p3pn=lv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fyEoH-000246-GP
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 11:20:21 +0000
In-Reply-To: <20180823094711.21376-10-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA4LjE4IGF0IDExOjQ3LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoZSBuYW1lICdpb21tdV91c2VfaGFwX3B0JyBzdWdnZXN0cyB0aGF0IHRoYXQgUDJNIHRh
YmxlIGlzIGluIHVzZSBhcyB0aGUKPiBkb21haW4ncyBJT01NVSBwYWdldGFibGUgd2hpY2gsIHBy
aW9yIHRvIHRoaXMgcGF0Y2gsIGlzIG5vdCBzdHJpY3RseSB0cnVlCj4gc2luY2UgdGhlIG1hY3Jv
IGRpZCBub3QgdGVzdCB3aGV0aGVyIHRoZSBkb21haW4gYWN0dWFsbHkgaGFzIElPTU1VCj4gbWFw
cGluZ3MuCgpIbW0sIEkgd291bGQgbmV2ZXIgaGF2ZSBpbXBsaWVkICJoYXMgSU9NTVUgbWFwcGlu
Z3MiIGZyb20gdGhpcwp2YXJpYWJsZSBuYW1lLiBUbyBtZSBpdCBoYXMgYWx3YXlzIGJlZW4gInVz
ZSBIQVAgcGFnZSB0YWJsZXMgZm9yCklPTU1VIGlmIGFuIElPTU1VIGlzIGluIHVzZSIuIFRoZSBj
b2RlIGNoYW5nZSBsb29rcyBzYW5lLCBidXQKSSdtIG5vdCBzdXJlIGl0IGlzIGEgY2xlYXIgaW1w
cm92ZW1lbnQuIEhlbmNlIEkgd29uZGVyIHdoZXRoZXIgeW91CmhhdmUgYSBuZWVkIGZvciB0aGlz
IGNoYW5nZSBpbiBzdWJzZXF1ZW50IHBhdGNoZXMgd2hpY2ggZ29lcwpiZXlvbmQgd2hhdCB5b3Ug
c2F5IGFib3ZlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
