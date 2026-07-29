Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944FFC54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 11:59:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375604.1622735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp2wH-0006rn-24; Wed, 29 Jul 2026 11:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375604.1622735; Wed, 29 Jul 2026 11:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp2wG-0006rg-VL; Wed, 29 Jul 2026 11:59:08 +0000
Received: by outflank-mailman (input) for mailman id 1375604;
 Wed, 29 Jul 2026 11:59:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp2wE-0006rX-NS
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 11:59:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp2wE-005j0Q-42
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 13:59:06 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a69eaf8-bab6-0a2a0a5309dd-0a2a4504bd2a-26
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 13:59:06 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a69eb09-b57f-0a2a45040019-d1558036a866-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 13:59:06 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49550ec592cso12942675e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 04:59:06 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c4625161sm145986965e9.14.2026.07.29.04.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 04:59:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785326345; x=1785931145; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Quyvk3M2oF8BN6QVIFqXQiEzaipUG1/2p96Odu38AkQ=;
        b=opmEk2zEFYsQoJlnML45WJvUHtPygo7VR4FeLrk4BopeSWQLTCxoaMWJ4kYhv+XoUs
         c0jUp+31EH2rjo8BQ3RbpDKsxGoTzmk9Pku8r+5z7F78X0llOOe64lfxM/NamG4LUhBH
         GTjJcLGKwF3ZhlkJky29ljr1E0NxBmntyEXmjD1og//AfrAhl3mcE3Q/ue2Sl+D71Pju
         tnkFny6d/sVb6fOgqf4Afpine9e6i3BS5CRHnQ/lQlGo3TfdFgGU7pJukC2OG6HHXiG0
         FIQM+BTrqA8Nemjedomgt43kCirHlNllsa1tNSOO96o9/Il5gP6SA+F04pqF8lr9/9M4
         fSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326345; x=1785931145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Quyvk3M2oF8BN6QVIFqXQiEzaipUG1/2p96Odu38AkQ=;
        b=FPcTTdgnOgaCMBcFJ78bQrgMUUZMBshVRa7yxbUQCEsijbcWsMdq0rZSqtJ/WUFhvu
         JCdpDvsBADtMOnSBAjsHo/5s0YlB6/TOTsEgmZ1QOFahHf8MQ/cW0VJ+P+VdwanqolSK
         KE5an/8gS8YRM15daY/IybYeMw6R5eb/ojV8KwpPiwMlvhAPAIFEKEEG7G7T8CJqM7m5
         dUbXJ9idhcpc27w4XKl636qBK033sWekbvDIUKS0oDUiOzHUTRDoEB0nR7/Aajs7Q9uX
         Wiqyqa4GaQc5mIqb2ecDQDznj3Dv0YDxwhb27YNX7sWHb8EVvEJh9RBxQgFHzu8qcQ2m
         Q/ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RokRhtxWhw6DPAxv45V/MA3no5Lfd/g+R5S9eGzI4BtIb6RNnfobysPdT3MLikhXcpm2A2VX0xBhG4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKMlG+Vg67OnRXoUvAfuT5PCufaG2V34kmYSkc6DCzh/ZTCQ7K
	Eam38j4COs8M9QRW/OaOHlG2csZfCK8YbI0HaDXieGZ9GfZ+02/jcimc
X-Gm-Gg: AR+sD12GKvUewODxWygfriCvClI0JIf30QBTXaORfjA9QVZG+LkFgOgxrMudwoSouRd
	EQnuL5caVuvZWWxdnbFyaxglyXIUWopVps/NgDmW6ptQXUMROpV1v3fkHAEFV1dEp2yOCf8UMTg
	+ehlIwC3v+rZYy2UV/eDEfZTFEpKMC4LKW++Zkh77NPHcTDU3VDxn0xYjvl32OIflMQuUQZC98F
	R8rnjy7K67mDOW/yeggq+SyjYGL13MsCmJxC69z87QvI69y8S2Rwn7+wajFF/axoyHTJSOWZibO
	XUuYzAPALmnCQdsP/Ri0hpI9xOu14UIpU4PSh5LI6FQ9dCRwx5GDzBGgEQZcclEUU/ZA5PhvBZ9
	43pCXKweF6X+XBT5cqY7z4k2eBrKUh+3QOsd4P0s3F1lF46oNRPMPJLonkdNM31fxw65QgiqS2k
	P3Clccb1B/51uQr+kUCzZrSdKoG1Dg4NtL62rdFepVmlGFynoQ5tmKriYkpymwYavpBw/q52Ehg
	YJMJ+jZTyYs48RCPjNsWeZ633d0tnoVHQkbbAENDfQ=
X-Received: by 2002:a05:600c:1548:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-497fd298f87mr24643955e9.0.1785326345470;
        Wed, 29 Jul 2026 04:59:05 -0700 (PDT)
