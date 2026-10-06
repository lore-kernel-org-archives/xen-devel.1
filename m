Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BC2CA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 11:33:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441434.1659037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE3QP-0000ey-Bz; Tue, 06 Oct 2026 11:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441434.1659037; Tue, 06 Oct 2026 11:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE3QP-0000er-9Q; Tue, 06 Oct 2026 11:33:37 +0000
Received: by outflank-mailman (input) for mailman id 1441434;
 Tue, 06 Oct 2026 11:33:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xE3QO-0000dg-D5
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 11:33:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE3QM-00Fbco-Ut
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 13:33:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac4dc8e-8faa-0a2a0a5109dd-0a2a4501ad7e-0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 13:33:34 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac4dc8e-5984-0a2a45010019-d1558033d8ed-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 13:33:34 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a020e65269so5002915e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 04:33:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ad2f9sm9315557f8f.38.2026.10.06.04.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 04:33:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791286414; x=1791891214; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zhRxXI2vG3Bec2VYbHNPL4htDvm2A0FKca1uSEAeYbI=;
        b=MLguG7wfAR3GXt7KjPIQ5fBuWTTE9wSLvFIHlHlQqyFjOoJSOG1vaKRk/QYcBqGBun
         EWU3umavTV81+TuXyuZsoSjxD0oYPe/bjY91ms/I4ivg8E47MtRh2HD4oBtN+zXrPihY
         sDRs9HkwymRFJMlt66wBkuIeyk3FyBK85CPO86XpYFJgbZz70oDzVJiwAU/r1bpTAbQK
         NUWiszjzPGcnxgAdpGXYpmBgLGRIh5JYetfzREMWZz4E9IK4S9MAj6YvkQmygdEeaVvC
         xs7+557xi0EpD4cdVYO9NccJjAheQmjT+GxQd6kloWtLLaTkWq8wv6N5fwzXQzSKb6wi
         IAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286414; x=1791891214;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhRxXI2vG3Bec2VYbHNPL4htDvm2A0FKca1uSEAeYbI=;
        b=wT3T5OBNa3mDq3VT/4VylmrLEBcgNRpMSHqtLdpzgvRoSY2e0EuIumglVMW2ScMDts
         302WrDN6ZDQhLzOYgn0A2l5R1iDiRzEE6UlMLcXPQM4uFPg8mLaimcE5Ps+/XNEDLpsm
         kX2KohjEr4Bd23BsI/bgtMrwjy36lk8SooxEsoPaJ1aAZtdvpVdUOTgwranadb1yShgi
         ZQs2YJpzlK5RE+IUkRcyRuMlRBxXAHLRcjqI9trum9D5RwDrBC9vVsCeZQVSq7Xnzn6w
         ldIaU34KJbxSqT3O8JJRD53huNt3XMGsCcjVRNaLW57ZE2+ZInY9INfEHtCQDXLLf5ob
         79Zw==
X-Forwarded-Encrypted: i=1; AKwUvBztUn5seUnQpWhvt1NWtsT2BDR1clFZdrSgyi6a7I5vXlo2vCI5oR9mAlmQkfTcwRp7ZCcGhuRrrs0=@lists.xenproject.org
X-Gm-Message-State: AFuF++lZoALWxYxS+7j4S7ju1WBZYbUuXXNp259I9iARlAhdHAc5BWpd
	xIo6Ub+mmOKZxkJlr5f+hLcJI3SnFzGR3Qv68bt1/F4s61aOFyNRyfSCme/nEbjC8Q==
X-Gm-Gg: AYBFou38FEJEWDeDqdwQiwqUpCLO7LVkkMIwxxBg+tKS8iVTVPK1ZZVcwe9qoopmZSV
	MTCjEhodqiHQncnXox1fskIhhODaMAfZmtVEe+Hn0sll/14hbSG0S6f+K6LG7681eomuDCEl7LC
	znHbtaVEY8yQ3jTSDRQO+H0NlaiIQtIsiSJemyJwZYlqpQFXmgry99vnI/VUdL1Gs95N59Q4f33
	PfaNus/ZGGVdtvd/o/Ul3cvYZ4McyIrkHYJzssYJNiW6t/Rw6PZlcbj4AOA1Y0R5UQnlm4v/+U4
	JKHBFMowt4875OxSchWQjPgVpnpeI/dnIyt7XmRlvUEyLxJpkyijtN3QJ7snKRmw0lcuxG3ByLk
	ywDGJJBrU4DYYYU0a+GjMMif9IFuxdEoqiV6WgEd7TNTfmh7KjMwzjiyJfs7w6IWml2g+e6qKDz
	VD2557n0RFYzS0oNqBeCEteqpbXTcixMBwJkHcbhTxlLzsTUJgwgFjjEtXrZJOdX/mQtqyqYxVn
	/qbfEJr5wnb2MJZ/3v5LkaPDqOh16ukggoaTsJgDbcTt8zMHPRSKGboBQ0hQQ0=
X-Received: by 2002:a05:600c:1d0a:b0:4a0:1e53:e51f with SMTP id 5b1f17b1804b1-4a17b52f03fmr16676595e9.14.1791286414213;
        Tue, 06 Oct 2026 04:33:34 -0700 (PDT)
Message-ID: <015d6541-b8cb-4994-ba67-0683a8b99bd5@suse.com>
Date: Tue, 6 Oct 2026 13:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: drop the old GDT frames only after their
 translations are flushed
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261006103702.55276-1-gwd@xenproject.org>
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
In-Reply-To: <20261006103702.55276-1-gwd@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1791286414-C475B757-4AB327B5/10/78276251493
X-purgate-type: spam
X-purgate-size: 2187

On 06.10.2026 12:37, George Dunlap wrote:
> pv_set_gdt() tears down the old GDT before installing the new one, and
> the teardown, pv_destroy_gdt(), puts each old frame's reference before
> it rewrites the slot's entry; the flush of the slot's translation is
> left to the hypercall wrappers, after pv_set_gdt() returns.  If a put
> drops the last reference, the frame can be freed and reused while this
> pCPU's TLB still translates the slot to it.
> 
> This is safe today only by inspection.  The only consumers of a vCPU's
> GDT slots are descriptor fetches by that vCPU and Xen's trap-handling
> paths on its behalf, none of which run between the put and the flush;
> and every other caller of pv_destroy_gdt() acts on a vCPU that no pCPU
> has loaded, which holds no translations at all.  pv_destroy_ldt() is
> in the same position: it unmaps and puts, and returns whether its
> callers need to flush, so there too the put precedes the flush, and
> the arrangement holds only because nothing fetches through the slots
> in between.
> 
> Restructure pv_set_gdt() so that the flush sits between the two: take
> the references on the new frames, install them (and the zero page over
> the unused slots) over the old mappings, flush if the vCPU is the
> current one, and only then put the old frames.  The flush moves out of
> do_set_gdt() and compat_set_gdt() to sit next to what it protects.
> pv_destroy_gdt() is then only reached for vCPUs that are not loaded
> anywhere, so it asserts that directly (!vcpu_cpu_dirty()), which also
> covers the lazy switched-out state that a plain v != current test
> would let through.  Like pv_destroy_ldt(), it does no flush of its own
> and is safe because the mappings it tears down are not live; it
> unmaps before it puts all the same, so that a flush has its natural
> place should one ever become necessary there.
> 
> No change to what guests observe: a slot always holds the old frame,
> the new frame, or the zero page; there is never an unmapped slot.
> 
> Assisted-by: Claude Code:claude-fable-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


