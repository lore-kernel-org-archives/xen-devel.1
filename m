Return-Path: <SRS0=3Xfx=75=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B7CC433DF
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 10:42:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BB7520767
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 10:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BB7520767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl92L-0001V5-Fw; Tue, 16 Jun 2020 10:41:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AL9H=75=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jl92J-0001Uz-V3
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 10:41:47 +0000
X-Inumbo-ID: f97edc60-afbd-11ea-b8ae-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f97edc60-afbd-11ea-b8ae-12813bfff9fa;
 Tue, 16 Jun 2020 10:41:46 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: U4NJN7iYtxyl0XcC0hK+/k8Mtlg6T3m5Zz1w0una2aT//FccXLpzDe7HgnNcZSRhQEi73LEvnS
 fMDaLPZ6mtTaqvQwPek/a0puqPEWl6HWatP3BCidBqZlLVz2pyvBD4dJGKlE0OTjkthAfeuq5V
 vWW0Pw0YKKEIR9fblJohzvvQTRjPwdHzvft4HIfXm2MgH8g3FYKkFcj+m6ppzZ7Qw5nwY9birT
 GQnwteBoG3mA9EEGsxu6P6zgFP4q5iN3DMtvdrvviwpCi6ODwbd7yspXFxF/G/8SelPihhZw+i
 MSs=
X-SBRS: 2.7
X-MesageID: 20921592
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20921592"
Date: Tue, 16 Jun 2020 12:41:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvm: check against VIOAPIC_LEVEL_TRIG in
 hvm_gsi_deassert
Message-ID: <20200616104139.GO735@Air-de-Roger>
References: <20200616102056.18074-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200616102056.18074-1-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Forgot to add maintainers.

On Tue, Jun 16, 2020 at 12:20:56PM +0200, Roger Pau Monne wrote:
> In order to avoid relying on the specific values of
> VIOAPIC_{LEVEL/EDGE}_TRIG.
> 
> No functional change.
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
> index 6cbea63f4c..6772aec721 100644
> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -202,7 +202,7 @@ void hvm_gsi_deassert(struct domain *d, unsigned int gsi)
>      int trig = vioapic_get_trigger_mode(d, gsi);
>      struct hvm_irq *hvm_irq = hvm_domain_irq(d);
>  
> -    if ( trig <= VIOAPIC_EDGE_TRIG || gsi >= hvm_irq->nr_gsis )
> +    if ( trig != VIOAPIC_LEVEL_TRIG || gsi >= hvm_irq->nr_gsis )
>      {
>          ASSERT(trig == VIOAPIC_EDGE_TRIG && gsi < hvm_irq->nr_gsis);
>          return;
> -- 
> 2.26.2
> 

