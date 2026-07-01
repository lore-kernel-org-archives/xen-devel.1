Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6D8C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 15:31:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350174.1607725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewtr-0005uy-45; Wed, 01 Jul 2026 15:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350174.1607725; Wed, 01 Jul 2026 15:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewtr-0005ur-1H; Wed, 01 Jul 2026 15:30:55 +0000
Received: by outflank-mailman (input) for mailman id 1350174;
 Wed, 01 Jul 2026 15:30:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wewtp-0005uj-Rn
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:30:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wewto-003GHH-TZ
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 17:30:52 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4532ac-e002-0a2a0a5209dd-0a2a4501c9a6-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 17:30:52 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4532a1-400f-0a2a45010019-d155dd29dc8c-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 17:30:41 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-474560436c3so758602f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 08:30:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477de3dd0b1sm571782f8f.35.2026.07.01.08.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 08:30:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782919841; x=1783524641; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PzuFWwDhr1bgrcQW7srPgbk5rjVNeVot/73Z7hmNgIk=;
        b=EWVz2g0yTOm8/wlDb485/3HpqO2VOmWmzK5rwdCQ5xKPSqe9UT4qZOcgp6FhLIHB3s
         1IgPlBNaRi9x1UhZ8gn2YurydmgOOpBf5B2Ho+/WGMmti3eYrGFIZyO3rwbnLXaiqElp
         9/URhg2vSyj7wO1v8Yp3ZyqRp9XxMwNSOodAq5DE8/WtIDmdtEWF45OmfEPptcW0AeKO
         fONNSuEzp6hXrUdSz0okIpRF0nceWVEpWv1WUezP3pIGBQoMmm4x3AtwAao4ss2sOEu6
         srK6l5QT/BwwmCazV9dokerTe5kZLEQ9UR2dGNEQ6iUqMnPStkG16mC63eTTgfgeue6u
         mnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782919841; x=1783524641;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzuFWwDhr1bgrcQW7srPgbk5rjVNeVot/73Z7hmNgIk=;
        b=bEoe930Y5Dzfnz3YsnJr8+anc87bTUpWXzp2QTN27/USuxMV5IbOR4frtTEcaFpqGh
         IXvr/bCt93m6PgZKcgfUjVyaf5CWxMXuYtvwZWcLmsAM2w/RHtJHDRhBItHJ/vtn6EIs
         lV+J9zssx+BBSkFLpLUlKapRykKDL5JATZBiDwN0Ikg1/+g4m6gG45bLZxagsorBCasL
         nPh/KtmclDyrOH2dgUkDimJ2+1rG1Z09HAuDXFl7mlhpMgdFN9npJd9epAvTV/Q10FOo
         NOoippAthyQX14vASO3M5GepoRFjEpKEAiMjx47Ou5ik8ainYH1sFkRqoPJ0xTY8GdDn
         Yt/w==
X-Forwarded-Encrypted: i=1; AHgh+Rr7yBKrIGTHK0JiqB0KoafMgAmzGL69fttQ5HW2arQrZcMDDrbYL+gLFnXVVxk9flUgmaIC0uV7ZBE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVku1FSpqgGVjn46nkNgpCO1YJ7P8QNHJpBTy+xyXjYNW8G3aq
	r5WueGQFvut+lelB1H7KcYhCDGe1j9yl3L3fRWgFm/ifV4gmU9qGVS8P
X-Gm-Gg: AfdE7cmQPb6h6A3ZDAYBV5r9SCrNCF3aVYYRzWgpdW57uAkVBR3fsATTdceobJQXsvn
	BP6ka6Rn2EkNXj3XWZFWRCEsw1DGVoRQgRH0lM4e4X3HLItev49I7W4bLcQPkS5Id2JvPbMRigZ
	ph4a92vw7Tu/JNGC49fzEd9qRcKA3Sf8mjPvj/4rLU9MHSyr9utv3U4/nxgP2FvJxOC/dpQ+3X0
	b9uxDf6NHIZb8iIRbjoP2/wHsCKZV6velgCyeZcRIz5oLq4Xe/7va1NMNIZJEjaFjqHS5RRwnJB
	B6eG9I3IPfDRldcJ5+mIernbPLXhFFcvgASHusYEDj8BMx1yIfGRWpO1Y5N/zcjynY0jGlwhNuy
	737oz3b/nSpDYzuchMEL5vp/PXRPNGnXpOPjacR33Oeeqdfwy3NLd+C9E5mJr1cKYyjjN+xj45R
	FzqaCnTh+RnTJt8dA31+qpr99FzNZRggUXgrX+SS8XCLyNzuEAbJEo9VuVhhZmPt0yvkQ=
X-Received: by 2002:a05:6000:18af:b0:475:f0d1:eb55 with SMTP id ffacd0b85a97d-477b1aa2fefmr1804109f8f.48.1782919840832;
        Wed, 01 Jul 2026 08:30:40 -0700 (PDT)
