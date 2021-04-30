Return-Path: <SRS0=vACI=J3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA58C433B4
	for <xen-devel@archiver.kernel.org>; Fri, 30 Apr 2021 07:16:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 443FA61424
	for <xen-devel@archiver.kernel.org>; Fri, 30 Apr 2021 07:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 443FA61424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.120326.227575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcNNX-0002UF-KS; Fri, 30 Apr 2021 07:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120326.227575; Fri, 30 Apr 2021 07:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcNNX-0002U7-H2; Fri, 30 Apr 2021 07:15:59 +0000
Received: by outflank-mailman (input) for mailman id 120326;
 Fri, 30 Apr 2021 07:15:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNDj=J3=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1lcNNV-0002Tk-TN
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 07:15:58 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b9ed3253-6556-4bea-bbfc-2ff0b8b0bec7;
 Fri, 30 Apr 2021 07:15:57 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-j96slHjjPtCQzyW7KnLLGw-1; Fri, 30 Apr 2021 03:15:54 -0400
Received: by mail-ed1-f69.google.com with SMTP id
 h13-20020a05640250cdb02903790a9c55acso29793036edb.4
 for <xen-devel@lists.xenproject.org>; Fri, 30 Apr 2021 00:15:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i19sm1367781ejd.114.2021.04.30.00.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 00:15:52 -0700 (PDT)
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
X-Inumbo-ID: b9ed3253-6556-4bea-bbfc-2ff0b8b0bec7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619766956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=28TamhQnx/WTmTYJRRukTbFCMkH+GJB8ptneJQNf94c=;
	b=a/h2RXTz3elZH9Q3ky3ZB8QY6ojoZO1C8jAtL2ODlZwdfsEQGfd1V1h5broHEiLkAJt5O+
	grj3CrbDaisb8PEJ9lHlQMr4weprWVBkAK0zCRu4SNVmK6Qe+JHYeHGlEgBvX44DFKcPnY
	JCGzXjl2uvlFxfNLg0oPTd40nxi9eDk=
X-MC-Unique: j96slHjjPtCQzyW7KnLLGw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=28TamhQnx/WTmTYJRRukTbFCMkH+GJB8ptneJQNf94c=;
        b=VH9pjcvv6QmCHioD6XGSq/+PwCeEwfsQAlIKxhIGMbB6aG0uFtOEXolerNSN9pXkp8
         5MRjbIzPt+a9GDtmcWots/XLcoZ/SiDQJQW8ztoiGeehA+YYyF0434ExAL/VVsSYoOoh
         bLlHVnCCmFJkz6Dq/TQM0V4D+C/6NOHQ+Mv5e9FQBB96qq5dpxdsKa23HrrKn/NAGpxU
         B4Xm6XJ0KvpVEe/cboSSr+aqM/Svvi2+yd1BQmDRccDHa/waC0m7K1NhVjSQTEXaaQol
         jqgtmhttAZHphi6O8QHIJjuZu9A0ofm75DPW3kC+nw/DGzA0L41RSkCgEiwwcvDqksgl
         vTYA==
X-Gm-Message-State: AOAM530LVF23GEuI09rSxf08JPJNDAVWhwC7PR4V0B1y8feS0qrgHH+y
	55/tlh2kHJjTtRj+4CuqcP+dLLjjgplPN9y+u15HbWqhZNM3Q1+J32kXWRx9PEYepItxNw4xbUW
	VU5GdCl/l85EbX+aa8jk0XArjbZoPe+4AweOHN/nGIBdZj0UTBDel789BI8b8KcUujgu7MydxOL
	HbQDg=
X-Received: by 2002:a17:906:7d82:: with SMTP id v2mr2737726ejo.524.1619766953406;
        Fri, 30 Apr 2021 00:15:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAQdeuZInXmsMkcogPQFLA3VeuUhCp7LSV5xe8bJEmH45eKyauY8xcO7cSejDdlfL6uAEUlg==
X-Received: by 2002:a17:906:7d82:: with SMTP id v2mr2737676ejo.524.1619766953147;
        Fri, 30 Apr 2021 00:15:53 -0700 (PDT)
Subject: Re: [PATCH 1/4] x86/xen/entry: Rename xenpv_exc_nmi to noist_exc_nmi
To: Steven Rostedt <rostedt@goodmis.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <laijs@linux.alibaba.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Christopherson
 <seanjc@google.com>, Andi Kleen <ak@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 Josh Poimboeuf <jpoimboe@redhat.com>, Uros Bizjak <ubizjak@gmail.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Alexandre Chartre <alexandre.chartre@oracle.com>,
 Joerg Roedel <jroedel@suse.de>, Jian Cai <caij2003@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20210426230949.3561-1-jiangshanlai@gmail.com>
 <20210426230949.3561-2-jiangshanlai@gmail.com>
 <20210428172714.53adac43@gandalf.local.home>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d77ee423-53fc-d552-1ff8-6fdf75e416a7@redhat.com>
Date: Fri, 30 Apr 2021 09:15:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210428172714.53adac43@gandalf.local.home>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28/04/21 23:27, Steven Rostedt wrote:
> On Tue, 27 Apr 2021 07:09:46 +0800
> Lai Jiangshan <jiangshanlai@gmail.com> wrote:
> 
>> From: Lai Jiangshan <laijs@linux.alibaba.com>
>>
>> There is no any functionality change intended.  Just rename it and
>> move it to arch/x86/kernel/nmi.c so that we can resue it later in
>> next patch for early NMI and kvm.
> 
> Nit, but in change logs, please avoid stating "next patch" as searching git
> history (via git blame or whatever) there is no such thing as "next patch".

Interesting, I use next patch(es) relatively often, though you're right 
that something like "in preparation for" works just as well.  Yes, it's 
the previous in "git log", but you get what it's meant in practice. :)

Paolo

> Just state: "so that we can reuse it for early NMI and KVM."
> 
> I also just noticed the typo in "resue". Or maybe both NMI and KVM should
> be sued again ;-)
> 
> -- Steve
> 


