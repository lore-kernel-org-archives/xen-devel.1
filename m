Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F2B606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 23:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GAL62UBF
Received: from list by lists.xenproject.org with outflank-mailman.1455054.1668589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIwyH-0008WI-NX; Mon, 19 Oct 2026 23:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455054.1668589; Mon, 19 Oct 2026 23:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIwyH-0008WB-Kb; Mon, 19 Oct 2026 23:40:49 +0000
Received: by outflank-mailman (input) for mailman id 1455054;
 Mon, 19 Oct 2026 23:40:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ludloff@gmail.com>) id 1xIwyF-0008W5-Sn
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 23:40:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIwyE-00DCFZ-Rk
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 01:40:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ludloff@gmail.com>)
 id 6ad6aa15-8faa-0a2a0a5109dd-0a2a450b825e-44
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 01:40:46 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ludloff@gmail.com>)
 id 6ad6aa7e-b7e8-0a2a450b0019-d155d030a5e0-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 01:40:46 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6acb9c018ffso287827a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 16:40:46 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:To:Subject:Message-ID:Date:From:Reply-To:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792453246; cv=none;
        d=google.com; s=arc-20260327;
        b=GokrR/ztEq9hB1t2c7KdutiyJxhoTK2UpmFhKgCYjYQfeobE7H4LhtU6tiywd6ung0
         1CbMOfPtsFT6rEabNy/MqGY2p1jDmcFziLjEEGwAXo5E6nIXFVoCNgy0Se51xmw4ZWT4
         JALVNf3kG7bN/1lRUSoRYvFNfHlkG/Foo54miZ63JmX71Mva35rcEJu9YoW1KXWNnCV/
         R3QepyTr19bjCPD95rvV5QpI92u47fuwzebPSXeaL3vmiiKgKa02JEkv7D6bU5w66F8A
         /9fxN/9M+cLMVuefhJOx8hIUmhZnF21DpqtU214mXdjO4TbYI0KgIruGx5hev8pgzJL6
         0s4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=k9sLU2zZysN+hcDUBgFgsh+bW6LB/1ZVChhIXh4bH38=;
        fh=quJY5mN2l4ZorNvEoO9ngNXalhEvTdq/+W8CvHWhECs=;
        b=nfSPBtlE0MJRj+vwzV1SxhQlLQfb8VJK7LyX0k0kc5AXVGe2UQse7VesMDunVS4nKb
         DwBwcL9GlpaZwNUJYank+pco8908cWhtxJp6H5We9J7MPVGSs1IR5no8ZvXCoZCf2BOF
         Psq+hCNez1P6LjkAXwOxTpA/scDX9vF/CMd/SEmEk1W53nqMISaAmMGTaBNVQlXJePnN
         udV2fv/D+6BsapwWMNdxbqzez7QSxOArrI/EcyBPVubgkHWCm6TkW/yQTBajzMOx01FN
         WmvnBFP+xMmUhuz1QzINpWsDzW+lHpQnYoIy4D7x6QKWuuBlXJZqGtsLslX2xKFKSsoR
         mEzQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792453246; x=1793058046; darn=lists.xenproject.org;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9sLU2zZysN+hcDUBgFgsh+bW6LB/1ZVChhIXh4bH38=;
        b=GAL62UBFPkkWyKqUAD4KXK57yfr7avutxX0phAKkiThhTswdX5wzyNxGgR4WLYfJrc
         n++1k76BSYkBx492m9Edz5lu71Zba7X7b3Rtu8Fi61h+m43m4JyRYw/KU4do/o9WP9Cb
         jyB+M+3UC2wb6hIPvkE1XNdPRzp1FBAF/L9WbVt8AROqfJ+4L/nh282wdsuHVhl5CDfF
         LYdCikxQ5g1yHAwUjzU1HDNnqeHfeXIT3McSol6lbdryU5NAkcB8M0Q401rDFJxSRiPF
         5OW9waDfwZYZ4VwNmRgh9LY2x4WfsgkxKjIIh7AshBZRN5L/Z/uj5nIHfqOPr7zrJ9SX
         J7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453246; x=1793058046;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k9sLU2zZysN+hcDUBgFgsh+bW6LB/1ZVChhIXh4bH38=;
        b=LZtyWrgAAjdUPfsgV7RPUtA7pOgrLZ5/YDxfUNB7Q9PSS86vUm4LpaopvF4ncWsU0l
         818d1xISN22qMjdx0u/2GUZeQwiTkgKenaFRhL4fvcOAKf1NjDkEa2ELlgXBb6EUw7eo
         1IupUzRYyFNLfyraxVtzd1++PggAT5IXSAtB22zevUqvoKyfYhHtqnHmn0gBfSQ5P43f
         2gZTincF/WtAWgFwE5Kqsft75zSF4kRsCMone5Nv9enCXJrXN33edFvTl0L9ycMysFU4
         d7YaqM9bDbNVLB1OTnx3L7i7bHfHJKpAFVCtnL8w8zCg/M+jwW1pBHxHxZzdo0OGB4dN
         hsEA==
