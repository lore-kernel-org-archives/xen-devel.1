From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] iommu: specify page_count rather than
 page_order to iommu_map/unmap()...
Date: Mon, 21 Jan 2019 04:27:38 -0700
Message-ID: <5C45ACAA020000780020FAF9@prv1-mh.provo.novell.com>
References: <20190118160328.10455-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q2fe=P5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1glXk0-0003gu-9j
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 11:27:44 +0000
In-Reply-To: <20190118160328.10455-1-paul.durrant@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Sander Eikelenboom <linux@eikelenboom.it>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAxLjE5IGF0IDE3OjAzLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC4uLmFuZCByZW1vdmUgYWxpZ25tZW50IGFzc2VydGlvbnMuCj4gCj4gVGVzdGluZyBzaG93
cyB0aGF0IGNlcnRhaW4gY2FsbGVycyBvZiBpb21tdV9sZWdhY3lfbWFwL3VubWFwKCkgc3BlY2lm
eQo+IG9yZGVyID4gMCByYW5nZXMgdGhhdCBhcmUgbm90IG9yZGVyIGFsaWduZWQgdGh1cyBjYXVz
aW5nIG9uZSBvZiB0aGUKPiBJU19BTElHTkVEKCkgYXNzZXJ0aW9ucyB0byBmaXJlLgoKQXMgc2Fp
ZCBiZWZvcmUgLSB3aXRob3V0IGEgbXVjaCBiZXR0ZXIgZXhwbGFuYXRpb24gb2Ygd2h5IHRoZSBj
dXJyZW50Cm9yZGVyLWJhc2VkIG1vZGVsIGlzIHVuc3VpdGFibGUgKHNvIGZhciBJJ3ZlIGJlZW4g
cHJvdmlkZWQgb25seSB2YWd1ZQpwb2ludGVycyBpbnRvICJzb21ld2hlcmUgaW4gUFZIIERvbTAg
Ym9vdCBjb2RlIiBpaXJjKSB0byB1bmRlcnN0YW5kCndoeSBpdCdzIHVuZGVzaXJhYmxlIHRvIHNp
bXBseSBtYWtlIHRob3NlIGNhbGwgc2l0ZXMgb2JleSB0byB0aGUgY3VycmVudApyZXF1aXJlbWVu
dHMsIEknbSBub3QgaGFwcHkgdG8gc2VlIHVzIGdvIHRoaXMgcm91dGUuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
