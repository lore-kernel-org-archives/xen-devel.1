Return-Path: <SRS0=o2nd=EL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591FDC00A89
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 08:27:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEB3020729
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 08:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dCM5TJtX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEB3020729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.19657.44892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaabt-0006Fc-Su; Thu, 05 Nov 2020 08:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19657.44892; Thu, 05 Nov 2020 08:27:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaabt-0006FV-Pw; Thu, 05 Nov 2020 08:27:09 +0000
Received: by outflank-mailman (input) for mailman id 19657;
 Thu, 05 Nov 2020 08:27:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaabs-0006FQ-KG
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 08:27:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12305d7e-24b5-4eb5-a4fa-dd9729b4d165;
 Thu, 05 Nov 2020 08:27:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5976AAF1;
 Thu,  5 Nov 2020 08:27:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaabs-0006FQ-KG
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 08:27:08 +0000
X-Inumbo-ID: 12305d7e-24b5-4eb5-a4fa-dd9729b4d165
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 12305d7e-24b5-4eb5-a4fa-dd9729b4d165;
	Thu, 05 Nov 2020 08:27:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604564826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0bbq7bYVfWFcwRu4kTljUaHGYEoVOcrIhukQmraJOw=;
	b=dCM5TJtX7B6lDRAOas3+8Eew1IXo5VpCOnog5Vtw64pOyB6/b16wn/T5cKymvx6lYDaASI
	dRsScF0TaB0mSpvqBl5MPaFVAI3UPQdiHJymbLTDId2qE+MpxjsiVmi7if4TbYQukFzL1t
	wd9CKjvBQlYw42MsJ7KBBIts41yYvl0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B5976AAF1;
	Thu,  5 Nov 2020 08:27:06 +0000 (UTC)
Subject: Re: [PATCH v2] tools/python: pass more -rpath-link options to ld
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <8cf8cfa9-2b0c-123a-2d23-8932e61085fa@suse.com>
 <20201104171928.GA1647@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5960e447-9e3d-a02e-3f11-c6aac01d6452@suse.com>
Date: Thu, 5 Nov 2020 09:27:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104171928.GA1647@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.11.2020 18:19, Elliott Mitchell wrote:
> On Wed, Nov 04, 2020 at 03:57:49PM +0100, Jan Beulich wrote:
>> --- a/tools/python/Makefile
>> +++ b/tools/python/Makefile
>> @@ -8,19 +8,21 @@ PY_CFLAGS = $(CFLAGS) $(PY_NOOPT_CFLAGS)
>>  PY_LDFLAGS = $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
>>  INSTALL_LOG = build/installed_files.txt
>>  
>> +setup.py = CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" \
>> +           SHLIB_libxenctrl="$(SHLIB_libxenctrl)" \
>> +           SHLIB_libxenguest="$(SHLIB_libxenguest)" \
>> +           SHLIB_libxenstore="$(SHLIB_libxenstore)" \
>> +           $(PYTHON) setup.py
>> +
>>  .PHONY: build
>>  build:
>> -	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
>> +	$(setup.py) build
>>  
>>  .PHONY: install
>>  install:
>>  	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
>> -
>> -	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" \
>> -		LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py install \
>> -		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>> +	$(setup.py) install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>>  		--root="$(DESTDIR)" --force
>> -
>>  	$(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)
>>  	$(INSTALL_PYTHON_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_BIN)
> 
> Shouldn't similar work of moving all the environment variable settings to
> a $(setup.py) variable be done for tools/pygrub/Makefile?
> 
> tools/python/Makefile and tools/pygrub/Makefile are presently quite
> similar and keeping them similar seems a Good Idea(tm).

The only dependency there is libfsimage - I don't even know whether
the same approach can be used there. If it can, I'd say: Likely, but
I've not observed a similar problem with pygrub, and it's only the
build problem I'm after here, sorry. As said in the post-commit-
message remark, I think there's more consolidation to be done here,
too, and I think it's at that point when pygrub, as applicable,
should also be brought in sync.

Jan

