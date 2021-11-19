Return-Path: <SRS0=jE49=QG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A779EC433EF
	for <xen-devel@archiver.kernel.org>; Fri, 19 Nov 2021 14:07:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0608A6120A
	for <xen-devel@archiver.kernel.org>; Fri, 19 Nov 2021 14:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0608A6120A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=srcf.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.227973.394440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4X9-0004hm-Nx; Fri, 19 Nov 2021 14:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227973.394440; Fri, 19 Nov 2021 14:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4X9-0004hf-Jr; Fri, 19 Nov 2021 14:06:31 +0000
Received: by outflank-mailman (input) for mailman id 227973;
 Fri, 19 Nov 2021 14:06:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hp3=QG=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mo4X8-0004hP-UH
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 14:06:30 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e395c821-4941-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 15:06:29 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:41406)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mo4X5-000qT7-2s (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 19 Nov 2021 14:06:27 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 9CCCC1FD9D;
 Fri, 19 Nov 2021 14:06:27 +0000 (GMT)
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
X-Inumbo-ID: e395c821-4941-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <66644716-dafa-f7de-c5b4-325ec5a49989@srcf.net>
Date: Fri, 19 Nov 2021 14:06:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] x86/dom0: Fix command line parsing issues with
 dom0_nodes=
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jane Malalane <jane.malalane@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119134416.1110-1-andrew.cooper3@citrix.com>
 <b4be209f-c9e8-9e5b-a4ee-70d1a4f5c442@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <b4be209f-c9e8-9e5b-a4ee-70d1a4f5c442@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2021 14:01, Jan Beulich wrote:
> On 19.11.2021 14:44, Andrew Cooper wrote:
>> This is a simple comma separated list, so use the normal form.
>>
>>  * Don't cease processing subsequent elements on an error
>>  * Do report -EINVAL for things like `dom0_nodes=4foo`
>>  * Don't opencode the cmdline_strcmp() helper
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> I guess you will want this backported?

In due course, probably.

For now, Jane is investigating why dom0_nodes=0 isn't working, and this
was a tiny bit I spotted on the side and just decided to fix.

I'm fairly confident there will be more bugfixes coming.

~Andrew

