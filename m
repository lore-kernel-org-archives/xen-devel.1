Return-Path: <SRS0=61/H=ED=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70BCC4363A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 07:25:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 455A9223FB
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 07:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="lx6EeuwB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 455A9223FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.13326.33879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXfpo-0001g7-Cx; Wed, 28 Oct 2020 07:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13326.33879; Wed, 28 Oct 2020 07:25:28 +0000
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
	id 1kXfpo-0001g0-A5; Wed, 28 Oct 2020 07:25:28 +0000
Received: by outflank-mailman (input) for mailman id 13326;
 Wed, 28 Oct 2020 07:25:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXfpn-0001fv-Ap
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 07:25:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c0f4f07-aeb0-452c-a061-10b968526896;
 Wed, 28 Oct 2020 07:25:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D274FB1B5;
 Wed, 28 Oct 2020 07:25:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXfpn-0001fv-Ap
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 07:25:27 +0000
X-Inumbo-ID: 2c0f4f07-aeb0-452c-a061-10b968526896
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2c0f4f07-aeb0-452c-a061-10b968526896;
	Wed, 28 Oct 2020 07:25:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603869925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJoszYaqabhvfmhXSdo1KsONfLselggym6Z5LR8lf6w=;
	b=lx6EeuwB6MjXRUplt1WETSTrAvpUM9YH09YAKdZ6XHh8dfs7kPAaJPGm/UNsGILFp8JtHD
	sB4nrsw1tvFZqgpbpaS9ZNKBYCTp3V0My4pqKn97Q/+KPfmikz6U85kjRmgP3t/Co+lMYf
	Vm9wxe9+9KOAtDkd9sRUnpRGfUMMWjw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D274FB1B5;
	Wed, 28 Oct 2020 07:25:25 +0000 (UTC)
Subject: Re: [PATCH v1 2/4] xen/pci: Introduce new CONFIG_HAS_PCI_ATS flag for
 PCI ATS functionality.
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <cover.1603731279.git.rahul.singh@arm.com>
 <1bb971bed3f5a56b0691fbcfd0346ae721ba049f.1603731279.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2cef4162-80bb-8689-6109-7fb964a3d24a@suse.com>
Date: Wed, 28 Oct 2020 08:25:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1bb971bed3f5a56b0691fbcfd0346ae721ba049f.1603731279.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 18:17, Rahul Singh wrote:
> @@ -48,5 +50,27 @@ static inline int pci_ats_device(int seg, int bus, int devfn)
>      return pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
>  }
>  
> +#else
> +
> +static inline int enable_ats_device(struct pci_dev *pdev,
> +                                    struct list_head *ats_list)
> +{
> +    return -ENODEV;

In addition to what Stefano has said, I don't think this is an
appropriate return value here either - -EOPNOTSUPP would seem
quite a bit closer to reality.

Jan

