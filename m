Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637EB606A327
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 08:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bEoSa4ac
Received: from list by lists.xenproject.org with outflank-mailman.1486846.1689307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRmaQ-0000fd-Bv; Fri, 13 Nov 2026 08:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486846.1689307; Fri, 13 Nov 2026 08:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRmaQ-0000fW-9Q; Fri, 13 Nov 2026 08:24:42 +0000
Received: by outflank-mailman (input) for mailman id 1486846;
 Fri, 13 Nov 2026 08:24:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRmaO-0000fQ-P5
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 08:24:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRmaN-006O4D-QQ
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 09:24:39 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af6c92e-8faa-0a2a0a5109dd-0a2a45079a5a-46
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 09:24:39 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af6c947-b4ea-0a2a45070019-d155802bac1b-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 09:24:39 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a59100fa83so4320375e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 00:24:39 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5a32d336sm4354463f8f.0.2026.11.13.00.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 00:24:38 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558279; x=1795163079; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bc9M1bQh8r2jLZLUbj1eA4lLALZewH9LB7PEx5gJODs=;
        b=bEoSa4acvc+P6KZjsI/MX0BE+D8MqYvWA6u3cBV/PBrOZeDQ/JBcOQdGWvlCweb+l4
         EytAuc44fS8ubaZIs7RHzfPbN/7LcOXnrtDeOez1jEG3u3Lj/DUhHRNPH7C9gUgf4YRW
         4IaGGFYwT2uXTXb7dh3q5zlGaXBWeICrLA5QGUi0jDZlFRSyFH1ueU5QohjSt8EizAtV
         mmNTXII4Ch0OI4GYy2Gc7xLwzrZEYwBUGGbheEb+KMv68IyHe/S5VEPLFBS7ywwejz7a
         DpjkCj9j26GNrJGWMHA7xgBfIlqxzL2Bz7ERgxuRjugGzKyDNtheeF0iPIuTDkR7mRoS
         dlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558279; x=1795163079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bc9M1bQh8r2jLZLUbj1eA4lLALZewH9LB7PEx5gJODs=;
        b=diIDG24vczX8YTeuGsTZbwqojFKN5crhOUTa95nXxqSTrTfP3N09omZ9msu2Kj1MkK
         XqNdYPq6c/dwXXPCvkQazOx1EOSY2wqetYF8eKysoOxd15zHnYFrwrOfbJO4i0nNmH7A
         Lb29Zk5ACKY2+W0X+AwCZTjWflVj+xIa7OJu9py1HXn38MPtP192Fo+RaLzFgfKgEaee
         w7LxeGmSy7vLtmdvpa3pkR5jsP19WLcafuHYClnTlgHaFqAfY54MeEuuRMpburTip0l+
         gzwXL/bR6ZCA+d01UGzoyRM6kvDQKtS/dVr3bDxogwngQYuOBKqwud7DNEaDMEmMAQjS
         yElg==
X-Forwarded-Encrypted: i=1; AL+hErH0eGJ8DBkvDeoVRmujY6q2uVjOyAZysJIqnpZZl7JNw0yNkTfZ0mornBeVw040zzvic2LivuoPVXQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/TPAmkcdgJN17vfHyvppFFftYdTrjNEu9Z0OKihyUa6i7HX+gc
	a1yM+RQMuua+06b2/i7vkzgCreM5oBleSEaZTHD6G/K+LrlE7E62Zlky
X-Gm-Gg: AYBFou0R3CYPONS2vJYIbaOJNoKz18etjGInssEA04vD5GKpKGNpbEHw9+QcqXnkoRX
	Mi+3kG1r2LVwJiKb5tcy0bgzRbl83QhI2JsxmtFRZ59ANQDzbkhTgdga1AClNSxl4wB1EjYWs7x
	kDqT8MN4lQcIliDP7sSBSgf8Aoouo5eR03hLLCJHDQzaqmudsIuxvXRwVWLKA+zkW97MvInn3wE
	ls/Z8669Re8FsfOZlK/UiMHrBWtfwqnUOPXiizZ9jDATDJXUmliwm6J9wtfnvWyfmJOmkdmkx46
	/9PVocXdnl5LvgiU6bkfZaTUpSXrS6AhehHwh42AxvQaLMK50uEJGdl6f8hq1l3Mhuul5Jyf9FZ
	z1s5dcy0us0XmnurHKQiadVblzY7uDVxqqQilgp3bUOY/UONARO7IqNMJMrSY+AKILMYiOmfP24
	i393YztHEFzeYx9rZPm48Ckvx/01uGLe9tGu5cHLvtM8ud9M+19wrrMN8J2euuJRrNFU7R3fK1s
	S1GF17Ud75vnlD11QcMdEFllyQOeqEc6QuGsLp3dQSC6Ir9FDnpcXW+WGM7Vp9ZgDd4Qb+tzI5h
	Uls6aikbwanP9Cwuhmq2kfGE8GpYngVK1rxjXeSPvzDzI+aM/9NsBJlw0rkw8FAbqAkPbP77QqE
	iZw==
X-Received: by 2002:a05:600c:6286:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb55a5d634mr32760235e9.5.1794558279111;
        Fri, 13 Nov 2026 00:24:39 -0800 (PST)
Message-ID: <923884f9-bbf4-4e85-b22d-aec0d482f456@gmail.com>
Date: Fri, 13 Nov 2026 09:24:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Remove CONSTRUCTORS from linker script
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20261112204032.3325011-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261112204032.3325011-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794558279-A56C2AE4-608D43DA/10/73395122804
X-purgate-type: spam
X-purgate-size: 445
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/12/26 9:40 PM, Andrew Cooper wrote:
> The other architectures inherited CONSTRUCTORS from x86, so just as with
> commit b7a7e346c710 ("x86: drop use of CONSTRUCTORS from linker script"), they
> should be dropped.
> 
> The .ctors section is handled explicitly in all architectures.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

