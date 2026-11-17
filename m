Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8EF606A32C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dzQSh7Q/
Received: from list by lists.xenproject.org with outflank-mailman.1492595.1693024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTJpD-0003Ua-7Y; Tue, 17 Nov 2026 14:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492595.1693024; Tue, 17 Nov 2026 14:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTJpD-0003UT-4K; Tue, 17 Nov 2026 14:06:19 +0000
Received: by outflank-mailman (input) for mailman id 1492595;
 Tue, 17 Nov 2026 14:06:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTJpB-0003UN-T8
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 14:06:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTJpB-00CREs-1o
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 15:06:17 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc5f58-8faa-0a2a0a5109dd-0a2a45018c82-4
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 15:06:16 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc5f58-5984-0a2a45010019-d155dd2fecdb-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 15:06:16 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-498f5fa4f70so4868357f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 06:06:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c60d9fff8sm29750447f8f.52.2026.11.17.06.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 06:06:15 -0800 (PST)
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
        d=suse.com; s=google; t=1794924376; x=1795529176; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ji5QojFG8GLXxyKf2kAGtCuZXTc0FvqAcL60FN0UnbY=;
        b=dzQSh7Q/1wFHCQMub05VII6Q+hwn47AR9xMvCVyvdqtUTRu5LKYKEq2xQi/VWeDnWL
         lcs0qn2i/PZDJps/bEGy/6Sihkjr8TSFKxybLP8lHX+ACEqNU6nwXrlatSsH+2ZDQgG+
         HJI5LqupVKIahjhj2W8DeDmK2p+eV39DDg2TRl/a00fePhIVi+KCzqmxaRhKVf66k6Jn
         UaSLaEALG6CSHTrIyq/RrVExq+sLNN/LlY/IfQqwCBUMeU1aRMnneZzcjHCCgjQKD/mN
         RNXj9Zx7Ets2qybdmT/cHnYCrHPIlR7JxObcm6yNixrSrDmwFYhgp3oSZKHZQAwsEEOm
         vOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924376; x=1795529176;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ji5QojFG8GLXxyKf2kAGtCuZXTc0FvqAcL60FN0UnbY=;
        b=GLFD3/OLRVxLgQUX9dxbCKcKl8xH05DxfxKkN9CdUpUNApNZcIVPM7DSQqAB5xtrNy
         3Hjlq4IFVtS0QIg8wSjxeZdrjSSrNEAfCC9aOUhnsTW77jO6wYNgpPq8x3k0HuCaUKRB
         3mTOqBmoFLSGOdOAL0Lrc9dHPgizd57OL6X3i/raI0two+0NXCYa/zK1kcg+bVmqEjtV
         2j8zell/+ZYSg7zWCtAtxHPOQmOHkZ+HqfnA6Wh1phZr5Vby5j/KTth5N73gPGEP8bbm
         TSOE7FKxofhU1dtg/27iuhVCnmvD3ueYRNSkbxIux7AYG4K0nMiVMWRulL4xEPpOipO8
         dx/g==
X-Gm-Message-State: APuU4Z8nEESGEeUANYKGpP+zoucfF4LtWq9eit3+9JsJbjYZveRGGO7j
	YbbiB+cRVl2JwoI3zTOt/hEMrNks0XP8FyHJLV+P1qrry6okMNTHmd7nz5APQcS3uA==
