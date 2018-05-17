From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH 07/10] mg-anoint: Make readonly
 operations "work" in standalone mode
Date: Thu, 17 May 2018 15:20:15 +0100
Message-ID: <20180517142015.em6cjaranuzsucwu@MacBook-Pro-de-Roger.local>
References: <1526555819-29883-1-git-send-email-ian.jackson@eu.citrix.com>
 <1526555819-29883-8-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xtgg=ie=citrix.com=prvs=668872ca3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fJJmr-0002AA-TK
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 14:21:45 +0000
Content-Disposition: inline
In-Reply-To: <1526555819-29883-8-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTcsIDIwMTggYXQgMTI6MTY6NTZQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhpcyBtYWtlcyBgbWctYW5vaW50JyBpbiBzdGFuZGFsb25lIG1vZGUgYSB2aWV3IG9u
dG8gYW4gZW1wdHkgc2V0IG9mCj4gYW5vaW50bWVudHMuICBTbyBub3cgaXQgYmVjb21lcyBvayB0
byBjYWxsIG1nLWFub2ludCBpbiBtYWtlLSotZmxpZ2h0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IElh
biBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
