From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] x86/altp2m: clean up
 p2m_{get/set}_suppress_ve()
Date: Mon, 24 Sep 2018 09:05:28 -0600
Message-ID: <CABfawhmCsx9-kUQNSNh4eqM=SPmVvNAN5C3nfjDQsqwUWi67kQ@mail.gmail.com>
References: <1537722262-6737-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sjmo=mg=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1g4SR6-0002qY-Vq
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 15:06:09 +0000
Received: by mail-ed1-f68.google.com with SMTP id u23so7451975edx.10
 for <xen-devel@lists.xenproject.org>; Mon, 24 Sep 2018 08:06:07 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id 25-v6sm7956610edz.45.2018.09.24.08.06.05
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Sep 2018 08:06:05 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id b19-v6so10095706wme.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Sep 2018 08:06:05 -0700 (PDT)
In-Reply-To: <1537722262-6737-1-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBTZXAgMjMsIDIwMTggYXQgMTE6MDUgQU0gUmF6dmFuIENvam9jYXJ1CjxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPgo+IE1vdmUgcDJtX3tnZXQvc2V0fV9zdXBwcmVz
c192ZSgpIHRvIHAybS5jLCByZXBsYWNlIGluY29ycmVjdAo+IEFTU0VSVCgpIGluIHAybS1wdC5j
IChzaW5jZSBhIGd1ZXN0IGNhbiBydW4gaW4gc2hhZG93IG1vZGUgZXZlbiBvbgo+IGEgc3lzdGVt
IHdpdGggdmlydCBleGNlcHRpb25zLCB3aGljaCB3b3VsZCB0cmlnZ2VyIHRoZSBBU1NFUlQoKSks
Cj4gYW5kIG1vdmUgdGhlIFZNWC1pc21zIChjcHVfaGFzX3ZteF92aXJ0X2V4Y2VwdGlvbnMgY2hl
Y2tzKSB0bwo+IHAybV9lcHRfe2dldC9zZXR9X2VudHJ5KCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBS
YXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgpBY2tlZC1ieTogVGFt
YXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
