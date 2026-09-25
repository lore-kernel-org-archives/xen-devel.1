Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B31C9830D
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 09:13:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433535.1654032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA1zq-0006mP-W7; Fri, 25 Sep 2026 09:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433535.1654032; Fri, 25 Sep 2026 09:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA1zq-0006mH-Sk; Fri, 25 Sep 2026 09:13:34 +0000
Received: by outflank-mailman (input) for mailman id 1433535;
 Fri, 25 Sep 2026 09:13:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1xA1zp-0006mB-58
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 09:13:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA1zm-001NuL-Jr
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 11:13:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6ab63b2e-bab6-0a2a0a5309dd-0a2a45069658-20
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 11:13:30 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6ab63b3a-195a-0a2a45060019-4a7de18ddfe2-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 11:13:30 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49ccff31419so6216135e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 02:13:30 -0700 (PDT)
Received: from [192.168.1.109] ([88.230.46.165])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff21c38a4sm18941345e9.2.2026.09.25.02.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 02:13:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790327610; x=1790932410; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXXdFDFau2Czj+WwbE2oq5QWYgBVXR49RaMBkVsNBCA=;
        b=JCbaPJmDiBN+rZ6P1I+QJWRppHkak3lzDpd0sFWEWGv3QKsrPx7E4z8MZVrnDFfHVw
         8F4lNilQGmDrpO6SQz6XVaFPft2phVU20fv3leOdKjetLQ/yvs4fRwZOID9lLVKZkI0c
         h26mEx0zfI5DUW25zXjoUgD0hytCKY3AhqBE7u13rbUTfen7/VldVHtHAlMqqGkn6OHZ
         48C1ahUO18s3bbcP96aDbxKBH6fNYoCX4c/AZ/2wRZfI9n1bhEb+CDRTE3OVL50Dq6FB
         UNMRR0tSw4SH9N33m4zHOPYLEIR9kz5JKNFefkkKt+pu/3KYcrDNRbbAx4DPUOHTVipV
         gmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327610; x=1790932410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXXdFDFau2Czj+WwbE2oq5QWYgBVXR49RaMBkVsNBCA=;
        b=B8MLoRZ++2kLnVutinFAghV/zm06xUeiNDMDZbz22bLCzle5ATRegeBcOc7rQ3zyRL
         DK+n4mfuPzvfTm2pwMQUuIDtagZ/oKURaOwAFmPhiUKksEvUjIpVe0iwpnpY9k6F3ZfO
         Rol18rHytkpIaGcefSob7k95iyUUcJom1lhST6vcJXtY+mJIvlF0x6TuFD3wy7TpMheq
         u5ec3ep1pQ8ySRX0BiYXwAHB5CWDK/rTfbE7QqrqX6mzYSu7cNEUCkTKZ4GCUBaRxAbq
         MWrF5U+1Tp2eRmz1ynhAYupoZbFVj1a4sJx5X+OOhWnusMsdW9nuDKYbxP3lOYZM28gX
         cOqw==
X-Forwarded-Encrypted: i=1; AKwUvBw1E8SZ1QwfkK5Hg2LDasWHg4wvCF/VRLrrBnbrqbc2he7Sts+Fcm9hQBpYcY1Kn6q0rDEEg6YrCDU=@lists.xenproject.org
X-Gm-Message-State: AFuF++nWAwRpsjoZ+1DWiOHkJ3mLEz5es7V1Hi4OGAwqY1iQ7m6onNE+
	lkmlUartgaNMNR+2v0iwhxTUYq4cX52iCGVxh90AUVlpPguaqAWPrqjw
X-Gm-Gg: AYBFou3ye3NZP/Yc5T1RR/VJYTVVYeek6qXWhQ6AUa3XVzNeWQRKjQOS7gt8I179m48
	FXWDA4HBzySecciTSkxiHMYLWL0tflMUWYPA7fkcAJxEloMNzmvDrZxSz+LxgKLvAG1DWpqiHCo
	3XGgsUrFEYSRZpzyAratT/G1qO6VrSxltb5j397YVM4iHd0HSWlj5jOSzwx62iiFtsAa4KMlpmD
	w/CwX8X8d+3gsB1bPX91weCeo6F+nHwfkLveqfHotyUgAuwBTAgEABPXTuP3z2ObK28XSogfSQj
	rtFldtTI+9cQu0MgHwPFRCY/SafyrM1cIX2ejGNncWI+7pRLAG41ZOie9mW9JpmShFUvIPAHPoq
	+j0/5Mv77YuAYcIrt1i85P7slVsAozj16MLqWBCDO7mDQujBstuckqFjBZfT+yA22bvrrJ2N2gu
	LqtzPEg1PeKZPJWFY1J3N8MsBnwBsZ2MqCEQ99REl/JVHZB65LByDislRbKK3FPyz26lT/fwDl2
	NiD
X-Received: by 2002:a05:600c:46d1:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49fe7bab928mr75133995e9.16.1790327609844;
        Fri, 25 Sep 2026 02:13:29 -0700 (PDT)
Message-ID: <d5e3edc6-2bf8-4527-a341-0946d6292c93@gmail.com>
Date: Fri, 25 Sep 2026 12:13:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2.1 5/5] tools: expose admission control toggle via xl
 sched-rtds
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 anthony.perard@vates.tech
References: <20260918080935.35498-6-frn1furkan10@gmail.com>
 <20260918104106.53530-1-frn1furkan10@gmail.com>
 <c959d6e8-3eba-46a8-a486-20a76f7438a7@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <c959d6e8-3eba-46a8-a486-20a76f7438a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790327610-F480577B-4E6587A0/0/0
X-purgate-type: clean
X-purgate-size: 765


On 9/18/26 13:45, Jürgen Groß wrote:
> On 18.09.26 12:41, Furkan Caliskan wrote:
>> Wire the per-cpupool admission-control switch through libxl
>> to xl sched-rtds, and document it.
>>
>> Add -s/--schedparam to list or set pool-wide RTDS scheduler
>> parameters, and -a/--admission to enable or disable admission
>> control for a cpupool ("-c pool -s -a 0/1").
>>
>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> 
> Juergen

Hi Jan,

Just noticed that patches 1-4 have been merged, but patch 5 
(which already has a Reviewed-by from Juergen) doesn't seem to have 
made it in. Could you let me know if it needs anything further, 
or if it just got missed?

Thanks,
Furkan

