Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB680C43458
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jul 2026 10:59:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1362195.1614097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjaqg-00024o-0a; Tue, 14 Jul 2026 10:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362195.1614097; Tue, 14 Jul 2026 10:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjaqf-00024h-TK; Tue, 14 Jul 2026 10:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1362195;
 Tue, 14 Jul 2026 10:58:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjaqe-00024b-EK
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 10:58:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjaqd-000fl4-6a
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 12:58:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a561657-2eae-0a2a0a5409dd-0a2a4506e86c-22
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:58:47 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a561666-195a-0a2a45060019-d155802bd003-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:58:47 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493bf73ec2aso28596145e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 03:58:47 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4950871e830sm66674095e9.2.2026.07.14.03.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 03:58:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784026726; x=1784631526; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y3MknwqOTQ6hmtw8v/weN9rTs2W2tCuMX/vBAhVJnAs=;
        b=JZErH+hQ6oDu8+XAbios+g99vto71kYyWl5i2+Q17gMrOAhTAWVThkARBzvVDEZQIS
         KH77oQqzqoVz41FgytPa6FedfDgtWGzVQ0EmI0n7ASkJHIt8rvIduKbS2yuSlUGMCZd5
         ZO1cteaLRqlp9K89B6W52+8EEUGX4PgCrizlk5CrCLBkIrkbgvXbsAJdcP4OjZ6SkSz5
         oZtAoCv73uN8VIt/SlePwjXzYQkpIJXru0WHF6FTZEVE9mITWSalmoNpsPTOwp1n63v3
         pO1jY3how9fGlQkE8mmifUYO/xJQ4kaXPVsixE+R4Ll5PngTTkGad+j22JkwjkFuMZNq
         APHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784026726; x=1784631526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3MknwqOTQ6hmtw8v/weN9rTs2W2tCuMX/vBAhVJnAs=;
        b=DC04rMYnb6ScSIUZ8de9RZB6TYpn2+sfPll+QvoZg603iKA5BYgFeRdRO+dcM+chZK
         Ip9fiSSkHCN0Xsx0bZTdgBCn0pwXcC6pPwsM9HXQsVlJu1guTwIHDBctJSC+e13Daqj/
         NH0Wh9NkjgN1Z/qlJKL95+iQ95/pby/6KJExjOgCj/oPH+LL7IQm17xBiXT8EzketDwL
         nvXI2DDWbJNStU03MN94PYOIyHsuAOcje7OHcO9ep0c0Yo0N0oXDplRVXoZHHoY/nLAE
         y2e2PhAh/sj79bwBv3d7KIXWBN5dxIvVYVuv1lPux8asmIhnXCIP5B1njnIbmLHNCTEG
         N95Q==
X-Forwarded-Encrypted: i=1; AHgh+RqWm9yfCEyLkTLWHSjGPtI1b1cNEuk5NUdjgZ/+ysgq7ur0sv0AU996gIQgtbInVTl+Y49qQh/0+uU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6OogJMMI9HkHkWey55fAOcoezHxI1+xActDQUD/rRlCLGCgTh
	aVdnemd4VbXrg/lP5bHWMuQpKroofIAdMA1KmSMaYfsIjEyO4iJzuUbB
X-Gm-Gg: AfdE7ckJq6zhkr7aMRPUHLMyTcmfjgqUTHgqIeTNMWx44dFaVQSl6omuRprCByMfqjn
	fPIeTo2VD63TgB2lnKfzsNSUoQtzO+MbCgBdwtJqZVKPlRjA0PoAxM+X/S/L6rGI7Puu53I3W3z
	o1NXCCfGYpxQl9CexR/IJ6BVPnV0w3jUJeOgD8emOETIVaxjwsO5OR11NfRiTZCh+UCo5h0Ejrv
	ElFlhRgqCtode+VJEBNONRNVgWY/6BRW+YAytE0DDNlbOeAOwDvNrJWPk9AA8fUTPKXH2FSXB2U
	4IAFx+GKZCR7nsgDSn3Y3HjWSZsiBXktSsxdOO/l5/of/xCEj1gkJI7dn94NA9/CKo2oCtu4zmB
	smn6miNHa/PmaZ4FYgJJNJetJM9Jh/i1WB+6BUVV1VvfHaafEQ0QOpDxsgIfDQJhn9BagjRNK5s
	w3nc8p4Yr/eSDGsnY5zmOBU6xo4Swcx4cJSrl2FQ1F6ki/8ukUrQ//LubixO2fs9rTa7g=
X-Received: by 2002:a05:600c:4fca:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-493f8826c59mr127268385e9.26.1784026726178;
        Tue, 14 Jul 2026 03:58:46 -0700 (PDT)
Message-ID: <45fec396-d0e6-47a6-bc79-c3e50922550f@gmail.com>
Date: Tue, 14 Jul 2026 12:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <351b89ba726d5524fd920cc28b7204d683fa8c43.1783856794.git.dmytro_prokopchuk1@epam.com>
 <e61f2f7e-4686-4566-8916-b22f38332786@amd.com>
 <ee26bcf6-ace8-470c-871d-95e20e4f0c9e@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ee26bcf6-ace8-470c-871d-95e20e4f0c9e@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1784026727-FC20077B-5679E333/10/73395122804
X-purgate-type: spam
X-purgate-size: 371

Hello Dmytro, Michal,

On 7/13/26 11:44 AM, Dmytro Prokopchuk1 wrote:
> Hello Michal, Oleksii
> 
> Sorry, doing this v6... I just forgot to add "for-4.22".
> Please, include this patch into 4.22.

I think that the fix is pretty simple so we could consider to be in 4.22:
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

