Return-Path: <SRS0=suLm=CL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF2EC433E7
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2020 20:50:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 053D5207EA
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2020 20:50:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="drnLNVDU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 053D5207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDZhA-0003Lf-Kc; Wed, 02 Sep 2020 20:49:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9C4+=CL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kDZh9-0003La-23
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2020 20:49:27 +0000
X-Inumbo-ID: 4f8b6a73-7873-4494-880e-637b30075b31
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f8b6a73-7873-4494-880e-637b30075b31;
 Wed, 02 Sep 2020 20:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599079766;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9E1Ej96OTGj9BktdwBneg8WpoSptU9oMQ4246wzqH0A=;
 b=drnLNVDU5dZPphUmRzlB4v8ERYwsIPksI7OH2k7Y4Qb2+Be4V4i/FHAs
 VPfMIvtC+pU+PlTt45oG1DQvP1IPHrN+jrYbS0SBg0UCWpGmtLY5t1GrN
 SbBcSwzWEPBCOGXFbAoh9Y/GvEdzounY7XNpEMiY6KAzrbVDmxFoFqZ+v o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: voMhzhv1Hy38RFxjl7RBiD9SoIIO+kAPuVRHYXPeLiTIhq4aHB/1tlamJLiZY8jr7+ElFa7wj4
 IPhPTm3xzfJ4Jh5jfG1D0ggCeIXVvqh2edUymHqEUyXmCYRtNLLHL/8zcSy1+Ht21iu9UDEivz
 2rNmtr+bgXYru8P1qLHLe9D1qk0ovRe+frZ9hqZW/7+AuObGhyHpQBpFa6CJ0YzSgriFWWdVgs
 lNpCHTTKWHYz24ydgT79vYW+IjKS2TvD83BlsBBl40hZ99Yy3zpqK69O74QJWUmt0mUl9BW40t
 kJ0=
X-SBRS: 2.7
X-MesageID: 26205336
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,384,1592884800"; d="scan'208";a="26205336"
Subject: Re: [PATCH v3 3/8] x86/msr: explicitly handle AMD DE_CFG
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-4-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fad50f73-1a7f-3053-bea0-a5c87530a75c@citrix.com>
Date: Wed, 2 Sep 2020 21:49:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901105445.22277-4-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01/09/2020 11:54, Roger Pau Monne wrote:
> @@ -517,6 +523,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>              wrmsr_tsc_aux(val);
>          break;
>  
> +    case MSR_AMD64_DE_CFG:
> +        /*
> +         * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
> +         * https://www.illumos.org/issues/12998

"Drop writes", or some suitable equivalent, so it is clear what action
Xen is trying to take in response to the bug.

Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> +         */
> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> +            goto gp_fault;
> +        break;
> +
>      case MSR_AMD64_DR0_ADDRESS_MASK:
>      case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
>          if ( !cp->extd.dbext || val != (uint32_t)val )


