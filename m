Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BF3606A32A
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OClL9rCc
Received: from list by lists.xenproject.org with outflank-mailman.1500439.1696595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVUa1-0000g1-Nj; Mon, 23 Nov 2026 13:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500439.1696595; Mon, 23 Nov 2026 13:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVUa1-0000fu-L8; Mon, 23 Nov 2026 13:59:37 +0000
Received: by outflank-mailman (input) for mailman id 1500439;
 Mon, 23 Nov 2026 13:59:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVUa0-0000fo-Ru
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 13:59:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVUZz-005MZC-Sq
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 14:59:35 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0446a7-8faa-0a2a0a5109dd-0a2a450396a6-36
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 14:59:35 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0446c7-fae8-0a2a45030019-d155dd2fbd21-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 14:59:35 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-490d59c3f0aso1533955f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 05:59:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853ca452sm349527375e9.15.2026.11.23.05.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 05:59:34 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795442375; x=1796047175; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYPgj1f8qBbwpBLnsdoLqaZOMZLDtiCKZIRvxWJg7fI=;
        b=OClL9rCcznal1bpbKVfbHdVnMs3J7RC7I/02H7l5D0kVgP7I/XEBd6f2Py0QU593pe
         WXBdzyFls4IvQO/SKo85lZVDFaqtDn2BlQnNa+D9FO1oMea9VELduvrxPrtdIjTt9FdY
         rbZfiYXwYSGWPoxlM94eazOoHnod24O1IabtV8uZSP+F+mPWBfsKHBBTq5Ppd/5Fj9ZC
         PLdDFPoejr4lDbZAk77upByNVioNMbtqfYIOii1M0lKwGwNZrCyMwHH7GhinB4kqlM4O
         USEHfOaV6Cy/1oJQswZ+JSpxnP26q5P2dfpxjxOOY0rGTnIkpmrtdsf+zUv5iNeEqeAC
         FndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442375; x=1796047175;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYPgj1f8qBbwpBLnsdoLqaZOMZLDtiCKZIRvxWJg7fI=;
        b=2ZydXAIor4hytcMqDGWw4Zybz4BAXYQsCi5xcUjT5RsS258bEcQED9KltDQPSkGUDt
         Fga1paTGtAoskqlANd27nEmSetQr4cCQyMQJe5+mT0CWM58vmUYCzxRNGvhhrfHGkZFI
         56ZdQpxe8OgNQde/ncPBGK/7EsnGaBAVnhGX2jJySBsKkOdqYQalMWuSDSeQ3HiEbnXZ
         bc44R6QWeVHUENDVgiq3OtqRa7m9WddQeQ9kBjQ2n73FCiKZ9xv0s4HIMMjP5l9y5w1V
         t/V08GZAPQ4xQ/YMZSZj19FLnW2PRNpdpmaBtXf4WnqVu7IUvj3rDmfYOnk1aJyBt3AT
         TelA==
X-Forwarded-Encrypted: i=1; AL+hErHdi5j0h9dU1Z94PYceXW0BFKaJxmqVU1eNTsK1VaTegr+pqOgddknwTs0PP6JJblcIvSO8wlyO2wY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8Gbfi3cbnttc3Vgg34y+M8WZESLx9bP1TqUG8xbY/mtP4EHdY0
	XWzCTrLguiFyqdovlIZynVVlh7CfWol9uxUdNlBMHIaezA2mGlU8ssjdCT2QSZdvWw==
X-Gm-Gg: AZFdTZfSjm4bax8m/XMhSY12X6mCDlbDv2Ime936FG3xduC0w4DXUWovCiirRNxIke0
	dl7jWEqp/c0DXeR+w5+hkOcRalaJ/dYxlvHuy7OIvOJlEykMQazuKvv7QnWm6zL4r5Cbd+AfzCC
	0XYWp1ha0YPoe5lNK10pE1S58HxgIprZdYolDSnRklrFMuvlKc96/eLiR0jdmMgpWDsSFVR985X
	EIn1qNXUPXj89AOdUouU5wEEqwjHWA4Gs1OdQrb8ThUH0Nq1r0HLA/BoUVTyQ/GkKR3OVRahlbB
	umV1wTgtHsWeM3TWwoCpBNUmi1dIWvOrh7VhCA+QmIjT7BYVODog1jEBECk2xzrSWpOEzBTo+Z1
	nF4WOvmEFv74WlhUALiVI5mpQXXPahy2urtp/FulGPDFTk9GIH/Xl/BYcsEyAkLd3IW6amU8Zpf
	b1Y4XD9vVta70M1d08gvf3aber8XlOjLbIA8pL5kmKIazx6QvpLFL6hTaT/nacR+hCPmNF/BdV7
	LlvbJgAFt52kSb4LKCEn6V9MLiI09232cnBGoQPiMSXQ4QNB4Gno/4FC1BI1tqU81YpOcTwQw8/
	KUANFFl0AgvKDe+donbnyxcTD4bStSSZbA7a14XwtgWOBr8gAvYJbugAuS0smsOAkdurGoBMVDt
	MYhqAkqIF7Awfz/1F
