Return-Path: <SRS0=L/tO=A2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1538AC433E2
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2020 12:45:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E352F20578
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2020 12:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E352F20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvgn1-00062o-Sl; Wed, 15 Jul 2020 12:45:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvgn1-00062j-Hf
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:45:35 +0000
X-Inumbo-ID: 136bcf60-c699-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 136bcf60-c699-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 12:45:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8554FACBF;
 Wed, 15 Jul 2020 12:45:37 +0000 (UTC)
Subject: Re: [PATCH 1/3] x86/HVM: fold hvm_io_assist() into its only caller
To: paul@xen.org
References: <42270be7-43d6-ba53-3896-e20b5d7e3de0@suse.com>
 <94d683d7-302b-f0c2-0108-3f6d76b8df9b@suse.com>
 <001901d65aa5$27c03560$7740a020$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec74b9ba-dbc5-7ab4-0f65-6119bc49c333@suse.com>
Date: Wed, 15 Jul 2020 14:45:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <001901d65aa5$27c03560$7740a020$@xen.org>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.07.2020 14:40, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 15 July 2020 13:04
>>
>>  static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
>>  {
>>      unsigned int prev_state = STATE_IOREQ_NONE;
>> +    uint64_t data = ~0;
>>
>> -    while ( sv->pending )
>> -    {
>> +    do {
>>          unsigned int state = p->state;
> 
> I guess this is beneficial from the point of view of restricting cope and...
> 
>>
>>          smp_rmb();
>> @@ -132,7 +121,6 @@ static bool hvm_wait_for_io(struct hvm_i
>>               * emulator is dying and it races with an I/O being
>>               * requested.
>>               */
>> -            hvm_io_assist(sv, ~0ul);
>>              break;
> 
> ...(as you say) allowing this early break, but a forward jump to an 'out' label would be more consistent with other code. It works though so...

Since this gets restructured by subsequent patches I thought I'd
avoid the introduction of a disliked by me "goto".

> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks, Jan

