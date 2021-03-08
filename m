Return-Path: <SRS0=fV0s=IG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5013DC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 14:52:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02971650F7
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 14:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02971650F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.95002.179170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJHFD-0005RJ-Lt; Mon, 08 Mar 2021 14:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95002.179170; Mon, 08 Mar 2021 14:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJHFD-0005Qx-BF; Mon, 08 Mar 2021 14:52:27 +0000
Received: by outflank-mailman (input) for mailman id 95002;
 Mon, 08 Mar 2021 14:52:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3/5=IG=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1lJHFB-0005QH-Tk
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 14:52:25 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 898f1e11-6962-457e-ae67-7cf5648fbd22;
 Mon, 08 Mar 2021 14:52:25 +0000 (UTC)
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
X-Inumbo-ID: 898f1e11-6962-457e-ae67-7cf5648fbd22
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615215145;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=XQkacuw92YZ6s7P1uWP7jgpIFq+z/6x0But1e7Mt5q4=;
  b=N74eB0jPPR4l7lHRWx+z37Rbseo4j0u7TI7ll7mJwmu4e5jS45Mj8yr4
   FZyCREXQ4LMALatlfmBZv2n47Ck18eYUKrX5XCLP8BuJiild61HEXtCWs
   N2sZoAjQTLvCw9TMAYa3cE2pPizGNGtVoDVdXCIdLnNtOUa1QvXknEVTk
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jRy1UYqBSfW2yl9OZHRJd41YtrqxamoXGfBvcIC8zZyj/eXMKgZVnxkaE89Y8aiHCK5VsGf3ib
 YTSKMxSAA0PmqhBspGhMbcOI8HvOmBPEXmhzxwpTdipw6XhLJDBG4cEbyNyWUelZbdsgztmzZD
 SRXxRdHFIt5/TsCpNwJP8e9RjyRLUzK5jppGEJZOA9YO8xHhSOW58JEvRHu7SjtkIgzbRTiHV9
 qqnzxs0sV4yobwj29RdIwtUvwRRAPq485gN+Sq6lZ9I7zeYZWHeXlVRrh5WgU5J/OsumEm95wy
 ufo=
X-SBRS: 4.0
X-MesageID: 38957321
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="38957321"
Subject: Re: [PATCH for-4.15] vtd: make sure QI/IR are disabled before
 initialisation
To: Jan Beulich <jbeulich@suse.com>
CC: <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>,
	<kevin.tian@intel.com>, <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>
References: <1615186802-5908-1-git-send-email-igor.druzhinin@citrix.com>
 <de357605-ef0c-82ba-0ae2-ef96f1dd23f3@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <ce950c68-1d44-bcbd-b071-131777b87a38@citrix.com>
Date: Mon, 8 Mar 2021 14:52:20 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <de357605-ef0c-82ba-0ae2-ef96f1dd23f3@suse.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/03/2021 08:18, Jan Beulich wrote:
> On 08.03.2021 08:00, Igor Druzhinin wrote:
>> BIOS might pass control to Xen leaving QI and/or IR in enabled and/or
>> partially configured state. In case of x2APIC code path where EIM is
>> enabled early in boot - those are correctly disabled by Xen before any
>> attempt to configure. But for xAPIC that step is missing which was
>> proven to cause QI initialization failures on some ICX based platforms
>> where QI is left pre-enabled and partially configured by BIOS.
> 
> And those systems then tell us to avoid use of x2APIC? I would have
> expected that on modern systems we wouldn't see such quirky firmware
> behavior anymore. Anyway, half a sentence to this effect might help
> here, as without such firmware behavior the only way to run into
> this ought to be use of "no-x2apic" on the command line. Which in
> turn might require justification (and potentially a fix elsewhere in
> the code to make use of that option unnecessary).
> 
>> Unify the behaviour between x2APIC and xAPIC code paths keeping that in
>> line with what Linux does.
>>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with some editing of the description. If no other need for a v2
> arises, I suppose whatever you come up with could be folded in
> while committing.

How about:

"... But for xAPIC that step is missing which was proven to cause QI 
initialization failures on some ICX based platforms where QI is left 
pre-enabled and partially configured by BIOS. That problem becomes hard 
to avoid since those platforms are shipped with x2APIC opt out being 
advertised by default at the same time by firmware.
..."

Igor

