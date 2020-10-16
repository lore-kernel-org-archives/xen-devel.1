Return-Path: <SRS0=yWKO=DX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92118C433E7
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 12:09:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E70672083B
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 12:09:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="CsPQThEV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E70672083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.8052.21421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTOXv-0007NE-UH; Fri, 16 Oct 2020 12:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8052.21421; Fri, 16 Oct 2020 12:09:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTOXv-0007N7-RF; Fri, 16 Oct 2020 12:09:19 +0000
Received: by outflank-mailman (input) for mailman id 8052;
 Fri, 16 Oct 2020 12:09:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iki1=DX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kTOXu-0007N2-4z
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 12:09:18 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f42769e-79e5-4469-88c8-e5ded720fc27;
 Fri, 16 Oct 2020 12:09:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Iki1=DX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kTOXu-0007N2-4z
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 12:09:18 +0000
X-Inumbo-ID: 6f42769e-79e5-4469-88c8-e5ded720fc27
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6f42769e-79e5-4469-88c8-e5ded720fc27;
	Fri, 16 Oct 2020 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602850156;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=wYHtKj7tFXBVmXh/3krYXanUGnDcUzLV5iImjfUSivY=;
  b=CsPQThEV7abQGg9oawM/39KJrt6q8P/7BwSj13C9AA9ZGgV5ThYkfp1v
   +UnFfp7QAmb93sPZWk4zP7+XJxTGAfXdA4oabM7qano/DIFXcFaG8h9iq
   kTgTqcS00UeOAoQFWtnhyEFpp6h5NBvJuUzWhMDoautW3ZWQZUawYxT/V
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jXKgeqHSUaj2Qd6gHAaFfKACcooX+EHsCGXz7oEzrtTMBO+4tdCE0CkENe2rnuz1SX7NlfTkY3
 Pc9tWDLMB5+0Q+hucFXjCus6peGk2+TJOTncPE/gGaGuoJeFQLNnpDRyN1eEz6n1txeQSKQ93z
 a0AGNTx+b6Y4zCdzw68npUQuMTayIc9Sa9NlbuesnVpr17s7POIfhP6iYeSO5g0n+5o80LDW4Z
 SnEJnut99v3CzOPK/sd+07X8LdbHoyL/ykMay7kamcox0F1RX7QElSmiMhI5+1TASc+1SLEFmy
 6oY=
X-SBRS: 2.5
X-MesageID: 29407124
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,382,1596513600"; 
   d="scan'208";a="29407124"
Subject: Re: [PATCH] x86/traps: 'Fix' safety of read_registers() in #DF path
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
References: <20201012134908.27497-1-andrew.cooper3@citrix.com>
 <afc5c857-a97b-a268-e6b2-538f31609505@suse.com>
 <307753b0-fef8-658d-f897-8c0eb99ce3e5@citrix.com>
 <948f0753-561b-15e8-bf8c-52ff507133d2@suse.com>
 <dbd19cd0-316a-c62f-de7b-627ada4df350@citrix.com>
 <00ba5885-5ee6-c772-a72e-15431cd3b1f4@suse.com>
 <09049e52-548b-3ffc-5259-b1ffc26413a5@citrix.com>
 <7f3272d5-8ec7-26ec-33ec-2281539920e2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5807e645-7242-125a-03cf-c7c23f28dfa3@citrix.com>
Date: Fri, 16 Oct 2020 13:07:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7f3272d5-8ec7-26ec-33ec-2281539920e2@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 16/10/2020 12:55, Jan Beulich wrote:
> On 16.10.2020 13:24, Andrew Cooper wrote:
>> On a tangent, what are your views WRT backport beyond 4.14?
>>
>> Back then, it was #DB which was adjacent to the guard frame (which was
>> not present), but it doesn't use show_registers() by default, so I think
>> the problem is mostly hidden.
> I wasn't fully decided yet, but as long as it applies reasonably
> cleanly I think I'm leaning towards also putting it on 4.13.
> 4.12 closes anyway once 4.12.4 is out, and I don't think I want
> to pick up not-really-urgent changes for putting there beyond
> the few ones that I already have (and that I mean to put in
> alongside the XSA fixes on Tuesday); I could be talked into it,
> though.

The question I was asking was really "should I try and make an
equivalent fix for 4.13 and older".

While the base premise of the fix would be the same, the logic in
load_system_tables() is different, and the commit message is completely
wrong.

I only encountered this problem with added instrumentation in the #DB
handler, which is why I'm questioning the utility of going to this effort.

~Andrew

