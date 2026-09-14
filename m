Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5E6C88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 09:27:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420616.1646869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x62yT-0004tw-0k; Mon, 14 Sep 2026 09:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420616.1646869; Mon, 14 Sep 2026 09:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x62yS-0004tp-UF; Mon, 14 Sep 2026 09:27:40 +0000
Received: by outflank-mailman (input) for mailman id 1420616;
 Mon, 14 Sep 2026 09:27:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x62yS-0004sc-28
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 09:27:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x62yQ-009FHJ-MH
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:27:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7be06-8faa-0a2a0a5109dd-0a2a45099b12-30
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:27:38 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7be0a-be1a-0a2a45090019-d1558032e1da-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:27:38 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso37350395e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 02:27:38 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb34fdd2sm25862446f8f.28.2026.09.14.02.27.36
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 02:27:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789378058; x=1789982858; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xx/j5TK8XLtU89U2kDZ8oobMIgRGALq6rhd2aCZgOP0=;
        b=OZlPZBSDqi+f/gfi5IQqNtxH5PbvwJGBUMVia4tjfweLO/ZFVkGO+OQtQlj46pOJju
         mbGOEVpXLGhJZCVEgTyQXBrF5vQjiDuzUOMM+czpHnwJIt0qeX4yP8rQ9bPy+PCTL0zY
         1eZuQLyVoa8alurusmIgDo9RXXV4M+DSpDkbg/EyTBDDJqL58IFth1C4OLgsrtEHvSJp
         tvlgrjUM73Fgtzvo2Cj5z/uefmiwiyp7H0lac5UNBjJtCODfXOn9Zv0zVWyQ+PlZPGG8
         TW4hpdDEOkdyoTeJCzOMNMA2+PXXix2GuB/1ivd7NB/kc6jgjfg/8mf84G3plm8WDj6O
         e32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378058; x=1789982858;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xx/j5TK8XLtU89U2kDZ8oobMIgRGALq6rhd2aCZgOP0=;
        b=eoRcT2x0fbbWklKoQvWbUz0PBGSv+p42vy/2de+mZtPkgeocUcCHtvxuJoImZZy50i
         9tBLElMNf6//m0R9kgIIgv5CfCXieLAgF20AxViAKzeeTQtelTbvlQTrnYk+Kyl1FvTY
         dgao8hawvmiZELd1GxX/TVJaKq0BqMhkOMLZbv/Dgwu9uFYpAQUotQNUFW4kAEXEzkUO
         C48hDHWi/D3ou28bxkf7vSwzJieCmWcr7JJxq8HoXjMypmK6UWNtyI/gEIKm/Z02IZRN
         1Tmr+w4jjXkf/fkcid7HkdXP/UeQdDQyL47NgM3HlLZ7amrKhSLrvEGQqxsmW+wbzjYh
         153g==
X-Gm-Message-State: AFuF++mrV49mLlsccGpXFX4ApieznzIdXjWYVT9C2fyAXBJJBgeVVVos
	RWpUiCujRc18Iats2rN0JdxCRUaj5HQ+3ECr3k+fZ8Hr6pyoiD0IPk9yGZRIt6HmWLbwBIY8Eqj
	g0Dk=
X-Gm-Gg: AYBFou2rb3asiS0z0q3ygynx4rsxm9XsBv5/zK78qYQ5XKPhIVAVmQamWtM6f+hfIci
	cTVYi0qBVdsZ8e0XpKnX1Ze4FeiIRqXxD4qWDTWYQYjugcH96R+b5zfOJJZL55d/6Lbdwkifdmx
	NbQ7xWdX9WElru3m2qnRDyTyScUpDvKodZYA3aENMGffBxktMrlVm9AlZz8poELygHXOd49efIH
	P96h1gISb+EWrR90OCdq5vPbpgjMcdrGzm7RCyfrNCcitPeKSjBMs++tA0PVhqOyY/d+nw2vW63
	0zqP9VbQgzL2qEUoU/WbKxkPJWmmsp45u2GXMImNtOlibGTpjLU04/uEeJgI8Wr88ccqkOcbYST
	2/PV6qe9uB0H2KmlqkTsj7Ii26Tq/Z3sIQQJzOHAfb1dVYo51f+zwMMdYfPc32DQJZaIy0oBNM2
	FjwDROGuYfvOlP7ewlm8yRmpEYaIfUhGUKZZt5tkC5BHJQnHsM3oTkzSuAf7+bqh2m7/aawhyVj
	vS/T3+VjQU+Tg==
X-Received: by 2002:a05:600c:3acd:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49e7a639518mr16575565e9.1.1789378058009;
        Mon, 14 Sep 2026 02:27:38 -0700 (PDT)
Message-ID: <f2dc5297-151d-4d16-bbdf-faab93865d7e@suse.com>
Date: Mon, 14 Sep 2026 11:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6aa6dded12155_28a4c52b6718b7799c6170@prd-scan-dashboard-0.mail>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6aa6dded12155_28a4c52b6718b7799c6170@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1789378058-BD0CD034-D1BB223E/0/0
X-purgate-type: clean
X-purgate-size: 1435

On 13.09.2026 19:31, scan-admin@coverity.com wrote:
> 1 new defect(s) introduced to XenProject found with Coverity Scan.
> 2 defect(s), reported by Coverity Scan earlier, were marked fixed in the recent build analyzed by Coverity Scan.
> 
> New defect(s) Reported-by: Coverity Scan
> Showing 1 of 1 defect(s)
> 
> 
> ** CID 1701169:       Control flow issues  (DEADCODE)
> /xen/arch/x86/hvm/hvm.c: 5136           in do_hvm_op()
> 
> 
> _____________________________________________________________________________________________
> *** CID 1701169:         Control flow issues  (DEADCODE)
> /xen/arch/x86/hvm/hvm.c: 5136             in do_hvm_op()
> 5130             rc = -EINVAL;
> 5131             if ( unlikely(d != current->domain) )
> 5132                 rc = -EOPNOTSUPP;
> 5133             else if ( is_hvm_domain(d) && paging_mode_shadow(d) )
> 5134                 rc = xsm_hvm_param(XSM_TARGET, d, op);
> 5135             if ( !rc )
>>>>     CID 1701169:         Control flow issues  (DEADCODE)
>>>>     Execution cannot reach this statement: "pagetable_dying(a.gpa);".
> 5136                 pagetable_dying(a.gpa);
> 5137     
> 5138             rcu_unlock_domain(d);
> 5139             break;
> 5140         }

Nothing really changed here recently, so how can this be a new violation?
It's presumably related to SHADOW_PAGING=n by default now, but that change
was done a while ago.

Jan

