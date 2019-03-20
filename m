From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: passthrough/amd: Remove unused
 function guest_iommu_set_base
Date: Wed, 20 Mar 2019 11:13:56 +0000
Message-ID: <b85a35fb-9b25-26ec-afb1-aef4c9f6e923@citrix.com>
References: <20190319232055.23993-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9c8J=RX=citrix.com=prvs=975c63c42=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h6ZAu-0005K2-Cp
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 11:14:24 +0000
In-Reply-To: <20190319232055.23993-1-julien.grall@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Brian Woods <brian.woods@amd.com>, Jan Beulich <jbeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDMvMjAxOSAyMzoyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBmdW5jdGlvbiBp
cyB1bnVzZWQgYW5kIGNvdWxkIHBvdGVudGlhbGx5IGxlYWQgYSB0byB0cmlnZ2VyIHRoZQo+IEJV
R19PTigpIGluIHAybV9jaGFuZ2VfdHlwZV9vbmUgaWYgbWlzdXNlZCBhcyB0aGUgcDJtIHR5cGUg
aXMgbm90Cj4gc2FuaXRpemVkLgo+Cj4gU28gcmVtb3ZlIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkVpdGhlciB0aGUgZW50aXJlIGZp
bGUgZ29lcywgb3IgdGhpcyBmdW5jdGlvbiBzdGF5cy7CoCBJdCBkZWZpbml0ZWx5Cmlzbid0IHBy
b2R1Y3Rpb24gcmVhZHkgeWV0LCBhcyBub3RlZCBpbiBteSBwb3N0LWNvbW1pdCBub3RlcyBpbgpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgt
MTEvbXNnMDIzNTYuaHRtbAoKSG93ZXZlciwgdGhpcyBmdW5jdGlvbmFsaXR5IGlzIGdvaW5nIHRv
IGJlIG5lY2Vzc2FyeSBpbiB0aGUgZnV0dXJlLsKgIEl0CmlzIHByb2JhYmx5IGVhc2llciBqdXN0
IHRvIGxlYXZlIGl0IGFzLWlzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
