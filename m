Return-Path: <SRS0=IV2x=DI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358B4C4727C
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 10:07:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C352C2137B
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 10:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="JlF4ttl+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C352C2137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1166.3853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNvUQ-0003pz-Uh; Thu, 01 Oct 2020 10:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166.3853; Thu, 01 Oct 2020 10:07:06 +0000
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
	id 1kNvUQ-0003ps-RV; Thu, 01 Oct 2020 10:07:06 +0000
Received: by outflank-mailman (input) for mailman id 1166;
 Thu, 01 Oct 2020 10:07:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNvUP-0003pj-KO
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:07:05 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72ae7b56-c6e0-4650-b615-248ae41a477a;
 Thu, 01 Oct 2020 10:07:03 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNvUP-0003pj-KO
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:07:05 +0000
X-Inumbo-ID: 72ae7b56-c6e0-4650-b615-248ae41a477a
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 72ae7b56-c6e0-4650-b615-248ae41a477a;
	Thu, 01 Oct 2020 10:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601546823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Zv4obAIWlRsLAjQN+kpVRABTv5ZEK3WTLA2T+jlpnug=;
  b=JlF4ttl+47NV2d9iDYanEZ+TvjP/2h33KsfFE82TbNL6xjJ76rGV2uzp
   RGXNHyGL+ys25fXb/dmFBcrAVhtJ5XpJzM1sAeFIOl1PE0Qqb7dRzjdOu
   n/NQQdc5B0dUUCRAvgZdfaihDZFAyeqv4CYpPpb85LeYpBfiKQX06gFrW
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5HGXiubGCZ27aigNbjMnPTH/jFw/iCcePLrnmG/5I6tllqxLQVYKhlGX1gLoWvVoaJumSQbPb1
 tnCL5smZCVGXrxqbQ2qOMkDR/mJV2T/FoUCatxPXgfXZluky9EmcpfbTpih8MJlgkGGNqMJyil
 C5O14pQZcQOWyjyhhOsIFrXyl8blz3GHZLn3nU9P2+Qtc3lIgTr2Xk6AI9YsiZ61bO/UXCUT0N
 P1VJlrVqp5omZfhlicFxANhHmQL7AMYM4kuTs1fE6OJQjRvjsNn4Ma6CIEks3P/Vh+MshPTv0W
 BDk=
X-SBRS: None
X-MesageID: 28058006
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28058006"
Date: Thu, 1 Oct 2020 12:06:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH 4/8] tools/cpuid: Plumb nested_virt down into
 xc_cpuid_apply_policy()
Message-ID: <20201001100654.GB19254@Air-de-Roger>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930134248.4918-5-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 30, 2020 at 02:42:44PM +0100, Andrew Cooper wrote:
> Nested Virt is the final special case in legacy CPUID handling.  Pass the
> (poorly named) nested_hvm setting down into xc_cpuid_apply_policy() to break
> the semantic dependency on HVM_PARAM_NESTEDHVM.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

