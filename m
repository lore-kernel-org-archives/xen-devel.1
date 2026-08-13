Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BD8C5CFCF
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 17:04:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390350.1630803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuYq7-0004iP-Dy; Thu, 13 Aug 2026 17:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390350.1630803; Thu, 13 Aug 2026 17:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuYq7-0004iH-AI; Thu, 13 Aug 2026 17:03:35 +0000
Received: by outflank-mailman (input) for mailman id 1390350;
 Thu, 13 Aug 2026 17:03:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuYq5-0004iA-KE
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 17:03:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuYq4-007DaN-JY
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 19:03:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7df8e2-bab6-0a2a0a5309dd-0a2a450bb2d2-4
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 19:03:32 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7df8e4-b7e8-0a2a450b0019-d155dd30a4b0-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 19:03:32 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47fde295992so23576f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 10:03:32 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b27bfsm646246f8f.23.2026.08.13.10.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 10:03:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786640612; x=1787245412; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCw4fyOxR5RxseyWR8QPKYGo5XGTtX8NNzKul/VV0tk=;
        b=AoByQ5oWMuD/UGjXhlPd6Z40BHHomBT/b4eFyCgpBWLQMQ5RiksolX+ueFZ9vJeDCL
         0sl2gKrrGfZYGCiw2Y4iX4wcdsKoIPX9lQu/aS3aOQwXq53jSeuekK8iseplXebNNSLb
         3SlvbG3jYKdGtb/sZWEw7vbEF/yv2gOtZh2SqwTbqRg8pHnaUn8AbATSA+X7BgfNBFu8
         tfQ6IF6m56dZlkI2uHzfOa32kix3t3+yrTCuUUsr9yiXxsdZw+2LmScUNVn0Luh6ONrp
         Vmcf3MsDtwWGZUTkarPsg/oBYSiE6SkZxENkw4fL7OOw+WZ3dK9TB9IGRia539ppbZY3
         3Nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786640612; x=1787245412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCw4fyOxR5RxseyWR8QPKYGo5XGTtX8NNzKul/VV0tk=;
        b=lY7zJR/Yhqihb0XhMfAVWrGRby7VsKvFfx9ecCSdRxUp96uoVIWr8106F9zAgR14MR
         v9YjRMq7Ovmv+98KMXBzLJTfRxbueTBHHNxiTakSRaM+G1j4OQbfc4dK1RZ+Ke1sEPOT
         fwIEIi6K6ni5Sgew8gSgOuoKcTgnorsYoHFkHHfDOIsFJG9unH8B/EbOhFraw70degE4
         KKCuIWqy155DOER8+NVu5L1T7R01LcOgMSbP1wBMrNXK0I4oHNCla6ZGpzxi/CJGRGid
         tuKb1PhPjPT1oB11X4av+D0qFZ1pnoTZAWPww6kHl9epib3yzvbrMxWit5r/UMhUN6Vv
         +SXA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3N3o2LikGaK+o0hM7bsB+fjd7ETxg20lkOfGOrUGr35UKHAMUJIZ/9syCiIHfz1JvneRmAIbo6MA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVtS+aS8lXHRrvvi+0iETF0a6o9F+4NSs7sYWXRUfygKt5QPib
	/fjBBxKKAAQ7iCa3ittOVlXK7OHjDybsbnFYxrA49Ua9ID/dlXL7UDp2R5xRsQ==
X-Gm-Gg: AR+sD12gmO2N0owe0MMHfdXYdOA4ZfCqpA2yIr6JsWmThgU2/hd8vgDv24WUFke8U68
	yD+AUYZ05lMK8Xw3VCl3WBpu/4c/5NGV8QOATf3f/Hssop2z6IoMngKnYRfh7I8tbw1MccdGOi1
	wjfKcdVQqtWsYLugrbsSrDyt/DUvhFvkOA8cszSTtJZI5ZTUKbCnFA8EFI5JC4jl5j+9/qn0+XI
	me+PmAXrQz9PWr4R3BPx6Trapux/gpIKCfWFGYbzw/+jk6/ILB+OvWM9UyyU03+46VMW5SLh+xo
	W91NHq4Q6Cu6J4swK0c76+gfb+1w6x1T4ghcMJ6IsrtCArqHfkbUaTcpCCJ64J2VEz+8dKAYLBL
	JdkFxAQnlEIUM9AcCVSlzaEuMiwClSNRw34bcvRd42yrG5UR7S6e44luEp94x6tGx3x8l7MtqZj
	0DOjQ+BXTei1lKHjVBFD6S1lr/taHIxp6L5fcZg0/W0N/OF+hMvo03N2GadYnnhdW0run6tpviH
	B29xYEJdyTu7/7xPWvUAih2mISITgcs/9UHUqbf4l4=
