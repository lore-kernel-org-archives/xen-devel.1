From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/3] libxc: Cleanup
 xc_dom_parse_elf_kernel()'s return value
Date: Fri, 9 Feb 2018 12:00:44 +0000
Message-ID: <20180209120044.ee6kehfbiylr7x3f@MacBook-Pro-de-Roger.local>
References: <20180208214910.10699-1-simon@invisiblethingslab.com>
 <20180208214910.10699-2-simon@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qs32=fd=citrix.com=prvs=5717decf0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ek7MQ-000214-RX
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 12:00:58 +0000
Content-Disposition: inline
In-Reply-To: <20180208214910.10699-2-simon@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMDgsIDIwMTggYXQgMTA6NDk6MDhQTSArMDEwMCwgU2ltb24gR2Fpc2VyIHdy
b3RlOgo+IHhjX2RvbV9sb2FkZXIucGFyc2VyKCkgc2hvdWxkIHJldHVybiBlbGZfbmVnZXJybm92
YWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2ltb24gR2Fpc2VyIDxzaW1vbkBpbnZpc2libGV0aGlu
Z3NsYWIuY29tPgoKTEdUTToKClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
