Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6BBC982D0
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 10:51:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423889.1648747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x79i7-0002UZ-Vr; Thu, 17 Sep 2026 10:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423889.1648747; Thu, 17 Sep 2026 10:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x79i7-0002US-Ry; Thu, 17 Sep 2026 10:51:23 +0000
Received: by outflank-mailman (input) for mailman id 1423889;
 Thu, 17 Sep 2026 10:51:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x79i6-0002UM-Rr
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 10:51:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x79i0-002ame-MA
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 12:51:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aabc620-8faa-0a2a0a5109dd-0a2a4505b4fe-26
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 12:51:16 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aabc624-4cb1-0a2a45050019-4a7de18cbf13-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 12:51:16 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd38e0f79so4038145e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 03:51:16 -0700 (PDT)
Received: from [10.72.3.60] ([91.26.93.146]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd2563ccsm80801395e9.13.2026.09.17.03.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 03:51:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789642276; x=1790247076; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fz342ZapvVW137Glp/+LrmoTo3LQuz+HEHydJlsSWMI=;
        b=TpjLUkNAKGNtk0lqYUoSnMZ8uNhpAIWzZZ9IaLv1dWuKl1zI4FBHhSbbufConpSmlX
         JPHUEqOCJB3rPaCthOtUkdacM+cvTK8XXRMUqrcbgYoZsvsS9NN4TtbNc+mW6JH2JLWU
         gqtqEUQaL3RObh1OGtowoZPdCX17E59T7Ng4vFxgL/gMt5cia6Si3fYA9rvP2tzydopi
         ZfBVGNNP+eTYLuj2TLzyuly3ygi3Yab8YjCOoCotM74nh7Kou7S/iEaw8ykgYChoZR9P
         X126Z95j02nC7TyV1bJ/GtGa6w3fQJaXIxMBx9O9FWqmo7cRTNObo+zWRa8htsz4QAOl
         nOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642276; x=1790247076;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fz342ZapvVW137Glp/+LrmoTo3LQuz+HEHydJlsSWMI=;
        b=izE/d8yAQrk5fO0CYAHE7YYgj6FyDf4KlYUi8llCoTPTXV4e8SYjBhaclFgKPNaKKo
         UViQ99+6q4sD97wfGNC2uLQ5QDZ3G9YWOx/+AjDmM4cRpKy/+j88LiJJOq6bIAS9PjZC
         KFEjZVdI96hRv6KEKTkTf8pgnk6EQu/QsIQKiZ16p0+2gJb+P0YBaTGJv7rdEGsGgQN5
         XrRDJX4pNmB0aSHsbTvE7UwZH727kOcuWSdnbF6suCaodOTp9rKGvPSpDVIwHTtkA5j7
         XiWJlu4lOq8nREbXAUZdm/V62x26qhnn/8Q7BTBKoq1YqhKgxB81luRMn2a+6p+YFd75
         RA3g==
X-Forwarded-Encrypted: i=1; AKwUvBx8s8HmhCs5amhuk6P1Q3RZxoMpRfS8SkZi8uynqciaKsOFpzHUdW9lwgjftFe8IbUUnYCc3nL9FbY=@lists.xenproject.org
X-Gm-Message-State: AFuF++n4tXUemRNvaMRUCstYA3+molC9r7PuYvnc4O3n96fBwOo/+dM4
	J26h4NdYukF6cEIUrVaNZRSMU+GC2AqwwH23T0v6va4B5eWfw4BSbhTYzPoafwXTxQ==
X-Gm-Gg: AYBFou0A6JjP/XENGnuUv0eYZWDvnWHso3rDQsrWl5qsXN+/i7U3L36Rs3UZJNQZ/Mz
	kxJK0yGVftuFBoU23hu2qFr101YDaNznldbuiiKwiF57bKS+P2VQU6vvVInYEtMa0RQMbDA1J3g
	7ISkR1riIKmQy7yjKqw0g1+g+SpAQbXYffTFdqzMIlKcjuVE7dLsgh0JkFfA5NaJzxL1OIjqkxj
	P5BLvqY6C90AoCQAJ1pPE39LK3FtFJz5cMblafR45P+VVkufQKoa33e5MEpGvKxkVAVmEUjL+9e
	q9VpphK7RbbCaExPM3FSq1rZSnB+TOv6guVR8KetSduml1EXbYhhbYPQoYgqacaQgzgqext54Yu
	Rj3xVCrMLMYtrBBVup0eFOgWs2C8tQdDrhFpJgoKhwNA8rbb/SfH5ccSnDyWf6q9EClLU9bNuYO
	OpH6FpU7RkLjqXySF5/nemkRZ7zjGldZBiLusY8vbvG//eUVqoVuTNdTO0aH7V7SqbZKIXUCLc+
	w==
X-Received: by 2002:a05:600c:474a:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49eac464371mr115512335e9.1.1789642276122;
        Thu, 17 Sep 2026 03:51:16 -0700 (PDT)
Message-ID: <6f9965b4-4d06-46a2-ae18-8014b1a1c4cf@suse.com>
Date: Thu, 17 Sep 2026 12:51:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] stubdom: remove build of zlib
To: Juergen Gross <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
References: <20260917075351.37208-1-jgross@suse.com>
 <20260917075351.37208-3-jgross@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20260917075351.37208-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1789642276-F66B52A1-6F56D40F/0/0
X-purgate-type: clean
X-purgate-size: 314

On 17.09.2026 09:53, Juergen Gross wrote:
> The last users of zlib for stubdoms have been removed.

Looking at patch 1, I can't really conclude whether that's where the last
user disappeared (no occurrence of "zlib" in that patch), or whether this
patch really could go in right away. Please clarify.

Jan

