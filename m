From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/4] iommu: rename wrapper functions
Date: Thu, 06 Dec 2018 07:44:19 -0700
Message-ID: <5C0935C30200007800203B69@prv1-mh.provo.novell.com>
References: <20181205112924.36470-1-paul.durrant@citrix.com>
 <20181205112924.36470-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fsyp=op=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUut6-0000zK-Tg
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 14:44:24 +0000
In-Reply-To: <20181205112924.36470-3-paul.durrant@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEyLjE4IGF0IDEyOjI5LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEEgc3Vic2VxdWVudCBwYXRjaCB3aWxsIGFkZCBzZW1hbnRpY2FsbHkgZGlmZmVyZW50IHZl
cnNpb25zIG9mCj4gaW9tbXVfbWFwL3VubWFwKCkgc28sIGluIGFkdmFuY2Ugb2YgdGhhdCBjaGFu
Z2UsIHRoaXMgcGF0Y2ggcmVuYW1lcyB0aGUKPiBleGlzdGluZyBmdW5jdGlvbnMgdG8gaW9tbXVf
bGVnYWN5X21hcC91bm1hcCgpIGFuZCBtb2RpZmllcyBhbGwgY2FsbC1zaXRlcy4KPiBJdCBhbHNv
IGFkanVzdHMgYSBjb21tZW50IHRoYXQgcmVmZXJzIHRvIGlvbW11X21hcF9wYWdlKCksIHdoaWNo
IHdhcyByZS0KPiBuYW1lZCBieSBhIHByZXZpb3VzIHBhdGNoLgo+IAo+IFRoaXMgcGF0Y2ggaXMg
cHVyZWx5IGNvc21ldGljLiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkkgaGF2ZSB0byBhZG1pdCB0aGF0IEknbSB1bmRl
Y2lkZWQgd2hldGhlciB0byBhc2sgdGhhdCB0aGlzIGJlCmNvbW1pdHRlZCBpbiB0aGUgc2FtZSBk
ZXZlbG9wbWVudCB3aW5kb3cgd2hlcmUgYWxsIHRoZQoibGVnYWN5IiBpbmZpeGVzIHdvdWxkIGdv
IGF3YXkgYWdhaW4sIGkuZS4gcHJlc3VtYWJseSBvbmx5CmFmdGVyIDQuMTIgbm93LgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
