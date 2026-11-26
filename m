Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE150606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=O/6BeEGQ
Received: from list by lists.xenproject.org with outflank-mailman.1503434.1699144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZfV-00038W-Cp; Thu, 26 Nov 2026 13:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503434.1699144; Thu, 26 Nov 2026 13:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZfV-00038L-8M; Thu, 26 Nov 2026 13:37:45 +0000
Received: by outflank-mailman (input) for mailman id 1503434;
 Thu, 26 Nov 2026 13:37:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZfU-00038E-0T
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:37:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZfT-00FvHp-D1
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:37:43 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b08361e-8faa-0a2a0a5109dd-0a2a4506dca0-26
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:37:43 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b083627-195a-0a2a45060019-d155802fac78-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:37:43 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4bb72b44a97so60256565e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:37:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884a15absm547882255e9.9.2026.11.26.05.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:37:42 -0800 (PST)
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
        d=suse.com; s=google; t=1795700263; x=1796305063; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRavKIgnHTEql2DNhKvRahYgBZeL33TO7k+GHOEeR8A=;
        b=O/6BeEGQTLdnh2DL9e053jNi3JZMH9kbRQIgRExYcwbWSPyoROkS+qQnE8DabLFHdL
         CiKXnzhphPgmhDkm/LYcZ3PsN0R/QTI+O7f/+9kBm6ibNdQhch1SN5BmL5o7bx3DWxr8
         6bSuWDp2/Sp8nwLO0vsOOKVuTQWEcMQ+uBL59VsKT/Qk8Ss+BJXBrFtADMt5SGDKudwz
         4k9Hi3Q/xeeQ/fqqLCTvQaF90XoMGrb6P5uPdDNtJsWP8wLrsP3ZfL4Gb9xnegu05Pbp
         cQHmJ2A4DiIXD6vGo45tRK/ZpI7h0p5S+zdZ/46ZqILEQgSowsX/lHG+xpPBd/Tc1hDJ
         xVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700263; x=1796305063;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRavKIgnHTEql2DNhKvRahYgBZeL33TO7k+GHOEeR8A=;
        b=FZnQRtc6u/iA6YK1Z5WRUem07hPc7I0JHG5GchGdYKn8/n9iNg3Vln3DCcMdf72PyD
         ae/kX44XN0/FwMyocWyf7bBfWszYEcuw79zAi7+j8D9DLDkA7NFaxY2X+I8PTILn7ml4
         +udlcDSU5/24y/rlLwksqZ9pfYd8mqB/jTcA4SgouXHmZ6KDyEMrGCoeLIpMvUmunO8d
         i5F8Zad1dcuIpLqXNRyftDlWRIMrWpiLh65uge9Qj5P9VUuwfYCHBsvzbIzwk5nzZUgb
         UoyWype/sQdi4oh88hFENJUXbDjogHt5kHaA0CoKE0wjFYFgjWdFZk4xfPofpbNLSBvz
         1gPQ==
X-Gm-Message-State: APuU4Z8b0830WOB2LkIMs2R18nPmeqa/in3lRnkZr3lRWUWgQ+p7jqeg
	4b7hj95XonY1BKDqEYnnowi6CnXA2vbpQaMrngec7q37YK/QDGxd21EC+392V4yiQhqRm1Yr5wJ
	lS/Hnww==
X-Gm-Gg: AZFdTZeINPb0FRE4QJa/dPpVncGXC6Z37zGvQ7KBy7pc1UdWEcE7Zdvb3N7fKEdxSvK
	h8aPbQQeBQcXVxC1mcxCCKSj7NFfvtfke1tJmg6kQD+d6i/Ud+xhgtkrYEAuHi0NXqIPECL6pXI
	dGk36f/bTQU10zZlBIQCFqadthsOP8a19u1KUtf+Kl2zymsQl71aI7yRxEMMj9j6gPiDZA/CFLC
	0Zjg2IKtjKUVAOpwJWwv/qtiv3UKovorSkRNzYi+dImvHkBkfGMhOvVHHHmwjhfZKZb0snTdtmx
	xKPsXPUSzAXgrLxUvJqylS307GTj1WsYw7OR22IFSVv/Gxv921qP0V2egFSFf2cnd8ntShjOf2E
	oLLnALJWOQbJpphDLwu88QzqkYKo374p6oL2Q/ZNowj9k75gef6ye2bdTbnb62IKSULuLtZYTSa
	9Apw+oBsIGja1c9Y9cHZ9FkUgPU5tXqNm1CFlaGHAmyqVktDs5a2X245ecAiR1+ygghydAS/3bL
	1iHU/loZIU3l9WfHEIKbQZdk1n4x46yr9qDqPnMhQy584pB0RD0iadE3gBWgMf8P2Mb1utr+oY+
	xm9eDvOKNUgGBBbaaUq0q86D2asFrVLeeFFMc7IpRZGybcwKADlZIEd/5gUmyjNXkSUvx+ejtu7
	0icFfSbZ18VeB+5Rp3Q==
X-Received: by 2002:a05:600c:3b1d:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb8881a890mr435465465e9.22.1795700262837;
        Thu, 26 Nov 2026 05:37:42 -0800 (PST)
Message-ID: <ccc96924-afaf-48fa-9a57-015f0d8cb2c3@suse.com>
Date: Thu, 26 Nov 2026 14:37:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 04/13] domctl: use domain_vcpu() in
 XEN_DOMCTL_{g,s}etvcpucontext handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
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
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1795700263-F580D77B-81238EEC/10/78276251493
X-purgate-type: spam
X-purgate-size: 1444
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If for nothing else, then to reduce the number of open-coded d->vcpu[]
accesses.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -606,12 +606,10 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
     case XEN_DOMCTL_setvcpucontext:
     {
         vcpu_guest_context_u c = { .nat = NULL };
-        unsigned int vcpu = op->u.vcpucontext.vcpu;
-        struct vcpu *v;
+        struct vcpu *v = domain_vcpu(d, op->u.vcpucontext.vcpu);
 
         ret = -EINVAL;
-        if ( (d == current->domain) || /* no domain_pause() */
-             (vcpu >= d->max_vcpus) || ((v = d->vcpu[vcpu]) == NULL) )
+        if ( !v || d == current->domain ) /* no domain_pause() */
             break;
 
         if ( guest_handle_is_null(op->u.vcpucontext.ctxt) )
@@ -792,12 +790,10 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
     case XEN_DOMCTL_getvcpucontext:
     {
         vcpu_guest_context_u c = { .nat = NULL };
-        struct vcpu         *v;
+        struct vcpu *v = domain_vcpu(d, op->u.vcpucontext.vcpu);
 
         ret = -EINVAL;
-        if ( op->u.vcpucontext.vcpu >= d->max_vcpus ||
-             (v = d->vcpu[op->u.vcpucontext.vcpu]) == NULL ||
-             v == current ) /* no vcpu_pause() */
+        if ( !v || v == current ) /* no vcpu_pause() */
             goto getvcpucontext_out;
 
         ret = -ENODATA;


