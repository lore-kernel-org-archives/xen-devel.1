From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v7 3/6] iommu: push use of type-safe DFN and
 MFN into iommu_ops
Date: Thu, 13 Sep 2018 10:12:16 +0200
Message-ID: <20180913081216.tqtfcgieo553htqk@mac.bytemobile.com>
References: <20180912113028.19610-1-paul.durrant@citrix.com>
 <20180912113028.19610-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m7pv=l3=citrix.com=prvs=787f1cd73=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g0Mjh-0003lI-0C
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 08:12:25 +0000
Content-Disposition: inline
In-Reply-To: <20180912113028.19610-4-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTIsIDIwMTggYXQgMTI6MzA6MjVQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggbW9kaWZpZXMgdGhlIG1ldGhvZHMgaW4gc3RydWN0IGlvbW11X29w
cyB0byB1c2UgdHlwZS1zYWZlIERGTgo+IGFuZCBNRk4uIFRoaXMgZm9sbG93cyBvbiBmcm9tIHRo
ZSBwcmlvciBwYXRjaCB0aGF0IG1vZGlmaWVkIHRoZSBmdW5jdGlvbnMKPiBleHBvcnRlZCBpbiB4
ZW4vaW9tbXUuaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFu
dEBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPiBBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
