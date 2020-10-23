Return-Path: <SRS0=ydFR=D6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC97C388F9
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 16:05:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EB522168B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 16:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="3Lg7JQT3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EB522168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.11139.29517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzYc-0005n9-VO; Fri, 23 Oct 2020 16:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11139.29517; Fri, 23 Oct 2020 16:04:46 +0000
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
	id 1kVzYc-0005n1-SC; Fri, 23 Oct 2020 16:04:46 +0000
Received: by outflank-mailman (input) for mailman id 11139;
 Fri, 23 Oct 2020 16:04:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVzYb-0005mw-1P
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:04:45 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c174df08-0dc6-4639-9cc8-0bfc89dcbbf1;
 Fri, 23 Oct 2020 16:04:44 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzYX-0007uQ-Ew; Fri, 23 Oct 2020 16:04:41 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzYX-0001Qo-5W; Fri, 23 Oct 2020 16:04:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVzYb-0005mw-1P
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:04:45 +0000
X-Inumbo-ID: c174df08-0dc6-4639-9cc8-0bfc89dcbbf1
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c174df08-0dc6-4639-9cc8-0bfc89dcbbf1;
	Fri, 23 Oct 2020 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=cAFotQCaqJldMMQoBx1Mucz8jlPrhF5zZ2dGZIKFe1I=; b=3Lg7JQT3MvAUsmKEZ3ZdWkLDV3
	M9hrE6Zz52Py1ikLT1wHTeQh4t1YDc7iovqAQM8+bS56Kg7t4Fkd/MocqxvkSA0GbwVhynQAvC0U1
	aSBeB9027e6aa8uyqtowOp+lJyTwj7tRuDYZM9JtpKwQVoNHZsdOGkfYeEimDH9OgSfM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzYX-0007uQ-Ew; Fri, 23 Oct 2020 16:04:41 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzYX-0001Qo-5W; Fri, 23 Oct 2020 16:04:41 +0000
Subject: Re: [PATCH] PCI: drop dead pci_lock_*pdev() declarations
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cb644565-92c9-8dbe-8c36-54e8b6b722ad@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <744bb4fb-3e2d-652d-ef55-d42a404851b4@xen.org>
Date: Fri, 23 Oct 2020 17:04:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <cb644565-92c9-8dbe-8c36-54e8b6b722ad@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/10/2020 09:02, Jan Beulich wrote:
> They have no definitions, and hence users, anywhere.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -155,9 +155,6 @@ bool_t pci_device_detect(u16 seg, u8 bus
>   int scan_pci_devices(void);
>   enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn);
>   int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus);
> -struct pci_dev *pci_lock_pdev(int seg, int bus, int devfn);
> -struct pci_dev *pci_lock_domain_pdev(
> -    struct domain *, int seg, int bus, int devfn);
>   
>   void setup_hwdom_pci_devices(struct domain *,
>                               int (*)(u8 devfn, struct pci_dev *));
> 

-- 
Julien Grall

