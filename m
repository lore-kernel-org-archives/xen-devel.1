Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFA0C88E50
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 12:07:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420868.1647084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x65T0-000763-Th; Mon, 14 Sep 2026 12:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420868.1647084; Mon, 14 Sep 2026 12:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x65T0-00075w-Qy; Mon, 14 Sep 2026 12:07:22 +0000
Received: by outflank-mailman (input) for mailman id 1420868;
 Mon, 14 Sep 2026 12:07:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x65Sz-00074l-R1
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 12:07:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x65Sz-00FeEC-7a
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 14:07:21 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7e373-8faa-0a2a0a5109dd-0a2a450ca88c-34
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 14:07:21 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7e378-f479-0a2a450c0019-4a7de48c9bc6-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 14:07:20 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254f705536so461333666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 05:07:20 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2966147b46sm415673566b.60.2026.09.14.05.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 05:07:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1789387640; x=1789992440; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HA60+e5Pq/r/yiWzjxDAI87jtQZSqdkKSGgJz/Lj8Mc=;
        b=dFSYtQO+khXtHTnXrctWU1ML88MPggEpc1UNLZoXMxlYB7evz1aqNKFHKxFuN9dCIH
         rHLRr7hejQrwCqsuCO7bCXotRPsfBMk1QO9HvJ17LGY4DibPbrcUNtsU1mAgd9WXCY63
         vfQyNYRoN+YzAjhqx5BFBXTCk1fkQhSycJ6fk7FdJ1UbXBmvTXnv6wVX4RSswoxncoF5
         nM54fLOqbnF6UHHxnznk6cmmuRcXjYsmRdWUFcjscQscJT++Fi6RlpF9Q4ZWP1BobZ8l
         Xotmj8rbfLQyQjyGOW3ZBeaYkB/foEfGg1HkG03Bykmo8XRWSr9ua/MZiB+PgRKbejr2
         ehTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387640; x=1789992440;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HA60+e5Pq/r/yiWzjxDAI87jtQZSqdkKSGgJz/Lj8Mc=;
        b=L15HHcq/cQUSOm5MWxFLUwklW23f2QhLzbQliLRv/06mELR9/hyWVVLHONXm1tu2F0
         Q5V0BSY39tBp6fvqcw7Lcrb6jIB4TX2bJccgF1hR3tcIOXq41FkgJhrk/vp1CmlRLQpG
         Be94H6CcBSivAyNrS5vaC6LIJ/srvOxqFFbfzfRHTROtgcJke8BQIYiRGUsDBRkjx4GQ
         Kbm7hMUIUAuQHYNSfrNZ5VNr/XlEHRwkVohta9oVv0wxBNoEPj84QY0u/FEEnVhAPyvs
         dKGZqTJGacEzWaqAtV/9JDQTwKXvC1w2emndg2pSOx8GMejzzcSNQ6Daqj8QZ5fXk4Xn
         0NXw==
X-Forwarded-Encrypted: i=1; AKwUvBzDCQDYOq7bWvR+mQ6mImSX7JDHvXKqxIqlpaxhDTuA8lPZ1n+7RN4RlLNe31CUZLucnM/nBIja1zg=@lists.xenproject.org
X-Gm-Message-State: AFuF++mc/g2nyMtRpIfoiMlrMSGWFHqO17vjmrv+btfIJJficBBNbgfG
	hips7XWTmm8K5jj3Pp3hO5mVL9/z3Hh8DpcvWwRdWcePur0IGk8FT4ikU2xREZyodQ==
X-Gm-Gg: AYBFou2WEnCR+pWD0RK13uAF+JO71Qh7yjn9tTPFPWTWx0Uar38XHnDAzwUtRLb+pAE
	CmNIji/cwki+a1OhRvE0wNV98jHLgIFn843we8E8k4iZBAkh7lER6IrJgD+szT6lstgXgJESUmM
	/jmUk4jeOs8T2SkzLYBiCrrquoQUWpEgLpI1NJL0UO0CGgKmBvWSHzxZTntsMLi2njYAwsFCE5p
	pBgRQiuMhZkjK+BXrrjV+8ljsDdH6TlVJLpi+8H3mKLW/HCQA2+Xx00ECvmz8/Zl9y7/8pw2std
	OGJMpqNdvPhjtySESWL5GFijFsZ4D98/vUw5JiqzxpaPFdZSFHhBuMblPf3qOrum0Wd7PD4WNVf
	X0PC1GT+hrHquB4BzAR5A9NxPDdZbmwvaoY1m/K2zbcUtaeORvD5Y1wK7JTBEa/zPfu2B97K+pH
	3dX8T4lEvt9d0WNohbj8lhx7Hcbyuoin1eHpyrMj3z9OSytDDn6De4FZ+wMU4Qu91d8obWUu6zH
	XDNroy43n2i
X-Received: by 2002:a17:907:7ba1:b0:c29:591a:d247 with SMTP id a640c23a62f3a-c29b87259fcmr155760966b.30.1789387640437;
        Mon, 14 Sep 2026 05:07:20 -0700 (PDT)
Message-ID: <cbebe81e-1c68-452e-9442-8c817bd68a29@suse.com>
Date: Mon, 14 Sep 2026 14:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/39] xen/riscv: introduce arch_move_irqs()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <df3d3e1be48d9e46e4884c8573550b242efe26db.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <df3d3e1be48d9e46e4884c8573550b242efe26db.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1789387640-02EDAA5B-2BCA926A/0/0
X-purgate-type: clean
X-purgate-size: 1701

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> When migrating a vCPU between pCPUs the hypervisor must also migrate
> the associated virtual interrupt state. arch_move_irqs() is the
> per-arch hook called by generic code to trigger that.
> 
> Replace the static inline BUG_ON placeholder in asm/irq.h with a real
> implementation in intc.c dispatching through a new move_irqs vintc_ops
> callback. Wire it up in vAPLIC, which delegates to imsic_migrate_vcpu()
> which itself still a stub to be implemented in follow-up patches.
> 
> Note that technically ASSERT() in arch_move_irqs() could be skipped as
> it will be anyway NULL pointer dereference (and a trap will occur) if
> something isn't properly initialized but sometimes it is harder to
> find place where NULL pointer derefence happened as it isn't
> guaraunted that all necessary registers will be filled with something
> useful.
> As at the moment I don't find any case when ->move_irqs() could be
> skipped, the check that ->move_irq isn't NULL is added to ASSERT()
> instead of adding "if ( ...->move_irq) vitnc->ops->move_irqs(v)".

All of these two paragraphs look stale / inapllicable; ...

> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -192,3 +192,11 @@ void vintc_ctxt_switch_to(struct vcpu *v)
>  
>      ops->ctxt_switch_to(v);
>  }
> +
> +/* Move vCPU's IRQs from one pCPU to another */
> +void arch_move_irqs(struct vcpu *v)
> +{
> +    const struct vintc_ops *ops = v->domain->arch.vintc->ops;
> +
> +    ops->move_irqs(v);
> +}

There's no ASSERT() here (and I'd prefer if none was added). With the
description pruned:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

