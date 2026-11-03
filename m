Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17B0606A329
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 19:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uuPG6QVD
Received: from list by lists.xenproject.org with outflank-mailman.1470543.1679282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOJjZ-0004hi-HJ; Tue, 03 Nov 2026 18:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470543.1679282; Tue, 03 Nov 2026 18:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOJjZ-0004hb-E0; Tue, 03 Nov 2026 18:59:49 +0000
Received: by outflank-mailman (input) for mailman id 1470543;
 Tue, 03 Nov 2026 18:59:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <richard.henderson@linaro.org>) id 1xOJjZ-0004hN-2X
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:59:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOJjY-00ED2G-8R
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 19:59:48 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <richard.henderson@linaro.org>)
 id 6aea2f13-8faa-0a2a0a5109dd-0a2a4506df1c-14
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 19:59:48 +0100
Received: from [209.85.215.172] (helo=mail-pg1-f172.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <richard.henderson@linaro.org>)
 id 6aea2f22-195a-0a2a45060019-d155d7acacf4-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 19:59:47 +0100
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-cd6a7b62ce8so1603480a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:59:47 -0800 (PST)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b09445f7b3sm264830a91.5.2026.11.03.10.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 10:59:45 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:From:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793732386; x=1794337186; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjfyQfy5EO6T7cqM1mm/lGkAgE18E4V1yV903QuKr2M=;
        b=uuPG6QVDzfbKtbD8/NJpDtmW82CpRPsI0p3ZbpvnHJ7029NVdHP+7rM0sFCEV26pIZ
         j2D8dR8bHOouTH8CRmNDizXr4xTjxDhH6TtixriEi6AnzBemGrv7zkKc+G0sttj//Sev
         UW48wWHvWSdMH7D7JQ/o5AqRc8xGYiWe7er+CPWtsorvAuDCgx+gLOVY1EwbdoFHn4oD
         Acu1VN1Okiry1rn6MG4ty5DivB8PiwHkJGEunOUzZEg3nV8kz+wlsGPognuYFdBI75DR
         zYSYMJrk1I0kWGkOcwZv0CM6+3+/TjQeYvARpSlO5NBilM8EBcXlaXMf5ijJcdnibbhj
         k64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732386; x=1794337186;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjfyQfy5EO6T7cqM1mm/lGkAgE18E4V1yV903QuKr2M=;
        b=xBXIVitbKZ0fkVnWizNCxCkvbV7wDeKdab35klcZO1YaXlF1sEQLoYN1JkO0jL9kYp
         EjbcT0Pdd49gIoG7IsMMC7kUF7ULteKOXqC0frfw7s5/uvoEsAEoUY4gGx1wa4QciE7y
         95b9wy8K1lIkjVziDUpUPPjW1nPPkSjroHEhEwR3OSWZ+86EpWC8qylP0k9BsJwcDCpR
         skGdy8emBzi9kTXPfekxJNOirmrPyU07Ft7BiC3xVn8pZNIuSsZXio7Zh2Ptbv0L9oPq
         4LZzQWQuAVLXi1EpaJtzz6cQ4Arrs72iZ5lQmVZ9/iCGudHOSNHmSAX3b1IaViDnwIJM
         csbA==
X-Forwarded-Encrypted: i=1; AKwUvByXpN/ssrQsoIQvX0hcmsZHpMU7fMKHL3+PlNohZGpBzNdBzulwV688A/C2hBG/X4D5P3u5l2Vaif0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+1QVBMxXS1E3PnDPvl3mltxhc+yV0D/P7HlChavaR+NG5gP95a
	Qjshcci4yFGOojCpj0OVXmByVvGbbynzU+7VatT22S4CUSg+V75pcPvOncj4evMKxn0=
X-Gm-Gg: AYBFou1uXG55UUMn61sWOKWDknqxpsyesjNkBWMYwSbtNNHsHphBEcJvgq52yi3jID9
	eH5WbipDrpH6MJeF1ebRsK5B2Pmtnu6mpEL4BqAXwYpKc/3rrde0f/i1/Y0/5j5PrRCpPzhvYCX
	LiJd9E+Kz2lDaCQgcIOW2RhpjmxIq144dVrqQuY0fe08Et15vMVV5NTDJ7TYzTNuRwqWNbq5Pi6
	tgECqTTchzRBJ5Oxj0UTlv303l5ZOgkz6v+2qHYbfwqNCDP7xgutAR4k8ceqa3XS0SjxugC+m83
	WCN7tD/CrBEjpoymIqUMGKBVupqeOLO2XZV8TudmDdNIReUifQYWxPVCnjM1XUWJ3iFzS3YThWN
	WTEI9ejujjMmw/CBmkWXpQgw2CXVdIwzPLTzTkGX28ez6YGL8q/gBBLd6hVTP71/kCxu6PTdMKx
	YYJ+G96gEhpElv2J+zRo/Zkx3RdSy7CFh9z5c4lktZ0j4+MowwhC3v4xEckaR8ilOAHyZ1eMnyi
	k8DzqMxhTteWdDh6la0QQg8Kt396vU+d+h0KBSb85AT8wEPoi/EJzo0zq9YbRD8tNHH7+QkBEJ1
	sre4P7VnfKEo1l+4guFsVZft0RZdNzZBy2MCVGjLVaDrEVFajN4Lko5ufr/36phAPYK4jw==
X-Received: by 2002:a17:90b:4483:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3ae8979ba8emr11422066a91.39.1793732385957;
        Tue, 03 Nov 2026 10:59:45 -0800 (PST)
Message-ID: <102e313c-1193-44b1-9908-a03c01a85e8d@linaro.org>
Date: Tue, 3 Nov 2026 10:59:43 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/25] Tracing patches
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Helge Deller <deller@gmx.de>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony@xenproject.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20261102185831.1880189-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261102185831.1880189-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793732388-FDE0E77B-02A7726F/0/0
X-purgate-type: clean
X-purgate-size: 1299
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/26 10:58, Stefan Hajnoczi wrote:
> The following changes since commit 56afd82bd4db9688f1c1c9d0e2ea163b8cde3283:
> 
>    Merge tag 'qemu-sparc-20261101' ofhttps://github.com/mcayland/qemu into staging (2026-11-01 08:37:48 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/tracing-pull-request
> 
> for you to fetch changes up to 3b68720390b98f21e26ffcff8874851b7b49b7b7:
> 
>    trace: remove 'trace_event_get_state' wrapper (2026-11-02 13:52:14 -0500)
> 
> ----------------------------------------------------------------
> Pull request
> 
> Daniel Berrangé's 'disable' property removal and associated cleanups.

Function signature change in here somewhere that didn't get propagated 
to rust?

https://gitlab.com/qemu-project/qemu/-/jobs/17710633655#L4275

> error[E0308]: mismatched types
>    --> /builds/qemu-project/qemu/build/trace/trace-hw_char.rs:236:14
>     |
> 236 |       unsafe { (bindings::qemu_loglevel & bindings::LOG_TRACE) != 0 &&
>     |  ______________^
> 237 | |              trace_event_state_is_enabled(_TRACE_PARALLEL_IOPORT_READ_DSTATE) } ||
>     | |_____________________________________________________________________________^ expected `()`, found `bool`
>     |

etc.


r~

