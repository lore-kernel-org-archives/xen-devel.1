From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 02/34] x86/vvmx: make get_shadow_eptp static
 function
Date: Wed, 22 Aug 2018 02:48:00 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912D37EB@SHSMSX101.ccr.corp.intel.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <8031c7ec84999887184e15c73a534ee80a0642d7.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5ybv=lf=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fsJBn-0007Ta-Uv
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 02:48:07 +0000
In-Reply-To: <8031c7ec84999887184e15c73a534ee80a0642d7.1534518694.git-series.wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBXZWkgTGl1IFttYWlsdG86d2VpLmxpdTJAY2l0cml4LmNvbV0KPiBTZW50OiBGcmlk
YXksIEF1Z3VzdCAxNywgMjAxOCAxMToxMiBQTQo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBp
bnRlbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
