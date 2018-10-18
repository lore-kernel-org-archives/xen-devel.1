From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3] arch/x86: Add registers to vm_event
Date: Thu, 18 Oct 2018 13:56:07 -0600
Message-ID: <CABfawhmJReM5nxabj6+QyDCAyDBknTfMCuDe0NmJGL_0aa-cpA@mail.gmail.com>
References: <20181018090157.30186-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2kzf=m6=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gDEPY-00053c-AZ
 for xen-devel@lists.xenproject.org; Thu, 18 Oct 2018 19:56:48 +0000
Received: by mail-ed1-f67.google.com with SMTP id c1-v6so29400632ede.5
 for <xen-devel@lists.xenproject.org>; Thu, 18 Oct 2018 12:56:46 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id j22-v6sm8748998edr.96.2018.10.18.12.56.45
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Oct 2018 12:56:45 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id i8-v6so1489061wmg.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Oct 2018 12:56:45 -0700 (PDT)
In-Reply-To: <20181018090157.30186-1-aisaila@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Isaila <aisaila@bitdefender.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBPY3QgMTgsIDIwMTggYXQgMzowMiBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQo8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBhZGRzIGEgY291
cGxlIG9mIHJlZ3MgdG8gdGhlIHZtX2V2ZW50IHRoYXQgYXJlIHVzZWQgYnkKPiB0aGUgaW50cm9z
cGVjdGlvbi4gVGhlIGJhc2UsIGxpbWl0IGFuZCBhcgo+IGJpdHMgYXJlIGNvbXByZXNzZWQgaW50
byBhIHVpbnQ2NF90IHVuaW9uIHNvIGFzIG5vdCB0byBlbmxhcmdlIHRoZQo+IHZtX2V2ZW50Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5j
b20+CgpMR1RNCgpBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
