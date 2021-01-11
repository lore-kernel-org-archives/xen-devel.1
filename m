Return-Path: <SRS0=O81L=GO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC1EC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 09:16:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD612063A
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 09:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECD612063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.64700.114324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytJ8-0001Lh-Ov; Mon, 11 Jan 2021 09:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64700.114324; Mon, 11 Jan 2021 09:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytJ8-0001La-LY; Mon, 11 Jan 2021 09:16:14 +0000
Received: by outflank-mailman (input) for mailman id 64700;
 Mon, 11 Jan 2021 09:16:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kytJ7-0001LV-9a
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 09:16:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a84fc29-92b8-4a62-b657-1bb1d5f6b70a;
 Mon, 11 Jan 2021 09:16:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 960CBAD2B;
 Mon, 11 Jan 2021 09:16:11 +0000 (UTC)
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
X-Inumbo-ID: 1a84fc29-92b8-4a62-b657-1bb1d5f6b70a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610356571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lb+tkPNomeNBwotSLe2nth5GzmjN1HVzGE1ZmMS0HeE=;
	b=Llk103NrRCgq+GGwwZBa0C5yVTrtR1N3ewSj9ockRJHVMO4qaini9t8mpoisY+2YS81Wcm
	g9qqm7OuxYoebQco42Xcikz0DyqUFwKmI3lNkWL8wk6jGxUWdzMhXywIHgZWgmhuZEiPe9
	U2UYJzUm/JU4FQlHlyYuej/LNdiCR78=
Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per
 partition
To: paul@xen.org
Cc: wl@xen.org, iwj@xenproject.org, anthony.perard@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 sstabellini@kernel.org, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org, 'Igor Druzhinin' <igor.druzhinin@citrix.com>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <009d01d6e598$bfdd0110$3f970330$@xen.org>
 <ce4814a8-4f18-c17c-c3e2-99a0ad18e4f1@citrix.com>
 <00ad01d6e7f6$1ebbe610$5c33b230$@xen.org>
 <33322763-6810-3bfc-9573-1e326b38293e@suse.com>
 <00b001d6e7f9$80937a30$81ba6e90$@xen.org>
 <00b101d6e7f9$e342ff20$a9c8fd60$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d5e7f52e-2ec4-a722-e6cf-4b0b9b1cd1d5@suse.com>
Date: Mon, 11 Jan 2021 10:16:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <00b101d6e7f9$e342ff20$a9c8fd60$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.01.2021 10:12, Paul Durrant wrote:
>> From: Paul Durrant <xadimgnik@gmail.com>
>> Sent: 11 January 2021 09:10
>>
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 11 January 2021 09:00
>>>
>>> On 11.01.2021 09:45, Paul Durrant wrote:
>>>> You can add my R-b to the patch.
>>>
>>> That's the unchanged patch then, including the libxl change that
>>> I had asked about and that I have to admit I don't fully follow
>>> Igor's responses? I'm hesitant to give an ack for that aspect of
>>> the change, yet I suppose the libxl maintainers will defer to
>>> x86 ones there. Alternatively Andrew or Roger could of course
>>> ack this ...
>>>
>>
>> I don't think we really need specific control in xl.cfg as this is a fix for some poorly documented
>> semantics in the spec. The flag simply prevents the leaf magically appearing on migrate and I think
>> that's enough.
> 
> ... although adding an option in xl/libxl isn't that much work, I suppose.
> 
> Igor, would you be ok plumbing it through?

This back and forth leaves unclear to me what I should do. I
would have asked on irc, but you're not there as it seems.

Jan

