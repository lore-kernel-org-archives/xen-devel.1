Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3184A606A330
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 14:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JX0I3jqQ
Received: from list by lists.xenproject.org with outflank-mailman.1481860.1685758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmTE-0006wm-6a; Tue, 10 Nov 2026 14:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481860.1685758; Tue, 10 Nov 2026 14:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmTE-0006wf-3m; Tue, 10 Nov 2026 14:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1481860;
 Tue, 10 Nov 2026 14:05:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQmTC-0006vZ-Vx
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:05:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQmTC-000eJM-5Q
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:05:06 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af32481-bab6-0a2a0a5309dd-0a2a450ac4e8-36
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:05:06 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af32491-f2d2-0a2a450a0019-d1558029d5ae-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:05:06 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so11912915e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 06:05:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0237204csm49096465e9.4.2026.11.10.06.05.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 06:05:05 -0800 (PST)
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
        d=suse.com; s=google; t=1794319505; x=1794924305; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvzMhA0BMWYo0aDhByE1fezhm7CQRx8mwSsIu3tNhUU=;
        b=JX0I3jqQNjM/rbmywx8j96GeDhnalv6EPCIkyJVTofyZW6HHfmTpLDP/X00iyE086m
         pVWQwreZQELOoIRo3phbrLbyyFCE+8guDpkqnwC7LIWzA5ErHpQ7JhgylBJ2xKNkIvVw
         Bta6wMFFzawQdyb9Hpfxit60ad9rhQsr4ftyuE72vlgxIfjhU5MXw5wRIO3E/DTWTp3G
         qZW80WJ7ap+v5PqCC4XaJZupPWdNSxsP86fV/v/TOIhg+FuPehgjOb/qt15i+I7MIeCB
         cmjxtFSQPQ7R9P26XaLWUzU9Ef9Q/uiKUAK4fikiA7HfSL0sNwMZWiFfm4hRCa6PMS1A
         EYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319505; x=1794924305;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvzMhA0BMWYo0aDhByE1fezhm7CQRx8mwSsIu3tNhUU=;
        b=iA/hXHcIHd97BVIGxAY0pwaSd0NDf9Cd9VHw01TT/MhuErfKWDeuRLj9gSYi6HLTXE
         eWNs6RWrZ6LXbn2dZ+AcJCoK78GYWrZK7wrImig+7gghs15B8tObJBDIlj9kN2N5pyfP
         +0abiipzdXNuOpa6OlaBF2hU0MLMW9utKfXQsRcqJLiqNnsGYcnx/D7h1lhncDaWaxls
         6dBsEnfFyLpKeDe/+Cu9Z4g1gzSNwpsfu51mUYo/2Za1ekf4Fi0ViftDdcLtgzARwO2g
         gI6suXIjGt6M1++A1IM8FdfCboxwdxnLsZ3zbAuI9XzDPe0HAU5LB8Me+/t6cUoTaMz5
         mwBQ==
X-Forwarded-Encrypted: i=1; AL+hErFBIh0Hl0BBErUYa//UGZUEks3nn8pNMcufUcx3gN6Qc0iztd1YM0j0dBTVaEAQWUFxNUmxsML5Smo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8vFy46QsuwsRE3erMZ6rf7NsMkbZxWlVuoH/JoQIwIK3kmwq4c
	gTwLAAMzt5uQ33nFXsqCEf4fJfoYFmC/RjfzyZ/8NA0x+/ZWER+iuqWCJn0jPYi7mA==
X-Gm-Gg: AYBFou2/J1Q6e2ffMvYw55wAazn4uQaRSP3+aAVDo0/OSSMe8Sfmr9JPAA9PPU1NJDv
	3jecVK9GzQljrO244BbiAxJLHnKEaMJePNQGIxkUnI1VhRuWyZAeljj8et0tRqnWGG6xspSkOJy
	Py86znca4/XvdMUPp1RPeBroCTwdRiAJbXw0Y37ybmVg9EIVQzYukCAtQf0TidSRg0d4Zj0IYej
	aCuPRBhprW018m8uZoZJHgyO6q68edWQTW219jP0uej83tPDNKUOd031Sy6DGUbIhdSBN73B4Ak
	mWbrkMAF43YcqBsWs32BsukWtArH0olq/t0lVEGa6UH+X5AcxOdusgLGOazWML6kYotOrSncIyb
	+/Q1NKSCyVHmwLv4LAHFL3id6gg4HieirwvV+QceaYg0PmlIH4D0WeFkx5A5YoJxoDn2jiTj3E+
	fiPlwD3lsGQoS3lS0zIM+KA2D2LISKFrwUl7avdNiuIHttjWrY1LL+W7s81wDWkEIqr2BJsLFp9
	OjeWroKJaZIk0gY9hbnAT5JM8p7EuRM5n2GpSS08C/N4sxAzXfaJByVWTjdSp6AZsQA67R3i/zY
	fQVpToHQCQ0SyGLvWoXCt1b7bDoll2kFsxVO2OZ2FIZscaU0eFOXI30MrkNFZJOE32dHsWdE6EN
	hL/n0Xx/nrxM66T+0MA==
