Return-Path: <SRS0=7xGv=V6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80818C32750
	for <xen-devel@archiver.kernel.org>; Fri,  2 Aug 2019 17:07:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5072C20880
	for <xen-devel@archiver.kernel.org>; Fri,  2 Aug 2019 17:07:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D10CNQ22"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5072C20880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htb1j-0006Yg-Cj; Fri, 02 Aug 2019 17:07:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/l75=V6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1htb1i-0006Yb-0N
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 17:07:34 +0000
X-Inumbo-ID: 03cb6967-b548-11e9-8980-bc764e045a96
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 03cb6967-b548-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 17:07:32 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id d24so73511225ljg.8
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 10:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=UWND/3c14T2Y+4NTtfhOezVQTpcxUCdeecJ+DsQwDzc=;
 b=D10CNQ22Y+MiQgwMZN/FmVtxYTm+wFhLwvpljAFHfbBraqsNS3irseY6G3dwdvvS0b
 6NTSM5h/310pkl0bi/FZ2DHfx4ZV98MlQe1TJkXtTy8sOchQe+uUd9wlxDvNDz4d0i8h
 9NxvS+WU6na9l2WiPCmiYirGYECg6fFJw9aK3E+7JHVRrkQJQ6/saEUjtouME+G6c/yV
 BYn8+r+R0YYUY8jsTQ6Mj+YKko+8iCUS5pe2WtH68E87JxDCQNkJo2rlLrBXOyyI0m3B
 ow2nr0Z8tiw4PnwldVLOJl8CBD0V8/q7JM0rJAPt4vqBzSQJJe7++ZnpM5MIyi1Zan/1
 L9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UWND/3c14T2Y+4NTtfhOezVQTpcxUCdeecJ+DsQwDzc=;
 b=LxeyFf6JOlefbcv7X4gdWZfiAn3/DaDBvGJDad0gXmbYlKXJYxc7I3y993z4km4rl1
 Hl3Ftfas7Q1xR8LO8IUrmLXqLDTd55DWA9AddCzfiXMpdyfP5ApDRBe/Bs893DPK43It
 3RB4Exl6Mxwkuyv6PToxYo1sNtjbUoCi4PwBitAaTDr3/EmChCzYmB4NZodtbUkrkGBr
 ldbw41T2j3rQDE/49sKzadzMhRllxkm659FdZkvu2U7W9Va9rGKcum5McAgwZc6DTis3
 zLbpAswtkezdGjMAynD1qX9kquqUNlEE3Vo/un5Nnu+st/5skXQ95UXGGwtfASZm/Uoz
 wzzA==
X-Gm-Message-State: APjAAAU1TAgfz6GjX0v3fAOk1794ddfJkBZQwBJleHeQBj6cJF7Ylwd6
 SHNmIMNd0clEcPC8KLlEgoKuSvOuyEU=
X-Google-Smtp-Source: APXvYqxqZEglRMkYSF6zrjzWPFu7SseKPS5L7GvUo5QKIMwLpPOsIxlCso3jTzBr9wbwF8EVfuljMw==
X-Received: by 2002:a2e:9c85:: with SMTP id x5mr4888690lji.139.1564765651261; 
 Fri, 02 Aug 2019 10:07:31 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id w1sm17604529ljm.81.2019.08.02.10.07.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 10:07:30 -0700 (PDT)
To: xen-devel@lists.xenproject.org, jgross@suse.com
References: <20190801160048.11031-1-jgross@suse.com>
 <20190802155246.GD5791@perard.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f013b687-64da-d5e5-e187-e930a52e22fd@gmail.com>
Date: Fri, 2 Aug 2019 20:07:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802155246.GD5791@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhlbGxvIEp1ZXJnZW4KCgpJIHdvdWxkIGxpa2UgdG8gc2VlIHRoaXMgaW4gWGVuIDQuMTM6Cmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0w
OC9tc2cwMDI1My5odG1sCgoKU28sIHBsZWFzZSBhZGQ6Cgo9PT0gQVJNID09PQoKKsKgIFJlbmVz
YXMgSVBNTVUtVk1TQSBzdXBwb3J0ICsgTGludXgncyBpb21tdV9md3NwZWMgKFYyKQogwqAgLcKg
IE9sZWtzYW5kciBUeXNoY2hlbmtvCgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtv
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