X-Gm-Message-State: AFq9FYLElEAeWzPiGcB8cjQnqNQN1s+4PaFTvp3fsrHYW01i6lQpGNi4
	plKYEloMbxucQF5m6vqGoO0SKAKxpxFWxSPd/riR5Y95cMqphQvEWtzyXOyONq8sSpGnnVk5kul
	FvkgB1UPxWXzqtoPeVLwBDy0K/lVOF2PUBOlg7k58Qw==
X-Gm-Gg: AYBFou0thbAV5cmdDiCoc2Cd6mjEk6YcDwfoGcqQNwsBur+6Fup/joZ6qqsHcKhJpp4
	9ZEFBaHEuhEYC43bbt+qo2GLwPuizqUnWhx3RnuMwCxBkUdmSOEsZiVNYRkSMfbfh72CuyqaGW/
	eDHaLtZejIrrZuVhr+fWwLUO5sPVasdl3LLRYvZpB02WAJw56FEsGx6ydI3/rTj7CcFY+Lpxs4j
	xJcG6uPq2TqOiya8o65wcCQA+7igkRBqEEBPaliQyTj1pv/D6aMxgDR1VpplvpRTsp1bx/ZaM7t
	khWaBbey2UQj2e9PA5vIts+MS7awOlZoJLbE6FHplQLusy0mg++4xws3HWMJEVIaOXLAZ6A22+2
	8A5PbVFNe8MVy6kpKiSQXOSqWQ7pBOCKs+dnr/N5S9EmWdhlp7eqCaUMSZ0iUkCI+ESbcxRhd
X-Received: by 2002:a05:6402:158a:b0:6b1:c355:c7c2 with SMTP id
 4fb4d7f45d1cf-6b3e679f617mr334087a12.13.1792453246257; Mon, 19 Oct 2026
 16:40:46 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Tue, 20 Oct 2026 01:40:34 +0200
X-Gm-Features: AclHuK8MuOKz1Gd45M0vqBXptHGA3tqsrHMTJuH7Ligjuy4RhL29rknB82vgWJY
Message-ID: <CAKSQd8UuWw+JQLr5=3erPj01RgSPq2szcWR7Piuu8CSRqR8jhA@mail.gmail.com>
Subject: Re: [PATCH] x86/vlapic: Don't change ICR on x2APIC SELF_IPI write
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-42698a/1792453246-192CC9EA-7204D707/0/0
X-purgate-type: clean
X-purgate-size: 461
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> It looks like it's a behavioural difference between Core and Atom.
> Core modify ICR, while Atom do not.

For Core there might be more nuance yet.

I seem to have an ICL result for "does not".

And I seem to have two SKL machs (same
stepping, same ucode) that... disagree with
each other. Some sort of config thing...?

Maybe Intel can explain.

I consider "does not" the cleaner behavior,
unless a compelling explanation is offered.

--
C.

