From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 04/13] iommu: push use of type-safe BFN
 and MFN into iommu_ops
Date: Thu, 19 Jul 2018 09:10:07 +0100
Message-ID: <20180719081007.7px4byb3y56k4omt@citrix.com>
References: <20180717133816.37958-1-paul.durrant@citrix.com>
 <20180717133816.37958-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xz3x=kd=citrix.com=prvs=731336292=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fg40z-000051-9Q
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 08:10:21 +0000
Content-Disposition: inline
In-Reply-To: <20180717133816.37958-5-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTcsIDIwMTggYXQgMDI6Mzg6MDdQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggbW9kaWZpZXMgdGhlIG1ldGhvZHMgaW4gc3RydWN0IGlvbW11X29w
cyB0byB1c2UgdHlwZS1zYWZlIEJGTgo+IGFuZCBNRk4uIFRoaXMgZm9sbG93cyBvbiBmcm9tIHRo
ZSBwcmlvciBwYXRjaCB0aGF0IG1vZGlmaWVkIHRoZSBmdW5jdGlvbnMKPiBleHBvcnRlZCBpbiB4
ZW4vaW9tbXUuaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFu
dEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
