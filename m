Return-Path: <SRS0=SZmv=Z7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5C2C43603
	for <xen-devel@archiver.kernel.org>; Mon,  9 Dec 2019 06:26:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254A8206D3
	for <xen-devel@archiver.kernel.org>; Mon,  9 Dec 2019 06:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 254A8206D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieCUM-0002XN-K2; Mon, 09 Dec 2019 06:25:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieCUL-0002XI-Th
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 06:25:45 +0000
X-Inumbo-ID: b99d9516-1a4c-11ea-879b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b99d9516-1a4c-11ea-879b-12813bfff9fa;
 Mon, 09 Dec 2019 06:25:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5493CAFAE;
 Mon,  9 Dec 2019 06:25:41 +0000 (UTC)
To: Qais Yousef <qais.yousef@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20191125112754.25223-1-qais.yousef@arm.com>
 <20191125112754.25223-11-qais.yousef@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ff1486b7-1072-b4a6-ff51-1d5861d2c17b@suse.com>
Date: Mon, 9 Dec 2019 07:25:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191125112754.25223-11-qais.yousef@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 10/14] driver: xen: Replace cpu_up/down
 with device_online/offline
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMTkgMTI6MjcsIFFhaXMgWW91c2VmIHdyb3RlOgo+IFRoZSBjb3JlIGRldmljZSBB
UEkgcGVyZm9ybXMgZXh0cmEgaG91c2VrZWVwaW5nIGJpdHMgdGhhdCBhcmUgbWlzc2luZwo+IGZy
b20gZGlyZWN0bHkgY2FsbGluZyBjcHVfdXAvZG93bi4KPiAKPiBTZWUgY29tbWl0IGE2NzE3YzAx
ZGRjMiAoInBvd2VycGMvcnRhczogdXNlIGRldmljZSBtb2RlbCBBUElzIGFuZAo+IHNlcmlhbGl6
YXRpb24gZHVyaW5nIExQTSIpIGZvciBhbiBleGFtcGxlIGRlc2NyaXB0aW9uIG9mIHdoYXQgbWln
aHQgZ28KPiB3cm9uZy4KPiAKPiBUaGlzIGFsc28gcHJlcGFyZXMgdG8gbWFrZSBjcHVfdXAvZG93
biBhIHByaXZhdGUgaW50ZXJmYWNlIGZvciBhbnl0aGluZwo+IGJ1dCB0aGUgY3B1IHN1YnN5c3Rl
bS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBRYWlzIFlvdXNlZiA8cWFpcy55b3VzZWZAYXJtLmNvbT4K
ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
