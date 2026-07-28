Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3B4C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:21:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374368.1621522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woigR-0001ys-S5; Tue, 28 Jul 2026 14:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374368.1621522; Tue, 28 Jul 2026 14:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woigR-0001yl-PU; Tue, 28 Jul 2026 14:21:27 +0000
Received: by outflank-mailman (input) for mailman id 1374368;
 Tue, 28 Jul 2026 14:21:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woigQ-0001yQ-5F
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:21:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woigP-00HNbQ-HT
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 16:21:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bada-2eae-0a2a0a5409dd-0a2a45079dd6-16
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:21:25 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bae5-b4ea-0a2a45070019-d155802eec42-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:21:25 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4954dff6536so27595185e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:21:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45bb2e7sm86149115e9.7.2026.07.28.07.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:21:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785248485; x=1785853285; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XGrZ7kjDuuGJhwYMCufypln4dXhKBUUO4NDiLthgxi8=;
        b=ftyQmVeqX169mLpt97B/WrV/L/NfbYVN5giGjkVhncNOqDILD1ArFajOzJDgt3LGtz
         l2J5uEqZivRfV8reifxCkTtTvBC+oWhtn6Vn8D8A4S79qEtPZov1TMaCLIOjuGYo4BpD
         ++vh99DrHYvg2VZf9Ok97baUNmKpAxrsOFsSjzv3F5l3nbrheKCbm1sswBfSqlbd94to
         VoPX8dmsWNaG64ovM12sqIllnaOwBUTx1kzgrbgYkBA5/DOmRkAAMVEIDGCS1UE7s1ke
         ZrQBTYJ6jbstTisWTijS/19QlR+B1xBlkDVdIaQgQJppbmiyj2iUnx/ingb/9WOo4oRP
         4brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248485; x=1785853285;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XGrZ7kjDuuGJhwYMCufypln4dXhKBUUO4NDiLthgxi8=;
        b=OP0VwMQNI2+tEi4/jMuOgdIVip/K5uj7D73kuFcvpf3vSWCVIJZXDoB62vLrkqu6A2
         teyC5PcpmVhA1UXPaeeeNT06rQN8VnNsgfSVd0/4alklMm950XNp7BvjbzYf79PSSm6o
         onoRLD2KKlAG/vQaV/zuZk8o5f37i9Iu2UZ2ie4micmJrx3jzEEjv45tXqPc2iQp4M5u
         JhaTjN23hOrdYJ1UgdHxNhJIbOfy7KEVnxugMVgSCyXmPno3rVfyi9cbGf7CPRE7TORP
         OSTkVSx2PEzFq5SobrFiQ2iDjY4InnTJqYq9fDJ2+nNK393Z5UHl9cxU4aLVAUZkWMMa
         ERAQ==
X-Gm-Message-State: AOJu0Yy/wPvWEFIY5u/zNSGMwciVAPglG5/w36rK//zrh3uUsTMK2Pf6
	W9eJxVFjvsEmtTFj2DP2JL0fEmHdLKAUYw9rgsmbnjMDvhKdTTuSMgMlKhbw6uUuNwfPxM5Xa9F
	tjmCo5w==
X-Gm-Gg: AR+sD12yjaZf9DeTuihhduD1TSUNZaThFV9XCiaLO+610nUTFTOdwq/N2GcTJKYOHis
	yllasjXphj8ISnApL2CqD5/BI1QumX7BGkDrvjd56vxT2x7XY43UDi/GbkXuoBhiVGH9fsx17U4
	Q/CXQ9TNF8OCtZr+JpDhBCtnwgrO+yxVANlaXBZNkv1vEnkiWC+i6DuTmiuC8gE9JXjgR1FF0JE
	hhFXpqfwxEzCC7J8kRXsZiLddqs0/9g+rn4I0tfG7J/MbbLXA6ve1a9j/wOXQBaWEHv3uF03HzY
	D1/GkEa+YluVVrFsQjnyOqC3Z9CuVXQBpPpV+EyB6Am9G3y4fOHLWR/hF0Ey3FMptqKVZD4icHk
	p8+lZ1UrmyF82H+JRYd47Rh7ssfahiFsVAuzKEnmaVfbXW39a6h4Hzcc7HnBmyT2lXAB/++4mhd
	44/98Su+oY/uCpOFHl3wTkOPHtgilchp+4kFTyZQ0rbipMoIXUK3AThWiVvYNW9waUJg==
X-Received: by 2002:a05:600c:5291:b0:495:4e1d:82e6 with SMTP id 5b1f17b1804b1-496c659294bmr28684895e9.36.1785248484901;
        Tue, 28 Jul 2026 07:21:24 -0700 (PDT)
Message-ID: <4ba9dcd7-3e96-4ced-bafb-8bfb35fe26ca@suse.com>
Date: Tue, 28 Jul 2026 16:21:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v15 03/10] x86/shadow: 1-bit-disable doesn't need to detach
 old tables
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
References: <68c16600-a4bf-4060-a1fc-56c4ae655b03@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <68c16600-a4bf-4060-a1fc-56c4ae655b03@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1785248485-A54C3AE4-A87BD2E7/0/0
X-purgate-type: clean
X-purgate-size: 2608

Just ahead of the loop being modified sh_new_mode() is called, which in
turn calls sh_update_paging_modes() and thus sh_detach_old_tables(). To
retain the intended effect of not leaving any shadows in place, avoid
re-establishing a new top-level shadow from sh_update_paging_modes().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
This doesn't need to be part of the XSA, but it eliminates one point of
concern wrt preemption checking. However, in the context of "x86/mm:
make more of log-dirty mode enable/disable preemptable" I started
wondering whether things don't want doing differently. 1-bit-enables
technically don't need to purge all shadows:
- log-dirty enable only needs to get rid of all L1 entries; this could
  be done via hash lookup (of all L1/FL1 shadows) instead of
  shadow_blow_tables(),
- test enable doesn't need any purging; it may be the intention though
  that it does a certain amount of purging,
- force enable doesn't need to do any purging either.
We could therefore pass a new boolean through sh_new_mode() to
sh_update_paging_modes() to suppress the call to sh_detach_old_tables()
for some (all?) of the 1-bit enables.

1-bit disables (log-dirty as well as test) match the above, but of
course they will need to (at least) detach all tables when shadow mode
is being turned off altogether (i.e. the very invocation that's being
deleted here). As done in the other patch, the amount of work to do by
the (then possibly retained) sh_detach_old_tables() here could be
bounded by "preparatory" purging (in a properly preemptable way) in
shadow_one_bit_disable() or its callers. Using shadow_blow_tables() for
that purpose is probably preferable anyway, as sh_detach_old_tables()
alone won't get rid of pinned shadows.
---
v15: Re-base.
v13: New.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1982,7 +1982,8 @@ static void sh_update_paging_modes(struc
     }
 #endif /* OOS */
 
-    v->arch.paging.mode->update_cr3(v, false);
+    if ( paging_mode_enabled(d) )
+        v->arch.paging.mode->update_cr3(v, false);
 }
 
 /*
@@ -2459,8 +2460,6 @@ static int shadow_one_bit_disable(struct
                        d->arch.paging.free_pages, d->arch.paging.p2m_pages);
         for_each_vcpu(d, v)
         {
-            if ( v->arch.paging.mode )
-                sh_detach_old_tables(v);
             if ( !(v->arch.flags & TF_kernel_mode) )
                 make_cr3(v, pagetable_get_mfn(v->arch.guest_table_user));
             else


