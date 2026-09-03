Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297D6C624D7
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 20:34:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407684.1640632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2E8t-0005xZ-TJ; Thu, 03 Sep 2026 20:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407684.1640632; Thu, 03 Sep 2026 20:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2E8t-0005xS-Qk; Thu, 03 Sep 2026 20:34:39 +0000
Received: by outflank-mailman (input) for mailman id 1407684;
 Thu, 03 Sep 2026 20:34:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <d-tatianin@yandex-team.ru>) id 1x2E8s-0005xK-EC
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 20:34:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2E8q-00FqXT-9i
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 22:34:36 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <d-tatianin@yandex-team.ru>)
 id 6a99d9d7-e002-0a2a0a5209dd-0a2a4508dd76-4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 22:34:35 +0200
Received: from [178.154.239.136] (helo=forwardcorp1b.mail.yandex.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <d-tatianin@yandex-team.ru>)
 id 6a99d9db-f659-0a2a45080019-b29aef888f42-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 22:34:35 +0200
Received: from mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c24:fa2:0:640:41ee:0])
 by forwardcorp1b.mail.yandex.net (postfix) with ESMTPS id A69A280AD8;
 Thu, 03 Sep 2026 23:34:34 +0300 (MSK)
Received: from [IPV6:2a02:6bf:8080:d5c::1:3a] (unknown
 [2a02:6bf:8080:d5c::1:3a])
 by mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (smtpcorp) with ESMTPSA
 id WYsZl6waMuQ0-SJOJ4uIE; Thu, 03 Sep 2026 23:34:34 +0300
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=default header.d=yandex-team.ru header.i="@yandex-team.ru" header.h="From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID"
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1788467674;
	bh=HBcAjfpMlA7r60pPF6BOpwXqiGeqg7IHcYn4i21hws0=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=uAk54gbjsyrsqbPeh6xGMu3IEHk2AqRIhGR7cPeS7Iz080EYc6Imz/NalWxaQFfh+
	 i5WFVpaRYiWhNNiMlnfZbErjpTFgOUMR10/FW+fvBHryw1OYrhCwq4Kuh82VePsBsh
	 QLQZ5HQsv+ebLZ8VVF3NsT64Jw7etZxOLC6BEbl8=
Authentication-Results: mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
Message-ID: <5c57eb31-3548-4e0a-8b02-315057d029b8@yandex-team.ru>
Date: Thu, 3 Sep 2026 23:34:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/apic: Remove dead disable_esr machinery
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: Daniil Tatianin <99danilt@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Steve Wahl <steve.wahl@hpe.com>, Justin Ernst <justin.ernst@hpe.com>,
 Kyle Meyer <kyle.meyer@hpe.com>, Dimitri Sivanich
 <dimitri.sivanich@hpe.com>, Russ Anderson <russ.anderson@hpe.com>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20260902220124.2931854-1-d-tatianin@yandex-team.ru>
 <87tso69jdu.ffs@fw13>
Content-Language: en-US
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <87tso69jdu.ffs@fw13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1788467675-D4D7087B-2A4F938D/0/0
X-purgate-type: clean
X-purgate-size: 462


On 9/3/26 11:20 PM, Thomas Gleixner wrote:
> On Thu, Sep 03 2026 at 01:01, Daniil Tatianin wrote:
>
>> From: Daniil Tatianin <99danilt@gmail.com>
> ...
>> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> Seems you can't decide which of your alter egos is author and signing
> off on the patch.

Yeah, sorry about that. Originally had my git email configured 
incorrectly. The right one is in the S-o-b (the one I sent the patch from).


