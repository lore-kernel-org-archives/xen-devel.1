Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F66C4363D
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 12:02:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C7A4207EA
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 12:02:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlZELsjG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C7A4207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3478.9932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ88r-0006H6-Ll; Wed, 07 Oct 2020 12:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3478.9932; Wed, 07 Oct 2020 12:01:57 +0000
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
	id 1kQ88r-0006Gz-Ia; Wed, 07 Oct 2020 12:01:57 +0000
Received: by outflank-mailman (input) for mailman id 3478;
 Wed, 07 Oct 2020 12:01:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5kpZ=DO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kQ88q-0006Gu-NQ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 12:01:56 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64ddcfd9-fa74-4a09-985d-3f699b0cd72c;
 Wed, 07 Oct 2020 12:01:55 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 184so1962616lfd.6
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 05:01:55 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id x17sm325927lja.10.2020.10.07.05.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 05:01:53 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5kpZ=DO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kQ88q-0006Gu-NQ
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 12:01:56 +0000
X-Inumbo-ID: 64ddcfd9-fa74-4a09-985d-3f699b0cd72c
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 64ddcfd9-fa74-4a09-985d-3f699b0cd72c;
	Wed, 07 Oct 2020 12:01:55 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 184so1962616lfd.6
        for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 05:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qB9vXmKs4AD/b/cLEPCCdBmQGD4zsABIUtwF1mE8G/w=;
        b=DlZELsjGyAbmcrdzep0CtK1W6VDd5rpCbH/rytqb+bOgxoXKWYSXFUqkxo5jE7mB2A
         uNK+Wsh4vA41veKxROYQgXyZSXrnT4eT5DCz0vzgWwR8C7F3bF0GxPESAx17LtSLlTu9
         5j6O18Drvhfh33ddKhzFOf7YD1yXGrkr/BmWmsWjDr542zByjEUlMd8V/VCiHx+q7s3u
         Zqka7GWdLwb1Tijsetl1kFKap7N3jBYQyK5nkkPMa6FUEIymQKJpS+hVe4EVB6XINPX6
         bYEKw8bEmiRacyXPxiwK2+oCS143YiUq7s8pV07c1xDB85uhmk2LaQSmW77U12AZV4wJ
         1dXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qB9vXmKs4AD/b/cLEPCCdBmQGD4zsABIUtwF1mE8G/w=;
        b=NWOtNlvkO6xdPeLM9oS1B7GgTDJnp2Dj2vpy37iVvvr6adOOdSYytfQYi6aQTXxNNK
         cgMldlyHJbtiQhO2AF9HZpR2xouUgwUXOEXFByFOQbj/WjYsRX88xLKoo4LXJSu4fo37
         +epgW3CqHBmuUnpAaaEH4cTAh5icRo1sqy2SCoyOyI/BQz3udwRFxxUGxQamBsEp0Ns/
         8K+rzMxUZDe14PC7zDL8ayRmtz5Y4G5KOAxTg2I2TydyzKfeRebXtS5N36U5ekzOsaOQ
         eRoZs4g2sI38OgY07rOa9zStxCzLTL/CkKdWZt9hpixxKePXHKfcb1vKFeMCHA9289ws
         6wlg==
X-Gm-Message-State: AOAM533T0aAJTJ5Rv5r/Bto/hAKShxK36DTQEWarQAI2TYxXR+vShNGC
	tbt+AYPsxegJ05WZAH0kvHM=
X-Google-Smtp-Source: ABdhPJy9LfF4/eI13d4o44aFKpQIlrL6Iu2RuTf4MLfTVS+/5CZeRb8t6ipF/EH7fsUMSm+st+SsCQ==
X-Received: by 2002:a19:505a:: with SMTP id z26mr797907lfj.442.1602072114548;
        Wed, 07 Oct 2020 05:01:54 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id x17sm325927lja.10.2020.10.07.05.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 05:01:53 -0700 (PDT)
Subject: Re: [PATCH V1 13/16] xen/ioreq: Make x86's invalidate qemu mapcache
 handling common
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-14-git-send-email-olekstysh@gmail.com>
 <83dfb207-c191-8dad-1474-ce57b6d51102@suse.com>
 <2cab3ca5-0f2b-a813-099f-95bbf54bb9c8@gmail.com>
 <17f1c7d2-7a84-a6a5-4afb-f82e67bc9fd0@suse.com>
 <0fa6a31c-8da6-2a0a-b110-a697f4955702@gmail.com>
 <3abe3988-f1c0-9bbf-1ff9-ce3ae380c825@suse.com>
 <47ecdde7-6575-bee8-7981-7b1a31715a0b@gmail.com>
 <0aa9a225-1231-fa98-f2a1-caf898a3ed86@gmail.com>
 <fa610665-78c2-3bd0-66f4-2aa716bafe64@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0e58975f-c0a9-76c6-9856-2a78a67e7f3e@gmail.com>
Date: Wed, 7 Oct 2020 15:01:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fa610665-78c2-3bd0-66f4-2aa716bafe64@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 07.10.20 13:38, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien.



>
> On 02/10/2020 10:55, Oleksandr wrote:
>> If I got it correctly there won't be a suitable common place where to 
>> set qemu_mapcache_invalidate flag anymore
>> as XENMEM_decrease_reservation is not a single place we need to make 
>> a decision whether to set it
>> By principle of analogy, on Arm we probably want to do so in 
>> guest_physmap_remove_page (or maybe better in p2m_remove_mapping).
>> Julien, what do you think?
>
> At the moment, the Arm code doesn't explicitely remove the existing 
> mapping before inserting the new mapping. Instead, this is done 
> implicitely by p2m_set_entry().

Got it.


>
>
> So I think we want to invalidate the QEMU mapcache in p2m_set_entry() 
> if the old entry is a RAM page *and* the new MFN is different.

Thank you. I hope, the following is close to what was suggested (didn't 
test yet):


diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index ae8594f..512eea9 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1073,7 +1073,14 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
       */
      if ( p2m_is_valid(orig_pte) &&
           !mfn_eq(lpae_get_mfn(*entry), lpae_get_mfn(orig_pte)) )
+    {
+#ifdef CONFIG_IOREQ_SERVER
+        if ( domain_has_ioreq_server(p2m->domain) &&
+             (p2m->domain == current->domain) && 
p2m_is_ram(orig_pte.p2m.type) )
+            p2m->domain->qemu_mapcache_invalidate = true;
+#endif
          p2m_free_entry(p2m, orig_pte, level);
+    }

  out:
      unmap_domain_page(table);


But, if I got the review comments correctly [1], the 
qemu_mapcache_invalidate variable should be per-vcpu instead of per-domain?

[1] https://patchwork.kernel.org/patch/11803383/



-- 
Regards,

Oleksandr Tyshchenko


