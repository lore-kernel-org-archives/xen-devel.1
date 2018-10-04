From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH V6] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Thu, 4 Oct 2018 10:56:32 -0600
Message-ID: <CABfawhmo=22jwKkUgBUZwMDwJ-NTtrKovj5uZaa94109yQPmnA@mail.gmail.com>
References: <1538035134-10967-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rxxd=mq=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1g86w5-0005be-Sg
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 16:57:13 +0000
Received: by mail-ed1-f66.google.com with SMTP id c1-v6so9203947ede.5
 for <xen-devel@lists.xenproject.org>; Thu, 04 Oct 2018 09:57:12 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48])
 by smtp.gmail.com with ESMTPSA id j19-v6sm953642ejb.64.2018.10.04.09.57.10
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Oct 2018 09:57:10 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 189-v6so9742631wmw.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Oct 2018 09:57:10 -0700 (PDT)
In-Reply-To: <1538035134-10967-1-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Adrian Pop <apop@bitdefender.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjcsIDIwMTggYXQgMTo1OSBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gQ3VycmVudGx5IHRoZXJlIGlzIGEgc3Vib3Ag
Zm9yIHNldHRpbmcgdGhlIG1lbWFjY2VzcyBvZiBhIHBhZ2UsIGJ1dCBub3QKPiBmb3IgY29uc3Vs
dGluZyBpdC4gIFRoZSBuZXcgSFZNT1BfYWx0cDJtX2dldF9tZW1fYWNjZXNzIGFkZHMgdGhpcwo+
IGZ1bmN0aW9uYWxpdHkuCj4KPiBCb3RoIGFsdHAybSBnZXQvc2V0IG1lbSBhY2Nlc3MgZnVuY3Rp
b25zIHVzZSB0aGUgc3RydWN0Cj4geGVuX2h2bV9hbHRwMm1fbWVtX2FjY2VzcyB3aGljaCBoYXMg
bm93IGRyb3BwZWQgdGhlIGBzZXQnIHBhcnQgYW5kIGhhcwo+IGJlZW4gcmVuYW1lZCBmcm9tIHhl
bl9odm1fYWx0cDJtX3NldF9tZW1fYWNjZXNzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBv
cCA8YXBvcEBiaXRkZWZlbmRlci5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1
IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoKTEdUTQpBY2tlZC1ieTogVGFtYXMgSyBMZW5n
eWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
