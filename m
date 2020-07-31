Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86FAC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 15:17:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7714121744
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 15:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="ayJL8bue"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7714121744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Wmm-0001YA-HV; Fri, 31 Jul 2020 15:17:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG5j=BK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1Wml-0001Y5-F8
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 15:17:27 +0000
X-Inumbo-ID: f0b8a51a-d340-11ea-8e58-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0b8a51a-d340-11ea-8e58-bc764e2007e4;
 Fri, 31 Jul 2020 15:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596208646;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=/w9QrzdbXq3+QWS8jsdjJCrxPabXgxbpAuteD8IFlvE=;
 b=ayJL8bueIaDtInrMEEAEnj2A54OMhJB3443eNUKL51j7LKatuuPWhk8+
 udfLXM9JhHncPQPjT6QwBNqmo6dslPZuZ0aPvE2TU1Xe3uRYnzcuaz4Pq
 G9fGDRn1Mf5DW5wwTEhpep/I4BK/arTas8T7TtYgUuGNmqDj+YvsdBwc3 M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: DTdIo7pTNrRNl3JCjI6HmcJqhFibRl2T7DVEAxyTEZGAeMx/KlkyNb5TVTddiEgBrg9k0vBdaM
 4np50gDy1jtv9XajAV5yafuywsG9UmAt670gRe80LGSmsTjhpnF5vxUm2deTwBWV1zd9Bq4MPi
 zaHiniOMW55mi7N2vYJD5ZMPn/Lh5XFNOGar5RlG61VGRrSVRD+rvYddli9+0zWqvtDksWr6xv
 mNXW0fr56qsg2GMCYzKPm8y9Yc/Az6zq5VgFrrLmvcNu3PM0qpUjFxfEHqaOYiWjf0SoM3m4Wo
 kkI=
X-SBRS: 3.7
X-MesageID: 23969009
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23969009"
Subject: Re: Ping: [PATCH 3/5] x86/PV: drop a few misleading
 paging_mode_refcounts() checks
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
 <9f8d0c4d-dec2-0175-09df-51d5e11c88e1@suse.com>
 <bc2c4ec4-8703-c7a7-76b6-b79e55bca49e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bd8e8dd1-ea1d-039b-d96a-69a4d5443b65@citrix.com>
Date: Fri, 31 Jul 2020 16:17:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bc2c4ec4-8703-c7a7-76b6-b79e55bca49e@suse.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tim Deegan <tim@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31/07/2020 15:58, Jan Beulich wrote:
> On 15.07.2020 11:59, Jan Beulich wrote:
>> The filling and cleaning up of v->arch.guest_table in new_guest_cr3()
>> was apparently inconsistent so far: There was a type ref acquired
>> unconditionally for the new top level page table, but the dropping of
>> the old type ref was conditional upon !paging_mode_refcounts(). Mirror
>> this also to arch_set_info_guest().
>>
>> Also move new_guest_cr3()'s #ifdef to around the function - both callers
>> now get built only when CONFIG_PV, i.e. no need to retain a stub.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> While I've got an ack from Tim, I think I need either an ack from
> Andrew or someone's R-b in order to commit this.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


