Return-Path: <SRS0=OroT=5R=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0DAC43331
	for <xen-devel@archiver.kernel.org>; Wed,  1 Apr 2020 09:25:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2345020784
	for <xen-devel@archiver.kernel.org>; Wed,  1 Apr 2020 09:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2345020784
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJZcY-0003xD-GR; Wed, 01 Apr 2020 09:25:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJZcW-0003wS-NP
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 09:25:12 +0000
X-Inumbo-ID: af204626-73fa-11ea-ba84-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af204626-73fa-11ea-ba84-12813bfff9fa;
 Wed, 01 Apr 2020 09:25:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1D95CAD7C;
 Wed,  1 Apr 2020 09:25:10 +0000 (UTC)
Subject: Re: [PATCH 1/8] xen/guest_access: Harden copy_to_guest_offset to
 prevent const dest operand
To: Julien Grall <julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
 <20200330192157.1335-2-julien@xen.org>
 <33a36f0e-5adb-b8af-445c-bab765c84589@suse.com>
 <b5f7037a-5253-b5f2-d5b7-1b90d19021c2@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11871e55-481f-b318-bf5d-d9518e180fa9@suse.com>
Date: Wed, 1 Apr 2020 11:25:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b5f7037a-5253-b5f2-d5b7-1b90d19021c2@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 dfaggioli@suse.com, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 21:13, Julien Grall wrote:
> I am not aware of any way before C11 to check if a variable is
> const or not. If we wanted to keep allow void type the handle
> then a possible approach would be:
> 
> #define copy_to_guest_offset(hnd, off, ptr, nr) ({              \
>     const typeof(*(ptr)) *_s = (ptr);                           \
>     typeof(*((hnd).p)) *_d = (hnd).p;                           \
>     size_t mul = (sizeof(*(hnd).p) > 1) ? 1 : sizeof (*_s);     \
>     ((void)((hnd).p == (ptr)));                                 \
>     raw_copy_to_guest(_d + (off) * mul, _s, sizeof(*_s)*(nr));  \
> })
> 
> I don't particularly like it but I could not come up with better so far.

Having looked at how in particular copy_field_to_guest() (which
doesn't have this issue afaict) works, here's an imo much better
alternative:

@@ -87,6 +87,7 @@
 #define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    void *__maybe_unused _t = (hnd).p;                  \
     ((void)((hnd).p == (ptr)));                         \
     raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));  \
 })
@@ -143,6 +144,7 @@ static inline void put_guest_handle(void
 #define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    void *__maybe_unused _t = (hnd).p;                  \
     ((void)((hnd).p == (ptr)));                         \
     __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
 })

Jan

