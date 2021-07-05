Return-Path: <SRS0=1i6W=L5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B384BC07E99
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 17:47:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7750E61956
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 17:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7750E61956
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.150572.278379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Sh2-0006RO-1C; Mon, 05 Jul 2021 17:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150572.278379; Mon, 05 Jul 2021 17:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Sh1-0006RH-UK; Mon, 05 Jul 2021 17:47:39 +0000
Received: by outflank-mailman (input) for mailman id 150572;
 Mon, 05 Jul 2021 17:47:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FZXx=L5=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1m0Sgz-0006RB-VH
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 17:47:38 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cc2e2db-28be-4fb5-9b97-ef904705c757;
 Mon, 05 Jul 2021 17:47:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a13so22950779wrf.10
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jul 2021 10:47:37 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:bdf1:273d:a193:c704?
 ([2a00:23c5:5785:9a01:bdf1:273d:a193:c704])
 by smtp.gmail.com with ESMTPSA id y16sm13369078wrw.42.2021.07.05.10.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 10:47:36 -0700 (PDT)
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
X-Inumbo-ID: 0cc2e2db-28be-4fb5-9b97-ef904705c757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tH0l4DKT+uucxToiTY+ot90qDeSro3d4JqiLS2jEWyE=;
        b=JEeN2wbq6jLmRS3EbjWJ2IslF4/fDr3iLnq2ECodsxRVdB7fl13YiAmImzTlk7cTng
         YtlXV8SQ4DtvlX2AO6wDznV5N/WvnXml4lAgP6np2QIQu8Dw6UGm8c0DDdi24xwpVPdr
         BeiossaVanK5IIVUgnn+VkmRN2vAGN7eqgwdUn/wKa6/FuVnvjVu5KiEOzVUyzQT5drx
         KotLYXRLWtvSH25ADA/EnIu3Sys0KSmPi4b9h691H3ATLJ46HlcH4kgS1YJpsdgLBzMN
         +eY3e5Vt+qm9K5DRdcqJiGODKCAg76JRhbiZyyK1x8CEJ7jBYdLedjpArczPe0/oOSyP
         Bu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tH0l4DKT+uucxToiTY+ot90qDeSro3d4JqiLS2jEWyE=;
        b=ME6JkNEAPeTYu5hV6AYJB5sJIGOQYbnVg6EBdmt+F6ypebDdFJ0WW/texg0b4uOzIN
         O8adtdUum8d/Ud4KL3yP91VGmcYJ7+WXlICL41bQ56JlUg+rZiHHr4B6LuYQieL1ib70
         dLzH+d6S9e5vF5XMBx4PgR9XFzxS9J+XXgrZJ+Weht8osG+zwZG6/Q4BOViSVpBv13OW
         jELqkB+kyA5rSMX1g8NoOjf1sgoiZfed2CjD6DY+mS12Z2rc91tR5nZ3fb1+4uFlDI9d
         dntqKqbGndZuXtvB45nDAVgC5IXDXddf0/gRCmnBrHjmPR37WIQqT3h/c+QVc3a9AEcC
         fVQw==
X-Gm-Message-State: AOAM532OpBUbg7J7mNUwK4kckWfJ8X41R768+wuQqKo0XPSKZmGGordd
	TmH0L2ksFLj80dwqEFC+7HA=
X-Google-Smtp-Source: ABdhPJyRErrogRcdTVot8XHpex7hk6d73W2jADNLMw1vsIFhaZKWfMLU7kXfCOPgKb8a8sQuFa4/0A==
X-Received: by 2002:a5d:5701:: with SMTP id a1mr16859072wrv.216.1625507256451;
        Mon, 05 Jul 2021 10:47:36 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH 02/16] x86/P2M: introduce p2m_{add,remove}_page()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <eaf6f63d-1122-f52d-1147-cda40a9c3387@suse.com>
Message-ID: <04de95f8-313e-aef3-1cea-599d5526233b@xen.org>
Date: Mon, 5 Jul 2021 18:47:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eaf6f63d-1122-f52d-1147-cda40a9c3387@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/07/2021 17:06, Jan Beulich wrote:
> p2m_add_page() is simply a rename from guest_physmap_add_entry().
> p2m_remove_page() then is its counterpart, despite rendering
> guest_physmap_remove_page().

Did some words get dropped in that second sentence? I can't really 
understand what it is saying.

> This way callers can use suitable pairs of
> functions (previously violated by hvm/grant_table.c).
> 
> In HVM-specific code further avoid going through the guest_physmap_*()
> layer, and instead use the two new/renamed functions directly.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

The code looks fine so...

Reviewed-by: Paul Durrant <paul@xen.org>

