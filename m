Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E027AC43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 07:15:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348384.1606169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSgH-0000hC-IP; Tue, 30 Jun 2026 07:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348384.1606169; Tue, 30 Jun 2026 07:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSgH-0000h5-FM; Tue, 30 Jun 2026 07:14:53 +0000
Received: by outflank-mailman (input) for mailman id 1348384;
 Tue, 30 Jun 2026 07:14:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weSgF-0000gz-Vl
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 07:14:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weSgF-006q3n-CS
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 09:14:51 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a436cdd-5cb7-0a2a0a5109dd-0a2a450b8324-24
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:14:51 +0200
Received: from [209.85.167.43] (helo=mail-lf1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a436ceb-ac48-0a2a450b0019-d155a72becc3-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:14:51 +0200
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5aeb17c2564so1529789e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 00:14:51 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39b1da1c843sm3598411fa.27.2026.06.30.00.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 00:14:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782803691; x=1783408491; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFlGjfRm+tPHKjF6Bxl+6FJj4KuSU9yfuI7cK87DlEg=;
        b=qr/sjc0rbDxjioq/UHw9iZKrWTp0i3sgvB0HGZJTPvHwGI+nRoAuTVn1z+hVxyGDTY
         qa7LT5eNg6TkFvDkinTbHMyTGIXhSo3bmeN77c0NHto6Vy9PUetUULLl1n6P6zBnvrZm
         2RKVWBiPi+AAT0saNmOpuARTvlKwZzilQn5wQoBAPT6SRUVbTlNVolK25MXzzlaGFXAt
         y8sqc2pvZQtlhl12QrIqxH2G6/G6i9/lFZCflqZLiFrTbDVHDpEnOuwujSJjtyRmX8gN
         kyLH4J09KnTcwa+W8HexcL0IsNr4SBOBpToX39q9nIJJlbtED/PA/WUyakrQRmpkiy5R
         MANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803691; x=1783408491;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFlGjfRm+tPHKjF6Bxl+6FJj4KuSU9yfuI7cK87DlEg=;
        b=Ql4mE3SSqYvM0j/QUIvQGM0cyTM0XNZI7rsfQ6m9oBniTI3ogQh5llJsLsv/BJRJMA
         oi6pBnMsbBJh/1mx9mWypNQTWRp8LG98ZviEd9fKsvcqpEjzHhPM8KAbLzNVkB/ds7Ow
         G1gAi3MOlfV7I4nWuxPo8SPbx4zrTKu2DkDSL0pgheZTs95dCW6aOnbfQ7EVdPoV/Gc5
         eyWKP+Z//b0w4CQpsFsn9NHWFUpcgzI68OwqGj7cRrfjGukVoWnqiaIfUs9UObG54TfE
         NzJYefMR/IWDmyJslFWrSCtGleO5wWGocq+Z2yLyM1BC6KWhSJhyxpFs4cSESLhII5WQ
         8lyQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOX8I4b8gp8/yHNPI2W0fCEuyOblLtfcXR1sZPeDe7nFkRYKzo5MsbymP6f2zSmcZLFSBXBZOLpFE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2M11r7aAeQ+qEozRJZz0c/d/fzD5ALbd5d0BpCsTEC3bKCC1S
	nj1Sp1SZot5iWbILTLEi7ckX+nXBKEgga4rnlnk4iaIGmY6XTaTQmaqZ
X-Gm-Gg: AfdE7cljVjnTCL2sgeGYDQl1C5BCGX6hR84LsEoH3UIhMGxwsml93CV1VpQ2S6NB4Ja
	oyzIzW0OR/WixYzVGtQEMDKq8s4sVtfoBvYa52OH7YFHLJc4glrJ9NP62ZBs29mogU0vs+WpYCA
	dHtjbK5Vmz06ezjakyeNpwzg9+JvCngh5YJFdtYDyf6OOy+aTwfmGhjTq/Otu5KKYfOOALWK3GG
	6trdqs6RrKfvSiveeqp6BWavMDrvyhagua4Hy1PVj7vcHztDfg/0M548XK+UtYg8NnNurs+uQ9A
	jrp+OH27CXp7BJDDY1zvkAdoCe39TXiGqPUrQ33RFAZbQBZC3ZqhVGWoxFq6rAEiEC0ny1rXgAO
	6x+rweZqdk2YOu2Y3fUT/6EOKyXGi0OtbpAG48Y+WKxQHFCk/vmhfAx3pTdgBcGWEiUXmuggAUI
	D5XKLpMtUySiVMbJBLbtnXTLCZL40pehdYk03FqxG+uLWRR8vNNaAlfxwFZV4YDzgr4Bk=
X-Received: by 2002:ac2:4f0e:0:b0:5ae:ba7a:1789 with SMTP id 2adb3069b0e04-5aebdb7d889mr545104e87.13.1782803690362;
        Tue, 30 Jun 2026 00:14:50 -0700 (PDT)
Message-ID: <9cf63046-eed3-4f7c-8cc4-3011713f3618@gmail.com>
Date: Tue, 30 Jun 2026 09:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: domlist_update_lock can be static
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <c511b3fb-2bf6-4739-a3fd-114976b77cfc@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c511b3fb-2bf6-4739-a3fd-114976b77cfc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1782803691-A6B38220-6B586379/10/73395122804
X-purgate-type: spam
X-purgate-size: 377



On 6/29/26 4:05 PM, Jan Beulich wrote:
> For a long time (if not forever) this lock has been referenced only from a
> single CU. Misra C:2012 rule 8.7 (which we didn't accept yet) wants us to
> have such identifiers non-external.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii




