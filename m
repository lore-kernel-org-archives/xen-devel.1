Return-Path: <SRS0=JVlm=TD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DF8C43219
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 16:15:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6CF620651
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 16:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6CF620651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaq5-0002VU-4R; Fri, 03 May 2019 16:15:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMaq4-0002VP-0U
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:15:08 +0000
X-Inumbo-ID: 9d81dc10-6dbe-11e9-8d85-17ac1a7d5e52
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9d81dc10-6dbe-11e9-8d85-17ac1a7d5e52;
 Fri, 03 May 2019 16:15:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B4B4374;
 Fri,  3 May 2019 09:15:06 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 414DA3F557;
 Fri,  3 May 2019 09:15:05 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-6-julien.grall@arm.com>
 <41447e74-1dab-72d3-74b7-cf5d5fabf45d@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8fa5ac75-5e8d-4be0-f899-f362a070c27d@arm.com>
Date: Fri, 3 May 2019 17:15:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <41447e74-1dab-72d3-74b7-cf5d5fabf45d@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 05/20] xen/arm: Rework secondary_start
 prototype
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190503161503.J1DUYIzAJC3D3F0XYJGtx5QGcKFdwE9VNKxdLFPFyzg@z>

CgpPbiAwMy8wNS8yMDE5IDE2OjU2LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKPiAKPiBPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBOb25lIG9m
IHRoZSBwYXJhbWV0ZXJzIG9mIHNlY29uZGFyeV9zdGFydCBhcmUgYWN0dWFsbHkgdXNlZC4gU28g
dHVybgo+PiBzZWNvbmRhcnlfc3RhcnQgdG8gYSBmdW5jdGlvbiB3aXRoIG5vIHBhcmFtZXRlcnMu
Cj4+Cj4+IEFsc28gbW9kaWZ5IHRoZSBhc3NlbWJseSBjb2RlIHRvIGF2b2lkIHNldHRpbmctdXAg
dGhlIHJlZ2lzdGVycyBiZWZvcmUKPj4gY2FsbGluZyBzZWNvbmRhcnlfc3RhcnQuCj4gCj4gV2hh
dCBpcyBub3QgcmVhbGx5IG1hbmRhdG9yeS4KClNvLi4uPyBZb3UganVzdCBkb24ndCBzZXR1cCBw
YXJhbWV0ZXIgd2hlbiBpdCBpcyBub3QgbmVjZXNzYXJ5LiBUaGUgbW9yZSBpdCBpcyAKcXVpdGUg
Y29uZnVzaW5nIGZvciBhIHJlYWRlciB0byBzZWUgdGhlIHJlZ2lzdGVycyBhcmUgc2V0dXAgYnV0
IG5vdCB1c2VkIGJ5IHRoZSAKY2FsbGVyLgoKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiBUaG91Z2g6Cj4gCj4gUmV2aWV3ZWQt
Ynk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgpUaGFuayB5b3UuCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
