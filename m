From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH V3] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Mon, 14 Jan 2019 07:37:31 -0700
Message-ID: <CABfawhnFYG3h2wMwFNR_XkK42qCe7DwzES+ozGYjsjhnsZGwgg@mail.gmail.com>
References: <1544788198-28303-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gf7h=PW=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gj3OR-0005BH-Ta
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 14:39:11 +0000
Received: by mail-ed1-f68.google.com with SMTP id g22so18806014edr.7
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jan 2019 06:39:10 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48])
 by smtp.gmail.com with ESMTPSA id i24sm4132976edq.0.2019.01.14.06.38.08
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Jan 2019 06:38:09 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id p6so9072962wmc.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jan 2019 06:38:08 -0800 (PST)
In-Reply-To: <1544788198-28303-1-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMTQsIDIwMTggYXQgNDo1MCBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gQmxvY2sgaW50ZXJydXB0cyAoaW4gdm14X2lu
dHJfYXNzaXN0KCkpIGZvciB0aGUgZHVyYXRpb24gb2YKPiBwcm9jZXNzaW5nIGEgc3luYyB2bV9l
dmVudCAoc2ltaWxhcmx5IHRvIHRoZSBzdHJhdGVneQo+IGN1cnJlbnRseSB1c2VkIGZvciBzaW5n
bGUtc3RlcHBpbmcpLiBPdGhlcndpc2UsIGF0dGVtcHRpbmcKPiB0byBlbXVsYXRlIGFuIGluc3Ry
dWN0aW9uIHdoZW4gcmVxdWVzdGVkIGJ5IGEgdm1fZXZlbnQKPiByZXBseSBtYXkgbGVnaXRpbWF0
ZWx5IG5lZWQgdG8gY2FsbCBlLmcuCj4gaHZtX2luamVjdF9wYWdlX2ZhdWx0KCksIHdoaWNoIHRo
ZW4gb3ZlcndyaXRlcyB0aGUgYWN0aXZlCj4gaW50ZXJydXB0IGluIHRoZSBWTUNTLgo+Cj4gVGhl
IHN5bmMgdm1fZXZlbnQgaGFuZGxpbmcgcGF0aCBvbiB4ODYvVk1YIGlzIChyb3VnaGx5KToKPiBt
b25pdG9yX3RyYXBzKCkgLT4gcHJvY2VzcyB2bV9ldmVudCAtPiB2bXhfaW50cl9hc3Npc3QoKQo+
IChwb3NzaWJseSB3cml0aW5nIFZNX0VOVFJZX0lOVFJfSU5GTykgLT4KPiBodm1fdm1fZXZlbnRf
ZG9fcmVzdW1lKCkgLT4gaHZtX2VtdWxhdGVfb25lX3ZtX2V2ZW50KCkKPiAocG9zc2libHkgb3Zl
cndyaXRpbmcgdGhlIFZNX0VOVFJZX0lOVFJfSU5GTyB2YWx1ZSkuCj4KPiBUaGlzIHBhdGNoIG1h
eSBhbHNvIGJlIGhlbHBmdWwgZm9yIHRoZSBmdXR1cmUgcmVtb3ZhbAo+IG9mIG1heV9kZWZlciBp
biBodm1fc2V0X2NyezAsMyw0fSBhbmQgaHZtX3NldF9tc3IoKS4KPgo+IFNpZ25lZC1vZmYtYnk6
IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KCkFja2VkLWJ5OiBU
YW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
