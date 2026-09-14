Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A50C88E50
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 09:59:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420671.1646923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x63Sl-0003s9-JK; Mon, 14 Sep 2026 09:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420671.1646923; Mon, 14 Sep 2026 09:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x63Sl-0003s2-G4; Mon, 14 Sep 2026 09:58:59 +0000
Received: by outflank-mailman (input) for mailman id 1420671;
 Mon, 14 Sep 2026 09:58:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x63Sj-0003rw-V9
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 09:58:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x63Sj-000n8l-Bk
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:58:57 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7c550-8faa-0a2a0a5109dd-0a2a4501e800-18
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:58:57 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7c561-5984-0a2a45010019-4a7de14cde35-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:58:57 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-484366874b0so983819f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 02:58:57 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb2ed0fbsm26143727f8f.3.2026.09.14.02.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 02:58:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789379937; x=1789984737; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nj2WKhRtq0LWRb/70aoHdYoAG7yMtsmTUZJuj68xb8=;
        b=D3vF8HNVzDFp+ukp4xwAzTFnLnEB0C2e+TqA34xL5bCSEu6XEWLL3On3fw9PpflL8K
         E1ex8Tmf+TfzVBSs0vWM2pXEZ3pmvgo0x1fL9dWbbOWuhWlgPZSV2eBIdHMhh7it0aSH
         EjExhJf2LexAAXUM7yGcW6rPH6JYEufbXREPRyQS560nX6Tbpq7b+dDhkoua2sADmyfZ
         6FIjytWbH4PPXDGfljNnmwTMyjL9CtbsofGrfzxpgrnanaI1lo56/3dOCiFRF2rKF+vc
         /y1C22AKQjo29hZHYLnb9pd6ITvsuLdtFeLeoK6wAq9i700+sEnooKSuz0XxvPFKxR+Z
         KWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379937; x=1789984737;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nj2WKhRtq0LWRb/70aoHdYoAG7yMtsmTUZJuj68xb8=;
        b=bKf5GObtLxutgdYwuU6aeC680hdAUKe/AtxsR7OHi3BOOhD9kZTVxLsGZIyek6y4I9
         iVJQ0FNeGAhn+nBjMrqbDYPzeG1H8s+Qe5w+mahomozBbEPOiJZuEmTY4e6loBgihspd
         19qH+r3g5Jf27z2F+9sILqM2JDHJukNrylvZM1kS55LJfFwTBcpYuo2t93aidXbMzuEr
         kjuyxeonoHpMnw3JkFwMZw6nuvl/gb/3HL4nCB3WQezCzS85ktQQxD/bsUOkQLPoq+4u
         TAQTqn8xp+JcFtR49xiprlLMfGtGik3DNsA9oDuPfZFY2r29mz/Fk85gBAlr6dR7YAz7
         /mpA==
X-Forwarded-Encrypted: i=1; AKwUvBx6fAjrVa+ilYYpTt3b/VaJSw9E5VzHbZ4ZuXLQurCTOXk2CF61pr0mjqEZeqrnR4dV4jPd0I5eNeE=@lists.xenproject.org
X-Gm-Message-State: AFuF++k1fn1CWP99JJIXPZkfJmC0IcYFesy8oC0V750Ve0N3nkqlZvfP
	NHN2dRMnKe8pu03JKXC8h1pW/OQ6p74377YP6bny5cuD3Q/vQE5RhJCJxzqm3TJNhSdF3dpYGOG
	be64=
X-Gm-Gg: AYBFou0FozU0mwTjIQVEnQ8dZmwO7KY23B1wPFQnhFLf1i5C1nz2uGQFKJm1KZ5/ZhU
	oOnMWuGPC9PFp0N/4HtipSgYXiN9Z/8S7U3p7b6BlmEPAjQZq0G5uqI1IRbptwZRmfthYeqO4OT
	FKCodxWlwIiy2L91OnzSBcfiU82LCDWkkIeTd9XMBPKxM0NebfrZZAsPI6A8rIsRZPB/0CaEGNf
	5qZK75HU+zBVRbtttNbNvsQFwI72Ggr0OaRQs/3aTLzuEPJnPUoFoifiwOej1vqPL4L2AceU9cD
	RZRlK3w1CwhQm7bFlr7EcsZzwOIqcFONGMslMGLDe3pqzEnOR5V4bwh/AUUkdbDx+lJj/xuTUuT
	vpawMzXRhqVjEgY4v1kA1bO1tGrDv894ONPNXcKID1TAYg2yUAK/M+LiflIsFbBm308bbrbft4G
	sKoDJYWm74aEMIjjxKrJHNq8H5PHh7ba9o77zQFCQFAk6YeT16zuQu4EuC4aUus4zsqJTSjCH1e
	jfmy1DOTZET
X-Received: by 2002:a05:6000:4010:b0:487:39a:6444 with SMTP id ffacd0b85a97d-487039a64eamr1434627f8f.2.1789379936705;
        Mon, 14 Sep 2026 02:58:56 -0700 (PDT)
Message-ID: <547d74b4-37c9-40d2-a37e-5cf31637a2c2@suse.com>
Date: Mon, 14 Sep 2026 11:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] x86/viridian: Implement synthetic timer direct
 mode
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260911091244.1165516-1-ross.lagerwall@citrix.com>
 <20260911091244.1165516-3-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20260911091244.1165516-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1789379937-BCB45757-F43FAA0D/0/0
X-purgate-type: clean
X-purgate-size: 717

On 11.09.2026 11:12, Ross Lagerwall wrote:
> In direct mode, the timer asserts an interrupt on expiration rather than
> using a SynIC message. It is useful to implement this since Windows 11's
> Hyper-V can only use synthetic timers in direct mode.
> 
> To avoid changing behaviour in existing guests, add a new Viridian flag,
> stimer_direct, to control whether this feature is visible and usable.
> 
> At the same time, check that the reserved bits are zero and the APIC
> vector is only set when using direct mode since this is enforced by
> Hyper-V (although not mentioned in the spec).
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


