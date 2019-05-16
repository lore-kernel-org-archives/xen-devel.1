From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
Date: Thu, 16 May 2019 17:29:32 +0300
Message-ID: <f2180e29-2e12-ad57-da03-97f48ed592e8@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <5CDD52F1020000780022FA14@prv1-mh.provo.novell.com>
 <80187476-c972-7d88-d6f7-09c04d96705e@gmail.com>
 <4912f9e5-860a-04ce-92bc-99e1abe700a1@arm.com>
 <0095c6f0-531c-3794-991e-662a9a1283be@gmail.com>
 <837c80dd-4033-a54e-d700-454df167e2d0@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N6Wg=TQ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hRHO5-0005Qn-8I
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 14:29:37 +0000
Received: by mail-lf1-x144.google.com with SMTP id u27so2794646lfg.10
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 07:29:36 -0700 (PDT)
In-Reply-To: <837c80dd-4033-a54e-d700-454df167e2d0@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNi4wNS4xOSAxNzoyOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdlbGwsIGlmIHlvdSBm
YWlsIHRoZSBjaGVjayB0aGVuIGl0IG1lYW5zIHNvbWVvbmUgd2FzIG1vZGlmeWluZyBpdCBiZWhp
bmQgeW91ciBiYWNrLiBUaGF0IHNvbWVvbmUgY291bGQgdXBkYXRlIHRoZSBydW5zdGF0ZSB3aXRo
IHRoZSBuZXcgaW5mb3JtYXRpb24gb25jZSBpdCBpcyBtb2RpZmllZC4gU28gSSBjYW4ndCBzZWUg
aXNzdWUgd2l0aCBub3QgdXBkYXRpbmcgdGhlIHJ1bnN0YXRlIGluIHRoZSBjb250ZXh0IHN3aXRj
aC4KClRoYXQncyBmYWlyIGVub3VnaC4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
