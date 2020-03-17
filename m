Return-Path: <SRS0=G0Zv=5C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18224C18E5B
	for <xen-devel@archiver.kernel.org>; Tue, 17 Mar 2020 10:18:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E07352071C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Mar 2020 10:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E07352071C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jE9Hk-0008Qz-9x; Tue, 17 Mar 2020 10:17:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lIpW=5C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jE9Hj-0008Qt-9R
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 10:17:19 +0000
X-Inumbo-ID: 7a66d346-6838-11ea-b8fe-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a66d346-6838-11ea-b8fe-12813bfff9fa;
 Tue, 17 Mar 2020 10:17:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26BABAD63;
 Tue, 17 Mar 2020 10:17:16 +0000 (UTC)
To: Hongyan Xia <hx242@xen.org>
References: <bd60c61a1e7eb0bafa1ed60f87ab144ae4d34c1f.1584379843.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <42e5b23c-31e2-5bf6-da43-8a0c136577c2@suse.com>
Date: Tue, 17 Mar 2020 11:17:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bd60c61a1e7eb0bafa1ed60f87ab144ae4d34c1f.1584379843.git.hongyxia@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/tboot: check return value of dmar_table
 allocation
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDMuMjAyMCAxODozMCwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gRnJvbTogSG9uZ3lhbiBY
aWEgPGhvbmd5eGlhQGFtYXpvbi5jb20+Cj4gCj4gVGhlIGFsbG9jYXRpb24gY2FuIGp1c3QgcmV0
dXJuIE5VTEwuIFJldHVybiBhbiBlcnJvciB2YWx1ZSBlYXJseSBpbnN0ZWFkCj4gb2YgY3Jhc2hp
bmcgbGF0ZXIgb24uCgpOb3QgdmVyeSBsaWtlbHksIGFuZCB3ZSdsbCBiZSBpbiBiaWdnZXIgdHJv
dWJsZSBpbiBzdWNoIGEgY2FzZSwgYnV0Cnllcy4KCj4gU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBY
aWEgPGhvbmd5eGlhQGFtYXpvbi5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
