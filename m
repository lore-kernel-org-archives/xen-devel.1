Return-Path: <SRS0=9rT6=SQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D4DC10F13
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 16:08:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 305DD2084E
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 16:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 305DD2084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFhfR-0001RQ-Qk; Sun, 14 Apr 2019 16:07:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bMma=SQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hFhfQ-0001RL-5d
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 16:07:40 +0000
X-Inumbo-ID: 6bbe34ec-5ecf-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6bbe34ec-5ecf-11e9-92d7-bc764e045a96;
 Sun, 14 Apr 2019 16:07:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB2A680D;
 Sun, 14 Apr 2019 09:07:36 -0700 (PDT)
Received: from [10.37.12.66] (unknown [10.37.12.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A78A73F706;
 Sun, 14 Apr 2019 09:07:35 -0700 (PDT)
To: Amit Singh Tomar <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
Date: Sun, 14 Apr 2019 17:07:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
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
Cc: andre.przywara@arm.com, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190414160733.YO3cl0H1gmFhDG39X_GO7BVeNKUYpw22dXVO4EMtVkQ@z>

SGksCgpPbiA0LzE0LzE5IDM6MzMgUE0sIEFtaXQgU2luZ2ggVG9tYXIgd3JvdGU6Cj4gQXQgdGhl
IG1vbWVudCwgd2UgaGlkZSBQTVUncyBmcm9tIGRvbWFpbiAwIGFuZCBYRU4gYm9vdCBmYWlscyBv
biBwbGF0Zm9ybVsxXQo+IHdoZXJlIERUUyBjb250YWlucyAiYXJtLGNvcnRleC1hNTMtcG11IiBh
cyBjb21wYXRpYmxlIHN0cmluZyBmb3IgUE1VIG5vZGUuCgoiRG9tYWluIDAgYW5kIFhlbiBib290
IGZhaWxzIiBpcyBwcmV0dHkgdmFndWUuIEhvdyBkb2VzIGl0IGZhaWw/CgpJbiBnZW5lcmFsLCBh
IGNvbW1pdCBtZXNzYWdlIHNob3VsZCBnaXZlIGVub3VnaCB0byB0aGUgcmV2aWV3ZXIgdG8gCnVu
ZGVyc3RhbmQgd2hhdCBpcyB0aGUgaXNzdWUgYW5kIGJlIGFibGUgdG8gZGVjaWRlIHdoZXRoZXIg
eW91ciBwYXRjaCBpcyAKdGhlIGNvcnJlY3QgZml4LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
