Return-Path: <SRS0=fmWs=TY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBFFC072B5
	for <xen-devel@archiver.kernel.org>; Fri, 24 May 2019 16:18:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C85152070D
	for <xen-devel@archiver.kernel.org>; Fri, 24 May 2019 16:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C85152070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUCtY-0005dy-PP; Fri, 24 May 2019 16:18:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aM+Y=TY=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hUCtW-0005dt-TL
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 16:18:10 +0000
X-Inumbo-ID: 8457e1d0-7e3f-11e9-b572-9b6237e0319e
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8457e1d0-7e3f-11e9-b572-9b6237e0319e;
 Fri, 24 May 2019 16:18:08 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 8A6AB3016C4A; Fri, 24 May 2019 19:18:07 +0300 (EEST)
Received: from [192.168.228.119] (5-12-248-112.residential.rdsnet.ro
 [5.12.248.112])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 6CBD1306E477;
 Fri, 24 May 2019 19:18:07 +0300 (EEST)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20190524152318.19735-1-jgross@suse.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <24756c8f-4505-7ab2-07b6-dd9e6868ff49@bitdefender.com>
Date: Fri, 24 May 2019 19:18:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190524152318.19735-1-jgross@suse.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v2] xen/vm_event: fix rc check for
 uninitialized ring
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190524161801.echrYwiH_4CL5WjkjXyjwxpqG1m45NAIp4tuFknx1Uk@z>

T24gNS8yNC8xOSA2OjIzIFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IHZtX2V2ZW50X2NsYWlt
X3Nsb3QoKSByZXR1cm5zIC1FT1BOT1RTVVBQIGZvciBhbiB1bmluaXRpYWxpemVkIHJpbmcKPiBz
aW5jZSBjb21taXQgMTVlNGRkNWU4NjZiNDNiYmMgKCJjb21tb24vdm1fZXZlbnQ6IEluaXRpYWxp
emUgdm1fZXZlbnQKPiBsaXN0cyBvbiBkb21haW4gY3JlYXRpb24iKSwgYnV0IHRoZSBjYWxsZXJz
IHRlc3QgZm9yIC1FTk9TWVMuCj4gCj4gQ29ycmVjdCB0aGUgY2FsbGVycy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gVjI6IGFkZCBi
bGFuayBsaW5lIChKYW4gQmV1bGljaCkKPiAgICAgcmVwbGFjZSB0d28gZnVydGhlciBFTk9TWVMg
cmV0dXJucyB3aXRoIEVPUE5PVFNVUFAgKFJhenZhbiBDb2pvY2FydSkKCkFja2VkLWJ5OiBSYXp2
YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