X-Received: by 2002:a05:6000:491e:b0:47f:7ea0:6c20 with SMTP id ffacd0b85a97d-4815a5f80c7mr11242611f8f.15.1786640611658;
        Thu, 13 Aug 2026 10:03:31 -0700 (PDT)
Message-ID: <31674604-d595-4706-b5b6-cb3e9ed4d148@gmail.com>
Date: Thu, 13 Aug 2026 19:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/20] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
 <ed247fcc594346ad20a3d12e5d49c8f48ba6792a.1785836421.git.oleksii.kurochko@gmail.com>
 <3bd3a9d5-444b-4bb5-9a4c-8353f98802a9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3bd3a9d5-444b-4bb5-9a4c-8353f98802a9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1786640612-18ECE9EA-68665AC1/10/73395122804
X-purgate-type: spam
X-purgate-size: 12149



On 8/13/26 4:54 PM, Jan Beulich wrote:
> On 04.08.2026 17:47, Oleksii Kurochko wrote:
>> On architectures that run guests in dom0less mode without the PV ABI
>> (currently RISC-V), no shared_info page is allocated and d->shared_info
>> remains NULL throughout the domain lifetime. Several places in common
>> code access d->shared_info through the shared_info() macro or directly,
>> causing UBSAN null-pointer errors on such architectures.
>>
>> Rather than adding runtime NULL guards that are logically unreachable
>> on x86 and Arm (where shared_info is always allocated), introduce a new
>> Kconfig symbol CONFIG_HAS_SHARED_INFO selected by x86 and Arm.
>>
>> On !HAS_SHARED_INFO the shared_info() macro expands to a dereference
>> of shared_info_absent, an extern pointer that is declared but
>> intentionally never defined.  Any use of shared_info() that is not
>> dead-code-eliminated will therefore cause a link-time failure, making
>> missed guards impossible to overlook.
>>
>> The 2L event-channel ops call shared_info() and must not be compiled on
>> architectures without a shared_info page, so event_2l.o is gated on
>> CONFIG_HAS_SHARED_INFO. On such architectures evtchn_init() installs the
>> FIFO ops as a placeholder instead, so that a later guest opt-in to the
>> FIFO ABI via EVTCHNOP_init_control has no special-casing to do; if FIFO
>> support itself is also unavailable (!CONFIG_EVTCHN_FIFO), a dedicated
>> no-op evtchn_port_ops_none table is installed instead, so that
>> d->evtchn_port_ops is never NULL. evtchn_fifo_word_from_port() is
>> guarded against uninitialised d->evtchn_fifo so the FIFO ops are safe
>> before evtchn_fifo_init_control() is called by the guest.
>>
>> With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
>> dummy_vcpu_info, so writes through vcpu_info() could leak data between
>> vCPUs. Reviewing the write paths in common code: the write in
>> map_guest_area() stores the constant ~0 so nothing serious would happen
>> if it were leaked; the event_2l.c paths are not compiled on
>> !HAS_SHARED_INFO, as event_2l.o is gated on CONFIG_HAS_SHARED_INFO; the
>> write in vcpu_info_populate() targets the new mapping buffer, not
>> dummy_vcpu_info.
>>
>> Outside common code, the remaining writes are x86 PV-specific, for which
>> CONFIG_HAS_SHARED_INFO=y. No code changes are needed.
>>
>> Finally, struct domain's shared_info field itself is gated on
>> CONFIG_HAS_SHARED_INFO, as it would otherwise be a permanently NULL
>> pointer: every user of it is either arch code for an architecture that
>> selects HAS_SHARED_INFO, or common code already guarded by the same
>> Kconfig symbol.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> albeit still with a number of comments / requests:
> 
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -40,6 +40,41 @@
>>   
>>   #define consumer_is_xen(e) (!!(e)->xen_consumer)
>>   
>> +#if !defined(CONFIG_HAS_SHARED_INFO) && !defined(CONFIG_EVTCHN_FIFO)
>> +/*
>> + * Placeholder ops for domains with neither a shared_info page nor a FIFO
>> + * control block (CONFIG_HAS_SHARED_INFO=n and CONFIG_EVTCHN_FIFO=n). Such
> 
> I'd omit the part in parentheses - it only repeats what the #if already
> has.

Sure, I will drop then.

> 
>> + * a domain has no ABI to record event state in, so these are reachable
>> + * whenever an event is delivered to (or queried on) one of its ports; they
>> + * just discard/no-op it.  They exist to keep d->evtchn_port_ops non-NULL.
>> + */
>> +static void cf_check evtchn_none_set_pending(
>> +    struct vcpu *v, struct evtchn *evtchn) {}
>> +static void cf_check evtchn_none_noop(
>> +    struct domain *d, struct evtchn *evtchn) {}
>> +static bool cf_check evtchn_none_false(
>> +    const struct domain *d, const struct evtchn *evtchn) { return false; }
>> +static void cf_check evtchn_none_print_state(
>> +    struct domain *d, const struct evtchn *evtchn) {}
>> +
>> +static const struct evtchn_port_ops evtchn_port_ops_none = {
>> +    .set_pending   = evtchn_none_set_pending,
>> +    .clear_pending = evtchn_none_noop,
>> +    .unmask        = evtchn_none_noop,
>> +    .is_pending    = evtchn_none_false,
>> +    .is_masked     = evtchn_none_false,
>> +    .print_state   = evtchn_none_print_state,
>> +};
>> +
>> +static void evtchn_none_init(struct domain *d)
>> +{
>> +    d->evtchn_port_ops = &evtchn_port_ops_none;
>> +}
>> +#else
>> +/* Declaration only; the calls below are DCE'd unless both configs are off. */
>> +void evtchn_none_init(struct domain *d);
>> +#endif /* !CONFIG_HAS_SHARED_INFO && !CONFIG_EVTCHN_FIFO */
> 
> I think the (inverted) comment would be more valuable on the #else line.

