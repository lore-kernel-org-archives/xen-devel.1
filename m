Return-Path: <SRS0=3oPe=3D=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CC4C33CB1
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jan 2020 09:32:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1FFA207FF
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jan 2020 09:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1FFA207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irIYM-0006jj-Bb; Tue, 14 Jan 2020 09:32:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irIYK-0006je-T0
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 09:32:00 +0000
X-Inumbo-ID: b227afe4-36b0-11ea-ac27-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b227afe4-36b0-11ea-ac27-bc764e2007e4;
 Tue, 14 Jan 2020 09:31:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6287AB87;
 Tue, 14 Jan 2020 09:31:51 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200113213342.8206-1-julien@xen.org>
 <20200113213342.8206-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f5dcdf24-f71c-164b-e770-594ea01bbe1e@suse.com>
Date: Tue, 14 Jan 2020 10:31:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200113213342.8206-2-julien@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] xen/x86: Remove unused forward
 declaration in asm-x86/irq.h
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDEuMjAyMCAyMjozMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEZyb206IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gTm9uZSBvZiB0aGUgcHJvdG90eXBlcyB3aXRo
aW4gdGhlIGhlYWRlciBhc20teDg2L2lycS5oIGFjdHVhbGx5IHJlcXVpcmVzCj4gdGhlIGZvcndh
cmQgZGVjbGFyYXRpb24gb2YgInN0cnVjdCBwaXJxIi4gU28gcmVtb3ZlIGl0Lgo+IAo+IE5vIGZ1
bmN0aW9uYWwgY2hhbmdlcyBpbnRlbmRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGpncmFsbEBhbWF6b24uY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCkl0IGlzIGdlbmVyYWxseSBuaWNlIHRvIGlkZW50aWZ5IGlmIHRoaXMgd2FzIG1p
c3NlZCBjbGVhbnVwICh0aGUKbmVlZCBpbmRlZWQgd2VudCBhd2F5IGluIDQuMTIpLCBvciBpZiBz
dWNoIGhhcyBuZXZlciByZWFsbHkgYmVlbgpuZWVkZWQuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
