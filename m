Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE37CC433E0
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 12:35:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7C9920678
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 12:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7C9920678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg68T-0008T9-GE; Tue, 02 Jun 2020 12:35:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg68S-0008T4-GW
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:35:16 +0000
X-Inumbo-ID: 819c5a1a-a4cd-11ea-81bc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 819c5a1a-a4cd-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 12:35:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BEA70AA7C;
 Tue,  2 Jun 2020 12:35:15 +0000 (UTC)
Subject: Re: [PATCH v2 06/14] x86/shstk: Create shadow stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-7-andrew.cooper3@citrix.com>
 <8a02b933-3b7e-ded9-8bf3-a1c35f2ef7ae@suse.com>
 <fe8f077d-2048-38af-5deb-0d9dda48cf36@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <77701f03-9755-3d1f-101e-21b02e525231@suse.com>
Date: Tue, 2 Jun 2020 14:35:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <fe8f077d-2048-38af-5deb-0d9dda48cf36@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 21:35, Andrew Cooper wrote:
> On 28/05/2020 13:50, Jan Beulich wrote:
>> On 27.05.2020 21:18, Andrew Cooper wrote:
>>> +    /* Primary Shadow Stack.  1x 4k in stack page 5. */
>>>      p += PRIMARY_SHSTK_SLOT * PAGE_SIZE;
>>> -    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
>>> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
>>> +        write_sss_token(p + PAGE_SIZE - 8);
>>> +
>>> +    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
>>>  }
>>>  
>>>  void memguard_unguard_stack(void *p)
>> Would this function perhaps better zap the tokens?
> 
> Why?  We don't zap any other stack contents, and let the regular page
> scrubbing clean it.

Except that Xen used pages, if re-used by Xen itself, may not go
through a round of scrubbing. As long as we use 1:1 mappings,
re-using the same page for a shadow stack will end up having the
necessary token already in place. Looks like a defense-in-depth
measure to zap them off as soon as a page goes out of (shadow
stack) use.

Jan

