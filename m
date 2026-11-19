Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590EF606A32C
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k3NWBJ0L
Received: from list by lists.xenproject.org with outflank-mailman.1497466.1695767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9qM-0005gH-OO; Thu, 19 Nov 2026 21:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497466.1695767; Thu, 19 Nov 2026 21:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9qM-0005gA-LT; Thu, 19 Nov 2026 21:38:58 +0000
Received: by outflank-mailman (input) for mailman id 1497466;
 Thu, 19 Nov 2026 21:38:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hfranco@baylibre.com>) id 1xU9qL-0005g0-7F
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:38:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU9qK-009Ur7-KD
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 22:38:56 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6aff6c4a-2eae-0a2a0a5409dd-0a2a4504cb62-20
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 22:38:56 +0100
Received: from [209.85.221.182] (helo=mail-vk1-f182.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6aff6c6f-b57f-0a2a45040019-d155ddb6d4f1-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 22:38:56 +0100
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-5eac6c5f927so81138e0c.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 13:38:55 -0800 (PST)
Received: from localhost ([2804:14c:4c5:8bf0:364f:2eda:8fb7:113e])
 by smtp.gmail.com with UTF8SMTPSA id
 71dfb90a1353d-5ee8b556db7sm681757e0c.4.2026.11.19.13.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 13:38:54 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=baylibre.com header.i="@baylibre.com" header.h="User-Agent:In-Reply-To:Content-Transfer-Encoding:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795124335; x=1795729135; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/OYQOGxfiChFRkcxwnfvwsLdVkvpCJ3D4DU2fgjwow=;
        b=k3NWBJ0LrbvuPs7xU5MNJztnc8uEA0/trn77pYjudUxP5Y5DU0YzwW+/l4RNmznSJ9
         ISvVgZ448Vq+uMhJ76sCjeXvrkelUJIAWzNLSl46d6tsGGpkOQw3TsbwF3TAS1W8Mysm
         Bcj2G9fIGJjE8nNykrFQk0Vzef115iBDZPI9ZvHu62qai0GppSeB3DtRZw4P5/KzI2Vg
         UFk3ARm7GzH7Rt2zM/sVq1i+BBDh0h3LBeeR6M+aRvQEJee8fgry2ScDaXhFzSI7xABb
         2nHvS5hkz1RW0q+mSUbUeaOSOmj7lmYoMMuV/xQKYzh3N8sk4okLY68LEZgjELdpRw8p
         D86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124335; x=1795729135;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k/OYQOGxfiChFRkcxwnfvwsLdVkvpCJ3D4DU2fgjwow=;
        b=GY2USRyQo54gxNu3j2an2zBn1y4H9dKswDwq9rezG91SOKOHxfghXD9KQISYHlNCKc
         mgBDZol0IHgtPhleu7YJWApJaUCRgxgVqv2GBO88iwpj6uTuCM2G/i3E7jT+eEMZagL0
         e0UN3bAOPmc15EjfhtF9OzNwrGFCT3W9tlT+8DcyP2crAHvVXoavUkofJETypsIK5WSj
         cNgZNYds26pErqmKYEfdmRl99GcBmA4pX/TjvEa7jbTNbb5QR1NDLwIMMHP7uj12awzD
         eJw5ESB+qSLnlBXRL96mBFJUAXTW0rQvCdLkjHXXdiN8XkCmVI3Hnhh0C21wrjYxX9/3
         2jSw==
X-Forwarded-Encrypted: i=1; AL+hErHQNKi8+bnkxNFbLVHB504lQ8rTHiQMmC99iiLRJqJFAnx/e9+Q75nLCuw2iSMu1uPAwCSP1qEFKFM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+siu+Dq9ZTrfqnaDOMWe3O8Khp01YzY3cfCpPw0TnLjyhVuSUy
	giZ9tDKKiXyuCR9MGxk85uO56OtNfqZ5bo6Ijs8nzqxeoNq4iRwP78phGF4E9IMEoc0=
X-Gm-Gg: AYBFou1ISHo3alGvI+UzaQVqHZktaoyBi48ySKptppp5PAw6HJQjWLVde+WlWBhCni7
	61r3MoUl+UmgdR6+QU779hH1s+9wlum7M7JXJPFUUj/Gf95wFZ0BMuKbTcU7hV1BfxrjythxMIu
	InClXS52z2BkV7JHiS+jYL8JfsbgnQ3FymxeZtVOd3IZSSV/bWw9+cxyPFS/cf//kFnnjbbDtlT
	zqdQ7MZSbb7KuWO1zlBqSkpuFLR/7aZXOE/7q/2vInL2jflBYm+Kp8KZ9tmdw2te917xSdlI+ww
	J7u43qRFv1oEs7M5k+i+lZOdoqNTE1qvG/pkuFWVt+DNH8DbIQLKUwYtxrcGZQALuWJpAXpCk7n
	TiAfgfnQYdoKj6be37oWNtxUavmFljjhz6RCE8m/bSCJYh4dpRYBpo8m7clJSok3DpfU2KqpNN4
	kMszZGTlslowGEnQ0LjUs0gHUlOSi45EfoasRId+M9HoLfsKecgE6z+bwVQD0HK6H9K+3jOIEHX
	zfCD6WHZfZhjc99BN7NZB2IVf4ua2rCmuTNqrLwdzWcEopMcW4rslrrUuUcfTAOLLAHCadUmxxx
	NI9W5+qLIBqWUX11LkHflhdkUQrI3VJ2UIy56AQXTpjs8CK//cXa+iDj2/d3f3wJkYBVwExhZax
	5n48Ux3ld
X-Received: by 2002:a05:6122:513:b0:5ee:3fae:3995 with SMTP id 71dfb90a1353d-5ee8af737dcmr705850e0c.22.1795124334874;
        Thu, 19 Nov 2026 13:38:54 -0800 (PST)
Date: Thu, 19 Nov 2026 18:38:52 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
	xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Ronaldo Nunez <rnunez@baylibre.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/riscv: vsbi: add SBI TIME extension
Message-ID: <qirjvivvx37bva53kt6cxaywl7etjjhe22lfr66rwk3c7drdhn@jmtvevtkskna>
References: <20261119-riscv-vsbi-time-ext-v1-1-1d5813a883e6@baylibre.com>
 <1795105976.8631fc262581453bbf619ec5b2062170.1a1f4a7711a000183d@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1795105976.8631fc262581453bbf619ec5b2062170.1a1f4a7711a000183d@vates.tech>
User-Agent: NeoMutt/20250510
X-purgate-ID: tlsNG-ebf023/1795124336-C08D9B50-1BF91878/0/0
X-purgate-type: clean
X-purgate-size: 2489
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 05:32:48PM +0100, Baptiste Le Duc wrote:
> The commit's name is kind of weird with this two `:` next to each other.
> Here is suggestion based on previous patches (xen/riscv: implement SBI legacy SET_TIMER support for guests (647542cdf1)...)
>     ```
>     xen/riscv: implement SBI TIME extension for guests
>     ```
> 

Noted, I will fix that.

> > [ ... 8 lines skipped ... ]
> > Implement the TIME extension and handle SET_TIMER() by programming the
> > vCPU virtual timer through vtimer_set_timer(). With the extension
> > registered, SBI_EXT_BASE_PROBE_EXT reports TIME as available and Linux
> > selects the v0.2 path.
> > 
> > Assisted-by: DeepSeek:v4.1-flash
> Uncommon to see DeepSeek model used :)

