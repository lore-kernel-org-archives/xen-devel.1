Return-Path: <SRS0=v0bc=AS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D36C433DF
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jul 2020 13:56:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F41222073E
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jul 2020 13:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F41222073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jso4n-0001Ei-MH; Tue, 07 Jul 2020 13:56:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqME=AS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jso4m-0001Ea-Pp
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 13:56:00 +0000
X-Inumbo-ID: 9670a368-c059-11ea-8d75-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9670a368-c059-11ea-8d75-12813bfff9fa;
 Tue, 07 Jul 2020 13:56:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7CFAAE2C;
 Tue,  7 Jul 2020 13:55:59 +0000 (UTC)
Subject: Re: [PATCH] x86emul: avoid assembler warning about .type not taking
 effect in test harness
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4a0f9e7d-53f1-b77f-e8a9-a75483884a6f@suse.com>
Message-ID: <7f59e378-1996-7fd7-9c2b-e8dc36c7f992@suse.com>
Date: Tue, 7 Jul 2020 15:55:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4a0f9e7d-53f1-b77f-e8a9-a75483884a6f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.07.2020 11:35, Jan Beulich wrote:
> gcc 9.3 started to re-order top level blocks by default when optimizing.
> This re-ordering results in all our .type directives to get emitted to
> the assembly file first, followed by gcc's. The assembler warns about
> attempts to change the type of a symbol when it was already set (and
> when there's no intervening setting to "notype").

Turns out this wasn't a gcc change - the problem had been there all the
time, it just went through silently. It was the newer gas that I built
gcc 9.3 with that caused to issue to become visible. I've slightly
updated the description to account for this.

Jan

