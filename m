Return-Path: <SRS0=2oDP=7V=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B12CC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2020 14:12:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04FAB2065C
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2020 14:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04FAB2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiIVS-00019f-Bv; Mon, 08 Jun 2020 14:12:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmkZ=7V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jiIVR-00019X-O8
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 14:12:05 +0000
X-Inumbo-ID: 0757c4be-a992-11ea-b27d-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0757c4be-a992-11ea-b27d-12813bfff9fa;
 Mon, 08 Jun 2020 14:12:04 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: f8S7VtXZwabCNZRu6UnBw+Uk1952FBA2EOrtKHBjqWklmQDIRjKmGVWXxOa9c8mdkEulNtuDjg
 IINb/25Yc2boFwHpikb6hm3GdGEXVF0AjYGdOHhr6xwPFPzYxMtoTZJG9BHkif29dyLyUojXpe
 xnujHRv8WarSq4wMGmoHyi7cVLLwUDxAA+tuDEtXOYyEtIcuJeegaQNbELJ+Z5TTFnGUDAWDuX
 NyrrgFzBiyl9eWzhukFHj6njnDYrnSUHkGvSYkr5ictj8Wjy/bxHaGb3HGmiMFA3VvBpMQTFLd
 gyU=
X-SBRS: 2.7
X-MesageID: 19480105
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19480105"
Subject: Re: [PATCH v2 for-4.14] docs/support-matrix: unbreak docs rendering
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200608133433.23659-1-andrew.cooper3@citrix.com>
 <24286.16793.101133.543735@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <27c8c443-2566-3088-c86b-7177f16a1982@citrix.com>
Date: Mon, 8 Jun 2020 15:11:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <24286.16793.101133.543735@mariner.uk.xensource.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/06/2020 14:48, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH v2 for-4.14] docs/support-matrix: unbreak docs rendering"):
>> The cronjob which renders https://xenbits.xen.org/docs/ has been broken for a
>> while.  commitish_version() pulls an old version of xen/Makefile out of
>> history, and uses the xenversion rule.
>>
>> Currently, this fails with:
> Thanks for fixing this!
>
>> +    local maj=$(sed -n 's/.*XEN_VERSION.*= \([0-9]\+\)/\1/p' < "$tmp_versionfile")
>> +    local min=$(sed -n 's/.*XEN_SUBVERSION.*= \([0-9]\+\)/\1/p' < "$tmp_versionfile")
>> +    if [[ -z $maj || -z $min ]];
> I would prefer to avoid use of the unusual bash-specific [[ ]] syntax,
> not because of concerns about portability to other shells (since this
> is a #!/bin/bash script) but because many programmers won't be
> familiar with it.
>
> Would you mind writing this instead
>
>   +    if test -z "$maj" || test -z "$min"; then
>
> ?

Single square brackets would be consistent with the rest of the script,
if you're happy with that?

>> +    printf "%d.%d\n" "${maj}" "${min}"
> The { } here are not necessary but I don't kind if you feel they add
> clarity.
>
> You might also want to retain some text in the comment about what
> assumptions we are making about xen/Makefile.  Different assumptions
> to before, but assumptions nevertheless.
>
> In any case, with or without the changes I suggest above:
>
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
>
> On IRC:
>
> 14:35 <andyhhp__> Diziet: jbeulich: For the docs support-matrix
> fix, any concerns with me backporting it immediately?
>
> Having thought about this properly, I don't think we need to urgently
> backport this.  In our own infrastructure, the one from staging (or
> maybe it is master) is used.  The same script is used to parse all
> older versions.

Ah - I'd not spotted the logic to limit it to staging/master only.

In which case it won't block docs generation on older branches.

~Andrew

