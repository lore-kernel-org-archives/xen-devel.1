Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971DAC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 11:39:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428709.1651600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8ypc-0001VF-Mq; Tue, 22 Sep 2026 11:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428709.1651600; Tue, 22 Sep 2026 11:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8ypc-0001V8-KD; Tue, 22 Sep 2026 11:38:40 +0000
Received: by outflank-mailman (input) for mailman id 1428709;
 Tue, 22 Sep 2026 11:38:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8ypb-0001Up-At
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 11:38:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8ypZ-00GI8O-Hh
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:38:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab268ba-8faa-0a2a0a5109dd-0a2a4504b3e6-10
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:38:37 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab268bd-b57f-0a2a45040019-4a7de18cd8aa-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:38:37 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d37b6so19565025e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 04:38:37 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdad29ee8sm44526315e9.4.2026.09.22.04.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 04:38:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790077117; x=1790681917; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+RHzN2uifN1QY4H3CQrwFyO+hBAxSeEL8727VN2mVU=;
        b=YWnIww6eCCpcYMDxZIJHh5Pd+U2+SKamBaBrVxU3IyL7G4xd4aRM82H2aLOoqNkiwP
         bLzMmv7GVNYJcm8g3SMziv16uyUovUneQK0Yn4ApZfcsy6kNkrXcH6/TZjUamfut7Iba
         m/q1QFtwruRaN014xAmIsn3DCROMlvmyfwouXGd7KWhLQcUGaSyV77L0GcTIcN1yvPbb
         x/WXNSu0T/zLNUn9vFuSZmHeBuy4Rzizj0zZcLlRzsY5ylkCi7qJDB16tzbcYunaDVvy
         M2kAABJRE891+Ki9F8VNlsNPP3wLLfx5A/f3viKdB6tkAmfhUJ1Fqm45Eg2QRBAN9KK/
         AOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790077117; x=1790681917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+RHzN2uifN1QY4H3CQrwFyO+hBAxSeEL8727VN2mVU=;
        b=yqYQcskSzQgBxNMp65cm/8xREmGEWUHA9P2rJMjFbrMatRO6R6dN0dAljmvn1tWkI3
         5sLLmGrZ0LeXUr5mGJS+1/gz6Qs5MU3WXWB1HV1bu3yjykJg5we6/c8CtzEZ+1zqG7Rm
         8DkMgD8CEX50yLZTCxZHpNMp3jvEoPsiGrI2IsBW/0n4LLYezUVMAiIZzioOeZxG2uxn
         WkWNZqyTOpiKQzXP1+iycKROj5fo4RvwQY+2U1Qc5ULXxMBOCZSppR68YPv02sxAVyJo
         aZYq6Mu/9Piz4wPwxFn8bnkqxQgKooN/YO5s9pzgA8USojjwc1LvVy93+f8qIit3Qy4e
         FskA==
X-Gm-Message-State: AFuF++lgdBfdS1e/1M6kHtkmsilhhURiyKkuxa3lvEoev9s3IVR30XNr
	wtMmgO6J6Lk9KPCjzUngOoV+7w3L9jgHX1VwS5cxqxcvsIl+oenyN+LN
X-Gm-Gg: AYBFou1M03sj5dawpl1qVt3nTirsTQMFhZYMC2cnQLCYF4+igFnagiAHoRGLPQdkfgK
	1u8zy4euZauB9GFx7G5UKw6rZ0l7YEd2rSyZgXPUfPE7mkF4hvHDnP4hZs44416qFcMw2vYV7ri
	kWULKh91efUm9Vh01XholSL23VfcP5iNPYLgdFahsJ6eqhxIYU6R9cpl055OEauDchtQQ3HkM7m
	JDvgXKFmbDOH+un4NmmgkaMC9B1i4Waxk9c6WOA4j2lyCXmWa6kEe3FWJwoMBh0fR1JSqvmztjG
	cB57cHMzGtWYvsyD04cwmuH2squ9Ozm3SLHhuXXVDeDd+4n3D1MvGdlZ7s2lDDx60ZzhwRB1T7O
	2pbd0N4EOU5iWfg6fUg2Esu9ZWZAgcatEhIpdImhCiouTACB31nze0R53LCd7YpmfxsJtaowcdq
	QZEJfVXK8KpTo9ev6MkVtOj8h0zGwVMyReU8k2KnnlTZKI0ZabD/CbtXniRWVZhGH5qq0t7t9oH
	ADDEQlI1FQxmdW5wXBHddOHmRH669oQQUwkPgox8BLiX+dmjg==
X-Received: by 2002:a05:600c:64c5:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-49fc56aa4e8mr197533085e9.7.1790077116737;
        Tue, 22 Sep 2026 04:38:36 -0700 (PDT)
Message-ID: <1d647ef8-c6f7-4e27-83f5-4f9498bb9fd9@gmail.com>
Date: Tue, 22 Sep 2026 13:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/39] xen/riscv: add guest store emulation for trapped
 MMIO accesses
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <230c35550edff0b2b8480b6728614305951fe5cd.1787838835.git.oleksii.kurochko@gmail.com>
 <1789723009.8631fc262581453bbf619ec5b2062170.1a0b3cde27700072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1789723009.8631fc262581453bbf619ec5b2062170.1a0b3cde27700072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1790077117-C26CAB50-6A073E2B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1498



On 9/18/26 11:16 AM, Baptiste Le Duc wrote:
>> Extend the guest page fault handler with store emulation to support MMIO
>> write accesses.
>>
>> The instruction decode mirrors emulate_load() and, like it, is adapted
>> from Linux's KVM RISC-V implementation. As with the load path, the
>> completion is synchronous through try_handle_mmio() rather than KVM's
>> userspace exit/return split, since Xen's MMIO handlers run in the
>> hypervisor. Faults taken while re-reading the trapped instruction are
>> handled by decode_ldst_insn(), shared with the load path.
>>
>> When a guest store instruction faults, the trapped instruction is decoded
>> using HTINST or, if unavailable, fetched via unprivileged access. At the
> Nit: commit message restates the HTINST-or-unprivileged-fetch decode
> mechanism, which is already described in the prep patch introducing
> decode_ldst_insn()/insn_fetch_faulted(), and isn't repeated in
> emulate_load()'s commit message. Suggest trimming for symmetry with the
> load commit, e.g.:
> 
>    When a guest store instruction faults, the trapped instruction is
>    decoded via decode_ldst_insn(), shared with the load path. At the
>    moment only virtual interrupt controller (vINTC) traps are expected to
>    occur, since it is currently the only backend registered with the MMIO
>    handler dispatch, so in practice the store is emulated via the vINTC
>    backend.
> 

I will update the commit message.

Thanks.

~ Oleksii