Message-ID: <8808a658-0172-4af6-a6dc-6c975d0e5c34@gmail.com>
Date: Wed, 1 Jul 2026 17:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, xen-devel@lists.xenproject.org
References: <775c88457e5ec7fc7889002c6f9829669f9bce97.1782388193.git.oleksii.kurochko@gmail.com>
 <5d344cec-bb97-4d3b-87ff-e7175772fd45@suse.com>
 <0e2a8eab-366f-4384-a467-43f051d047ec@gmail.com>
Content-Language: en-US
In-Reply-To: <0e2a8eab-366f-4384-a467-43f051d047ec@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1782919841-80CD61E0-70DF2864/10/73395122804
X-purgate-type: spam
X-purgate-size: 3614



On 6/30/26 5:02 PM, Oleksii Kurochko wrote:
> 
>>
>>> @@ -55,6 +59,7 @@ struct evtchn_expand_array;
>>>   int evtchn_fifo_init_control(struct evtchn_init_control 
>>> *init_control);
>>>   int evtchn_fifo_expand_array(const struct evtchn_expand_array 
>>> *expand_array);
>>>   void evtchn_fifo_destroy(struct domain *d);
>>> +void evtchn_fifo_init_ops(struct domain *d);
>>>   #else
>>>   static inline int evtchn_fifo_init_control(struct 
>>> evtchn_init_control *init_control)
>>>   {
>>> @@ -68,6 +73,7 @@ static inline void evtchn_fifo_destroy(struct 
>>> domain *d)
>>>   {
>>>       return;
>>>   }
>>> +static inline void evtchn_fifo_init_ops(struct domain *d) {}
>>>   #endif /* CONFIG_EVTCHN_FIFO */
>>
>> Unlike these two. Which raise a different question though: What will 
>> be the
>> behavior when EVTCHN_FIFO=n and HAS_SHARED_INFO=n? Taking
>> evtchn_alloc_unbound() as example, afaict evtchn_port_init() will stumble
>> over a NULL pointer. Looks like for that (and only that) case we still 
>> need
>> your earlier dummy fallback.
> 
> I will introduce dummy fallback (I will shrunk some stubs in final 
> version):
> 
> +#ifndef CONFIG_HAS_SHARED_INFO
> +static void cf_check evtchn_none_set_pending(
> +    struct vcpu *v, struct evtchn *evtchn) {}
> +static void cf_check evtchn_none_clear_pending(
> +    struct domain *d, struct evtchn *evtchn) {}
> +static void cf_check evtchn_none_unmask(
> +    struct domain *d, struct evtchn *evtchn) {}
> +static bool cf_check evtchn_none_is_pending(
> +    const struct domain *d, const struct evtchn *evtchn) { return false; }
> +static bool cf_check evtchn_none_is_masked(
> +    const struct domain *d, const struct evtchn *evtchn) { return true; }
> +static void cf_check evtchn_none_print_state(
> +    struct domain *d, const struct evtchn *evtchn) {}
> +
> +static const struct evtchn_port_ops evtchn_port_ops_none = {
> +    .set_pending   = evtchn_none_set_pending,
> +    .clear_pending = evtchn_none_clear_pending,
> +    .unmask        = evtchn_none_unmask,
> +    .is_pending    = evtchn_none_is_pending,
> +    .is_masked     = evtchn_none_is_masked,
> +    .print_state   = evtchn_none_print_state,
> +};
> +
> +static void evtchn_none_init(struct domain *d)
> +{
> +    d->evtchn_port_ops = &evtchn_port_ops_none;
> +}
> +#endif

I will shrink it to::

#ifndef CONFIG_HAS_SHARED_INFO
/*
  * Placeholder ops for domains with neither a shared_info page nor (yet)
  * a FIFO control block.  None of these are ever reachable in practice;
  * they only exist to keep d->evtchn_port_ops non-NULL.
  */
static void cf_check evtchn_none_set_pending(
     struct vcpu *v, struct evtchn *evtchn) {}

static void cf_check evtchn_none_noop(
     struct domain *d, struct evtchn *evtchn) {}

static bool cf_check evtchn_none_false(
     const struct domain *d, const struct evtchn *evtchn) { return false; }

static void cf_check evtchn_none_print_state(
     struct domain *d, const struct evtchn *evtchn) {}

static const struct evtchn_port_ops evtchn_port_ops_none = {
     .set_pending   = evtchn_none_set_pending,
     .clear_pending = evtchn_none_noop,
     .unmask        = evtchn_none_noop,
     .is_pending    = evtchn_none_false,
     .is_masked     = evtchn_none_false,
     .print_state   = evtchn_none_print_state,
};

void evtchn_none_init(struct domain *d)
{
     d->evtchn_port_ops = &evtchn_port_ops_none;
}
#endif /* CONFIG_HAS_SHARED_INFO */

~ Oleksii


