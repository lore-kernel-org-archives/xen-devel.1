Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07665C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 07:22:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428250.1650978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8upD-00079Q-O6; Tue, 22 Sep 2026 07:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428250.1650978; Tue, 22 Sep 2026 07:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8upD-00079I-Kb; Tue, 22 Sep 2026 07:21:59 +0000
Received: by outflank-mailman (input) for mailman id 1428250;
 Tue, 22 Sep 2026 07:21:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ndaugoing@gmail.com>) id 1x8upC-00078r-CO
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 07:21:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8upB-00Emhp-Lf
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 09:21:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ndaugoing@gmail.com>)
 id 6ab22c87-e002-0a2a0a5209dd-0a2a45049ba2-38
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:21:57 +0200
Received: from [74.125.227.171] (helo=mail-pj2-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ndaugoing@gmail.com>)
 id 6ab22c94-b57f-0a2a45040019-4a7de3ab88b0-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:21:57 +0200
Received: by mail-pj2-f43.google.com with SMTP id
 d9443c01a7336-2d9004a1ac0so24804555ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 00:21:57 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:8a1e:2e81:7320:b94b:d1b8:4cbd:b7e1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2df5d057f55sm4912055ad.73.2026.09.22.00.21.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 00:21:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061715; x=1790666515; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6+9O7L6qCQ5h69lNzkhEL6SI6PUQRg+/hzlVyYHi4k=;
        b=Tu96gy8l5YRKKEwKJjG9RoIDmJe8FRk6NZxrr92C8/ks/OAtPOOxORdzfBfUuu6Ntb
         Tp53KQQgh9g6XpgaPirbqrmzwNN+//M96YXWscViotZ6tZCcKy0289LiVv71fi1R/xkx
         AygVaHknZYYsXnTu8IKTZRMXyhfm9+5EqBH66NeDYAejRgvlGP2ps/bB/jlOcJNKr3Cx
         5YlQl+O98/hjpDs9nZ9QGDwMbw4N/PM6gq7J8PYD74HJCKNTSjhZg2wygGffqcSOHGJd
         SEbjwPjWkih3DRlJvuxqNz0f9Tm4SD4B74uHILQ8hP8nu7jUGyMpxL17sbx2s9IxXZze
         plKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061715; x=1790666515;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6+9O7L6qCQ5h69lNzkhEL6SI6PUQRg+/hzlVyYHi4k=;
        b=D4HV+LG3p17vZQbgM0hRE9pbC8xum//hJV1Q9zy3PabAircC7aBELP24yOKMth7Wl5
         1x0pzktoajiyLane4PbyN1TUnQ8I3pLQ8ipa+eBvYVWQia31o0F7jkDRWFjnA26P16QI
         kL5IbqEeG72/u7x5F9qQ3C88sRJ3js4v7Pk8/T0wEkWbzt6h8Jm1i+Wb69sdwZfW+L34
         YTAYSV9LZutpwbgY9XtZuo8Mr5wl5twBOk3KAfXpUvomQ6R2oFFYuU1Sd8TiAMbIaSIH
         VbB6HB6lUbPA/jqlmjuVjLGzuN0U9Ez1Sojd3Qtl6w2YP0sTbzM+j36LS9XiD9aGR/cs
         FaNw==
X-Forwarded-Encrypted: i=1; AKwUvBzp336nYfIKKt0vGk2h9PsjM66qtgDFwRVsBsBpWQaejZoimSJIjYBvXO73Ocmd+TG23OW25r80+1Q=@lists.xenproject.org
X-Gm-Message-State: AFuF++ntkGl1RYSfHj4ggwn7REYksK85LBgiR9Xi6x1Vd5VUOa0tE0Je
	7citf0r+EGcaWzMIyDMRW3nVMkkoFQpS+DHTo7gGSZFekg2YjzSUZQ7Q
X-Gm-Gg: AYBFou0tQeZxSKp3XTkUbzxdGg0QIojFJFukU3DOoBMJUs1BP7get42pVKDGVVHnz6A
	Tso1Ag68mE99+CljeHPHhFKCxdlYkphtTDMVGgNHa1I+Q8UM/Q6+Ufc2wCLevgXHYFm2C0e05Sb
	vHqUiA6Av/NwqtmmNc50+PEP/6p5F4keOxajXN45hyT9Td0axJa6hogUKGfK3I5/KKWqzkgqgJq
	yXyYHPg59tsi0esLQMhW5tWW88bAcZllTRlm5n7HURzUSqq040owBcf7Dj3/jD4q4Wp9tIraoOD
	VNn1JTJpfYPbfkMS9iB+Xn7L5tA26PqzryyWGkxRLE7A8JRiCf4exjrS+Jzs3CP+/uarlV8oskO
	HsYPoQyUrLg001lhOy2+5i6t49yOToSYjh8Lhiw8ur3e50/6AQxaKxTRuQ//bbaErDjxB0WCKf8
	a4w9zcdM38ubNhYxj0sI/hJuSmN/UL53oTrW0lOkv0Wx25OXlFCYK6mFh913FFZwNdIoi8mnjO+
	WGzEcyTN0qwEGWSZy3HlA4961P+arf+43YzjTk=
X-Received: by 2002:a17:902:ec81:b0:2dd:c100:80b2 with SMTP id d9443c01a7336-2df60b61d54mr3177535ad.45.1790061715434;
        Tue, 22 Sep 2026 00:21:55 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: Re: [PATCH 1/1] xen-blkfront: unbind irq before tearing down ring and shadow requests
Date: Tue, 22 Sep 2026 15:21:46 +0800
Message-ID: <20260922072146.34611-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <arD7FHmbqJlLHmyE@macbook.local>
References: <arD7FHmbqJlLHmyE@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790061717-C1CD7B50-F5E84877/0/0
X-purgate-type: clean
X-purgate-size: 516

Hi Roger,

Thanks for the review and catching the right origin commit.

You are completely right: commit 11659569f720 ("xen/blkfront: split per device
io_lock") removed the lock protection from the interrupt handler and introduced
the race window.

I have updated the Fixes tag to point to 11659569f720 and added the requested
comment before unbind_from_irqhandler() explaining that interrupt teardown must
precede queue data cleanup.

v2 patch has been sent as reply to this thread.

Thanks,
Yuchao