I was using Claude before, but now I switched and have been testing it
for a couple of weeks :) Let's see how it goes...

> > [ ... 46 lines skipped ... ]
> > +static int vsbi_time_ecall_handler(unsigned long eid, unsigned long fid,
> > +                                   struct cpu_user_regs *regs)
> > +{
> > +    ASSERT(eid == SBI_EXT_TIME);
> > +
> > +    if ( fid != SBI_EXT_TIME_SET_TIMER )
> > +        return SBI_ERR_NOT_SUPPORTED;
> > +
> > +    vtimer_set_timer(&current->arch.vtimer, regs->a0);
> >
> Nit: this assumes VSXLEN == 64, i.e. that stime_value fits in a0. The
> SBI spec (binary-encoding.adoc) says:
> 
>     Parameters that are 2×XLEN bits wide are passed in a pair of
>     argument registers, with the low-order XLEN bits in the
>     lower-numbered register and the high-order XLEN bits in the
>     higher-numbered register.
> 
> and sbi_set_timer() takes a uint64_t stime_value, so an RV32 guest
> passes it in a0 (low) and a1 (high).
> 
> That's fine today, as both Xen and its guests are RV64 only, and the
> legacy SET_TIMER path makes the same assumption. But nothing in the
> tree enforces it for guests, so it might be worth stating it somewhere.

Got it, thanks, I will think about a fix for that.

> 
> Oleksii, any opinion on that point?
> 
> 
> > +
> > +    return SBI_SUCCESS;
> > +}
> > +
> > +VSBI_EXT(time, SBI_EXT_TIME, SBI_EXT_TIME, vsbi_time_ecall_handler);
> With Nits fixed, it lgtm.
> Thanks for your contribution!
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Thanks, as I mentioned on the other email, I will add those to the MR.

> 
> -- 
> Baptiste Le Duc <baptiste.le-duc@vates.tech>

Best regards,
-- 
Hiago

