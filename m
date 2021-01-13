Return-Path: <SRS0=UsJP=GQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F78CC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 19:08:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84F3222D05
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 19:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84F3222D05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cam.ac.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.66724.118623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlV9-0005JW-5f; Wed, 13 Jan 2021 19:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66724.118623; Wed, 13 Jan 2021 19:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlV9-0005JP-2V; Wed, 13 Jan 2021 19:08:15 +0000
Received: by outflank-mailman (input) for mailman id 66724;
 Wed, 13 Jan 2021 19:08:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdpw=GQ=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kzlV6-0005JK-GD
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 19:08:13 +0000
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fc52e12-10d7-431c-ac43-10164c0b6d96;
 Wed, 13 Jan 2021 19:08:10 +0000 (UTC)
Received: from 88-111-100-194.dynamic.dsl.as9105.com ([88.111.100.194]:35986
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kzlV3-000AmM-Lb (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Wed, 13 Jan 2021 19:08:09 +0000
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
X-Inumbo-ID: 2fc52e12-10d7-431c-ac43-10164c0b6d96
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bzwPzdsypEdwwIopWhUEHlvVB2EuVaqKXfioFHBs2ug=; b=yqtGbfRg0cTZevR9HpE+G2H1Bu
	mECVn07tbAonxA12JFGCBAH1yid2CraBMjF9o0VwKP2p71O9SpUoOAIPK0g+ycqEjVHMKiOiwazUN
	J2lckYe/dI1BP89wj3KhP09BKYJSsv49vrj7sF+BIe8Y3KVkuiUnwzF454rPZ7ODajKs=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH 2/3] tools: Move xen-access from tests/ to misc/
To: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <20210113123455.23209-1-andrew.cooper3@citrix.com>
 <20210113123455.23209-3-andrew.cooper3@citrix.com>
 <CABfawhmiD-UXRBvPd-6=OayvkMf0G6pZZFawasuWiv7DNN937A@mail.gmail.com>
From: Andrew Cooper <amc96@cam.ac.uk>
Message-ID: <44cfc9a7-4b73-b23f-4faf-9eef0659b570@cam.ac.uk>
Date: Wed, 13 Jan 2021 19:08:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CABfawhmiD-UXRBvPd-6=OayvkMf0G6pZZFawasuWiv7DNN937A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 13/01/2021 18:50, Tamas K Lengyel wrote:
> On Wed, Jan 13, 2021 at 7:35 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> xen-access is a tool for a human to use, rather than a test.  Move it
>> into misc/ as a more appropriate location to live.
>>
>> Move the -DXC_WANT_COMPAT_DEVICEMODEL_API from CFLAGS into xen-access.c itself
>> to avoid adding Makefile complexity.
> Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

Thanks.  I'll also update the MAINTAINERs path, which I forgot to do.

~Andrew

