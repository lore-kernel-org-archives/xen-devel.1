Return-Path: <SRS0=KLk2=EH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1319C2D0A3
	for <xen-devel@archiver.kernel.org>; Sun,  1 Nov 2020 17:26:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52D782225C
	for <xen-devel@archiver.kernel.org>; Sun,  1 Nov 2020 17:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QO1fNIfm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52D782225C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.17261.42062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZH7N-0004vv-IO; Sun, 01 Nov 2020 17:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17261.42062; Sun, 01 Nov 2020 17:26:13 +0000
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
	id 1kZH7N-0004vo-EW; Sun, 01 Nov 2020 17:26:13 +0000
Received: by outflank-mailman (input) for mailman id 17261;
 Sun, 01 Nov 2020 17:26:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kZH7M-0004vj-3e
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2020 17:26:12 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc3682fe-d563-467f-8d1f-4faac47f9117;
 Sun, 01 Nov 2020 17:26:10 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n15so11953902wrq.2
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2020 09:26:10 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id 6sm6826590wrc.88.2020.11.01.09.26.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 01 Nov 2020 09:26:09 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kZH7M-0004vj-3e
	for xen-devel@lists.xenproject.org; Sun, 01 Nov 2020 17:26:12 +0000
X-Inumbo-ID: fc3682fe-d563-467f-8d1f-4faac47f9117
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fc3682fe-d563-467f-8d1f-4faac47f9117;
	Sun, 01 Nov 2020 17:26:10 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n15so11953902wrq.2
        for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2020 09:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=81VH2H9EYCqx4v/04RbUnhPjmr5GDUw/nv05RtWy32I=;
        b=QO1fNIfmzx61QO/itaiw4gOc7mEjmasFWAVvs39eTh/Fp4ChDj/EHGWBJkpG35e0ox
         lbMH31qY7xXzKPE29Qu0HdkcOHiHmlPwl4ORViZLuE1o2E6DgAHyq/kFZDcduvtinpLU
         QiubOjGNLWzQZwZwg3rC3ogOR1GZh/q4RbSiWAEQ7p6XlkXMbu2iJnJaD4ZsLu75asMC
         o6zr/npoJA3m5TMMgMrKkSglNExOwupWOfsUqRcs9rZPAG/yUNsXvDO22t9vadZw+saW
         w71iASKzlDatnTbHPnONi1qC5ifLA5gtR8rq6JFnmsRtasF02rxcZMn231T6W1lCplyy
         OoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=81VH2H9EYCqx4v/04RbUnhPjmr5GDUw/nv05RtWy32I=;
        b=s/MjONtykyJM5P/yOI0AmtbEskIVcRHp+7kJwyeQ688iF6R7j/UHEvpJy7P9gA6cch
         dnO5SLqR7QqKOpgLax+LTZCSC1xXi3xR4HT4Q1j/XHpQrCJ4eNZNKB8Juuf1YVp5gfS4
         vgaebyTd3ZPtx5xpQmabYw6GiCe7tAVlC3Q7oApFy+qxd7Q9kBQ8Fowyuh+uivwVsF1y
         jD8eX6aAeOk4n2mxCatUMstQ/GGV2lWS3kjYuF445DdLQVK/LQ36BU2VAV/2y7BtXV2l
         Eu/yNdRpVVNjCXlHLeImT4+U+/7LpijPhnM5LsI0J70/B77QFw3Pd4cQpXy6z/isQg5O
         HvrQ==
X-Gm-Message-State: AOAM533Z4tsf/rPcCwL8mtEi6HG2Rk3+5FYWsk5/FWjr18zz1LXIEMcG
	np8eYKBzFZ1e7Vhh1XE/D4U=
X-Google-Smtp-Source: ABdhPJzyzZDz8pu8cWV/CIgvqGsV/zeL+GTq1V501DZv6Hnbnq7JszjICgWpFCSej+OREij+fTCWOQ==
X-Received: by 2002:a5d:62cf:: with SMTP id o15mr15123798wrv.49.1604251569772;
        Sun, 01 Nov 2020 09:26:09 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id 6sm6826590wrc.88.2020.11.01.09.26.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Nov 2020 09:26:09 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: sstabellini@kernel.org
Cc: ehem+xen@m5p.com,
	julien@xen.org,
	roman@zededa.com,
	xen-devel@lists.xenproject.org
Subject: Re: Xen on RP4
Date: Sun,  1 Nov 2020 17:26:08 +0000
Message-Id: <20201101172608.90996-1-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <alpine.DEB.2.21.2010301240450.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010301240450.12247@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,


>> I think the best compromise is still to use an ACPI string to detect
>> the platform. For instance, would it be possible to use the OEMID
>> fields in RSDT, XSDT, FADT?  Possibly even a combination of them?
>>
>> Another option might be to get the platform name from UEFI somehow. 
>
> I included appropriate strings in e-mail.  Suitable strings do appear
> in `dmesg`.


Just as a heads-up, SMCCC does define the optional SMCCC_ARCH_SOC_ID [1]
function and this is listed as mandatory in the Server Base Boot Reqs
(SBBR); see pp 15 of ARM DEN 0044F [2].

Unfortunately it looks like RPi 4's firmware doesn't currently support
this, or at least the rpi4-uefi project [3] didn't think so as of FW
version 1.6 [4], but I couldn't find equivalent SBBR feature tracking
pages on that site for FW versions 1.7 or 1.8 to confirm, nor could I
find any reference to SMCCC_ARCH_SOC_ID in the RPi 4 FW sources [5].

On the bright side, while not very helpful in the short-term, note that
Arm's recently announced SystemReady [6] program is an evolution of
ServerReady (SBSA+SBBR) but for other segments and applications incl.
Embedded, IoT, and general Linux Boot.

That means in future we should see more platform firmware supporting
SMCCC_ARCH_SOC_ID, as the SiPs will (hopefully) want their platforms to
be SystemReady certified.

Hope that's useful info.

Thanks,
Ash.

[1] https://developer.arm.com/documentation/den0028/c
[2] https://developer.arm.com/documentation/den0044/latest
[3] https://rpi4-uefi.dev/about/
[4] https://rpi4-uefi.dev/status-v1-6-firmware/
[5] https://github.com/pftf/RPi4/tree/master
[6] https://developer.arm.com/architectures/system-architectures/arm-systemready