I will do that.

> 
>> @@ -1324,9 +1359,15 @@ int evtchn_reset(struct domain *d, bool resuming)
>>           rc = -EAGAIN;
>>       else if ( d->evtchn_fifo )
>>       {
>> -        /* Switching back to 2-level ABI. */
>>           evtchn_fifo_destroy(d);
>> -        evtchn_2l_init(d);
>> +
>> +        if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
>> +            /* Switching back to 2-level ABI. */
>> +            evtchn_2l_init(d);
>> +        else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
>> +            evtchn_fifo_init_ops(d);
>> +        else
>> +            evtchn_none_init(d);
> 
> This being the same as ...
> 
>> @@ -1625,7 +1666,13 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
>>   
>>   int evtchn_init(struct domain *d, unsigned int max_port)
>>   {
>> -    evtchn_2l_init(d);
>> +    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
>> +        evtchn_2l_init(d);
>> +    else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
>> +        evtchn_fifo_init_ops(d);
>> +    else
>> +        evtchn_none_init(d);
> 
> ... this: Maybe have a small helper (evtchn_preinit()?), to reduce the
> duplication? Would require comment updates then as well.

I think then it will be needed to fix a lot of comments. My suggestion 
is the following:

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 0911808fe861..809638ce4bfd 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -71,10 +71,23 @@ static void evtchn_none_init(struct domain *d)
      d->evtchn_port_ops = &evtchn_port_ops_none;
  }
  #else
-/* Declaration only; the calls below are DCE'd unless both configs are 
off. */
+/*
+ * Declaration only; the call in evtchn_preinit() is DCE'd unless both
+ * configs are off.
+ */
  void evtchn_none_init(struct domain *d);
  #endif /* !CONFIG_HAS_SHARED_INFO && !CONFIG_EVTCHN_FIFO */

+static void evtchn_preinit(struct domain *d)
+{
+    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
+        evtchn_2l_init(d);
+    else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
+        evtchn_fifo_init_ops(d);
+    else
+        evtchn_none_init(d);
+}
+
  /*
   * Lock an event channel exclusively. This is allowed only when the 
channel is
   * free or unbound either when taking or when releasing the lock, as any
@@ -1359,15 +1372,9 @@ int evtchn_reset(struct domain *d, bool resuming)
          rc = -EAGAIN;
      else if ( d->evtchn_fifo )
      {
+        /* Switching back to the default ABI. */
          evtchn_fifo_destroy(d);
-
-        if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
-            /* Switching back to 2-level ABI. */
-            evtchn_2l_init(d);
-        else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
-            evtchn_fifo_init_ops(d);
-        else
-            evtchn_none_init(d);
+        evtchn_preinit(d);
      }

      write_unlock(&d->event_lock);
