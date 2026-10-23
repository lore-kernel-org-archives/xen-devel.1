Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C51606A31B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 14:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=YvMyL0L8
Received: from list by lists.xenproject.org with outflank-mailman.1459336.1671301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKG11-00013M-L4; Fri, 23 Oct 2026 14:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459336.1671301; Fri, 23 Oct 2026 14:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKG11-00013F-IL; Fri, 23 Oct 2026 14:13:03 +0000
Received: by outflank-mailman (input) for mailman id 1459336;
 Fri, 23 Oct 2026 14:13:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <almasrymina@google.com>) id 1xKG10-000139-UD
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 14:13:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKG0z-00APfm-SG
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 16:13:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <almasrymina@google.com>)
 id 6adb6b69-2eae-0a2a0a5409dd-0a2a45038ac4-18
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 16:13:01 +0200
Received: from [74.125.82.49] (helo=mail-dl1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <almasrymina@google.com>)
 id 6adb6b6c-fae8-0a2a45030019-4a7d52318c05-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 16:13:01 +0200
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-151de818519so4127c88.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 07:13:01 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792764779; cv=none;
        d=google.com; s=arc-20260327;
        b=OtTy3+CEaJ9Y4J75PJF4mSgcwJ8TlevxYckuZgfa7aZ8fpcqJUIh+EOBLprrshx1Wi
         Um9Jk+7SKrjwbs/J5svcAQeLUwnPpN0NyaqUH2tpJXqkINKbvSVaEyUVxFxWqEG+FiXp
         eTQQco3vcM1C8mP6afMLpFiT2krgQjHOKw8MLLjZPDwXvjYzCGgthF7JXtv04Su9M8uy
         8u9MF8gonK7pTDvsvAVb2qa6u/ssN4fpPU4Ld4bLacM0MHlPO9/tnm2nOfmJPB7uF1v8
         uCMk06X03nUBXUbm5jeoEyWLtXMl4fs6uBZYT9A2B+Ps/TuQ3+QXOrM/dcN01rK0lZ14
         KaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xkLt3lfrbsQ7vfYdIskLImlrhPYw2t6MqVNHm8RXqsw=;
        fh=OJliEttHmb/xASVAeF1CSy2INZws7GMjffaELyUwywo=;
        b=BNV/3hiimZE6fEFek1J+POlMFxs7332nj6c5Z541kv4BjpVB82rNgeUsYO9BFV/ZGa
         zjrzbl1hklXOgZCVSAyu/JT8IscrV3MLfUxB/zUBega7m5CjAncVi5uhsTXOYoZYK4IL
         Z05vGunNk7APiRbUN5NnEKluUWzSzr9ryykBTG6oDXVVJD7oYhNLSsmLbxDmlGPhDQnp
         GeD6jN4ZVDj1Wgsu2rc1iRlnSRrrQvCKh5HxCFqy2jeF4JaVMw6NCWMAy9+JWfVoTpK/
         1ANp6PT0zl2+5DmI67cQsv5wQ6/CBIOWb4hvKJnoD/li1bYIKh33+chEdXtHJOQMVtXK
         i27w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792764779; x=1793369579; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xkLt3lfrbsQ7vfYdIskLImlrhPYw2t6MqVNHm8RXqsw=;
        b=YvMyL0L8Ys/RfuQdYNrrBYuYswp2V56VkRQmRDYwDB6oXRnl78FLc4jIyMAURS5ZzX
         5xG56DgH2/eh8j1RIbFqSAGYkQinyAVCtcloCJdCb1V8JtT8LxYC1WBp2ZPHrroCjNBP
         1cmj+GNwFCqVvZL+qm+XLW6ZzvGhlOgSq3XFd3ayUrEQy2YuQI/YImgQRb/hldW1wGOB
         6x8+fWmRyIobfty+wCiz9Rugo7/878ntU491jbQxWbcc/C8pwzi1q6i/uG9TyHAnLR6z
         oHTcLY7bJ0INe/wat9CVnXEhp/YsMp1TxXQKVePw4zyec2U8927t6GwAZl9RrgtG+plv
         UDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764779; x=1793369579;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkLt3lfrbsQ7vfYdIskLImlrhPYw2t6MqVNHm8RXqsw=;
        b=ud9o6Bt2/YTqxTGvTCLg4po0RbXYVULFyOGn6+UC9ps1cDRqloPXmLvbXOS+KOaW7x
         206OovJmrbnpv2jE5dNzvoM71bTw6zhImx4Gk/4VIvDhBoJGBZHEeOXudfCc8K+ZvpGn
         uzqGw5ROWyCSe3FySEgc9XKU+xSAlE1oRlVe18vrDpolloeT8Wcumj270v+UdAUs9qyS
         ygpm/rYXG+uZ+ZjNtArswSKVi+YSo9Wwm3uQ49ysJLMqjU8xWIfEvH3FckyhY9cst/w4
         LyszOD/gfdSZelTzkRymu9hlvMizei9+cb0wS2iksTDcHWFuLDdoTSmxnxMIHgg7sGUh
         N8Ew==
