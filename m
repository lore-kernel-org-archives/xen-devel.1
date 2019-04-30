Return-Path: <SRS0=9ImI=TA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B3AC43219
	for <xen-devel@archiver.kernel.org>; Tue, 30 Apr 2019 10:19:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A876121670
	for <xen-devel@archiver.kernel.org>; Tue, 30 Apr 2019 10:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A876121670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLPr0-0001r0-1o; Tue, 30 Apr 2019 10:19:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5T1X=TA=citrix.com=prvs=016a56d21=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLPqy-0001qv-TH
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 10:19:12 +0000
X-Inumbo-ID: 65b1d171-6b31-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 65b1d171-6b31-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 10:19:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,413,1549929600"; d="scan'208";a="84737325"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23752.8472.14097.76030@mariner.uk.xensource.com>
Date: Tue, 30 Apr 2019 11:19:04 +0100
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
In-Reply-To: <20190429224252.29000-1-marmarek@invisiblethingslab.com>
References: <20190429224252.29000-1-marmarek@invisiblethingslab.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2] python: Adjust xc_physinfo wrapper for
 updated virt_caps bits
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190430101904.gKBNnkXlDjfFdE9OR2zZ_A_SgvDpUUd-DW-Fur-w-hs@z>

TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIltQQVRDSCB2Ml0gcHl0aG9uOiBB
ZGp1c3QgeGNfcGh5c2luZm8gd3JhcHBlciBmb3IgdXBkYXRlZCB2aXJ0X2NhcHMgYml0cyIpOgo+
IENvbW1pdCBmMDg5ZmRkZDk0ICJ4ZW46IHJlcG9ydCBQViBjYXBhYmlsaXR5IGluIHN5c2N0bCBh
bmQgdXNlIGl0IGluCj4gdG9vbHN0YWNrIiBjaGFuZ2VkIG1lYW5pbmcgb2YgdmlydF9jYXBzIGJp
dCAxIC0gcHJldmlvdXNseSBpdCB3YXMKPiAiZGlyZWN0aW8iLCBidXQgd2FzIGNoYW5nZWQgdG8g
InB2IiBhbmQgImRpcmVjdGlvIiB3YXMgbW92ZWQgdG8gYml0IDIuCj4gQWRqdXN0IHB5dGhvbiB3
cmFwcGVyIHRvIHVzZSAjZGVmaW5lcyBmb3IgdGhlIGJpdHMgdmFsdWVzLCBhbmQgYWRkCj4gcmVw
b3J0aW5nIG9mIGJvdGggInB2X2RpcmVjdGlvIiBhbmQgImh2bV9kaXJlY3RpbyIuCj4gCj4gU2ln
bmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2li
bGV0aGluZ3NsYWIuY29tPgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
