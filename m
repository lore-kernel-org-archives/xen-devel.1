From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/3] libxl: Constify src of
 device_compare_fn_t
Date: Tue, 9 Apr 2019 13:38:13 +0100
Message-ID: <20190409123813.GL30543@zion.uk.xensource.com>
References: <20190405175811.7446-1-anthony.perard@citrix.com>
 <20190405175811.7446-3-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDq1D-000234-Ka
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:38:27 +0000
Content-Disposition: inline
In-Reply-To: <20190405175811.7446-3-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMDUsIDIwMTkgYXQgMDY6NTg6MTBQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gQWxsIGZ1bmN0aW9ucyBsaWJ4bF9kZXZpY2VfKl9jb3B5IHdoaWNoIGltcGxlbWVu
dHMgZGV2aWNlX2NvbXBhcmVfZm5fdAo+IGFscmVhZHkgaGF2ZSB0aGUgYHNyYycgcGFyYW1ldGVy
IGRlZmluZWQgd2l0aCBjb25zdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
