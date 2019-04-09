Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C7FC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:40:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 538C02084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 538C02084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDnEW-0006Lt-0p; Tue, 09 Apr 2019 09:40:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDjF=SL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDnEV-0006Lo-0z
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:39:59 +0000
X-Inumbo-ID: 701f7236-5aab-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 701f7236-5aab-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 09:39:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D07480D;
 Tue,  9 Apr 2019 02:39:57 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCF893F59C;
 Tue,  9 Apr 2019 02:39:56 -0700 (PDT)
To: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>,
 Amit Singh Tomar <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
References: <1553163935-12862-1-git-send-email-amittomer25@gmail.com>
 <1553163935-12862-2-git-send-email-amittomer25@gmail.com>
 <5f956c43-6885-3553-2f37-bb9ce48e981b@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cd327f36-09db-f322-4675-30140839e159@arm.com>
Date: Tue, 9 Apr 2019 10:39:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <5f956c43-6885-3553-2f37-bb9ce48e981b@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/3] xen/arm: Add MESON UART driver for
 Amlogic Meson SoCs
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
Cc: sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409093955.tgB-sTza8_XsQ1h0xYHui6ZmJG5CfrsNixKMNwQd0Hc@z>

SGksCgpPbiAwMi8wNC8yMDE5IDIxOjAxLCBBbmRyw6kgUHJ6eXdhcmEgd3JvdGU6Cj4gT24gMjEv
MDMvMjAxOSAxMDoyNSwgQW1pdCBTaW5naCBUb21hciB3cm90ZToKPj4gVGhpcyBwYXRjaCBhZGRz
IGRyaXZlciBmb3IgVUFSVCBjb250cm9sbGVyIHByZXNlbnQgb24gQW1sb2dpYyBNZXNvbgo+PiBT
b0NzIGFuZCBpdCBoYXMgYmVlbiB0ZXN0ZWQgb24gTmFub3BpIEsyIGJvYXJkIGJhc2VkIG9uIFM5
MDUgU29DLgo+Pgo+PiBDb250cm9sbGVyIHJlZ2lzdGVycyBkZWZpbmF0aW9uIGlzIHRha2VuIGZy
b20gTGludXggNC4yMC4KPj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2Iv
djQuMjAtcmMxL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPj4KPj4gU2lnbmVkLW9m
Zi1ieTogQW1pdCBTaW5naCBUb21hciA8YW1pdHRvbWVyMjVAZ21haWwuY29tPgo+IAo+IFRoYW5r
cyBmb3IgdGhlIGNoYW5nZXMhCj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRy
ZS5wcnp5d2FyYUBhcm0uY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CgpJIGhhdmUgY29tbWl0dGVkIHRoaXMgcGF0Y2ggYW5kIHRoZSBmb2xsb3dpbmcg
cGF0Y2guIFBsZWFzZSByZXNlbmQgdGhlIGZpcnN0IApwYXRjaCB3aXRoIHRoZSBjb21tZW50cyBh
ZGRyZXNzZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
