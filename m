Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2655F606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wsKBwl9z
Received: from list by lists.xenproject.org with outflank-mailman.1497587.1695822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUDJ5-00047A-AT; Fri, 20 Nov 2026 01:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497587.1695822; Fri, 20 Nov 2026 01:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUDJ5-000472-6V; Fri, 20 Nov 2026 01:20:51 +0000
Received: by outflank-mailman (input) for mailman id 1497587;
 Fri, 20 Nov 2026 01:20:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ludloff@gmail.com>) id 1xUDJ3-00046w-GO
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 01:20:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUDJ2-00Dlt3-Hw
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 02:20:48 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ludloff@gmail.com>)
 id 6affa067-e002-0a2a0a5209dd-0a2a4505dc26-12
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 02:20:48 +0100
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ludloff@gmail.com>)
 id 6affa070-4cb1-0a2a45050019-d155d033a89b-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 02:20:48 +0100
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6b87a1a2babso3236388a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 17:20:48 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:To:Subject:Message-ID:Date:From:Reply-To:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1795137648; cv=none;
        d=google.com; s=arc-20260327;
        b=gObW9XADFR5nQT17L7A2EDj1f3pic3X6qwrhAIjmUjjdy6M32E66g4TfpaEQomNGSy
         wemil/0IULjjVhdjOEySpZVeLMVUuwvWpVP6WdDUjOlWt9lMkWauan0PHWMRRTy/ulHR
         iy37ffnGugcnCTC7D5gQo2p2zmsL+k3/cABOzZV446XJEXB9tNj/97QNa5QfXSDwl8Rr
         3o/PI6NbpFHvFgVKEUWXD4ep1WNk2uTQgriJCRBHxZQP3304p8SlsjjRj3tfMjw5E683
         UaOCoRv8+9Iy2abVUokhlKVIOfrAQrcex31UeUEGY6eE0OhEG1ifVkrp1/L9yzzxz+cV
         ihuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=evl68vkou27psCuK949p6FNymiz/tyuV3PX7Sr/9kZg=;
        fh=quJY5mN2l4ZorNvEoO9ngNXalhEvTdq/+W8CvHWhECs=;
        b=YfM5MvC/zUQgkQkW8W3/XhE9ET1JCfThOUdCmMdHHf8aCz8hC44bpAE/bW0IjWHJ6+
         Sg+m0j3d5s2IqcOgYfl3UOIx1LRD44lzH2GWVRKjT5oW92lcLe9L6DCn+W7x8vzjI7n9
         wowuMGqKWy4kFl+ru6m2rUud9NCGzuSOebFyDmfkcY0+S/8AK8e1glL1itNCYUC/d3el
         UPt5PqiSBAjbxqHqFhOzb4hOJaGWKXsGO0kOMUTjOdqeSykpGq5oGKQG3Tykqh2e2NHW
         p53T58FW6bsbII8r+ljjB8zbweH9ThTE08x64/NEk90u62YCX15WN/84u65GSQ/RHvwV
         o8Cg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795137648; x=1795742448; darn=lists.xenproject.org;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=evl68vkou27psCuK949p6FNymiz/tyuV3PX7Sr/9kZg=;
        b=wsKBwl9zdzZh7TXi5NY5AsrXAe7gy2Tnjja+2oAoagJ+gjPCvAlJLN0iw1RHmDnk12
         ePNmo1hUcZtoCCIWaZLAXwGLnVvlz2O3cWR7fwN6uI7TbWqKbnCmHWdIj0mjaW6c6JxJ
         Zo+RDs1Il2GRhBul4jMMfFE4VYVoAoeUi//e0RkPzJn3ohKTXVKdWAmz+7NUp7WuG/Ed
         xngKxi/fPB/0+XVrxAkqKiOUFg79Ln5xwQqKy3GxkglhPMOwZIM+n8yJ09joWyLPkstk
         0zQTmDhiJTs1wcKoAHPKWWZkCfYBvB1CULQCzOKOhq5zHLF+QqcHeEs0x0qHeuk/zsDF
         OGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795137648; x=1795742448;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=evl68vkou27psCuK949p6FNymiz/tyuV3PX7Sr/9kZg=;
        b=hhfl2Mz8uYdFgGk31dn1JjqtXiTbSOYn73mGwM+Wf8mGn+e6coWRKcrFbCrAZy37No
         e5VDFNP1ma6pFpc4n1jD1wdGIvGsQV2I8iKk9YtWQdzbhKKsq91khlu8tBg0e8Z3DHP5
         rGeQCPDqiY4nXl0tOir/lL/4pZqyADwxwEkECDIxVckRxha3DJT99m49EzuMPV2lBlYU
         CbDoN6f9SiCUzQyF/MVXcalyg1yYmQoP9mLvU+uzzsLvdpq3GMH2QuxfNWxlRDyFoXsq
         tEpALcoJC16V43VjWbF1p9PWFkgmUKXdgzK4TnL3KwY4KCc6OxIeOyJSVgPf5s1ione5
         8vXQ==
