Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412F0CDB466
	for <xen-devel@archiver.kernel.org>; Thu, 25 Jun 2026 07:17:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1345304.1604202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wceKy-00078H-IL; Thu, 25 Jun 2026 07:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345304.1604202; Thu, 25 Jun 2026 07:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wceKy-00078A-Fl; Thu, 25 Jun 2026 07:17:24 +0000
Received: by outflank-mailman (input) for mailman id 1345304;
 Thu, 25 Jun 2026 07:17:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wceKy-000784-2E
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 07:17:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wceKv-002clX-9U
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 09:17:21 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3cd5fb-bab6-0a2a0a5309dd-0a2a450caf60-38
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 09:17:21 +0200
Received: from [209.85.167.48] (helo=mail-lf1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3cd600-f399-0a2a450c0019-d155a730b8cd-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 09:17:21 +0200
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5aea1776279so340036e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 00:17:21 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3999afd3ee9sm42215171fa.17.2026.06.25.00.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 00:17:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782371840; x=1782976640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJotD54yCU2Ksws4toVBR6DBq3AUbXfIw1+aECBmAYY=;
        b=OskbPAB+d7oi6pG9n/nfKkt0GYoGc8ymxdCPhCygOoQqVBZU3rdFvx0wIbNhV1AFoH
         bMktaMzZc39NG7DxqPgk1xeZbPYgDfjKmxpgzz1BkxF8II3j8GMA+GuhzZCn6gXmVUYm
         J6zY93KB8Iz5r4pt9c0v+UXfDdlAXLn3+ZuZpvGINYAxgWC5IWkLWxZl6Hype0gsz8ff
         PvGfP+2BerCbWf1dtXW1EZJSGxAQg7HXcObWmeM69PJccVNFkDPnfzOtI7XbNbhBMWgC
         4q6s2yUhgOgEOpT7rjrUS590ooooW7aTNnp7hUfLO7OQdHqCjkd0ph40ap92pWsJLHsq
         1KSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371840; x=1782976640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJotD54yCU2Ksws4toVBR6DBq3AUbXfIw1+aECBmAYY=;
        b=NQsIYZMRu4I2d1SSQ0TQerYsmMeG31n2BHae+9eiECQLkVVpHB5/lhrWXMCvch+HLB
         86wKd8zrNu3eRpj4mjhREfvKP1+sHhIXUWynv6mUz/qWWM30pr46eRjQgiA94bTsP+nY
         +zAI7v6QStxBL11SLI7c1qoIJHKKeZFH2hdTXPA0wQ6v6pdI3cweHnVAS+hyAJRwNNJx
         Z93E0U+Yl4KdwBqZ9fAKUQ1WI0jEDq+BlfQHAl+rFPwQVbxoSUit8d2iSvjMxcSt+M2y
         Ef6FuMe/fjlPTNQLWvZMxqKRYc724k4Fusjzobcud1AAueQCFgINDLrHq0wIkQfkZZDg
         zadA==
X-Forwarded-Encrypted: i=1; AHgh+RoIj0zXKaVkHy6VrxbPnii2DLw4cnKy5gcDZZ84Ofam92PMD6wx8VMPDejQjse+uXO5zI3SQeiBNLc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQtiZQ7Vtjb/0329PxL3hjpm4qkpVnG4wENsAMFubleGau50B8
	SCvfMmdMMSL2q1/eDa4lk2QYodwUcHZ57pAT2KyQtSVfWjX7I4RdbHn1hxfgzQ==
X-Gm-Gg: AfdE7cndht3IlaI9eORSBz4cRSeYeKGhGcrKBlOkXGIEzOOTLe0GsicwU90wV1ogvsd
	pU5w+epQJaaupXhzCfGgsq/RJOKHrXwEMDMx/upf0q6tgO96Y/5gkd/Sk+/BBXso4dk0AhUu+My
	SgcesSPIgPQSzQ+2FJTIKJO8FcOvpNZH9nzgQfHuhJCgQqCgqzm9g8l5lfWWcSknGYdiICe5QTX
	bgBmVRCX6VawQhJTgDUQyLU4Qxckd43Og7ym3zg4o1uJFhXt9f+xyVykao3kqoCrLwPQO50xFZo
	5oSMyqbOy0rSMYc2ovG227MlSP+0vz7dtwG9avtrktMESdilE6wIz4awhMsteBMjpTNOpTiX8sf
	5EHpzHulF8WETKJ2/gZJ/he+MDtDAizXIk3db86VKKGjEhqT6fxeAJtzmPul0iyygIgPdhn3EHM
	DFKESZPObOLBVOr4UssQXtybPaNAmeK7R1gGAvfqhwqUJ8A7R7UVVn7LlUoD1uOd84IVI=
X-Received: by 2002:a05:6512:4052:b0:5ad:699f:9edd with SMTP id 2adb3069b0e04-5aea1f63d9amr368363e87.26.1782371840180;
        Thu, 25 Jun 2026 00:17:20 -0700 (PDT)
Message-ID: <527f0734-09e9-47f3-b933-322ddf80c019@gmail.com>
Date: Thu, 25 Jun 2026 09:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] x86/boot: don't blindly mark VGA in graphics
 mode on MB2 path
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <7fbe73a9-08b1-46ff-81fe-ddd6ed52deb6@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7fbe73a9-08b1-46ff-81fe-ddd6ed52deb6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1782371841-0E120D51-F4C8764E/10/73395122804
X-purgate-type: spam
X-purgate-size: 813



On 6/24/26 12:24 PM, Jan Beulich wrote:
> Setting ->orig_video_isVGA to the specific marker should be done only when
> the VBE tag is present and the FRAMEBUFFER is either absent or indicates
> RGB type. Since the "video" variable now starts out non-NULL, this
> property was broken when in particular neither of the tags are present. To
> move back to at least close to original behavior, add a 2nd check to said
> conditional.
> 
> Fixes: d5a73cdc6b90 ("x86/boot: Use boot_vid_info variable directly from C code")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

