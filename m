Return-Path: <SRS0=OoRj=ZL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30339C432C0
	for <xen-devel@archiver.kernel.org>; Tue, 19 Nov 2019 19:47:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0034D223B0
	for <xen-devel@archiver.kernel.org>; Tue, 19 Nov 2019 19:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="TPdGt18K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0034D223B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX9Sk-0004Jt-Ul; Tue, 19 Nov 2019 19:46:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sse+=ZL=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iX9Sj-0004Jj-9l
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 19:46:57 +0000
X-Inumbo-ID: 5782415c-0b05-11ea-a302-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5782415c-0b05-11ea-a302-12813bfff9fa;
 Tue, 19 Nov 2019 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574192817;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=CXuvpuoy0NtBQCTvXhGA+OmMHoj2gaXFvUFd8FT+GUw=;
 b=TPdGt18KHxyppVt3P5VEOhfmHdHUwnEVpzqn5Tlt3iUlQ0Z5J/E/mbpL
 ehlTSBg9NTjezGGkkCcGf8iRPbmEdPmW6c1AGm5K8RcuWJcdZ4YVspcL7
 pe0eNqllrslXycAhpTrLBPBj9quULvjS3S+s6GkHSxpGsHW3BagPVscAq 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8SIDt0LrdVprIfECnYIOYqZYdmqFF0uyHpBEjGO53Sxpq5C8G1Y2IL+K+/tT7cUAp5qDE1Dqrf
 qoeNP/vvSRRJtvGF4v1ZwhpaHq6tPmVzJfWi+/eHzjlFF57ebAleV5AOAyWVryd/+JAkpiA7Ly
 t1KT//ccso5XE63id5EsCvAI03IQpCvzki9Ye0DIoJYF/dk32wRB9E8xBVzLKKfio493FZIDEc
 +AR5FH9geINsshcs1w7Mz2EA98YQJAqaYEqrVq/+uv3d0i0AdkTuwrC2cUAB8Q6eAVPRhlL/Gl
 0Xg=
X-SBRS: 2.7
X-MesageID: 8555050
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,219,1571716800"; 
   d="scan'208";a="8555050"
To: Dietmar Hahn <dietmar.hahn@ts.fujitsu.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3020959.C8KU84B5rM@amur.mch.fsc.net>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <694f0fb2-4d89-2514-baeb-61f6c307ad43@citrix.com>
Date: Tue, 19 Nov 2019 19:46:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3020959.C8KU84B5rM@amur.mch.fsc.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-4.13.0-rc] kexec/kdump failure with cpu
 Intel(R) Xeon(R) Gold 6242 CPU
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTEvMjAxOSAxMTozOCwgRGlldG1hciBIYWhuIHdyb3RlOgo+IEhpLAo+IAo+IG9uIGEg
bmV3IG1hY2hpbmUgd2l0aCBjcHUgSW50ZWwoUikgWGVvbihSKSBHb2xkIDYyNDIgQ1BVIHRoZSBr
ZXhlYy9rZHVtcAo+IGRvZXNuJ3Qgd29yayB3aXRoIGN1cnJlbnQgeGVuLTQuMTMuMC1yYy4KPiBU
aGUgbGFzdCBvdXRwdXQgb2YgdGhlIHhlbiBjb25zb2xlIGlzOgo+IAo+IChYRU4pIEhhcmR3YXJl
IERvbTAgY3Jhc2hlZDogRXhlY3V0aW5nIGtleGVjIGltYWdlIG9uIGNwdTUKPiAoWEVOKSBTaG90
IGRvd24gYWxsIENQVXMKPiAKPiBBZnRlciBzaG9ydCBkZWxheSB0aGUgc3lzdGVtIHJlYm9vdHMu
Cj4gCj4gSXQgc2VlbXMgdGhlIGZpeGVzIG1lbnRpb25lZCBpbiB0aGUgdGhyZWFkCj4gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTEwL21z
ZzAxOTQ4Lmh0bWwKPiBhcmVuJ3QgZW5vdWdoLgo+IAo+IEkgYnVpbHQgeGVuLTQuMTEgd2l0aCB0
aGUgcGF0Y2hlcyBidXQgbm8gc3VjY2Vzcy4KPiBPbiBhbiBvbGRlciBzeXN0ZW0gd2l0aCB4ZW4t
NC40IHRoZSBrZHVtcCB3b3Jrcy4KCkZvciA0LjExIHlvdSBuZWVkIHRoaXMgZml4IGFzIHdlbGw6
IDEyYzM2ZjU3N2Q0NSAoImlvbW11OiBsZWF2ZSBJT01NVQplbmFibGVkIGJ5IGRlZmF1bHQgZHVy
aW5nIGtleGVjIGNyYXNoIHRyYW5zaXRpb24iKS4gSSdtIHByZXR0eSBjZXJ0YWluCnhlbi00LjQg
d291bGRuJ3Qgd29yayBvbiB5b3VyIG5ldyBzeXN0ZW0gYXMgd2VsbC4KCklnb3IKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
