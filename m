Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB18AC44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 07:35:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367506.1617247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm501-0000y3-Jc; Tue, 21 Jul 2026 07:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367506.1617247; Tue, 21 Jul 2026 07:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm501-0000xw-Gh; Tue, 21 Jul 2026 07:34:45 +0000
Received: by outflank-mailman (input) for mailman id 1367506;
 Tue, 21 Jul 2026 07:34:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wm500-0000xq-BA
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 07:34:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm4zz-003XvT-KX
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 09:34:43 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5f2104-5cb7-0a2a0a5109dd-0a2a45079cd2-36
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:34:43 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5f2113-b4ea-0a2a45070019-d155dd35d448-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:34:43 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47f7444576cso1426335f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 00:34:43 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e52aa4sm37467979f8f.10.2026.07.21.00.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 00:34:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784619283; x=1785224083; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZtwM6RKiMRrR18C9+SKjFHRz4Nyvpd6dBjw1+VDMBA=;
        b=og2aDp2FJzE5QYpcFwoGC1HrinU/2S2djfvFyBJ/WdU8X3DGW1wb+HsOpecYz7S+ic
         XNW1r2t56nX6tJ2dr2NcPDZtbJk+xL4W+cFRqGvh253b+ax8dKJ7ha4j5ONQOGswlGrv
         b4QcmEYIeHclL5VOW+Vi5yjOkpgTlH7l1lH5rkDWpm1TecQ6hda+OglnF8szKJNg7ROT
         jdmnaaTQ6eLnA0zsfJ6vP+pfzGH2UIXOggWzkOBL1Mmp5IhaOnDJngoDGfOw7mDnw6fj
         PWlyvgGrtCZWyKYp3ttD0VLPngFu8PWk0l5WNG7llx+TtLgUU+/gBb7xVLVRmcmq0/Bw
         Ky3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619283; x=1785224083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZtwM6RKiMRrR18C9+SKjFHRz4Nyvpd6dBjw1+VDMBA=;
        b=m6116wenWJM48mop4RArNDHVTkq3R53PnFeV7bo5bZz/Y6DbwUbLDoadO7b5s9cuSh
         1SvvGtoeef3UuUIakuELTYNpFVvCyKzsnjpxWWMY/uueaMtEuhpE/slvWSfeQ3iXxXk/
         2xfrjWD+KoJcTojHUWOl1ZaS9nhn1dX3F/LTWnQ22CHlhaSoPI0TS4JB601Z4wacgC/y
         xxfN+EkzNefveFzACwPIpbAVmQ1+uUNxTS1/vFX0kko8Jy09JtQoFRjFUvxG/qBl6hqT
         n01pWPR7f6zUPq6N8pwiDEx7MaskD5wAlG5uWfc0ycrDjqPDa7OqjQ6J2iDqiBYAmBBM
         C2/A==
X-Forwarded-Encrypted: i=1; AHgh+Rrte9Y5g9FyTXrJ/t+mR8J4Y+16VZtR1XSwHNfDtxZ1KtSJPbgbbYGCwB/FKRXRVYEAbIkMA5YQgto=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwDoqG7oZwkfQ9HfFfi0z+WWtyKgmxyMzDpnfre2fa6iKbwXFt
	Q60P+DLtCLhRNJYm6LKboSgiM/h9sPiVzJLwiXbT8oXvuJRiTVP5InVj
X-Gm-Gg: AR+sD10rGwXd2ecg3nvL0AwEFYCFDHkdjefqiC45JOs2vnxma3jWMdnvEx48gB8NtH4
	xO7i3/bXMw4hmOja6RZRFDWM+W1GgXjOkxmM8cVK6d4iZg4cphOmIHd7+d7lsKiKDnOfEg2b8KV
	9w7XiJnnbgPhn6dJ937XhzNJ4x6YQyYuzk8kNrDQ4XkPHU/1HGV2FPWWhhaBhCoGubcEgwTefv5
	09m005qllcjtc5Gdj1AdYf1ijNlJF0zxd1P4s02jAi6ML3/xHiBJOWatf9Ea9p7m9RHYWpQ27UK
	hGjR5gJXou3HjUklHCPIqhLwXJBYzKbpuEOPp4iH1Vo8NGU2+yY3XY7xTnIqMZeGpWJ+HGWcjyk
	um7FTpxL1tCMOrVFgbniDi9qkT1pfN09EsDDEdtNzFFG5fsl43teFs5JsSqnvcwgTOnGDMLgZ4I
	ad6m94Yo4uHmNhKZrmSjmJ0wNOFX3y3bfsbhkb0naOPpHTWjs+z6mcetHn
X-Received: by 2002:a05:6000:40cf:b0:472:d154:fac6 with SMTP id ffacd0b85a97d-47f62328243mr21111380f8f.35.1784619282774;
        Tue, 21 Jul 2026 00:34:42 -0700 (PDT)
Message-ID: <643e4582-2a76-4c82-92f2-7aebd420f3ac@gmail.com>
Date: Tue, 21 Jul 2026 09:34:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/23] xen/riscv: do a 4th linking pass if necessary
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <ff85121d7aea88f5e1e8eec729a11512f22c168c.1784559209.git.oleksii.kurochko@gmail.com>
 <f36c1688-52a5-4dd4-af7e-479dc77d18e1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f36c1688-52a5-4dd4-af7e-479dc77d18e1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1784619283-A6AD8AE4-8A7F70EF/10/73395122804
X-purgate-type: spam
X-purgate-size: 1074



On 7/21/26 9:29 AM, Jan Beulich wrote:
> On 20.07.2026 18:00, Oleksii Kurochko wrote:
>> Embedding the symbol table can shift sections and flip relaxation
>> decisions, changing code size and thus the set of emitted tools/symbols
>> (e.g. gap end markers).  Re-link with a regenerated table when its
>> size differs from the previous pass.
>>
>> This takes the same remedy as commit 35de7285d508 ("Arm: do a 4th
>> linking pass if necessary"), though the underlying cause differs:
>> here no symbol (dis)appears from the ELF symbol table; instead the
>> set of end markers emitted by tools/symbols legitimately changes,
>> because want_symbol_end() depends on code layout, and layout differs
>> between passes due to linker relaxation.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> And I think there's no dependency on earlier patches, so this could go
> in pretty much right away?

There is no any dependency and could go earlier then other patches.

Thanks.

~ Oleksii