X-Gm-Gg: AZFdTZecclhf071k3TpOiip3CBIbyMarpzzIYXvJd3Kw2zJPMpFuEZ0lKfzqZ7s75n0
	9TypHJ9JWQe9dgt4Ea2HgpuzSotBw0bt5H5NYUFfaR6UNpVhe6LL2iwj5Jq0FvTGyolvKVNbmgV
	T0fWcZqWLijo+wPVDN5chJtl17/LD4LsFN+WksGCWvrTlReMfE2Zw9XOi+wMhIVx7wFLGvbKSBi
	lHNZIZo0cT19wkO4giiIL9joT40NmQWO0QpTWWX8QVH1/q8UD848mr/SBJujJQXUXsg2H5ZNYQT
	rXksVfc7o+UM6LwMM+VgwKCMdCGVUjuv2TUJCRTdUmZKOWVJYhWcDLdW3mpmQOH92QAGB2rP/kB
	OAd4ZmqEKTFoaUhm1mSy4uZu5aZp+fxRk4RYXJ7ppZekScY2MyD7AtvlzEtWn1M1NEz1IIGifp9
	lDBkjr3SbFAUeftllccRZL31J+7fc1Q/xf/DfrCfrzRCX0qKQjLN0Z7YNd+QqSpFgcFMHOJgsvJ
	K46mQrgqvPn27z5fhKJNmUhi/XUxoS32yBAnXjt1aM5p56PHtod0ncDpkG07I9bI8NoNDqp0qbn
	+QR1Ju04PctgeodpPg/MoEZLksJgkd8iK0b/BZrwfgq8kIKRVtIWasLrMgMxLM7Jg/mbUAeLD9g
	dsnine4OmLBrNMirPZQ==
X-Received: by 2002:a05:6000:144d:b0:48e:3ebc:d242 with SMTP id ffacd0b85a97d-49c729bb2b4mr33291259f8f.37.1794924375998;
        Tue, 17 Nov 2026 06:06:15 -0800 (PST)
Message-ID: <0a15b164-08c4-4275-a765-6b56e8c842fa@suse.com>
Date: Tue, 17 Nov 2026 15:06:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] memory: check incoming GFNs
To: George Dunlap <gwd@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <b3b1f23e-a430-4772-af29-13e59cfeb640@suse.com>
 <CAFLBxZb_V0LM69OKPKabXnepH2nVYLN3tAMqpj9PbGsmoi5nPA@mail.gmail.com>
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
In-Reply-To: <CAFLBxZb_V0LM69OKPKabXnepH2nVYLN3tAMqpj9PbGsmoi5nPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794924376-BF262757-83159A5C/10/78276251493
X-purgate-type: spam
X-purgate-size: 11141
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 13:20, George Dunlap wrote:
> On Mon, Jul 20, 2026 at 9:55 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> P2M handling (for translated domains) is at best undefined when passing in
>> GFNs which aren't aligned according to the requested order.
>>
>> For non-translated domains the same isn't necessarily true, and domains
>> may possibly be able to leverage present behavior; in fact
>> XENMEM_memory_exchange is known to be used in such ways. Instead the
>> supplied GPFN has to at least pass VALID_M2P().
>>
>> In memory_exchange() go farther than merely adding checks: Restrict the
>> scopes of the two variables such that it becomes more clear across which
>> range of code the validity checks actually apply. Also don't limit
>> checking there to non-translated domains (as of now steal_page() would
>> prevent things from working on translated ones), to avoid giving bad
>> examples or leaving latent traps.
>>
>> Furthermore, covering translated domains in memory_exchange() is forward-
>> looking: Right now steal_page() prevents (successful) use of that sub-op
>> by such domains, but there are intentions to relax that.
>>
>> Fixes: e4dfe0cdba5e ("Replace dom_mem_op hypercall with memory_op hypercall with")
>> Fixes: 6f8668f57256 ("New memory hypercall 'populate_physmap'")
>> Fixes: 516250dac6a8 ("New memory_op XENMEM_exchange")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> OK, so to begin with, this commit message hardly tells me anything I
> need to know.  "At best undefined", ok, but is that a problem?

Maybe I've done / looked at too many UB patches over the last so many
years: To me it is out of question that UB is bad.

>  "For
> non-translated domains the same isn't true" -- sorry, does that mean
> behavior is worse than "at best undefined", or better?

It's different. I'm not sure I'd call it "better" or "worse". Hence the
mere fact being stated.

> "...and domains
> may possibly be able to leverage present behavior" --   Is this
> attackers leveraging the present behavior to do evil, or clever OS
> writers leveraging the present behavior for good?

Or careless OS writers adjusting their code only until it works, not
until it matches the (largely unwritten) spec.

>  "[I]n fact,
> XENMEM_memory_exchange is known to be used in such ways" -- who's
> using it in what ways?  Are we talking about attacks in the wild, and
> if so, why is this not an XSA?

