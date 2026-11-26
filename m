Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83969606A326
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GSJ/71Pt
Received: from list by lists.xenproject.org with outflank-mailman.1503427.1699133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZf2-0002eg-38; Thu, 26 Nov 2026 13:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503427.1699133; Thu, 26 Nov 2026 13:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZf2-0002eZ-0C; Thu, 26 Nov 2026 13:37:16 +0000
Received: by outflank-mailman (input) for mailman id 1503427;
 Thu, 26 Nov 2026 13:37:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZf0-0002eQ-SI
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:37:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZf0-0088xh-8G
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:37:14 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b083604-e002-0a2a0a5209dd-0a2a450ac132-8
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:37:14 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b08360a-f2d2-0a2a450a0019-d155802fd548-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:37:14 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so40839915e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:37:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853ca452sm584776625e9.15.2026.11.26.05.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:37:13 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Cc:Content-Language:References:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795700234; x=1796305034; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e5lyTnN+Lxsm5mLii3MfJujE3BvqD0r73RYHv4vmjvQ=;
        b=GSJ/71Ptp8GvIsq0w0+xgTvIU4QJ/KRxFJrbBvB9UujMnHiMzkLawJLa1rPtGiw759
         zUsTaZDTWwNVmxE1NW2KYQmzZj6SeaZ9tayblg5sb9+EaKBAC1cnVpmgCZY8QNtq9hZy
         wmUBbIGo/3q90eorVr7Lhp4iTDt2XfdnWcHPvzFk/gwtv8aQpHl+ESjzyzlsdIfwNLTJ
         EEF8CA1B6NGDVvsO0ZeHZEE6a1149URoQz2+K/N7kDykoPKI1KsMxyM1+k3spIYqiczl
         6KiBM0RyKDVVP2RQvQEVs+2mW80jz1itij2EeW0ZRx2pa+AEtwE4EA2xt29NE24KVT3a
         NslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700234; x=1796305034;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5lyTnN+Lxsm5mLii3MfJujE3BvqD0r73RYHv4vmjvQ=;
        b=Cr0HFjSyqQUessVqj6UciP7viuYmob8PUC1KV2skb4fQoKovfWIA+8TAJHxu/CI9WG
         cL/6f3QfDv2rQ9VBwnexT7OxEnLrUuwoUMcOApURSS/Rp1bAVYzOl67zUGiF5ivQM0Dt
         pt1D8od8HnTyoukoV+3eIHHWsis5kzE0n7WiPG/3AjEMVQuxUpqV6aL5ZWtJYLzo/Hkk
         FkpnpS/w9klJnX09l+/kVcgUwXGcT5MfKUzqGoUNGF1Em1GEPwmvDu3g9VKpELKJ1J6g
         OB9muwToQrEKicBg/G4S1qpJh7t1NXsn6OL+EphqQeYUZeEOzckXL5zNhZkklwYCZSSP
         eq1w==
X-Gm-Message-State: APuU4Z/dCyYjX1bn6PspgRkH3XHr/2+W5J3uSmjqnAegf50kK/uD0Iwk
	cICgkTD5B7hApTjp6mgpiow3m0SkBCGrPo174uZFoX5bSoW+YoN8ZaJVZzqrE+M47EdWuCFJgUc
	IYbN9Kg==
X-Gm-Gg: AZFdTZfuVUj31JC8fdiQ75byleCDlbkZ5j38H5SoeCPIECP9y/B094ICv8KjpzPCpF+
	uWuFU2oknsBzaL8VjJMm+FSSFeBLiNeKZKP3yLAbws2ZPTJfbclKzxmQhqeci5aS8R2JZpx569A
	Bs0BtoWePNs6pbWUbZ0Hp6ftzDag//+p8eFoY0hmZaOShOyG2WZveLkt2BjoeBGpVYLRxNyrBEW
	sHggyG2xIODz1YX3sFxQS0Nx9lp7qgR3lhsRG41b7A13+ap5ykgO50Tl/XV74rm/uqpc627TOth
	Tn19aAYPv3MQNhNOHiioACf8Uwn1fKWQ/ORUsZs1PUAlbpoV2szDIUp7MJHJ+QM5gxDaJX1SX3P
	EerHgiAXmSQVJvCD2kAHu8qqVYd4gfME8xZK0oQPuGHhEFll8JmFFOpzKMM9sbXhDKxBooQDaqr
	PLRYgJQl85p7Otp/+Hv911p83wYrDQ54DF4sxjsiS/sMVvO1nXcgnJfdJH8s9aM5/jeCDwE5I9b
	kNVRpnYAHlUSNjPPuV/tVJ3qgy+AzznjUiTzN1e+2plyWGNC8/0+dAQFWDDCelTmbHa9fzHXGF0
	YU+o/fAHznZ4fSgx148c/En4sOqIGjZq/2XXkRRDDHXbltf2IsnTzcG6ef2reBsijMypPkmw3Cw
	CjNqQXsGPlyYpO01wLA==
X-Received: by 2002:a05:600d:82e4:b0:4bb:6847:7927 with SMTP id 5b1f17b1804b1-4bb8882677cmr447234975e9.7.1795700233649;
        Thu, 26 Nov 2026 05:37:13 -0800 (PST)
Message-ID: <ffc99af3-01e9-478e-af05-a1fe7b45fd91@suse.com>
Date: Thu, 26 Nov 2026 14:37:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 03/13] x86/altp2m: don't blindly assume vCPU-s exist
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
In-Reply-To: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1795700234-5A9D9CFC-70A71398/10/78276251493
X-purgate-type: spam
X-purgate-size: 1648
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Checking hypercall inputs against just d->max_vcpus doesn't suffice, as
the hypercall may be issued ahead of vCPU-s being created. Use
domain_vcpu() to also cover other eventualities.

Fixes: 3e828f882a6b ("x86/altp2m: Allow setting the #VE info page for an arbitrary VCPU")
Fixes: 9b97818c3d58 ("x86/altp2m: add altp2m_vcpu_disable_notify")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4697,10 +4697,9 @@ static int do_altp2m_op(
 
     case HVMOP_altp2m_vcpu_enable_notify:
     {
-        struct vcpu *v;
+        struct vcpu *v = domain_vcpu(d, a.u.enable_notify.vcpu_id);
 
-        if ( a.u.enable_notify.pad ||
-             a.u.enable_notify.vcpu_id >= d->max_vcpus )
+        if ( a.u.enable_notify.pad || !v )
         {
             rc = -EINVAL;
             break;
@@ -4712,17 +4711,15 @@ static int do_altp2m_op(
             break;
         }
 
-        v = d->vcpu[a.u.enable_notify.vcpu_id];
-
         rc = altp2m_vcpu_enable_ve(v, _gfn(a.u.enable_notify.gfn));
         break;
     }
 
     case HVMOP_altp2m_vcpu_disable_notify:
     {
-        struct vcpu *v;
+        struct vcpu *v = domain_vcpu(d, a.u.enable_notify.vcpu_id);
 
-        if ( a.u.disable_notify.vcpu_id >= d->max_vcpus )
+        if ( !v )
         {
             rc = -EINVAL;
             break;
@@ -4734,8 +4731,6 @@ static int do_altp2m_op(
             break;
         }
 
-        v = d->vcpu[a.u.enable_notify.vcpu_id];
-
         altp2m_vcpu_disable_ve(v);
         break;
     }


