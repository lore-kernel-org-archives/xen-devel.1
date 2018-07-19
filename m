From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 09/13] vtd: add lookup_page method to
 iommu_ops
Date: Thu, 19 Jul 2018 10:55:31 +0100
Message-ID: <20180719095531.qzufndb5hnw3upiu@citrix.com>
References: <20180717133816.37958-1-paul.durrant@citrix.com>
 <20180717133816.37958-10-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xz3x=kd=citrix.com=prvs=731336292=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fg5eo-0001fl-IC
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 09:55:34 +0000
Content-Disposition: inline
In-Reply-To: <20180717133816.37958-10-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTcsIDIwMTggYXQgMDI6Mzg6MTJQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBtZXRob2QgdG8gdGhlIFZULWQgSU9NTVUgaW1w
bGVtZW50YXRpb24gdG8gZmluZCB0aGUKPiBNRk4gY3VycmVudGx5IG1hcHBlZCBieSB0aGUgc3Bl
Y2lmaWVkIEJGTiBhbG9uZyB3aXRoIGEgd3JhcHBlciBmdW5jdGlvbiBpbgo+IGdlbmVyaWMgSU9N
TVUgY29kZSB0byBjYWxsIHRoZSBpbXBsZW1lbnRhdGlvbiBpZiBpdCBleGlzdHMuCj4gCj4gVGhp
cyBmdW5jdGlvbmFsaXR5IHdpbGwgYmUgdXNlZCBieSBhIHN1YnNlcXVlbnQgcGF0Y2guCj4gCj4g
U2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KClJl
dmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