Does it really matter here who exactly is using the interfaces this
way? Or whether all such uses are gone (of which I'm not sure)? Okay,
I've added "(e.g. by Linux, at least up to a certain point)".

>  If not, who's using it how, and is that a good thing or not?

Can doing things not the way they're specified by a good thing?
And is "how" relevant here at all?

> I asked Claude to write an introduction to the commit for me, and it
> wrote the following, which I found actually helped me understand what
> you were trying to do here:
> 
> ---
> 
> memory: check incoming GFNs
> 
> XENMEM_populate_physmap, XENMEM_decrease_reservation and XENMEM_exchange
> each take a list of frame numbers, every one the first frame of an
> extent of 2^extent_order pages.  The public header describes each
> extent as aligned to its size ("size/alignment of each (2^extent_order
> pages)"), but Xen has never checked that.
> 
> For a translated domain the numbers are GFNs.  An unaligned extent
> works today because the paths that handle it split it up: the P2M code
> of x86, Arm and RISC-V sizes each piece by alignment, and the PoD paths
> have split such requests into aligned chunks since 182c737b9ba5
> ("x86/PoD: deal with misaligned GFNs").  The extent is then mapped in
> pieces smaller than its size.
> 
> For a PV domain the numbers mean different things.  The extents given
> to XENMEM_decrease_reservation, and XENMEM_exchange's input extents, are
> machine frames.  The extents given to XENMEM_populate_physmap, and
> XENMEM_exchange's output extents, are pseudo-physical frames, which Xen
> uses only as the values it writes into the M2P, a page at a time, so
> their alignment makes no difference to it.  Guests rely on this: before
> Linux 5.15, swiotlb-xen allocated its boot-time bounce buffer with page
> alignment only, and then had XENMEM_exchange replace it with
> machine-contiguous memory one 256k segment (order 6) at a time, so each
> output extent was aligned only to a page.  Nor are pseudo-physical frame
> numbers checked in any other way: one with the top bit set, which in an
> M2P entry means "no pseudo-physical frame" (INVALID_M2P_ENTRY,
> SHARED_M2P_ENTRY), is written into the M2P as it comes.
> 
> Accepting input that the interface rules out leaves every P2M path to
> cope with it, in today's code and in any added later; PoD did not cope
> until the change above, which was part of XSA-388.  And nothing stops a
> PV guest from naming a pseudo-physical frame that cannot exist.
> 
> Check the numbers where they come in.  Every extent must be aligned to
> its order, except a PV domain's output extents in XENMEM_exchange, which
> must keep accepting what older Linux passes.  A PV domain's
> pseudo-physical frame numbers must also pass VALID_M2P(), in
> XENMEM_populate_physmap and in XENMEM_exchange's output.  (A PV domain
> gets its machine frames from Xen, which allocates an extent of a given
> order aligned to that order.)  An extent that fails a check ends the
> request as other invalid extents do: XENMEM_populate_physmap and
> XENMEM_decrease_reservation return the number of extents completed, and
> XENMEM_exchange fails with -EDOM.
> 
> XENMEM_exchange's checks apply to translated domains too, although for
> now steal_page() keeps them from using that sub-op, as there are plans
> to relax that.  In memory_exchange(), declare gmfn and gpfn inside the
> loops that read them, which shows the code each check covers.
> 
> The one in-tree caller affected is the PV domain builder with vNUMA.  It
> asks for 2M extents from each node's start, so a node that doesn't start
> on a 2M boundary is now populated with 4k extents.  The guest still
> builds.
> 
> ---
> 
> OK, so the interface says there are restrictions, but we've never
> checked them; and we've already had one XSA as a result.  But older
> versions of Linux specifically relies on some of the behavior; so add
> restrictions where we can, making and documenting exceptions for
> backwards compatibility for cases where it's already relied on.
> 
> You don't have to take Claude's message, but the message does need to
> be made more clear; or at least accurate -- the code now requires
> alignment for populate_physmap and decrease_reservation for all guest
> types, but the commit message implies that only VALID_M2P is required
> for PV guests.

