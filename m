Return-Path: <SRS0=kHyn=7B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45744C433E1
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 07:52:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F1AB207E8
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 07:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F1AB207E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jax2o-0000Qd-UU; Tue, 19 May 2020 07:52:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aMO8=7B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jax2n-0000QY-Te
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 07:52:09 +0000
X-Inumbo-ID: a409276e-99a5-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a409276e-99a5-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 07:52:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A962BAC6D;
 Tue, 19 May 2020 07:52:10 +0000 (UTC)
Subject: Re: [PATCH v10 02/12] xen: add a generic way to include binary files
 as variables
To: Jan Beulich <jbeulich@suse.com>
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-3-jgross@suse.com>
 <24d44577-2e59-1428-2b63-08c89a0046d8@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0a46fa63-5914-8ced-cd38-fa2c938d167b@suse.com>
Date: Tue, 19 May 2020 09:52:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <24d44577-2e59-1428-2b63-08c89a0046d8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.05.20 09:47, Jan Beulich wrote:
> On 19.05.2020 09:20, Juergen Gross wrote:
>> --- a/xen/xsm/flask/Makefile
>> +++ b/xen/xsm/flask/Makefile
>> @@ -39,6 +39,9 @@ $(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
>>   obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
>>   flask-policy.o: policy.bin
>>   
>> +flask-policy.S: $(XEN_ROOT)/xen/tools/binfile
>> +	$(XEN_ROOT)/xen/tools/binfile -i $@ policy.bin xsm_flask_init_policy
> 
> I realize the script gets installed as executable, but such
> permissions can get lost. Typically I think we invoke the shell
> instead, with the script as first argument. Thoughts? Would
> affect patch 8 then as well. Sorry for noticing this only now.

Shall I resend or would you do that while committing?


Juergen


