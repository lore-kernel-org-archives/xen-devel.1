Return-Path: <SRS0=UpcS=BU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15063C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2020 17:10:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB45620866
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2020 17:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="F6NONhOV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB45620866
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5BIv-0005Rb-14; Mon, 10 Aug 2020 17:09:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BwXP=BU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k5BIt-0005RW-Kq
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 17:09:43 +0000
X-Inumbo-ID: 1eb1bb9f-45de-4e04-b814-8f849502fbdf
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1eb1bb9f-45de-4e04-b814-8f849502fbdf;
 Mon, 10 Aug 2020 17:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597079381;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=/2+gS0lISNF3o4YpqCfDxgKBrBW8TDmJPPOHpW2WEjY=;
 b=F6NONhOVHy8JdhYpP5vPAvqQU5Z+RZ4oF/0+9955m/XzxDSIY0VppiZ1
 93AyzD4ODwPPkWaxiGYRz8zNLBkqsuSC2SYO7l0C80DYtgw0k46o4NnWU
 2ISVhZDMAxTjczcDbUdqTKlFw6/kuZpQy3OEvZzUZTEaRb2L5+nU+votL U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YSkhbkww0dm3N0QHllcHopkZ6zlWAT/Di4dSHbL7WP8BV+Tu1uio48n1NbMoDf1MAXaAH8XRT4
 v1gEl8DB1nBLiDG/V2zRMA65OtjDhEs+55PQRr65TGf7upwMWU1RezOfXtdsr+RvUjzR7Uu3jU
 ihGiBxN/8jE/WZRkNMSR4MoKYj616MMca6rS4/n/Cs8lZ1neAJJ0KvJ3XYoRpG9BP895soLQVc
 7uyDb3XNDCtbg/uT7Mzj6qasCrMgJ+B0M2Q/yfiZaivZJ9OEPEqiGQgsCRdi6mYhqj2fD1vdTI
 4Gg=
X-SBRS: 2.7
X-MesageID: 24517334
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,458,1589256000"; d="scan'208";a="24517334"
Subject: Re: [PATCH 4/4] EFI: free unused boot mem in at least some cases
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <4e2d0d0a-9d85-d704-5d61-ae9efc69256a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <21bd3372-ac86-f20f-b2b8-3cfb697ef894@citrix.com>
Date: Mon, 10 Aug 2020 18:09:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4e2d0d0a-9d85-d704-5d61-ae9efc69256a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/08/2020 10:06, Jan Beulich wrote:
> Address at least the primary reason why 52bba67f8b87 ("efi/boot: Don't
> free ebmalloc area at all") was put in place: Make xen_in_range() aware
> of the freed range. This is in particular relevant for EFI-enabled
> builds not actually running on EFI, as the entire range will be unused
> in this case.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The remaining issue could be addressed too, by making the area 2M in
> size and 2M-aligned.

This memory range is only used for relocating the (synthesized?)
multiboot strings, is it not?

I'm not actually convinced that this is a sensible tradeoff.

For one, you've broken setup.c's:

    /* This needs to remain in sync with xen_in_range(). */
    reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));

which covers the runtime aspect of what xen_in_range() covers during boot.


I think the better course of action is to go with David Woodhouse's work
to not relocate the trampoline until later on boot (if even necessary),
at which point both of the custom allocators can disappear.

~Andrew