I don't think it does, after re-reading several times. I do agree one
can read it like that, but one doesn't have to. I've extended this
quite a bit.

Claude's description, while - as you say - helpful for you, isn't how
I'd like to see patch descriptions written. Many of your recent
descriptions resemble that style, and I'm only not opposing to that
because it's not wrong to do it like this. Still I, as a maintainer,
am not happy with such overly verbose descriptions. They remove focus
from the actual change / problem.

> Did you realize / intend the effect on vNUMA builds?  This should be
> in the commit message as well.

No, I wasn't aware we have in-tree broken code as well. I've taken that
one paragraph from Claude's description.

>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -9,6 +9,9 @@ The format is based on [Keep a Changelog
>>  ### Changed
>>   - XEN_DOMCTL_DEV_DT's, FLASK_[GS]ETBOOL's, and FLASK_DEVICETREE_LABEL's input
>>     string sizes need to include the nul terminator.
>> + - XEMMEM_populate_physmap, XENMEM_decrease_reservation, and
>> +   XENMEM_memory_exchange now check input frame numbers more strictly (for
>> +   alignment according to the indicated order).
> 
> s/XENMEM_memory_exchange/XENMEM_exchange/;, and XENMEM_exchange isn't
> checked for alignment.

Fixed / amended.

>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -40,6 +40,10 @@
>>  #include <asm/guest.h>
>>  #endif
>>
>> +#ifndef VALID_M2P
>> +# define VALID_M2P(gpfn) ((gpfn) != INVALID_M2P_ENTRY)
>> +#endif
> 
> So other architectures don't have an M2P at all, correct?  And they're
> all translated, so this never actually gets evaluated on those
> architectures.  (On arm32, this would be wrong anyway, as
> INVALID_M2P_ENTRY is ~0UL, 32-bit; but xen_pfn_t is 64-bit.  But
> again, it's never used so it doesn't actually matter.)
> 
> Would it be more honest to have something like the following?
> 
> #ifdef VALID_M2P
> # define M2P_CHECK(d, gpfn) (paging_mode_translate(d) || VALID_M2P(gpfn))
> #else
> # define M2P_CHECK(d, gpfn) true
> #endif

My first reaction was: Yes, why not. But then I realized this would help
only one of the two use sites. I've added /* Only evaluated for non-
translated domains. */ to the existing #ifdef.

> Or alternately, to have a dummy `#define VALID_M2P(gpfn) true` in a
> common header?

No, definitely not. It's bad enough that VALID_M2P() has escaped into
common code.

>> @@ -903,6 +923,18 @@ static long memory_exchange(XEN_GUEST_HA
>>                  continue;
>>              }
>>
>> +            /*
>> +             * PV domains are known to pass arbitrary PFNs into this hypercall.
>> +             * Therefore we cannot apply the alignment check there.
>> +             */
> 
> Worth being explicit here, so that in 20 years' time, someone can
> consider whether we can drop the exception?

Explicit about what? That some use in Linux has gone away at some point,
but it's unclear where else uses may still exist? I'd rather not.

>> +            if ( paging_mode_translate(d)
>> +                 ? !IS_ALIGNED(gpfn, 1UL << exch.out.extent_order)
>> +                 : !VALID_M2P(gpfn) )
>> +            {
>> +                rc = -EDOM;
>> +                continue;
>> +            }
> 
> Nit: Technically only the first gpfn is checked for validity; since
> the extent isn't guaranteed to be aligned, the base gpfn could be
> arranged such that the first one didn't have the high bit set, but
> later ones did.  Since this is mostly a sanity check, that's probably
> fine.

When first considering to take your M2P_CHECK(), I was intending to
extend that to

#ifdef VALID_M2P
# define M2P_CHECK(d, gpfn, order) (paging_mode_translate(d) || \
                                    (VALID_M2P(gpfn) && \
                                     VALID_M2P((gpfn) + (1UL << order) - 1)))
#else
# define M2P_CHECK(d, gpfn, order) true
#endif

but open-coding the double VALID_M2P() in both places isn't something
I'd like to do. I may try to come up with something along these lines,
but without embedding the paging_mode_translate() check.

Jan

