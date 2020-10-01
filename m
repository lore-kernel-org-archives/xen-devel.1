Return-Path: <SRS0=IV2x=DI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D60C4727C
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 10:53:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF8A2207DE
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 10:53:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="TITiAFQw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF8A2207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1187.3945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwDM-0000R4-GV; Thu, 01 Oct 2020 10:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187.3945; Thu, 01 Oct 2020 10:53:32 +0000
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
	id 1kNwDM-0000Qx-CH; Thu, 01 Oct 2020 10:53:32 +0000
Received: by outflank-mailman (input) for mailman id 1187;
 Thu, 01 Oct 2020 10:53:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNwDL-0000Qs-4S
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:53:31 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6452a83-6d3b-423b-b455-a76b5d47ade8;
 Thu, 01 Oct 2020 10:53:30 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNwDL-0000Qs-4S
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:53:31 +0000
X-Inumbo-ID: a6452a83-6d3b-423b-b455-a76b5d47ade8
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a6452a83-6d3b-423b-b455-a76b5d47ade8;
	Thu, 01 Oct 2020 10:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601549610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RjRT/Hg2ogLdWLHO37jJVlulrni7VJqaoYtk8G3MeKo=;
  b=TITiAFQwKdfZ34TiwV0h3wKqdB7TL7VW3BbzaFifLnQX3/grvLj9aY9K
   kOAhnY9n4Kz7r2EHCl5EYTaSnHBiEH7i29f3QWgLoz29KMCO3xnoJiauM
   mfWsm/cfqVJtp9Kq6oa6SD80bC+raPNZDHeTwhvsG+dhkKmgsanTcGUBs
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CXQeLGjRalIG7+p2fYoyLLu2Vx/Drg/73Co9r/bOyhH49yahScRdTKBTahAAiTAfBe/FYO9cdo
 1TXwfkayYbcKecY3W0iarfN6MY5Du11TBHdqnHMZAu5qAm810cXC9V6LvIdZATF1XDoEnEF0SB
 b9UoeMdUGutRB3Dh1HHfehBdbly30R3ad/iSs+jcLqJqlrpSEl79ny6y3zdt530ZnXz2sjohU0
 0tLoY99FponZydJBzSLhfc7liH65Sm8Sru3S5o19vQLWiS8E8Oe693+WVk2zC2LIn2p8I7+Jp1
 AaM=
X-SBRS: None
X-MesageID: 29068941
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="29068941"
Date: Thu, 1 Oct 2020 12:53:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 5/8] x86/hvm: Obsolete the use of HVM_PARAM_NESTEDHVM
Message-ID: <20201001105321.GC19254@Air-de-Roger>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-6-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930134248.4918-6-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 30, 2020 at 02:42:45PM +0100, Andrew Cooper wrote:
> With XEN_DOMCTL_CDF_nested_virt now passed properly to domain_create(),
> reimplement nestedhvm_enabled() to use the property which is fixed for the
> lifetime of the domain.
> 
> This makes the call to nestedhvm_vcpu_initialise() from hvm_vcpu_initialise()
> no longer dead.  It became logically dead with the Xend => XL transition, as
> they initialise HVM_PARAM_NESTEDHVM in opposite orders with respect to
> XEN_DOMCTL_max_vcpus.
> 
> There is one opencoded user of nestedhvm_enabled() in HVM_PARAM_ALTP2M's
> safety check.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

It's nice that the logic is already present in hvm_vcpu_initialise :).

Thanks, Roger.

