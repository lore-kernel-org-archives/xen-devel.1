Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0C4606D801
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g/qmTxT/
Received: from list by lists.xenproject.org with outflank-mailman.1474935.1681786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzJk-0004f2-C1; Thu, 05 Nov 2026 15:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474935.1681786; Thu, 05 Nov 2026 15:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzJk-0004ev-8d; Thu, 05 Nov 2026 15:23:56 +0000
Received: by outflank-mailman (input) for mailman id 1474935;
 Thu, 05 Nov 2026 15:23:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <richard.henderson@linaro.org>) id 1xOzJi-0004ep-WC
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:23:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzJi-000kcE-4h
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 16:23:54 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <richard.henderson@linaro.org>)
 id 6aec9f7a-e002-0a2a0a5209dd-0a2a4508bcd4-30
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:23:54 +0100
Received: from [209.85.210.176] (helo=mail-pf1-f176.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <richard.henderson@linaro.org>)
 id 6aec9f88-f659-0a2a45080019-d155d2b0d16b-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:23:53 +0100
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-8b2382bf051so429086b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 07:23:53 -0800 (PST)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8b09b668748sm2115551b3a.43.2026.11.05.07.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 07:23:50 -0800 (PST)
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
        d=linaro.org; s=google; t=1793892232; x=1794497032; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mcj2uVBctlGM4Q78LCis/HWW7PQmqr/jj9xsfQ1khEo=;
        b=g/qmTxT/+6oFcyusSXM6pTfNO+v5W4YyDix1vvFNaleCsGFrAnciOUhgFbRt0+Ju9t
         3dCeZHifrqMJUj2zmUj8F6pevJdskWwCUK7Zfc/7EqZPL1hNZTBleRQLDTCiKP1uNpY9
         xgpKqdtIXKTeZbVStGDoVmftFVuf91StyV00UEXtVb8FsgA01tSua/UfmFxnMohMwtum
         hnOlkx5tOssOxN/S3u8PjkOqjTPihP2jMjmVPcofx9r9JCE3aVAX3Upwp+iKSeDFm+kn
         2sXXsJatYh6nBDJpFHvbyzBzXY3uEO6duF60avNq+YMWUo1lM/gD+6rPPZt4QedwwKc1
         4b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892232; x=1794497032;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mcj2uVBctlGM4Q78LCis/HWW7PQmqr/jj9xsfQ1khEo=;
        b=afO4tJ2988HNuhAbYSgNc54MYNoOWmz7GBWwy9E/Bmy4NipaOO2XKPBbGk1MJfwKT3
         rhazAWJ3/v6/m8l/MQlqp8avYxKrOlPDD+DbLjd5Hw+fBu9ubwpiNEC5hQpwq4Fu9m9n
         gvDvTuwd6qfiIJ/HsJVrhkMPnHvaKsXj6pnIbixPDLeQUEkIl3GL+uFrtobKB5hpTRtS
         REC8oo4yYbOiYtatAzf1czFJmM6dNKHsI95krpz1RiOC5qdKTgngCS2X5iTgKJzHr6wH
         IDkCntKvDHo8iGLkFOrUDroUrAd6OogkN+6aq2jzx9VrxQYzpKb3cYNb4JMdK9bHwsWV
         fMGA==
X-Forwarded-Encrypted: i=1; AKwUvBy/eTZNjBJ7CV2eZ9h3vXxX0bSOtyNGndrd+cM2d0iV2K0oHKs/8etvssBZMVZE+n5qLzXqpX1D6Lw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8V1DFiTh+nT9axl15f4UIRRcWxDMNKh8HQpA4yUw6h5AtMpAyB
	sGKE6NRIxw+VVjwt3g7BazFxkumDf8x7XGcocOUkfn4bleYyg4p0qBm0DRYspRMwPEM=
X-Gm-Gg: AYBFou0OeESQMsWnaFxi5FwFKgqRVRjyALF5YzcqQ6rwyy5pukXs6mNcWBrUHj5DJLg
	PDcjTb4Jn8sR3j8V56a3HBuOMsqY/1/Hgy5OMcNzlCS19RoYCGf8dbyVyauL2fU/rAYFUWwIG5g
	fjfl7J7UzOYwrVz3qORDrP5zvKmMcuNxwOpEEJS0Q57F5nevG9xzkITTpZsY9AlsB+YSNVTSieK
	BPBXyW+y+9nDrpaOJklx8JOLfbSG7u3webuc19Fj6okYIoI0YlU6YFvZktPH98JBzYHYf3dwUnb
	xPTl3YyaviHuYI7v4WxMN4spJt0Ac7S2wobBvtoMuruhu70YrGV1W+yqji7W5KTK+8fK0Anjawb
	EJumxc3bUfNsqfipHVrMeW27YacHD2+AIksfzBkjyzFyg4ijOdTQJr/cBW3kYiNQzIWdJ49gOjo
	Eu54air9gcL8l+rlFwJL3lKf0f8IZI4NomDY7wKpqNWvt0KTESkwl1FKWWDfNYhYmVEBqDyBEug
	zN95f4QBumLzwelNZor+nwl8BElxX9KvbZCkdDECmRSs2qmxIti53vzLBMb2I0BamDKG/gQktje
	6LWJ83H45jYXIe4ipDWbZoZ11yDPy/BkpNjZUEjtIEmtTF6/M/94cQvlXflG41BgalNAyVk=
X-Received: by 2002:a05:6a00:4395:b0:89d:a947:9d58 with SMTP id d2e1a72fcca58-8a9beb64f99mr15120503b3a.25.1793892231504;
        Thu, 05 Nov 2026 07:23:51 -0800 (PST)
Message-ID: <e521051e-146f-4992-a6b4-a75fe30b52be@linaro.org>
Date: Thu, 5 Nov 2026 07:23:48 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL v2 00/25] Tracing patches
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Anthony PERARD <anthony@xenproject.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Helge Deller <deller@gmx.de>
References: <20261104201802.11556-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261104201802.11556-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793892234-DF8D587B-B992BB86/0/0
X-purgate-type: clean
X-purgate-size: 762
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 12:17, Stefan Hajnoczi wrote:
> The following changes since commit f29ccc287a6cfdd51d3a4fd17fbe9af3310a0ac5:
> 
>    Merge tag 'pull-11.2-misc-fixes-031126-1' ofhttps://gitlab.com/stsquad/qemu into staging (2026-11-03 14:44:10 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/tracing-pull-request
> 
> for you to fetch changes up to ddfa19c50616657cda4476260ce300c9463b09d3:
> 
>    trace: remove 'trace_event_get_state' wrapper (2026-11-04 13:19:12 -0500)
> 
> ----------------------------------------------------------------
> Pull request
> 
> v2:
> - Update "trace: include qemu_loglevel_mask(LOG_TRACE) in guard" so the Rust build succeeds [Daniel]

Applied, thanks.

r~

