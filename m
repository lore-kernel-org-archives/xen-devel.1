Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E223C43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 14:58:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2BC52081C
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 14:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2BC52081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJfp5-0006Du-Q9; Thu, 25 Apr 2019 14:58:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nzHz=S3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJfp4-0006Dp-DC
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 14:58:02 +0000
X-Inumbo-ID: 852e7207-676a-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 852e7207-676a-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 14:58:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6B3CA78;
 Thu, 25 Apr 2019 07:58:00 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B0973F5AF;
 Thu, 25 Apr 2019 07:57:58 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20190415052502.1067-1-jgross@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <bad92fbd-6513-4b11-7668-74af70bf7176@arm.com>
Date: Thu, 25 Apr 2019 15:57:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415052502.1067-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.13 Development Update
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
Cc: "lars.kurth@citrix.com" <lars.kurth@citrix.com>, wei.liu2@citrix.com,
 konrad.wilk@oracle.com, andrew.cooper3@citrix.com,
 marmarek@invisiblethingslab.com, dfaggioli@suse.com, paul.durrant@citrix.com,
 "committers@xenproject.org" <committers@xenproject.org>, JBeulich@suse.com,
 puwen@hygon.cn, luwei.kang@intel.com, Volodymyr_Babchuk@epam.com,
 chao.gao@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425145756.AsljlWfVGus_RWzBOngfDC973z0O8o7WDZuWLKLm8f8@z>

KCsgQ29tbWl0dGVycykKCkhpIEp1ZXJnZW4sCgpPbiAxNS8wNC8yMDE5IDA2OjI1LCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOgo+IFRoaXMgZW1haWwgb25seSB0cmFja3MgYmlnIGl0ZW1zIGZvciB4ZW4u
Z2l0IHRyZWUuIFBsZWFzZSByZXBseSBmb3IgaXRlbXMgeW91Cj4gd291bGQgbGlrZSB0byBzZWUg
aW4gNC4xMyBzbyB0aGF0IHBlb3BsZSBoYXZlIGFuIGlkZWEgd2hhdCBpcyBnb2luZyBvbiBhbmQK
PiBwcmlvcml0aXNlIGFjY29yZGluZ2x5LgoKVGhvc2UgZS1tYWlscyBiZWNvbWUgZWFzaWx5IHVu
bm90aWNlZCBvbiB4ZW4tZGV2ZWwgd2hlbiB5b3UgYXJlIG5vdCBDQ2VkLiBJbiBhbGwgCmhvbmVz
dHksIEkgcHJvYmFibHkgbWlzc2VkIHRoZSBhbGwgdGhvc2UgZS1tYWlscyBmb3IgdGhlIHBhc3Qg
eWVhciBiZWNhdXNlIHRoZXkgCmRpZG4ndCBsYW5kIGluIG15IGluYm94LiBZZXMgSSB0aGluayB0
aGV5IGFyZSBpbXBvcnRhbnQgZm9yIHRoZSBtYWludGFpbmVycyB0byAKc2VlIHdoYXQncyBnb2lu
ZyBvbi4KCkNvdWxkIHdlIGZpbmQgYSB3YXkgdG8gZWFzaWx5IGZpbHRlciB0aGVtPyBPbiBJUkMs
IEp1ZXJnZW4gc3VnZ2VzdGVkIFtQcm9jY2VzXS4gCkFueSBvcGluaW9ucz8KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
