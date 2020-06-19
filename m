Return-Path: <SRS0=ng2r=AA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D8FC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2020 12:38:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D7C2207E8
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2020 12:38:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QqXsN73X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D7C2207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmGHa-00041G-Mm; Fri, 19 Jun 2020 12:38:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oPen=AA=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jmGHZ-000418-LQ
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 12:38:09 +0000
X-Inumbo-ID: bb032bbc-b229-11ea-b7bb-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id bb032bbc-b229-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 12:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592570288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0vzAKNhIebVNhmPTwwk2+p6+FeyRJcrmAq4fe7SPCF8=;
 b=QqXsN73Xd3UR+F5S5SrZZdF9D+XDzE2gnwYRobTuq3HE8eO1h/PKFb1AMr471Yos/o0a4o
 BnteE/xhz1LqZmoSjHh4h9j9PzRbOH5CwXqnL9GkkDy016aemJMMsSClgynU1pUM88iTBa
 OGOfaAM81g1QAPhaPJ6Ox1WJUWWLf4I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-MZOZUjo2OZym8Wv5_BRnNg-1; Fri, 19 Jun 2020 08:38:06 -0400
X-MC-Unique: MZOZUjo2OZym8Wv5_BRnNg-1
Received: by mail-wr1-f70.google.com with SMTP id y16so435896wrr.20
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2020 05:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0vzAKNhIebVNhmPTwwk2+p6+FeyRJcrmAq4fe7SPCF8=;
 b=R1TVsgTAhKllER/pAo3egWT3lfty7do7IwfxbQv3aYlRVYtm1kpFH3A7yARNvIGxT/
 bgZjhNZklKfYOAbkJSDmPHgCPkLjGfPXgMduJW9j0bWe7AqFCyQakY5sGfV0dfz6zR21
 ZTmxdZGHICvuqClqeb32wmSAsgEW9MS3NZnEQkc92C7ZLCi4QBWZ2pH8UQpClBnygBit
 VfwQFQ//z3GuQaemhVQimiaGxO+BH8rw1JNMQAg5gOmJalZgx4+bAu4Btj3rg3KQoWec
 EeQ2ATfFXG6Ggty922W3sa/av5wcE6DcdsSqsEqkAu/gikOgZVURZYHu2/Jfk/P5ffAe
 ho0Q==
X-Gm-Message-State: AOAM530qyzVxRTypdFWn6hRuP2rLUxmCoYMWYWCFfctseDTq9bY/DWmI
 gXBWr3+2YamAiTvdYcsFF06MlRpRgyC+U77rsOmbcj75df39n15byLLtCm8Ci3gHkLGK7joHGW5
 FM2ucbN0u5Jg+XYj+tye2EVec6LQ=
X-Received: by 2002:adf:a1c1:: with SMTP id v1mr3988940wrv.205.1592570285588; 
 Fri, 19 Jun 2020 05:38:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKe+Jqm+9+qRBocH+ge+ctOBwEa9VJyyU/fXDgduU6zy7HpK/JjOJEWzFAFBJZy+Rk1KZCjw==
X-Received: by 2002:adf:a1c1:: with SMTP id v1mr3988925wrv.205.1592570285337; 
 Fri, 19 Jun 2020 05:38:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e1d2:138e:4eff:42cb?
 ([2001:b07:6468:f312:e1d2:138e:4eff:42cb])
 by smtp.gmail.com with ESMTPSA id z16sm7179070wrm.70.2020.06.19.05.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 05:38:04 -0700 (PDT)
Subject: Re: [PATCH] xen: Actually fix build without passthrough
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20200619103115.254127-1-anthony.perard@citrix.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ac75572a-6568-f5fd-16f0-f43c951e7e86@redhat.com>
Date: Fri, 19 Jun 2020 14:38:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200619103115.254127-1-anthony.perard@citrix.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/06/20 12:31, Anthony PERARD wrote:
> Fix typo.
> 
> Fixes: acd0c9416d48 ("xen: fix build without pci passthrough")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  hw/xen/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/xen/Makefile.objs b/hw/xen/Makefile.objs
> index 3fc715e5954d..502b32d877a0 100644
> --- a/hw/xen/Makefile.objs
> +++ b/hw/xen/Makefile.objs
> @@ -4,4 +4,4 @@ common-obj-y += xen-legacy-backend.o xen_devconfig.o xen_pvdev.o xen-bus.o xen-b
>  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen-host-pci-device.o
>  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_graphics.o xen_pt_msi.o
>  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt_load_rom.o
> -obj-$(call $(lnot, $(CONFIG_XEN_PCI_PASSTHROUGH))) += xen_pt_stub.o
> +obj-$(call lnot,$(CONFIG_XEN_PCI_PASSTHROUGH)) += xen_pt_stub.o
> 

Queued, thanks and sorry about that.

Paolo