X-Forwarded-Encrypted: i=1; AKwUvByvPVNfjAKsM4JkEYDLTGKI2dhdOTQG+BG7kcpu+FxRJ7bjegdoPTfq/F4EVFTZmd1Vh7G8m9hBKO4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIQeIJCVZ9QrrnVo6XyIA1gcL5hT9hyrgHy1NuiOCppn4U8iX21
	C6BDfqlzgEEy3FyPo5fmC78a5mfr5ZEDFpPwRsdY7M7tP/m3/6iTFpZs4ISf5Mh/302yGRILq+r
	Z1RyD5jxi/cupZf8t3GU29SB/7K9YLhMPS2Bn9siY
X-Gm-Gg: AYBFou2cg+e22IEeL1qBzBrIIrS/lGzW3sXrfVFnf37Avd47wx3M96L7j1JL3eX2wrl
	s7b2i5firtVMEESefon1QsTm+Dygs+s2v8AUJ/ZiNU3ex8LCk9Orpe8Y3K/UGLiPlW2jAybWzIZ
	HBVaz9sh2pxWrojMxcOL39jeHU3iwclmVuCiqmr0QKAXyjmiReKoKAupBmF6sh1Sr5TTLV+OUjh
	8Jf4q5AbqCqgggaZwmDT9OARd4hI32jP9IpErb2AbBoNtloBYOVI/tUdfmgiUFo3o++uZc3aU5b
	Be3chQbNOu3hRwQl+GaEMNw6UOovk0BPTY8AV7NvGT8Uyyyt+uLXf0jYcItciWzOmGyLFbtqU+S
	pFfStUsYU01r+rpiXoaPWRF8tdIGOwVMXq731nPP6dNBvgpObPYS7O+vGY7T4Jlep1bF4
X-Received: by 2002:a05:7022:6ba5:b0:144:f802:8bf1 with SMTP id
 a92af1059eb24-195f96f6e3bmr421525c88.18.1792764777402; Fri, 23 Oct 2026
 07:12:57 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-b4-skbuff-bug-on-followups-v1-3-41dbef50b9f7@toxicpanda.com>
 <179273111951.3134.3452028799437573017@kernel.org>
In-Reply-To: <179273111951.3134.3452028799437573017@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 23 Oct 2026 07:12:39 -0700
X-Gm-Features: AclHuK-tcTcrResIEJF7frxNES1XOTcAYvLS5iUmn3CVJsSLoqeepm1x0REGvsg
Message-ID: <CAHS8izMBEkxtS_s2t9uX4-RLxxM5249U_y=G8_1qtr+y3jL6=w@mail.gmail.com>
Subject: Re: [PATCH net-next 03/15] net: skbuff: fail checksum validation when
 the skb can't be checksummed
To: netdev-bot+sashiko@kernel.org
Cc: josef@toxicpanda.com, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, 
	jgross@suse.com, sstabellini@kernel.org, willemdebruijn.kernel@gmail.com, 
	fmancera@suse.de, david.laight.linux@gmail.com, netdev@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1792764781-750864E9-72C182E1/0/0
X-purgate-type: clean
X-purgate-size: 927
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 9:52=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The fix does not hold when conntrack checks checksums first.
> - [High] __skb_gro_checksum_complete() (net/core/gro.c:794-813) has the
>   same false-accept defect this commit fixes in=E2=80=A6

Both high's here seem like legitimate issue, al though the latter is
maybe pre-existing.

--=20
Thanks,
Mina

