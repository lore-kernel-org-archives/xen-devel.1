Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB690C531CC
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 09:17:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371019.1618801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnuyg-0004dJ-QY; Sun, 26 Jul 2026 09:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371019.1618801; Sun, 26 Jul 2026 09:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnuyg-0004d6-Kn; Sun, 26 Jul 2026 09:16:58 +0000
Received: by outflank-mailman (input) for mailman id 1371019;
 Sun, 26 Jul 2026 09:16:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tomitamoeko@gmail.com>) id 1wnuyf-0004d0-04
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 09:16:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnuye-00Ft98-67
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 11:16:56 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tomitamoeko@gmail.com>)
 id 6a65d067-e002-0a2a0a5209dd-0a2a4501e294-20
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 11:16:56 +0200
Received: from [74.125.227.131] (helo=mail-pj2-f3.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <tomitamoeko@gmail.com>)
 id 6a65d086-5984-0a2a45010019-4a7de383bd62-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 11:16:55 +0200
Received: by mail-pj2-f3.google.com with SMTP id
 d9443c01a7336-2ce7ac92dfcso17262405ad.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 02:16:55 -0700 (PDT)
Received: from ?IPV6:2408:820c:8ffa:c0f0:38f6:5714:f0df:99c3?
 ([2408:820c:8ffa:c0f0:38f6:5714:f0df:99c3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-314bc415eafsm19055702eec.7.2026.07.26.02.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jul 2026 02:16:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785057414; x=1785662214; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EAE+jyqEL9oR8OfraxbI5YKeewSRrwjZxO3fH6CCJTg=;
        b=Lr4JR4OgLndsUfNBmTQlm5dljIPtle/wNF6VPHHbpyIaQCQyT3zzvdrqqa0aqNS27m
         qYwqzqOPFLlysHkGWvh/pY31HJHItqORjx3uN1MTCv079v6w0pIVJGnAnOGh1Mug0+YG
         g/eYuyXbeX8mawSTEpetSNL/Iang0GSNphUSmE50fiCaFSK57XMlsapDjeu+OIx03bHf
         cjGMK7pZFMUkidKqK6uDS1HCMtts5u92lb2bJtfP/w4jgIboce2s9Tl74DeC9cvxSQhE
         lchfC5AVFqjdiPDGlCaco0zgEVZ4Q/s1eyRbqOuhZOwzyvCuSsQh2WrEvYKXVXg/k1Fs
         L33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785057414; x=1785662214;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAE+jyqEL9oR8OfraxbI5YKeewSRrwjZxO3fH6CCJTg=;
        b=plM+B2MkcTOnP/2R9Uy8riuw+rjNoj/lsnfNOjuKSgJ2UmnvR0yeNyXh3KU3QppdFa
         8OMFNmW2jeB3QPnV0Q/vf3rk2HsrGpBjxgZE+PDnZgKG2GB5ZHnWkcBahVGdJ0vFrJg3
         WXvbj3CIFUAjMQHHAS/B2FW+5Emlt7haYyAjRLsDUtC3U3mPyVqYJjOXidfSd3eS8hit
         Voa1aQ30Q60+Ggd8N61kMduJ7G3XuamVzBqmJwyFDGBmT01K7vFvgj98wqwjlTxvtBcr
         v8sLQ9t3fA8H6Qw/34wbctQ/XO/Dxqee+9LPzSfKGyFGY8bspXuuGLjZP4oLaqTFGK2e
         5n8w==
X-Forwarded-Encrypted: i=1; AHgh+RrmNccBTZ2YXcV/kf8ezGb40ifZl8V96FYUKfjGJiyWT/OAM6JbNNWh9nJt85GD2MEY8JXvno2/s00=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6A0XBsj1P1Fo7gpTlFEyFb1SdU+arcr3NpvA69DUMtPEYW09e
	rYa2cV5KCsge10ixlhw7AkGZ9vBdcqoLGw4twTDp5erZjfGiaLrVDZU=
X-Gm-Gg: AR+sD13m14T0ULfQ1HOusr3COPasPUW6X5O3tBGJo5dBqAF4Lmtd8O9a0UttXa15uA2
	FSYifTisczMHNP2k77Jw+4J+Jo+aXfc8zo4l4wWuFUsnmye+hMJz4+V0eeu/T2vnhUCmfFPspI+
	eUVixpo6glyN25vWBZVs8l/zaAu3Dl18LVLEfV/SurBK0k43HrwX7mrn0xMJRlpc25cz0XVkUHg
	hctJsZX5If9G3ax7ZwN9rq2K20Rwx5LCTuaxxiW+GJKQhTOKn+O/9TPv2b8PWcpGZcYI1KLqG0q
	wKPyO9+jUF4aELFwwfz9Tc/DZgTa9OWBN2fJP3bRnz8llw2NYTzST7WE49mallTGLr70LGN+61W
	NpeGwHDyH7FKnJf/kQNAJXon95iBz2XxMLOXps3Cww1+LAnIu7GwfT1qw1nkTwx4RWTe2ACMMlt
	59AGTiBT2hr0iXPSyTU26oj1IMbiw9oK7Yy7QUz+hK9oufNjF4GxbKXMvTYg==
X-Received: by 2002:a05:6a20:c5aa:b0:3c0:9c1b:d0b3 with SMTP id adf61e73a8af0-3c67e026f9dmr4396021637.62.1785057414063;
        Sun, 26 Jul 2026 02:16:54 -0700 (PDT)
Message-ID: <5bb70c1f-d4c7-4361-b93c-acd2d0616b2e@gmail.com>
Date: Sun, 26 Jul 2026 17:16:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/igd: get PCH info from host sysfs
To: Chuck Zmudzinski <brchuckz@netscape.net>,
 Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
References: <20260709183517.25866-1-brchuckz@aol.com>
 <20260709183517.25866-2-brchuckz@aol.com>
 <5cb8d286-f013-4400-aef4-baddaa775995@gmail.com>
 <dda25bc4-6d3c-4f36-94e0-ffdc8b9bc81d@netscape.net>
From: Tomita Moeko <tomitamoeko@gmail.com>
In-Reply-To: <dda25bc4-6d3c-4f36-94e0-ffdc8b9bc81d@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1785057416-BEA66757-B226B2A3/0/0
X-purgate-type: clean
X-purgate-size: 3866



On 2026-07-25 12:19, Chuck Zmudzinski wrote:
> On 7/23/2026 9:09 AM, Tomita Moeko wrote:
>>> ...
>>> Also, use errp in xen_igd_passthrough_isa_bridge_create
>>> to set errors from xen_pt_get_host_pch_info.
>>>
>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>>> ---
>>> Changes in v2:
>>>   - call error_setg* after closing files instead of before closing
>>>     files
>>>   - in last line of commit message change "to propagate errors" to
>>>     "to set errors"
>>>   - add stable to Cc list
>>>
>>> Changes in v3:
>>>   - whitespace fix at line 380 of xen_pt_graphics.c
>>>   - fix Cc address for qemu-stable
>>>
>>>  hw/xen/xen_pt.c          |  2 +-
>>>  hw/xen/xen_pt_graphics.c | 82 ++++++++++++++++++++++++++++++++++++++--
>>>  include/hw/xen/xen_igd.h |  3 +-
>>>  3 files changed, 82 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
>>> index 0fe9c0a..474606e 100644
>>> --- a/hw/xen/xen_pt.c
>>> +++ b/hw/xen/xen_pt.c
>>> @@ -867,7 +867,7 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>>>          }
>>>  
>>>          /* Register ISA bridge for passthrough GFX. */
>>> -        xen_igd_passthrough_isa_bridge_create(s, &s->real_device);
>>> +        xen_igd_passthrough_isa_bridge_create(s, &s->real_device, errp);
>>
>> The `errp` need to be handled here if any error occurs.
> 
> Do you mean calling it like this as a supported way to handle an error:
> 
>     xen_igd_passthrough_isa_bridge_create(s, &s->real_device, &error_fatal);
> 
> IIUC, that would cause Qemu to exit(1) here if there was any error.
>
> I didn't do that because I thought if there was an error one of the
> parents (pci or qdev) would handle the error appropriately since we
> are passing 'errp' from xen_pt_realize which I think comes from pci
> and qdev, but maybe not. I have not tested how an error is handled
> with this version of the patch and I am certainly no expert in how
> error handling should be done here, so thanks for alerting me to this
> question.
> 
> I have also seen in the Qemu source the use of local_err and maybe
> using &error_fatal is something like using a local_err instead of the
> errp from xen_pt_realize.
>
> I will accept any suggestions from more knowledgeable people about
> how best to handle the errors here. I can also do some tests by
> faking an error here and make sure the the error does get handled.
> I do think if the LPC bridge creation fails it should be a fatal error
> and if am reading the current code we have correctly, we currently
> just print a message to stderr if bridge creation fails without doing
> anything about that error. I also think maybe if for some reason we
> can't get a revision number for the LPC bridge, maybe that should
> not be a fatal error.

Here I mean, since you've changed the function to use errp, then it should be
handled as other function calls in xen_pt_realize() like

    xen_igd_passthrough_isa_bridge_create(s, &s->real_device, errp);
    if (errp) {
        xen_host_pci_device_put(&s->real_device);  // cleanup
        return;
    }

The realized function is called in device_set_realized() with

    dc->realize(dev, &local_err);
    if (local_err != NULL) {
        goto fail;
    }
    
In your code, if any error occurs, though it contiunes, it would be still
treated as a failure. I'm not sure if this failure would have any impact
to further steps in xen_pt_realize(), but since it ultimately fails, fail
fast is always preferred.

If you think the error can be ignored, then keep using current fprintf()
or error_report() would be the best choice.

Thanks,
Moeko

> I will make sure the next version of the patch will not be posted until
> I have verified the errors are handled appropriately.
> 
> Cheers,
> 
> Chuck