X-Received: by 2002:a05:600c:638f:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb8881a2bbmr213464045e9.17.1795442375209;
        Mon, 23 Nov 2026 05:59:35 -0800 (PST)
Message-ID: <2138ce98-dd16-461a-9f7a-608785c22c9a@suse.com>
Date: Mon, 23 Nov 2026 14:59:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/50] x86/svm: introduce SVM_MAP_VMCB() and
 SVM_UNMAP_VMCB()
To: George Dunlap <gwd@xenproject.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
 <20261119-asi-hvm-v7-3-6551b6d5c879@xenproject.org>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20261119-asi-hvm-v7-3-6551b6d5c879@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1795442375-74A894E9-6280D394/10/78276251493
X-purgate-type: spam
X-purgate-size: 3820
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.11.2026 22:06, George Dunlap wrote:
> @@ -531,10 +547,13 @@ static void cf_check svm_set_interrupt_shadow(
>  
>          vmcb_set_general1_intercepts(vmcb, gen1);
>      }
> +
> +    SVM_UNMAP_VMCB(v, vmcb);
>  }
>  
>  static int cf_check svm_guest_x86_mode(struct vcpu *v)
>  {
> +    /* Current only (see guest_cpu_user_regs() below): no mapping needed. */
>      struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
>  
>      if ( unlikely(!(v->arch.hvm.guest_cr[0] & X86_CR0_PE)) )

The pre-existing guest_cpu_user_regs() makes clear that one may better have
been here already before, but might this new comment perhaps warrant adding
a corresponding assertion here now?

> @@ -602,13 +621,18 @@ void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state)
>  
>  static unsigned int cf_check svm_get_cpl(struct vcpu *v)
>  {
> -    return vmcb_get_cpl(v->arch.hvm.svm.vmcb);
> +    const struct vmcb *vmcb = SVM_MAP_VMCB(v);

Much like you have it here (or below, e.g. in svm_get_guest_pat()), ...

> +    unsigned int cpl = vmcb_get_cpl(vmcb);
> +
> +    SVM_UNMAP_VMCB(v, vmcb);
> +
> +    return cpl;
>  }
>  
>  static void cf_check svm_get_segment_register(
>      struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
>  {
> -    struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
> +    struct vmcb *vmcb = SVM_MAP_VMCB(v);

... it looks as if this could also be pointer-to-const.

> @@ -754,25 +789,36 @@ static void cf_check svm_set_tsc_offset(struct vcpu *v, uint64_t offset)
>      if ( !nestedhvm_enabled(d) )
>      {
>          vmcb_set_tsc_offset(vmcb, offset);
> +        SVM_UNMAP_VMCB(v, vmcb);
>          return;
>      }
>  
> -    n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
> -    n2vmcb = vcpu_nestedhvm(v).nv_n2vmcx;

While moving these assignments, it might be a good idea to also move the
declarations ...

> +    /*
> +     * A vCPU stays in nested guest mode across a deschedule or a pause, so
> +     * this can run remotely with the L2 VMCB active: map both explicitly.
> +     */
>      if ( nestedhvm_vcpu_in_guestmode(v) )
>      {
> +        const struct nestedvcpu *nv = &vcpu_nestedhvm(v);

... into this scope, making ...

> +        n1vmcb = SVM_MAP_VMCB_ONE(v, nv->nv_n1vmcx, nv->nv_n1vmcx_pa);
> +        n2vmcb = SVM_MAP_VMCB_ONE(v, nv->nv_n2vmcx, nv->nv_n2vmcx_pa);

... these their initializers.

>          n2_tsc_offset = vmcb_get_tsc_offset(n2vmcb) -
>                          vmcb_get_tsc_offset(n1vmcb);
>          vmcb_set_tsc_offset(n1vmcb, offset);
> +
> +        SVM_UNMAP_VMCB(v, n2vmcb);
> +        SVM_UNMAP_VMCB(v, n1vmcb);
>      }
>  
>      vmcb_set_tsc_offset(vmcb, offset + n2_tsc_offset);
> +    SVM_UNMAP_VMCB(v, vmcb);
>  }

It might also help a little to fold both exit paths. n2_tsc_offset is set to
0 already initially, so inverting the first conditional looks to easily allow
that, saving the need to keep both paths in sync cleanup-wise.

In fact both if() can be combined, i.e. there also shouldn't be any need to
re-indent the 2nd one's body.

> @@ -407,6 +425,7 @@ static void cf_check vmcb_dump(unsigned char ch)
>  {
>      struct domain *d;
>      struct vcpu *v;
> +    struct vmcb *vmcb;

Can this please move ...

> @@ -425,7 +444,9 @@ static void cf_check vmcb_dump(unsigned char ch)
>                  continue;
>              }
>              printk("\tVCPU %d\n", v->vcpu_id);
> -            svm_vmcb_dump("key_handler", v->arch.hvm.svm.vmcb);
> +            vmcb = SVM_MAP_VMCB(v);
> +            svm_vmcb_dump("key_handler", vmcb);
> +            SVM_UNMAP_VMCB(v, vmcb);
>  
>              process_pending_softirqs();
>          }

... into the innermost scope it's needed in? Also again pointer-to-const?

Jan

