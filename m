Return-Path: <SRS0=BiGO=H3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D5BC433E9
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 13:11:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 617EC64EBD
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 13:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 617EC64EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89748.169311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGQn-0000Hj-Id; Thu, 25 Feb 2021 13:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89748.169311; Thu, 25 Feb 2021 13:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGQn-0000Ha-FZ; Thu, 25 Feb 2021 13:11:49 +0000
Received: by outflank-mailman (input) for mailman id 89748;
 Thu, 25 Feb 2021 13:11:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFGQl-0000HV-Sj
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:11:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57add156-7d44-4ffe-8f96-f2fb5e1ab63b;
 Thu, 25 Feb 2021 13:11:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77448AFB5;
 Thu, 25 Feb 2021 13:11:46 +0000 (UTC)
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
X-Inumbo-ID: 57add156-7d44-4ffe-8f96-f2fb5e1ab63b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614258706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLh5jHnGXF8Rf125Zr9n9gQbtHEr2OnV33y4nNQFXpM=;
	b=DhYxzZGW97qcmn9ftQMfpz5P8ieWQypQsM+2WF+dwMzXbLG2YzqnHFDYxnG+uUWH+2yLGm
	tlgnDeLC6QmjTK1OlQy9Hv2tFSgHWRryxrDK4Zxrr9tb90TTAf74FY5q3yn4BR1cijZ/YB
	2nPLXVcv+afprtcQPmfjjudnbG+E73Q=
Subject: Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization
 without reserved bits
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
Message-ID: <dae5479e-9974-334b-7f4f-e4194e435aaa@suse.com>
Date: Thu, 25 Feb 2021 14:11:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 14:03, Jan Beulich wrote:
> When none of the physical address bits in PTEs are reserved, we can't
> create any 4k (leaf) PTEs which would trigger reserved bit faults. Hence
> the present SHOPT_FAST_FAULT_PATH machinery needs to be suppressed in
> this case, which is most easily achieved by never creating any magic
> entries.
> 
> To compensate a little, eliminate sh_write_p2m_entry_post()'s impact on
> such hardware.

As to 4.15: Without this shadow mode simply won't work on such (new)
hardware. Hence something needs to be done anyway. An alternative
would be to limit the change to just the guest-no-present entries (to
at least allow PV guests to be migrated), and refuse to enable shadow
mode for HVM guests on such hardware. (In this case we'd probably
better take care of ...

> While at it, also avoid using an MMIO magic entry when that would
> truncate the incoming GFN.

... this long-standing issue, perhaps as outlined in a post-commit-
message remark.)

The main risk here is (in particular for the MMIO part of the change
I suppose) execution suddenly going a different path, which has been
unused / untested (for this specific case) for years.

Jan

