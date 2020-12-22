Return-Path: <SRS0=eaQF=F2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E0EC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 22 Dec 2020 01:39:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2C3322A83
	for <xen-devel@archiver.kernel.org>; Tue, 22 Dec 2020 01:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2C3322A83
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.57627.100888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krWeA-0004Q3-Ft; Tue, 22 Dec 2020 01:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57627.100888; Tue, 22 Dec 2020 01:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krWeA-0004Pw-Bf; Tue, 22 Dec 2020 01:39:30 +0000
Received: by outflank-mailman (input) for mailman id 57627;
 Tue, 22 Dec 2020 01:39:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYY1=F2=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1krWe8-0004Pr-Qr
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 01:39:28 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c3d5ed7-f087-4e1d-b172-a9566a95a7e4;
 Tue, 22 Dec 2020 01:39:27 +0000 (UTC)
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
X-Inumbo-ID: 3c3d5ed7-f087-4e1d-b172-a9566a95a7e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608601167;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=bUeQXKJqLiq9cmUZoaFFSY50qENVTMldeUr+bLgxyqw=;
  b=dCTMnMCW4B2Dvw541FdiQ+Rwbw1GKsPVZAqu+nYg48mGebcGYr+/dRJo
   tmN6aXYiaiJ3gA60wqWN0lt6KWg3luCZyBmr5oJngUZC7/Q4tsOvIHAyb
   etAcf28nL82Auv2AA17UAZZlK1HFo4LNWBBFO5y5tdw6RivVXHvwEq5/d
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7VVNWdtuFWeU3i+I0lC5aUsP6YDmrz/B/01D3HzUSLP6aOJzROlVQ+5gIewieh10P7bmiV9LE1
 G+2aXs9gH9kRagkw4tnzfeFMTmtlaAQo52BgS6tgdvVXx259FHI93cAwCGRTQoamia2hgKXLe/
 n7O62GehfZBMOZGGZ1iJshgPCJG20GagDvWubwFlBxh5NYpdiNZJxeWpGTNy/c1FP30t7nC7cS
 /wJCANmfu0jzokJmGVfkqmnqQ+N0fcFCeVvATiZKXxfwMKChbDSEq/lKdEg59C2lHIgi7PBONn
 Hoc=
X-SBRS: 5.2
X-MesageID: 34071410
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,438,1599537600"; 
   d="scan'208";a="34071410"
Subject: Re: [PATCH v2] x86/intel: insert Ice Lake X (server) model numbers
To: Jan Beulich <jbeulich@suse.com>
CC: <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>,
	<jun.nakajima@intel.com>, <kevin.tian@intel.com>,
	<xen-devel@lists.xenproject.org>
References: <1603075646-24995-1-git-send-email-igor.druzhinin@citrix.com>
 <d6265c58-b553-3dee-9817-1a8673472972@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <398d0e64-0154-faea-16a8-1677a2a1c3e9@citrix.com>
Date: Tue, 22 Dec 2020 01:39:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d6265c58-b553-3dee-9817-1a8673472972@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21/12/2020 16:36, Jan Beulich wrote:
> On 19.10.2020 04:47, Igor Druzhinin wrote:
>> LBR, C-state MSRs and if_pschange_mc erratum applicability should correspond
>> to Ice Lake desktop according to External Design Specification vol.2.
>>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>> ---
>> Changes in v2:
>> - keep partial sorting
>>
>> Andrew, since you have access to these documents, please review as you have time.
> 
> Coming back to this - the recent SDM update inserted at least the
> model numbers, but besides 6a it also lists 6c. Judging from the
> majority of additions happening in pairs, I wonder whether we
> couldn't (reasonably safely) add 6c then here as well. Of course
> I still can't ack the change either way with access to just the
> SDM...

I checked what 0x6c is and it appears to be Ice Lake-D (next gen Xeon D).
The information from EDS vol.2 on Ice Lake-D available to us corresponds to what
I got for Ice Lake X. So the numbers could be added here as soon as Andrew finds
time to review that one.

Igor