Message-ID: <6cebc63c-2f21-4ef8-ab10-e2ec62f887b7@gmail.com>
Date: Wed, 29 Jul 2026 13:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/23] xen/riscv: implement IRQ routing for device
 passthrough
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <c489a420b1c01c5312773c2e2b51f63d3babf855.1784559209.git.oleksii.kurochko@gmail.com>
 <c64fc958-73bb-44ed-a3b2-dc368ce675ac@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c64fc958-73bb-44ed-a3b2-dc368ce675ac@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1785326346-C3AC0B50-333FA057/10/73395122804
X-purgate-type: spam
X-purgate-size: 4716



On 7/23/26 3:30 PM, Jan Beulich wrote:
> On 20.07.2026 17:59, Oleksii Kurochko wrote:
>> +/* Route an IRQ to a specific guest */
>> +int route_irq_to_guest(struct domain *d, unsigned int virq,
>> +                       unsigned int irq, const char *devname)
>> +{
>> +    struct irqaction *action;
>> +    struct irq_guest *info;
>> +    struct irq_desc *desc;
>> +    unsigned long flags;
>> +    int retval = 0;
>> +
>> +    if ( d->is_dying )
>> +        return -EINVAL;
>> +
>> +    desc = irq_to_desc(irq);
>> +
>> +    /*
>> +     * release_irq() frees this action via xvfree(), relying on action
>> +     * being the first member of struct irq_guest so that &info->action
>> +     * coincides with info itself. Guard the layout so a future field
>> +     * reorder can't silently turn that into a free() of a mid-allocation
>> +     * pointer.
>> +     */
>> +    BUILD_BUG_ON(offsetof(struct irq_guest, action) != 0);
> 
> Can't release_irq() simply use container_of()? One way or another it feels
> like you're painting yourself into a particular corner ...

If it isn't the best option then it is needed to follow they way we had 
before:

-/*
- * Describe an IRQ assigned to a guest.
- *
- * The irqaction is embedded here (rather than allocated separately with
- * its dev_id pointing at a standalone struct irq_guest) so that freeing
- * the action in release_irq() also frees this whole structure in one go.
- * That avoids the alternative of release_irq()'s caller having to free
- * dev_id itself (something like in Arm release_guest_irq()).
- */
+/* Describe an IRQ assigned to a guest */
  struct irq_guest
  {
-    struct irqaction action;
      struct domain *d;
      unsigned int virq;
  };
@@ -263,7 +254,6 @@ static struct irq_guest *irq_get_guest_info(struct 
irq_desc *desc)
      return desc->action->dev_id;
  }

-
  void release_irq(unsigned int irq, const void *dev_id)
  {
      struct irq_desc *desc;
@@ -361,6 +351,7 @@ int release_guest_irq(struct domain *d, unsigned int 
virq)
      spin_unlock_irqrestore(&desc->lock, flags);

      release_irq(desc->irq, info);
+    xvfree(info);

      return 0;

@@ -384,23 +375,20 @@ int route_irq_to_guest(struct domain *d, unsigned 
int virq,

      desc = irq_to_desc(irq);

-    /*
-     * release_irq() frees this action via xvfree(), relying on action
-     * being the first member of struct irq_guest so that &info->action
-     * coincides with info itself. Guard the layout so a future field
-     * reorder can't silently turn that into a free() of a mid-allocation
-     * pointer.
-     */
-    BUILD_BUG_ON(offsetof(struct irq_guest, action) != 0);
+    action = xvmalloc(struct irqaction);
+    if ( !action )
+        return -ENOMEM;

      info = xvmalloc(struct irq_guest);
      if ( !info )
+    {
+        xvfree(action);
          return -ENOMEM;
+    }

      info->d = d;
      info->virq = virq;

-    action = &info->action;
      action->dev_id = info;
      action->name = devname;
      action->free_on_release = true;
@@ -454,13 +442,15 @@ int route_irq_to_guest(struct domain *d, unsigned 
int virq,
      if ( retval )
      {
          release_irq(desc->irq, info);
-        return retval;
+        goto free_info;
      }

      return 0;

   out:
      spin_unlock_irqrestore(&desc->lock, flags);
+    xvfree(action);
+ free_info:
      xvfree(info);

      return retval;

I see an an item in changelog which meniotned that:
```
Drop xfree(info) from release_guest_irq() to avoid a potential
dangling-pointer issue with the ->dev_id field. Now that
struct irqaction action;' is embedded into 'struct irq_guest',
'info' will be freed as part of release_irq() at the end.
```

But it seems I don't see now why it will be dangled-pointer here as
info is referenced by exactly one pointer, action->dev_id, and nothing 
caches it: the only reader, irq_get_guest_info(), dereferences 
desc->action->dev_id under desc->lock and doesn't outlive the critical 
section. xvfree(info) only ever runs after release_irq() has unlinked 
the action from desc->action under the lock and waited for 
_IRQ_INPROGRESS to clear, so by then no CPU can reach ->dev_id. A 
concurrent release_guest_irq() for the same IRQ is excluded by clearing 
_IRQ_GUEST under desc->lock, and live unrouting of a running domain is 
rejected with -EBUSY. In the error paths, out: frees an action 
_setup_irq() never installed, and the intc_route_irq_to_guest() failure 
path calls release_irq() before freeing info.

So it seems like it is safe to use what we had in v4.

Any concerns?

~ Oleksii

