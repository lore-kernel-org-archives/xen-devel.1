Return-Path: <SRS0=X6vN=4Q=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45051C3F2D0
	for <xen-devel@archiver.kernel.org>; Fri, 28 Feb 2020 06:02:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A6E6246A0
	for <xen-devel@archiver.kernel.org>; Fri, 28 Feb 2020 06:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A6E6246A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7Yiw-00072s-3y; Fri, 28 Feb 2020 06:02:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xa6/=4Q=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j7Yiu-00072n-G2
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 06:02:08 +0000
X-Inumbo-ID: d93a7aab-59ef-11ea-9880-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d93a7aab-59ef-11ea-9880-12813bfff9fa;
 Fri, 28 Feb 2020 06:02:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 564DFAD31;
 Fri, 28 Feb 2020 06:02:06 +0000 (UTC)
To: Roman Shaposhnik <roman@zededa.com>, xen-devel@lists.xenproject.org
References: <CAMmSBy_tX+cM6aE9WO1yO1AJPwVdDYEA-a1HxLE5xczC7WfiLg@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e9eec487-4bb9-4bf3-a45b-04c7132f327c@suse.com>
Date: Fri, 28 Feb 2020 07:02:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy_tX+cM6aE9WO1yO1AJPwVdDYEA-a1HxLE5xczC7WfiLg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] xenfs work
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAgMDQ6MDUsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4gSGkhCj4gCj4gSSdt
IHJlYWxseSBleGNpdGVkIGFib3V0IGFsbCB0aGUgeGVuZnMgcGF0Y2hlcywgYnV0IEknbSB3b25k
ZXJpbmcKPiBpZiB0aGVyZSdzIGEgYnJhbmNoIHRoYXQgdHJhY2tzIHRoYXQgd29yayBJIGNhbiBw
bGF5IHdpdGg/CgpKdXN0IHB1c2hlZCBpdCB0bzoKCmdpdGh1Yi5jb20vamdyb3NzMS94ZW4uZ2l0
IGh5cGZzCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
