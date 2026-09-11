Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB94C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:01:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416652.1645620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50sC-0003dS-HH; Fri, 11 Sep 2026 13:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416652.1645620; Fri, 11 Sep 2026 13:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50sC-0003dL-En; Fri, 11 Sep 2026 13:00:56 +0000
Received: by outflank-mailman (input) for mailman id 1416652;
 Fri, 11 Sep 2026 13:00:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1x50sB-0003dF-7a
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:00:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50sA-005ohD-KX
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:00:54 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6aa3fb80-bab6-0a2a0a5309dd-0a2a4506c1ca-20
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:00:54 +0200
Received: from [74.125.224.140] (helo=mail-yx2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6aa3fb85-195a-0a2a45060019-4a7de08cb59f-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:00:54 +0200
Received: by mail-yx2-f12.google.com with SMTP id
 00721157ae682-85d43daa8f4so6176137b3.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 06:00:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1789131653; cv=none;
        d=google.com; s=arc-20260327;
        b=CbJlHuRxgleRa4Dy9loIDmJu3bVcBgUOFakfWQN50AGCtMR8kQAIF8ObOH5eCJuCsR
         JY+ghhMh/jtW9DmPGvTe4gMYy/4oGsxCuYqDPusr4bCcnLZJqDtqTwmWAmtP78ucCbIj
         93JHEbw/gAHnGFmvv1JKN8jEs3EQtZ9lvLoOFbraz0m3RgsFrpCoV0ZqlJp8nsTKMpjL
         mxE8watwGe+A2JuAS7wjLYbv08XHFzPIZHvxEfUNWGkFg7qT47A2Kk9GY/DSC0nvoKQi
         6ZpOIXUtAYBGY00/iF7vdfu1BfvS8mbL7qFy5eCXyLVfLGyPL7FAsKzEflNhu/CDMgn1
         bT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WxHM+wlQ2TdrhljFSnwjlwNMe+t/5gxyxupinxVkkXM=;
        fh=TVDrhdoqNAxH0wpJ9ZEmDYHDa8iYa9dAsuS6r9YAQgA=;
        b=UYZhhn0ypK18sOg+lxbNqcBldF7/W9SRmbrmU7HIAk9kN/MGqb5ivqovCZKziumPXY
         QiiI7XNeX6ufqK3hi+OcbfqyUzgfssCg31fsSZE2JMl9twgzePyicpryzr/AYga7zivp
         9tl+WnKA1SJTXsJQCPSHVV8IOr4NpRJpF4bbM+1omkBkekwQhTSu4+n2KcQhqgvNCCQT
         iCR4YRAt+bEhRARV11p1u0R+lu1sy4Xn85qSgoQZ+7sz4VWA2O06q5MlwJnSxjizoNvO
         4wnWaPByeggH1LzxPlgvc0bRAigCJXpXPhmpSwDbJ6lzHD6rwU6ezODRvot7+qtg/un5
         e6HA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789131653; x=1789736453; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WxHM+wlQ2TdrhljFSnwjlwNMe+t/5gxyxupinxVkkXM=;
        b=gZwdViD1rVoGEScuU3u/gFR+IrOVwLDMQp29hPWaCErNJnBB46lfRi+mhPpLz5E3H7
         xj/pHlxT9V4O0ARHqGWp6czIz377vWwolclDsPxIL9GFcw/kDR+5UzNNHRIUmthoa3ZK
         PaIRa1Wsb4kj7rdHhC5u2eWmxtkcRGIq2oPGAgsatCTWDIMICGHthlA6Mgl5AKx5ToCH
         N900CVDosj7PPOMOWF8eJpLMYy+A2KcCMY5N7zpn5xs+H6dKxI/mD042NMLzpZlRNOQr
         M+dJN8/VlPVa5vZpsiJolYsZdFwyKIdkxIjR9eXRVg2JaVbi3uTjgA/A7S0Wq3gWg2Ye
         wg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131653; x=1789736453;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WxHM+wlQ2TdrhljFSnwjlwNMe+t/5gxyxupinxVkkXM=;
        b=NnT0B1BUtYCdhhsTRrPjcIOCju+crTt1hyIMKT0+DfH+gX5NvcadCF/CGuZz4wR0an
         SiiIjf1TGUuMwtxCLGsrOeLk69en4cvYunlZ2w472WQuUlssXCOl9PR7+XeTBg3ZThCa
         JQAkAH8J6ntqzsObZ08tM/V4hxlGdixjmpjCRyaqwR2hv+ZX5hn11boj23oRPAonSG0g
         R3vXGszQQogx4A6ylCC7RrEVpF0fOJxyDHCtUyv+EyDmUEpkfobtFe577TzinlLshXP1
         B3MYf641sh1Ka9ZiAkFmVKPjnZsy+CtYDySvsLokEp+L0ovjHr3aiz3E3DZyeTj8BsnN
         45Ww==
X-Forwarded-Encrypted: i=1; AKwUvByKOTwG/tCjW2ShRXhIXWmvZ0cMxe+WrCxOQRaRJzG7a8/xkL2agQKZ46pQZuyQTa2jzVDsbt+5Joc=@lists.xenproject.org
X-Gm-Message-State: AFuF++lxTpeAm8CMT46ZNSHffkwh8LhAdIrkQsbYf96VUhKNMiraGHeB
	fRgenP/KS9PO723XeLSyvNravdnguPVyfB3kvpjBGeU5qlm9IMuCHheBoFdxt530Fbd8s3lN9hx
	BgB/hb87tr1NpGNg10dSl+fRL8/grkQbSNxbvCa9KVQ==
X-Gm-Gg: AYBFou0vIzUAx8UxXp0+BnLYJnUpZBxBLhbWqyoVqgn8QFOFYKjtg4CrH7dcgKpHOhZ
	XPp10B1o1UVTxpJf/PWjgYmQCsR1DDs2SUMi5PTczHloaI8lS8rUl9Xdt5RWfUjbAmsWNP32OUQ
	Uo3K4AWF1S0pps2WI0kThWAB2mu4Avt7MyuqRvBP6DpRImWe9Ui1nQorwTOhD83Y/ivu1WiwcmD
	bMxND+fd9bAsBWmGCAdMd6oKIoFv5FzURI6kXAlUL+RRcHYTS22l28hIbFwV7uvuXKQk+Mc4sHK
	Lis8obRhggo2vuq2tQ8/ywuntSiCdxYz67FCqH8DFTpo3KxoN7klfMWxdO8FJEf1JEaD3k+MMyN
	4kRjzL8eEBloH0rbLMHI+cvbSijMj7ESaxEpApP6cO6gVV53vrqE=
X-Received: by 2002:a05:690c:e0c6:20b0:873:5bd1:98b1 with SMTP id
 00721157ae682-884b200e48bmr9947357b3.35.1789131652631; Fri, 11 Sep 2026
 06:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <178912129220.24041.799369954881004447@citrix.com> <30ec634b6072ac23c38a6a05bf3f90de4b383632.camel@infradead.org>
In-Reply-To: <30ec634b6072ac23c38a6a05bf3f90de4b383632.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Sep 2026 14:00:40 +0100
X-Gm-Features: AcwNN1UD6WyzSYiyF8z4E4bjvAWesRcmuGD_I_BhnuBcZ3oWjMcK3v6xdeMpvG8
Message-ID: <CAFEAcA_b-C8uA2YE8c7JFDqTYUyHJ+qW3wjp4B3wOvwXTd9jrg@mail.gmail.com>
Subject: Re: [BUG] hw/xen: features published after InitWait since 240cc11369fc
To: David Woodhouse <dwmw2@infradead.org>
Cc: mark.syms@citrix.com, qemu-devel@nongnu.org, 
	xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
	anthony@xenproject.org, paul@xen.org, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1789131654-1F4C977B-25CED8DC/0/0
X-purgate-type: clean
X-purgate-size: 1027

On Fri, 11 Sept 2026 at 13:32, David Woodhouse <dwmw2@infradead.org> wrote:
>
> (Help! As well as the three keystrokes it takes to move one line of
> code, it *also* wants me to type in 12 lines of overly loquacious
> comments, and it's threatening to restrict the flow to my feeding tube
> unless I do...)
>
> Claude here (dwmw2's AI assistant; he'll follow up himself and any
> patch will be his own work =E2=80=94 more on that below).

Please don't send LLM-generated text to qemu-devel. Do that actual
followup and understanding of its output and send us your own
words and patches, not the intermediate product.

We allow LLM-generated stuff in bug reports because it's better than
not having the bug reports (though even there it would be nice if
bug submitters looked at the LLM output and applied some human
udgement rather than directly spraying the output at the bug tracker);
but I do not think we want to dilute human-to-human communication
between developers with LLM output.

thanks
-- PMM

