Return-Path: <SRS0=L/tO=A2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF054C433E7
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2020 12:50:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 931DB20657
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2020 12:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931DB20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvgri-0006wc-OC; Wed, 15 Jul 2020 12:50:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvgrh-0006wX-LE
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:50:25 +0000
X-Inumbo-ID: c04ac2ae-c699-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c04ac2ae-c699-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 12:50:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 877CCAC23;
 Wed, 15 Jul 2020 12:50:27 +0000 (UTC)
Subject: Re: [PATCH 2/3] x86/HVM: re-work hvm_wait_for_io() a little
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <42270be7-43d6-ba53-3896-e20b5d7e3de0@suse.com>
 <872c2d16-f49a-41fd-68ae-f1e0ee14c7d8@suse.com>
 <001b01d65aa6$15710e10$40532a30$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d1908c1-05d7-2335-6e11-0b20a377361c@suse.com>
Date: Wed, 15 Jul 2020 14:50:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <001b01d65aa6$15710e10$40532a30$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.07.2020 14:47, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 15 July 2020 13:04
>>
>> @@ -139,20 +132,24 @@ static bool hvm_wait_for_io(struct hvm_i
>>              p->state = STATE_IOREQ_NONE;
>>              data = p->data;
>>              break;
>> +
> 
> Possibly mention the style fix-up in the comment comment.

Done.

>>          case STATE_IOREQ_READY:  /* IOREQ_{READY,INPROCESS} -> IORESP_READY */
>>          case STATE_IOREQ_INPROCESS:
>>              wait_on_xen_event_channel(sv->ioreq_evtchn,
>>                                        ({ state = p->state;
>>                                           smp_rmb();
>>                                           state != prev_state; }));
>> -            goto recheck;
>> +            continue;
>> +
> 
> You could just break out of the switch now, I guess.

I can't because of (see below).

> Anyway...
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks.

>>          default:
>>              gdprintk(XENLOG_ERR, "Weird HVM iorequest state %u\n", state);
>>              sv->pending = false;
>>              domain_crash(sv->vcpu->domain);
>>              return false; /* bail */
>>          }
>> -    } while ( false );
>> +
>> +        break;
>> +    }

This "break" requires the use of "continue" inside the switch().

Jan

