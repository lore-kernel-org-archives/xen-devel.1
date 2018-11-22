From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH V2] x86/p2m: constify
 p2m_mem_access_sanity_check()
Date: Thu, 22 Nov 2018 13:09:24 -0700
Message-ID: <CABfawhkskO_=ZpD_dM8utntMd6L64eqiUDkZx+xs4suko-=4Kw@mail.gmail.com>
References: <1542802175-3955-1-git-send-email-rcojocaru@bitdefender.com>
 <1b5f1036-378a-e69d-781d-38b2b4e98415@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q2cZ=OB=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gPvIc-0000UB-Ek
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 20:10:06 +0000
Received: by mail-ed1-f68.google.com with SMTP id y56so8579347edd.11
 for <xen-devel@lists.xenproject.org>; Thu, 22 Nov 2018 12:10:04 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id x58sm13253599edm.10.2018.11.22.12.10.03
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Nov 2018 12:10:03 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id r10so10325819wrs.10
 for <xen-devel@lists.xenproject.org>; Thu, 22 Nov 2018 12:10:03 -0800 (PST)
In-Reply-To: <1b5f1036-378a-e69d-781d-38b2b4e98415@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgNToxNSBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gT24gMTEvMjEvMTggMjowOSBQTSwgUmF6dmFu
IENvam9jYXJ1IHdyb3RlOgo+ID4gTWlub3IgaW1wcm92ZW1lbnQ7IHNpbXBseSBpbXByb3Zpbmcg
Y29kZSBxdWFsaXR5IGJ5IHVzaW5nIGNvbnN0cwo+ID4gd2hlcmV2ZXIgcmVhc29uYWJsZS4KPiA+
Cj4gPiBTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiA+IFNp
Z25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4K
Pgo+IFRhbWFzLCBJIHRoaW5rIHdlIG5lZWQgeW91ciBhY2sgZm9yIHRoaXM/CgpBY2tlZC1ieTog
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
