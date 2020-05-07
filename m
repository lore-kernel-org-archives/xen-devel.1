Return-Path: <SRS0=QEX0=6V=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD3CC38A24
	for <xen-devel@archiver.kernel.org>; Thu,  7 May 2020 17:27:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F59820A8B
	for <xen-devel@archiver.kernel.org>; Thu,  7 May 2020 17:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="VAMNH38w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F59820A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWkIS-0007bx-Qj; Thu, 07 May 2020 17:26:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53Et=6V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jWkIR-0007bs-7a
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 17:26:55 +0000
X-Inumbo-ID: f190c9a0-9087-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f190c9a0-9087-11ea-b9cf-bc764e2007e4;
 Thu, 07 May 2020 17:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588872415;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LR34SWfeleLjzXZQ9LoxWEPpFUaT9bSTuTKCJAVw5K4=;
 b=VAMNH38wr5MsyyNgwlAqBCDPj12aPQH8nwP7ejahgBvZr+vhLtDWwCCN
 HQm7247Udsf6ByLwPmqdiZklxh5D6Eto5G9hJjHxuKhU8cJzAoumPukwf
 SF3neczHtBKz9oD0l0kjUPXKA9lFsdTNgUaNDFfkTL3dewr7w3rH35rkM U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eS/OeqLO/8MeKOgG/u67CxxTmP7DRjAKrh1xQb6ZUXI8aaDnEeEFanrlowPWLCEZA42aQT+BXZ
 8B1shmrGbf96Q7zunQPnGObyN/6ftTwoNZ7kuMBa8LVGqBxkJvxapSJHcz5B57fPjWTZK9jr/5
 YU7FWFAvgNfwKChzBqLefOx80WBPhYLqaluU7NO2/aJNO/aN2WpS3xfh9yom9LDVxwewRhdB6k
 k9WCwOR9WgSCUUs0XVWpLMdkPOZ/g5v7FFuZWzS4Uv9HckPRQEo9s13LTSG/KJegpUn+U1hH0S
 0uo=
X-SBRS: 2.7
X-MesageID: 16990167
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,364,1583211600"; d="scan'208";a="16990167"
Subject: Re: [PATCH v2 1/4] x86/mm: no-one passes a NULL domain to
 init_xen_l4_slots()
To: Jan Beulich <jbeulich@suse.com>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
 <8787b72e-c71e-b75d-2ca0-0c6fe7c8259f@suse.com>
 <20200421164055.GW28601@Air-de-Roger>
 <4779dde6-6582-1776-ea9b-a2cd46ac3bc3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a40d1289-d88b-db93-1e6f-8f44c9c96bcf@citrix.com>
Date: Thu, 7 May 2020 18:26:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4779dde6-6582-1776-ea9b-a2cd46ac3bc3@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/05/2020 07:31, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> Andrew,
>
> On 21.04.2020 18:40, Roger Pau Monné wrote:
>> On Tue, Apr 21, 2020 at 11:11:03AM +0200, Jan Beulich wrote:
>>> Drop the NULL checks - they've been introduced by commit 8d7b633ada
>>> ("x86/mm: Consolidate all Xen L4 slot writing into
>>> init_xen_l4_slots()") for no apparent reason.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> you weren't entirely happy with the change because of the
> possible (or, as you state, necessary) need to undo this. I
> still think in the current shape the NULL checks are
> pointless and hence would better go away. Re-introducing them
> (adjusted to whatever shape the function may be in by that
> time) is not that big of a problem. May I ask that you
> explicitly clarify whether you actively NAK the patch, accept
> it going in with Roger's R-b, or would be willing to ack it?

I'm not going to nack it, because that would be petty, but I still don't
think it is a useful use of your time to be making more work for someone
in the future to revert.

However, if you wish to take the patch with Roger's R-b, then please fix
the stale commit message, seeing as this is v2 and I explained exactly
why it was done like that.

~Andrew