X-Received: by 2002:a05:600c:37c3:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4ba02305538mr43866145e9.4.1794319505466;
        Tue, 10 Nov 2026 06:05:05 -0800 (PST)
Message-ID: <f68f4464-1434-4314-bf3c-7eb367f0a1b9@suse.com>
Date: Tue, 10 Nov 2026 15:05:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: free the shared_info page switch_compat()
 replaces
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261110110500.27221-1-gwd@xenproject.org>
 <ec93ec9a-2fd3-4dcc-94f8-35376cb03363@suse.com>
 <CAFLBxZbndoe49Zcurk6ZM04niye=jRsEcD_=mnSoKQUuXPRZew@mail.gmail.com>
 <8d2ecf68-6c34-4a59-9fbf-0e3f67a338d7@suse.com>
 <CAFLBxZZA0ZYrjHC5TCNt53HLuq-fDxkNyXdM1iOua8u2EaJnKg@mail.gmail.com>
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
In-Reply-To: <CAFLBxZZA0ZYrjHC5TCNt53HLuq-fDxkNyXdM1iOua8u2EaJnKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794319506-526DECFC-FB16316A/10/78276251493
X-purgate-type: spam
X-purgate-size: 2942
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 14:52, George Dunlap wrote:
> On Tue, Nov 10, 2026 at 1:21 PM Jan Beulich <jbeulich@suse.com> wrote:
>> What I asked for here is that we free the page if its refcount is zero
>> (the common case), exactly as you do (via RCU). Yet we would skip the
>> freeing (and leak the page) in the unexpected case of the refcount not
>> being zero after the put_page_alloc_ref().
> 
> OK, I think I see.  Yes, I'd considered that.  I mean, to be honest,
> the whole xenheap allocation thing is janky; somehow we've taken a
> useful, well-understood primitive that should work simply and
> consistently (dropping the last ref causes a free) and added extra
> bits so that it's fragile once again.  (If shared_info were a domheap
> page, do_settime() would just grab a ref, map & access the page, then
> drop the ref, knowing the page wouldn't be freed while it held the
> ref, and *would* once it was dropped.)
> 
> Given that dropping a ref doesn't automatically / atomically free the
> page, it seems like the rule should be that you *never* grab a ref to
> a xenheap page, unless you've gone through the rest of the code and
> verified that the freeing path works correctly.
> 
> And given *that*, since nobody else is currently grabbing the ref, not
> checking the refcount should be safe.
> 
> I suppose you'll say, sure, but this is a non-hot path, and if we ever
> *do* free with an outstanding refcount it's a security issue, so why
> not be safe?  You have to draw the line on internal consistency checks
> *somewhere*; I'd leave the check off, but I can add it if you really
> want.

But is this only an _internal_ consistency check? Can't a toolstack or
DM map a domain's shared-info page (as soon as it exists)? IOW I didn't
think of the check as a consistency one at all, but rather as a guard
towards e.g. toolstack behavior changing.

>>> Now that we have the RCU version implemented and tested, I think we
>>> should keep it.  It's safe now, and we can keep it safe in the future.
>>> If you want we could add a comment to the field warning that no
>>> references should be taken to it because it may change; but honestly
>>> that seems like overkill to me.
>>
>> For the field I'm not concerned - it's purpose is clear, and anyone
>> trying to add obtaining of a ref using it as input will hopefully be
>> caught the latest during review. It's a ref existing ahead of the
>> put_page_alloc_ref() which worries me (some).
> 
> For clarity, I meant a comment on d->shared_info, saying not to retain
> pointers into it outside of a domain rcu_lock; and I guess now also
> adding not to grab an additional reference to it without coordinating
> free-on-last-reference properly.  But as I said, both should be a
> general rule, not something we need to add to each data structure
> affected.

Okay, looks like we agree here then that no new commentary needs adding.

Jan

