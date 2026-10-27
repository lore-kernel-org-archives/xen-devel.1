Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F176606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IeNEgX3+
Received: from list by lists.xenproject.org with outflank-mailman.1462219.1673261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLi2E-0005kM-N3; Tue, 27 Oct 2026 14:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462219.1673261; Tue, 27 Oct 2026 14:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLi2E-0005kF-KO; Tue, 27 Oct 2026 14:20:18 +0000
Received: by outflank-mailman (input) for mailman id 1462219;
 Tue, 27 Oct 2026 14:20:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLi2D-0005k9-Ba
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 14:20:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLi2C-006wlr-C3
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 15:20:16 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae0b31b-2eae-0a2a0a5409dd-0a2a4509d152-28
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 15:20:16 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae0b320-be1a-0a2a45090019-d155802ec58c-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 15:20:16 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso32493305e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 07:20:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb9cesm24210505f8f.27.2026.10.27.07.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 07:20:14 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793110815; x=1793715615; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x91tNUCmNoQh58/o7wKid6hcocDTO4IZ8Jm7zMD4Bqc=;
        b=IeNEgX3+/dGZZKtBwljeRUplR1BjMM5cgcPYuXUFxhGxwpU1jwuED//s9kupQ71Yzu
         DhLcTqoqm/X4/xqhCpw16XkMQOsHJfI1O2muhmJssex9pSwKhUJNQbNLwCE6orEjvMb6
         wrIChkcUFl/FteEn0Nm45p2uMXSVMsUKJJgmAu0Vh7zfu/LJVFUxoWZvf4ffLbkQMJRf
         JeEsMC8pfORJoxbrrlx2hBR5WSKC4Ki7DPGLxrzT1QXtnFIzTdybgLaxv7iYC5I3t+2t
         5ZnFAQVWO9YjoiuHQ1vbtgyEdE2QnS030m9BXQ0gStojJWgiZzAd1oR5n5IsOcQjf1yL
         jQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110815; x=1793715615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x91tNUCmNoQh58/o7wKid6hcocDTO4IZ8Jm7zMD4Bqc=;
        b=ddKiWr9XGMM0wZXCgCwqED6NEG3EGruMHZDIdnUvDxON+S8DrzhKS68ecbl9p7qNnZ
         Bim7fsiKIyDIZW1MGwCPghsHQTQOf7914VbeuMdDqS0oVaJC6+0zICiv6/obXqhh1OxQ
         IpFPnTV9yVREEIulSAYmSRaD/gejO3gmGyqJ7OkTH8h2P6cGrRIQlmBi9Xj010SjX1vk
         37ael43Dfis5QvBmO/8XCniWfidevaDRmjsNZ5TZB7UMGyC1lxGaG2coIQnWu07/WEQ1
         tLocTguSqZKyrOH9r4xFjiwS5T1JMZB9jJheniaBcNMHA6Fz5Q1m/6c2IE402oXg4Arm
         RKlA==
X-Forwarded-Encrypted: i=1; AKwUvBzRztmwArLQ8MKVryEvC4DsGv1xoEvTZVd+CRE273EOkimC5kznlsjx9Z4+9lTWhq/vtgI3EGy6CRI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKYQrUvd2Gwvuk7swLcA9s/x21j007Tvg+XUNW0DIWJm+XFYWbM
	J7Mp8jURqc7s60MW5pcBEDyvvKkQoeGjNoMI4uHBIvSLfI3XugWvDz7U
X-Gm-Gg: AYBFou2T8AojHAebzwFtSQgZ8E194FaAdI1E5gS3DNu9HvbQZJq1tMWGTReUVmD4blr
	ryuvZPbIVQcQe5TRd0p1c2nhTNs2KO/eoY1k/voUs/R8hwpM8lHRuffZ+NGS1sz73+X6l4/6ra4
	ZBGzKNpNKJBQart0KY5gStD3gZATSUBkOrpKRxmwz92uY2vI/G3TRFLBuza8MRorSKO+joN72Zg
	usfhRIMMK1ryNV+DwKrKH8b5NfRNGM0c7hPNBSpJaGKwhHxYt32B16Vw+8YKGOYURzPFj9szN/N
	IH3Yjhhe1axL/H5DjJKOFUWvJE7/xyUK2gXfzIzS9sMsb1gNH1lHzBP4E8RVah/tP8aAdMQ6CsU
	eTQnl/gT5JAZ7demzZ8zIka0YRNiWtIygme98G9Ees9sRE/JM+UqoRescbMdUoSQnSQLHToBwP6
	/TgKq+pMAEd118QOD6IV8bkkRouXNFCRHZYkcw3+4/IF1KiHkmqmoWeQcm0RYV+7hcilhTx60Ux
	tlBLmRFDfdsrNJz6Y9wuAeXceSEzl62WW1tkWVCravKv3HA8yBlIz7BETz9nhg2TJcHZAwdoUHs
	Cz8IujXfbGhH9LND+w9zF2qf4zjn
X-Received: by 2002:a05:600c:621b:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4a35ac95a53mr186795355e9.14.1793110815139;
        Tue, 27 Oct 2026 07:20:15 -0700 (PDT)
Message-ID: <ae3070f4-469a-442b-b331-cc190e2b70f3@gmail.com>
Date: Tue, 27 Oct 2026 15:20:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/dt: Drop unused function parameters
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20261027140118.176266-1-michal.orzel@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261027140118.176266-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1793110816-3A2C4034-5BAFCF4F/10/73395122804
X-purgate-type: spam
X-purgate-size: 438
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/27/26 3:01 PM, Michal Orzel wrote:
> - drop `name` and `depth` from process_memory_node(),
> - drop `name`, `depth`, `address_cells` and `size_cells` from
> process_reserved_memory(),
> - drop `name` from process_chosen_node() and process_domain_node().
> 
> No functional change.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
LGTM:

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

