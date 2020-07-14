Return-Path: <SRS0=aF8x=AZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A7AC433DF
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jul 2020 11:45:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9605522209
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jul 2020 11:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9605522209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvJMT-0005H3-Iv; Tue, 14 Jul 2020 11:44:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvJMS-0005Gy-RM
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 11:44:36 +0000
X-Inumbo-ID: 63abc1f6-c5c7-11ea-92fd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63abc1f6-c5c7-11ea-92fd-12813bfff9fa;
 Tue, 14 Jul 2020 11:44:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 305BAB009;
 Tue, 14 Jul 2020 11:44:37 +0000 (UTC)
Subject: Re: [PATCH v2 2/7] x86/mce: add compat struct checking for
 XEN_MC_inject_v2
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <007679c8-84d5-2e91-e48e-68746741fb45@suse.com>
 <20200714102448.GH7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <89e25262-7ad2-1b82-ed35-b4564ee40f62@suse.com>
Date: Tue, 14 Jul 2020 13:44:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714102448.GH7191@Air-de-Roger>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.07.2020 12:24, Roger Pau Monné wrote:
> On Wed, Jul 01, 2020 at 12:25:48PM +0200, Jan Beulich wrote:
>> --- a/xen/tools/compat-build-header.py
>> +++ b/xen/tools/compat-build-header.py
>> @@ -19,6 +19,7 @@ pats = [
>>   [ r"(^|[^\w])xen_?(\w*)_compat_t([^\w]|$$)", r"\1compat_\2_t\3" ],
>>   [ r"(^|[^\w])XEN_?", r"\1COMPAT_" ],
>>   [ r"(^|[^\w])Xen_?", r"\1Compat_" ],
>> + [ r"(^|[^\w])COMPAT_HANDLE_64\(", r"\1XEN_GUEST_HANDLE_64(" ],
> 
> Why do you need to match with the opening parenthesis?
> 
> Is this for the #ifndef XEN_GUEST_HANDLE_64 instances? Don't they need
> to also be replaced with the compat types?

Well, I wanted to be as strict as possible, i.e. along with
the matching of a non-identifier char at the beginning I
also wanted the other side to be delimited.

Jan

