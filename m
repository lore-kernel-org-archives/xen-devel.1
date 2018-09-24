From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v5 2/5] x86/p2m/pod: make it build with
 !CONFIG_HVM
Date: Mon, 24 Sep 2018 09:11:40 -0600
Message-ID: <CABfawhkFD742t=ODEen4KS83DP8M2Z6o9vFKmnnhdaZvM-joyA@mail.gmail.com>
References: <cover.147d0f0e643da1e63074fd4940f98b9ad458396a.1537545258.git-series.wei.liu2@citrix.com>
 <9e3fd1496edc9a1543dc95f9b5ba6c55570fbfc9.1537545258.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sjmo=mg=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1g4SX8-0003Y4-F2
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 15:12:22 +0000
Received: by mail-ed1-f67.google.com with SMTP id k14-v6so16576798edr.13
 for <xen-devel@lists.xenproject.org>; Mon, 24 Sep 2018 08:12:20 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42])
 by smtp.gmail.com with ESMTPSA id l18-v6sm601752edq.12.2018.09.24.08.12.18
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Sep 2018 08:12:18 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id z14-v6so2571582wrs.10
 for <xen-devel@lists.xenproject.org>; Mon, 24 Sep 2018 08:12:18 -0700 (PDT)
In-Reply-To: <9e3fd1496edc9a1543dc95f9b5ba6c55570fbfc9.1537545258.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjEsIDIwMTggYXQgOTo1NSBBTSBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPiB3cm90ZToKPgo+IFBvcHVsYXRlLW9uLWRlbWFuZCBpcyBIVk0gb25seS4KPgo+IFByb3Zp
ZGUgYSBidW5jaCBvZiBzdHVicyBmb3IgY29tbW9uIHAybSBjb2RlIGFuZCBndWFyZCBvbmUgaW52
b2NhdGlvbgo+IG9mIGd1ZXN0X3BoeXNtYXBfbWFya19wb3B1bGF0ZV9vbl9kZW1hbmQgd2l0aCBp
c19odm1fZG9tYWluLgo+Cj4gUHV0IHJlbGV2YW50IGZpZWxkcyBpbiBwMm1fZG9tYWluIGFuZCBj
b2RlIHdoaWNoIHRvdWNoZXMgdGhvc2UgZmllbGRzCj4gdW5kZXIgQ09ORklHX0hWTS4KPgo+IFNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogVGFt
YXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
