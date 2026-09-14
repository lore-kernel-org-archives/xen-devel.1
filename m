Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0185C88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 09:49:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420659.1646913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x63JU-0001vg-PD; Mon, 14 Sep 2026 09:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420659.1646913; Mon, 14 Sep 2026 09:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x63JU-0001vZ-MC; Mon, 14 Sep 2026 09:49:24 +0000
Received: by outflank-mailman (input) for mailman id 1420659;
 Mon, 14 Sep 2026 09:49:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x63JT-0001vT-RB
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 09:49:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x63JT-00CoBE-40
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:49:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7c31e-8faa-0a2a0a5109dd-0a2a4502a574-14
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:49:23 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7c322-6ca4-0a2a45020019-4a7de18d8aa9-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:49:23 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e6b885ef8so7498195e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 02:49:22 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb2ecfc3sm24826006f8f.4.2026.09.14.02.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 02:49:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789379362; x=1789984162; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JcnnsXW0NCPzXOWQCXzIot1QQ8b1TbROnhwSccF9ATc=;
        b=Y1+KVKOOb6nl+FhhJmizpoMQwiiM3F46aZC1RhuhpBIuXECV9fpAIQEFunJuZmh5Qo
         1b2dCDgpaM6ExWLhGDboGKZY+WXnAZ3wN8MFCkUXiAYOURrQSf6T+NXbbf8Nu0CHAbG+
         4GOwl2FnBaDdDaaCaViLag8NbymtAF4ZouzRqjIZz858Lnx4fYjbttJq3CjFGLXfKLVU
         T8SOxgJro0pHHCcS5WbDuzxSqgxLKYOWWZKo+a1otwdgw6Eh0Bljm+mTTRfvfz29/WTX
         bf/RtcTBajSpwnDuHckZEJxLtdGrATWEra1YDJVAkIYo82CY5grz1h8Awt4ol5gSGDqr
         uiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379362; x=1789984162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcnnsXW0NCPzXOWQCXzIot1QQ8b1TbROnhwSccF9ATc=;
        b=IJSZVgVU9xHzGQG9B5Gc4gazB54kKU67ke51PGnbMnVgrWlRbiand3wWtWk+vwCXNy
         EtUFbFgJjrY9Mw+4DzZvT2roAJpuSn+0ISkT9zaXcsNRvad0cWCix+r2VU4plpqWqJBB
         brS7BydbSnoYPb6FB9ypB+ZrV2oXYMZ/DmnDRtVvwaBGxjj/MlfC0v/IHxbEZJMTvcQw
         yVRbRSxfn5MfgblNwmjqp10RqF+UAufbIIojXifKt56rad/7MU5m8ghEllLLyNqY7bo2
         CWnFeTsfLvRlVaLUMVK+v5NBe2ZV0ylWBragRnJEGoPZw768un2rEXSExR6qHZ3OYYi+
         VbEA==
X-Forwarded-Encrypted: i=1; AKwUvBy+/arWzBIeYqWE6E+Xc+rVjjQSKKamlegGx9ZUjDzqfqSnKynqtTQu7dn58IxZNmccn/0KEq6ljzQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++mVyuw6gObgsHfCqleqCKlDI4KQAdrdTxaTS6jzxtIzWnkvhFGS
	y+ejCliFApF8MrAJyxq6oNGq9ov8qkiBP8sLuw9Vevvwi1eDikbr3g7fVdLREqoc/A==
X-Gm-Gg: AYBFou18XDxGcYjWQYHOvNahyxjO7rl1VahDrwxPEPETQkm8cijzeZmRSzE/DxnP0jl
	qhxZP177EHcXH/WXI4h7YQ17Qtk53KnUKN8IbHjcFenHDERK7PVIX07dB7YltWqqfWGEfZF2mvL
	mLKBOLZLmW5PcCbsqbFmdD7tS8j1jJB/YEGKbEkwXA8AZC9ZUvlyoXfaWvYpInQrhJwsZR5VhgG
	kHjhEcwTGuyvq9ogESdIgqrmVU+sjt1mVRFRkBM7OemosT97rzbvvVDroPaWGhmkibE1zHASNx3
	R3Un6v0x3QslipEKNQbXK381PPp/yslgL/vDVxxRCWiJSuQt0gMmQVJ94VzjpkXv2/HLfZqPuOO
	ov4eXnohqpikEMmjtkh5qxfFJp8/85IVya0Nqf/P0SKNwJsVZiaA5fdbcIffjI6/3RwMxqxKmMe
	YWM7+99TwIjob4aBAQpHmFIOwRulKCCw/5dfI8DXcaLDTECZ1K3a/Z7O0Tt4mmmHnhAX5uBA==
X-Received: by 2002:a05:600c:548b:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49e7a6625aamr19728365e9.8.1789379362532;
        Mon, 14 Sep 2026 02:49:22 -0700 (PDT)
Message-ID: <e9b0678a-a05a-4a26-b8f7-6331ebbe0dcd@suse.com>
Date: Mon, 14 Sep 2026 11:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] x86/viridian: Workaround Hyper-V GP fault writing
 to MSR
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260911091244.1165516-1-ross.lagerwall@citrix.com>
 <20260911091244.1165516-2-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20260911091244.1165516-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1789379363-F02992AC-82C126BF/0/0
X-purgate-type: clean
X-purgate-size: 576

On 11.09.2026 11:12, Ross Lagerwall wrote:
> The Viridian spec requires the vector to be >= 0x10 when writing to the
> SINTx MSR, otherwise it should #GP fault.
> The spec-defined initial value is 0x10000, i.e. the vector is 0. On
> startup, for some reason Windows 11 Hyper-V tries to set the MSR to
> the spec-defined initial value and since the vector is 0, it GP faults.
> Fix this by doing as Hyper-V does and only fault if the SINT is
> unmasked.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


