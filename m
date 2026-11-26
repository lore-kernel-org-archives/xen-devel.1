Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39A2606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CPCNHyKM
Received: from list by lists.xenproject.org with outflank-mailman.1503470.1699189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZi3-0006Vv-NX; Thu, 26 Nov 2026 13:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503470.1699189; Thu, 26 Nov 2026 13:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZi3-0006Vm-J5; Thu, 26 Nov 2026 13:40:23 +0000
Received: by outflank-mailman (input) for mailman id 1503470;
 Thu, 26 Nov 2026 13:40:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZi2-0006Td-JS
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:40:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZi1-00Fw7g-Op
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:40:21 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0836c2-8faa-0a2a0a5109dd-0a2a4503ebc4-18
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:40:21 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0836c5-fae8-0a2a45030019-d1558034d810-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:40:21 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4bba5e17728so17080145e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:40:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bbab390cf5sm85778815e9.7.2026.11.26.05.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:40:20 -0800 (PST)
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
        d=suse.com; s=google; t=1795700421; x=1796305221; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHgjd0D7CH0qeD0V+AWEswuMzcNFsfzR7b4E971ZGIc=;
        b=CPCNHyKMJN2eIA8dmJPK+QtS9b6xiTajSsE4PI0w7dMWnm/kfDMdm0tg7sTYOOqTot
         Qcb3lb/HNoFhywl64QOsi1ULGVqX4zvuxCTNs1q8OKYmYMLesjldxenRdr/PKb7NCEGh
         PBvkzR/MZdvQbjica4waCecaKADCuNROzXt2g0hpTzrEWh3wvlZbgFYNz1ZOlYYEjQOZ
         C3SN070fWsVk0Hen4kKwztLTCL3NdIzLhlgw64TpJI+k8Kh7y7Hx5KrR4L6dcm4Hfdnv
         1TBz3Ko1QVg/lZAXSoNunx+6poCjTY3OyBWxnJNE3UtENnOS3rDqH/DigqS5T9Wopval
         oeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700421; x=1796305221;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHgjd0D7CH0qeD0V+AWEswuMzcNFsfzR7b4E971ZGIc=;
        b=cunxkNEIlM9MbpZ4D+MlwcargkzAu2KhYKNzaTMpqyY5aPfbdP6ySSsVpz572koQ/u
         H/5xrxsr91EEBZ0daIz8DhRvpLiq/mWnd0rhuvkZlqfdrlCljFdc33KIiEWCu+i9Y6s0
         gv8CsnE8/mj4BBN1FwIDf0nkLUXH1r9Pt4VPnPcrtPgAf0fg94PIUW3nYV8Q7ifVz0YG
         aJuFd2fM48ZhI0t+lg8Z0Zn2/RGnuFkcVpm+ZKBYSxmL546TEDvZh9Ra8efYV6PlK9K+
         FZcylfhLLv1XMJbrMcRDizURaWGT0WnDm0SwTu9wK9z4m8j8tJs4ct2F1+xKW4Eunh5m
         TKZA==
X-Gm-Message-State: APuU4Z88n9DFUmk9aRSU0kqhQqb7oyCRt7Ivr4iGzoxIQapnMOxZBVe3
	GLqFNBY2CxH9UyabBIdXjfN1sVuhsEaHfuHu2WLX6yoH1tZ39St8R5swGy9lS5ESX0I7vzxx1l3
	KA9v4nQ==
X-Gm-Gg: AZFdTZdfAxs25pd/wneKZRS2qfYbqAf62wWd7zgk0AvqPPgSFvC8IXBRqOXxYsyNpHB
	ZncOEyIDwJO9jNtAqk6cEme7e6dQQ0h1eo7BGMV69cq5iLrW1YvD8/WhMvyCZQKx1v7GMuJqQxt
	TzVdRvMbWtk6X3X2dzr9BSQZ5loa4wh+9aW9lmwyIShyVNCGjPScX5EFBUemyLXBTszWIH6juqZ
	B5RjJpN3pzsHnfE1N1c/xMTlMu3VBJ0B1UjV+GnC/qGHi0WmhhkTBIdkyRQOBnA3IZkSR5hD7s5
	XuzTMWYn3qyIgZUyX8yGgmuvScDTjCAvRrFg/6/xogb2d6z7/+mY0DfsyjzrV8LaE/BBQlI6z5r
	enYGyMAEDSF0xzdPpXHXMvo/QTKrF/n6vnQZq2XrZhDT2uVyLKQQml11c2JM8wa+1oGD0fNY1B3
	avWbLoX80tbqiz61qlVw7Xnygc5BYw3WXcbwD6Uq/mtGCN59ORnGNDP9RRAwrnttgmmYx20qfNl
	823mQ5s5Ml60FPIIsUBUoaVqxcoq9L0ibHejgs4xG8QRIC644PKk8P4g9L7Qaj1MdQQahimhULt
	pG1j2hvOXX7K/1pNbRsWNhkX3kTpAA0VZTd9B7Y3V/pjrOgu4RgP6h1WY5+TriMhG1XdD/nEd07
	hzfi+ZLBuTbxg8t664w==
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr444912325e9.6.1795700420981;
        Thu, 26 Nov 2026 05:40:20 -0800 (PST)
Message-ID: <8cfc5306-7461-416e-b32e-ee4c51ec1f99@suse.com>
Date: Thu, 26 Nov 2026 14:40:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 09/13] x86/dm: use domain_vcpu()
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
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1795700421-6DCD34E9-517A0C61/10/78276251493
X-purgate-type: spam
X-purgate-size: 938
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

--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -54,7 +54,7 @@ static int track_dirty_vram(struct domai
     if ( d->is_dying )
         return -ESRCH;
 
-    if ( !d->max_vcpus || !d->vcpu[0] )
+    if ( !domain_vcpu(d, 0) )
         return -EINVAL;
 
     if ( DIV_ROUND_UP(nr_frames, BITS_PER_BYTE) > buf->size )
@@ -302,9 +302,9 @@ static int set_mem_type(struct domain *d
 static int inject_event(struct domain *d,
                         const struct xen_dm_op_inject_event *data)
 {
-    struct vcpu *v;
+    struct vcpu *v = domain_vcpu(d, data->vcpuid);
 
-    if ( data->vcpuid >= d->max_vcpus || !(v = d->vcpu[data->vcpuid]) )
+    if ( !v )
         return -EINVAL;
 
     if ( cmpxchg(&v->arch.hvm.inject_event.vector,


