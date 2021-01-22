Return-Path: <SRS0=o5zc=GZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FB5C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 18:34:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68AD02076E
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 18:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68AD02076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.73036.131660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l31Fz-0006Mv-VD; Fri, 22 Jan 2021 18:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73036.131660; Fri, 22 Jan 2021 18:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l31Fz-0006Mo-Qx; Fri, 22 Jan 2021 18:34:03 +0000
Received: by outflank-mailman (input) for mailman id 73036;
 Fri, 22 Jan 2021 18:34:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l31Fy-0006LB-AT
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 18:34:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l31Fs-0005e1-JC; Fri, 22 Jan 2021 18:33:56 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l31Fs-0006oc-Ae; Fri, 22 Jan 2021 18:33:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=69D4744myKeJSYQivF4TQbkmqasd9i0L3flLrIw/364=; b=13EwIonz3X5bKj1l+SuCvwNLuD
	SsCLY1MgGvIL4tl5QkFQQGIBJaMQZcEwvOoej0CtIdCH+HBj+izeHbiIX7euwizFEpeZPZCVFT17U
	8QPzA3+zgOfwVdXw6U/jvwWX/TFMrS08gn1ig8RbRcMa3x/I2hMb4tSvTtpVOag/OX5w=;
Subject: Re: [PATCH v2 1/4] xl: Add support for ignore_msrs option
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 jun.nakajima@intel.com, kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
 <edc67950-7d8f-5551-23c6-7b4a398ec9cf@xen.org>
 <189bbbab-e3c6-c7d4-84af-63e568f23dd3@oracle.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c7db8ca5-cb14-353e-0745-617482b77bc7@xen.org>
Date: Fri, 22 Jan 2021 18:33:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <189bbbab-e3c6-c7d4-84af-63e568f23dd3@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 22/01/2021 18:28, Boris Ostrovsky wrote:
> 
> 
> On 1/22/21 4:52 AM, Julien Grall wrote:
>> Hi Boris,
>>
>> On 20/01/2021 22:49, Boris Ostrovsky wrote:
>>> This option allows guest administrator specify what should happen when
>>> guest accesses an MSR which is not explicitly emulated by the hypervisor.
>>>
>>> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>> ---
>>>    docs/man/xl.cfg.5.pod.in         | 20 +++++++++++++++++++-
>>>    tools/libs/light/libxl_types.idl |  7 +++++++
>>>    tools/xl/xl_parse.c              |  7 +++++++
>>>    3 files changed, 33 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>>> index c8e017f950de..96ce97c42cab 100644
>>> --- a/docs/man/xl.cfg.5.pod.in
>>> +++ b/docs/man/xl.cfg.5.pod.in
>>> @@ -2044,7 +2044,25 @@ Do not provide a VM generation ID.
>>>    See also "Virtual Machine Generation ID" by Microsoft:
>>>    L<https://docs.microsoft.com/en-us/windows/win32/hyperv_v2/virtual-machine-generation-identifier>
>>>    -=back
>>> +=over
>>> +
>>> +=item B<ignore_msrs="STRING">
>>> +
>>> +Determine hypervisor behavior on accesses to MSRs that are not emulated by the hypervisor.
>>
>> The description of the feature looks very x86 focus. Yet, it seems to be defined as a generic one.
>>
>> Could you clarify whether this is intended to be re-usable by other architectures?
> 
> 
> x86 only. I'll add appropriate note.

Thanks. In which case, I would suggest to move the definition of 
ignore_msrs in the idle to an x86 specific structure. Maybe "arch_x86"?

I noticed that none exists today, but we could duplicate that "arch_arm" 
one.

Wei, Ian, what do you think?

Cheers,

-- 
Julien Grall