X-Gm-Message-State: APuU4Z/KRjN2GHuZEzkfQFJei4ypzAfU4QrDWG1QKv5y2m5qxpEMWZnI
	vKop5y+JsoDk7ieupWnf9CE+ioyZDBsh1INtByOn0/M7n+HZZnd2EOLpOWbKMmze2quzCngOPz2
	W8zKJbKgIXbKXKuvOxb8RdscDRDLisU9ukcVNPs0=
X-Gm-Gg: AZFdTZeqLX3K6NuCcjnzXQi2kGQfIySReDbl34TfUtow3T2mrXR3EBw3XRFaIt1hjb0
	8lSrkgCR2UeMXby54cxSJzTL13f3Cn7Fg8IyJT3TUg5OQwWE/Pg/XuVJdy3BQnCQvNB9qHmIvtF
	471yAcJcn/zNUtPmePzSyvHVF0eekoT9GCTe2e2OHZCy9JNJVgiay8zVxINArA4NmkK3TIHc0D4
	fkP2nqYrc/1ZlZoz5myeHUDFYBzYJUfrc1M7Kb/PY1bNE3O6CzbLUf772iStjvsXccDlg/tgs3m
	hkDJ5zDdGa7BkGk3iQNLkEL//1Id+hG/EbOP8uVvP6uYqY/q4n3GjvsLXS5OsOhrG66Y6x7kz8r
	td2gkjE5TfkrWjVUUXDxtA4OV0s95yO7lXdT9Y0TKfjaxz6FbK0GZO5D/4d/quEhZB8dDDoQ+v6
	Bl3D4WI2V5lqedjapQuZ3CgTGD8MisiCs40vMDGtRCS+xCeZAln/g0Kg==
X-Received: by 2002:aa7:cd75:0:b0:6b7:c855:f2ff with SMTP id
 4fb4d7f45d1cf-6ba1f76f950mr2060741a12.2.1795137648031; Thu, 19 Nov 2026
 17:20:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Thu, 19 Nov 2026 17:20:35 -0800
X-Gm-Features: AclHuK_Lg-oMz3hofViQlm79maUDSKXPIBJrlqTAmvF_Qc5_Ux81RXfVMWam3wQ
Message-ID: <CAKSQd8UCji1tnGdwqk2O1TzcC9NHjn3XJwrQsdYyUC0ro2+D9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] x86/amd: Consider only Fam10h affected by erratum 383
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c201ff/1795137648-F68B62A1-930E9D1B/0/0
X-purgate-type: clean
X-purgate-size: 568
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> [...] added Fam12h as affected. It is not acknowledged
> as so the relevant Fam12h revision guide [...]

That's because the public RG (#44739-3.10) only lists
a subset of what the non-public one (3.11) contains. In
particular, erratum #383 does affect LN-A0 and LN-A1
but not LN-B0. One school of thought foolishly argues
that A0 and A1 were samples, while another school of
thought doesn't argue but just points at silicon which is
out there in the wild.

00300F00h (LN-A0) affected
00300F01h (LN-A1) affected
00300F10h (LN-B0) not affected

--
C.