@@ -1666,12 +1673,7 @@ void evtchn_check_pollers(struct domain *d, 
unsigned int port)

  int evtchn_init(struct domain *d, unsigned int max_port)
  {
-    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
-        evtchn_2l_init(d);
-    else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
-        evtchn_fifo_init_ops(d);
-    else
-        evtchn_none_init(d);
+    evtchn_preinit(d);

      d->max_evtchn_port = min_t(unsigned int, max_port, INT_MAX);

diff --git a/xen/common/event_channel.h b/xen/common/event_channel.h
index c8ee09807008..156514fefff6 100644
--- a/xen/common/event_channel.h
+++ b/xen/common/event_channel.h
@@ -71,8 +71,8 @@ static inline void evtchn_fifo_destroy(struct domain *d)
  #endif /* CONFIG_EVTCHN_FIFO */

  /*
- * Declaration only when !CONFIG_EVTCHN_FIFO; the (dead) calls in
- * evtchn_init() and evtchn_reset() are DCE'd in that case.
+ * Declaration only when !CONFIG_EVTCHN_FIFO; the (dead) call in
+ * evtchn_preinit() is DCE'd in that case.
   */
  void evtchn_fifo_init_ops(struct domain *d);

diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index 3b6e619c5278..f11c4c16efa3 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -423,10 +423,9 @@ static const struct evtchn_port_ops 
evtchn_port_ops_fifo =
  };

  /*
- * evtchn_fifo_init_ops()'s only call sites are in the
- * IS_ENABLED(CONFIG_EVTCHN_FIFO) dead branches of evtchn_init() and
- * evtchn_reset(), which are never reached on HAS_SHARED_INFO=y builds
- * because of DCE.
+ * evtchn_fifo_init_ops()'s only call site is the
+ * IS_ENABLED(CONFIG_EVTCHN_FIFO) dead branch of evtchn_preinit(), which is
+ * never reached on HAS_SHARED_INFO=y builds because of DCE.
   */
  #ifndef CONFIG_HAS_SHARED_INFO
  void evtchn_fifo_init_ops(struct domain *d)
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 930190054cf0..595dedf0792c 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -211,7 +211,7 @@ static bool evtchn_usable(const struct evtchn *evtchn)

  void evtchn_check_pollers(struct domain *d, unsigned int port);

-/* Close all event channels and reset to 2-level ABI. */
+/* Close all event channels and reset to the default ABI. */
  int evtchn_reset(struct domain *d, bool resuming);

Does it look good for you?

> 
>> --- a/xen/common/event_fifo.c
>> +++ b/xen/common/event_fifo.c
>> @@ -62,6 +62,9 @@ static inline event_word_t *evtchn_fifo_word_from_port(const struct domain *d,
>>        */
>>       smp_rmb();
>>   
>> +    if ( unlikely(!d->evtchn_fifo) )
>> +        return NULL;
>> +
>>       if ( unlikely(port >= d->evtchn_fifo->num_evtchns) )
>>           return NULL;
>>   
>> @@ -419,6 +422,19 @@ static const struct evtchn_port_ops evtchn_port_ops_fifo =
>>       .print_state   = evtchn_fifo_print_state,
>>   };
>>   
>> +/*
>> + * evtchn_fifo_init_ops()'s only call sites are in the
>> + * IS_ENABLED(CONFIG_EVTCHN_FIFO) dead branches of evtchn_init() and
> 
> Perhaps better drop "dead" from here; those branches are dead only when ...
> 
>> + * evtchn_reset(), which are never reached on HAS_SHARED_INFO=y builds
>> + * because of DCE.
> 
> ... HAS_SHARED_INFO=y, not generally.

Agree, we could drop it.

> 
>> --- a/xen/include/xen/shared.h
>> +++ b/xen/include/xen/shared.h
>> @@ -43,7 +43,13 @@ typedef struct vcpu_info vcpu_info_t;
>>   
>>   extern vcpu_info_t dummy_vcpu_info;
>>   
>> -#define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
>> +#ifdef CONFIG_HAS_SHARED_INFO
>> +#define shared_info(d, field) __shared_info(d, (d)->shared_info, field)
> 
> Is there a reason this line cannot simply be kept as it was?

No, I will fix that.

> 
>> --- a/xen/include/xen/time.h
>> +++ b/xen/include/xen/time.h
>> @@ -66,7 +66,11 @@ struct tm wallclock_time(uint64_t *ns);
>>   #define version_update_begin(v) (((v) + 1) | 1)
>>   #define version_update_end(v)   ((v) + 1)
>>   extern void update_vcpu_system_time(struct vcpu *v);
>> +#ifdef CONFIG_HAS_SHARED_INFO
>>   extern void update_domain_wallclock_time(struct domain *d);
>> +#else
>> +static inline void update_domain_wallclock_time(struct domain *d) {}
>> +#endif
> 
> Perhaps best to insert a blank line ahead of the #ifdef.

Sure, I will add.

Thanks.

~ Oleksii

