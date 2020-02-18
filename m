Return-Path: <SRS0=Jx38=4G=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C038C34026
	for <xen-devel@archiver.kernel.org>; Tue, 18 Feb 2020 13:15:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AD06206F4
	for <xen-devel@archiver.kernel.org>; Tue, 18 Feb 2020 13:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="cow1EUuw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AD06206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j42it-00035M-Bx; Tue, 18 Feb 2020 13:15:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/79L=4G=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j42ir-00035H-AZ
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 13:15:33 +0000
X-Inumbo-ID: bd9397e2-5250-11ea-bc8e-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd9397e2-5250-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 13:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582031732;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=KGHGx/uIjPej6ZiI+D5WousKQTVMA/FJe2gdFBUT72Q=;
 b=cow1EUuwgQRQVnolk0z04Ed/znTAR1mdZp534/ccOlaPjZLB9z5qicfW
 ERRvAfyqss7FhpMCUaPzV1bqY5oBiADShyu+okqpGvdGcWhWucra26d0Z
 5zEbwBvd9f/0SsfVg7iuLLFCS1hNj9/n9NpB6qMraLF3ACi1SWAoZ8zGY c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9CBBB0YsiwhlkRfo4GKAyUu19fn2TUydpuWjTPnlZus4g2gBiYZGSSZAN7T5GIo4Bm+uosEFul
 yeyjrhB25X6fMXgx9gNwisf5h1Gmg/cqNSCwctE50oqCMJCM+gQ9/eN/R7QyQ3XMiVhUFJNvX0
 e60ZUS8iFVW1SQGh2GzkB71XDURlEmO055A4bNFsFl4ZFLExV6t0VXjPprxry4Hjo4flEvQBvQ
 WQ9R7e33TKdhmfedTAxtB7TBSl44tETIVCccPjtizTxyXWl7MdLkvx8Y/Op2rSp8gRymUkb4Ge
 K9k=
X-SBRS: 2.7
X-MesageID: 12619779
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12619779"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20200218122114.17596-1-jgross@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <8f900180-718c-e0e4-a638-c1404e00058f@citrix.com>
Date: Tue, 18 Feb 2020 13:15:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200218122114.17596-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/4] xen/rcu: let rcu work better with
 core scheduling
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDIvMjAyMCAxMjoyMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUb2RheSB0aGUgUkNV
IGhhbmRsaW5nIGluIFhlbiBpcyBhZmZlY3Rpbmcgc2NoZWR1bGluZyBpbiBzZXZlcmFsIHdheXMu
Cj4gSXQgaXMgcmFpc2luZyBzY2hlZCBzb2Z0aXJxcyB3aXRob3V0IGFueSByZWFsIG5lZWQgYW5k
IGl0IHJlcXVpcmVzCj4gdGFza2xldHMgZm9yIHJjdV9iYXJyaWVyKCksIHdoaWNoIGludGVyYWN0
cyBiYWRseSB3aXRoIGNvcmUgc2NoZWR1bGluZy4KPiAKPiBUaGlzIHNtYWxsIHNlcmllcyByZXBh
aXJzIHRob3NlIGlzc3Vlcy4KPiAKPiBBZGRpdGlvbmFsbHkgc29tZSBBU1NFUlQoKXMgYXJlIGFk
ZGVkIGZvciB2ZXJpZmljYXRpb24gb2Ygc2FuZSByY3UKPiBoYW5kbGluZy4gSW4gb3JkZXIgdG8g
YXZvaWQgdGhvc2UgdHJpZ2dlcmluZyByaWdodCBhd2F5IHRoZSBvYnZpb3VzCj4gdmlvbGF0aW9u
cyBhcmUgZml4ZWQuCj4gCgpJbml0aWFsIHRlc3Qgb2YgdGhlIGZpcnN0IDIgcGF0Y2hlcyBpcyBw
cm9taXNpbmcuIFdpbGwgcnVuIG1vcmUgdGVzdHMKb3ZlciBuaWdodCB0byBzZWUgaG93IHN0YWJs
ZSBpdCBpcy4KCklnb3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
