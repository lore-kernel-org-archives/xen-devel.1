Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14D5C88E75
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 06:11:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424699.1648952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7RoJ-0006cN-QL; Fri, 18 Sep 2026 06:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424699.1648952; Fri, 18 Sep 2026 06:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7RoJ-0006cF-Mw; Fri, 18 Sep 2026 06:10:59 +0000
Received: by outflank-mailman (input) for mailman id 1424699;
 Fri, 18 Sep 2026 06:10:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x7RoH-0006c9-Q8
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 06:10:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7RoH-00FfMW-3K
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:10:57 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aacd5ef-e002-0a2a0a5209dd-0a2a4507b232-8
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:10:57 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aacd5f0-b4ea-0a2a45070019-4a7de18d9e18-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:10:56 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e79a408deso1596635e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 23:10:56 -0700 (PDT)
Received: from [10.59.3.202] ([146.0.124.57]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd216028sm128708515e9.7.2026.09.17.23.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 23:10:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789711856; x=1790316656; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKSdUrl5slR8sYu4cKVxDwvqNkKE4AHINuHc25H5PF8=;
        b=JvgyCHbKORZxpxvElmQyO3IozsyZAhw9wJ1zx3cDkb/e5t7OvudfvUhjw3ZBHLPm2M
         ACvuY3mu1qH5NJRSPZAkldgmuBjpYydGs1CF9bxm/ElRSeUegSj+ScgaONofDCtO6Wtx
         AzO0vqQfcZTNeUY4kL14mdTkB9IFNv6NSxc3stX6KpJO2rj29RPk+n001a+vm/0BJ7JB
         /vLGiny0j2J0giwmL3TFgWQtUqdXaJDpU8knHBhzhPcfGAy1gQJgdIY4TZt7DT4k5Ice
         eijc3EbFRYjvmQkF1ReSGop0ASGLdocd0pV4JDt6n8AMyJ5KuOqEwIlJM6pdi7PdTemW
         oukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789711856; x=1790316656;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKSdUrl5slR8sYu4cKVxDwvqNkKE4AHINuHc25H5PF8=;
        b=J6c1Tq2PtwFVpceAwjBK9bFxQMYnSAm3G4ue5IIp1o56OR+ZjlzA1uN1PHjQiHlgJ0
         6ZtoSY0vfh90gKba2nSFsL/lX1erlP4pE54tFyaMQEXUMKRaPRFaaCBsUuEQlupQjQEg
         oLWe58RMWEvT6jBSWQr09EFNH7rUaleDHxgKNbdHQm1PlW+aAcr3RbGxAlwohGyMNs3I
         CEx851EPdN/8kViySxL/igeEEJ/vjub+c7kHQq8s4vHOwbVGpxxkS8c3bKZNMeI8LdsE
         F6Z8KHSDuaoJDeWIiDc0zdB/rp8AFJ4b40mJeV23l0NuDeWLzZP0T8BlI5wnRifc5Ehb
         0Cww==
X-Gm-Message-State: AFuF++ncoprtqmfe3pjaf5ddtzKusmJO+Kk1qhkpbAO2Wt7YGl1jjexI
	Bb5oGDmZdzIkiFKPvu13WxvUtNZTvbk56ySBzFuwqc0Fu74/B/EoTUL/5GlThKjuNQ==
X-Gm-Gg: AYBFou1QgGbtELNRdSj0L/jPOH/Hga4fVKm04/sUSF4RPTEMDU+UevJeVLG/tl+TTrq
	vjfdumvFIxYDlMf3jTA+7JAlhe6UpZD9eKiZNUAS29ywvWNZ0267TmQ22gC0LIJ9KYjOidHMcB1
	2agkfizBRyx2Q6LaM2RdojXORjdOjKlDKt80YyQGJFJLF5h2GdKRZju1gqaEj4I6sFNB+S5oHVD
	ida4oEgw77qXE2F0gRS12v1Rb7GAp1wBnPF4kMDN3LSmWOICqSeFv3iNAGObiGOc+pWqgxBKaJr
	9Vi07L4f9gneBfx+brbV4LkQUJuW63JnGK9lKcquBYzmHZ+1Apc1G3OiCnmSlX6ljUPT4Y8HEhl
	apobMNu9U9/MP9vdzX/UCNvSMVpYn0uE5I++maDQA5IrTXqeYPHYvlJlSWauSHLgi2uCj5yeGVz
	VvdXn0cWAx+pBWKKfPFd6qnvgi8+8jPLfElvb177NqyNJ381ygWKcgEHnhi887t4k55QWHgsCH2
	tk=
X-Received: by 2002:a05:600c:8b61:b0:49d:e0c:e55e with SMTP id 5b1f17b1804b1-49fc574a635mr15220055e9.23.1789711853175;
        Thu, 17 Sep 2026 23:10:53 -0700 (PDT)
Message-ID: <284816d0-b7e5-4e5a-8feb-d3ee984c95e2@suse.com>
Date: Fri, 18 Sep 2026 08:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Assisted-by tag
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>
References: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com>
 <f0cd81c0-81d2-4273-a2c8-736ce976670a@suse.com>
 <CAFLBxZbhF8=1RC4-6jXnaVYjxxk6aGTadA_kaCLbfop2xqYyuw@mail.gmail.com>
 <aqwzM5Cly1kSGd-O@mail-itl>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aqwzM5Cly1kSGd-O@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1789711857-A46CAAE4-DD7F94D9/0/0
X-purgate-type: clean
X-purgate-size: 853

On 17.09.2026 20:36, Marek Marczykowski wrote:
> On Wed, Sep 16, 2026 at 04:37:07PM +0200, George Dunlap wrote:
>> Discovered by sashiko+Opus.
> 
> How does that influence tags on a patch fixing the issue? Should that be
> Reported-by: sashiko+Opus ? Or maybe Reported-by: George + Assisted-by:
> sashiko+Opus? Or something else?

I was wondering the same, and my plan was to use two Reported-by: here
(as I was assuming I was to make a patch here, which maybe now you're
intending to do). The alternative I had thought of was to have the
Assisted-by: ahead of the Reported-by:, thus trying to clarify (by tags
being in chronological order) that it was the finding of the issue
where AI had helped. (In principle a 2nd Assisted-by: after the
Reported-by: could then indicate which [other] AI helped with making
the patch itself.)

Jan

