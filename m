Return-Path: <SRS0=WOnx=Z4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C519C43603
	for <xen-devel@archiver.kernel.org>; Fri,  6 Dec 2019 15:39:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A83A206DF
	for <xen-devel@archiver.kernel.org>; Fri,  6 Dec 2019 15:39:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoz+QoKP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A83A206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idFhc-00067s-FQ; Fri, 06 Dec 2019 15:39:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VY/6=Z4=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1idFhb-00067n-4l
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 15:39:31 +0000
X-Inumbo-ID: 9787a972-183e-11ea-88e7-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9787a972-183e-11ea-88e7-bc764e2007e4;
 Fri, 06 Dec 2019 15:39:30 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e28so8086664ljo.9
 for <xen-devel@lists.xenproject.org>; Fri, 06 Dec 2019 07:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=luvd+UP3jCAK1fqMQ9RZ/AhsBaSOSUd4P7/V0q6x1Qw=;
 b=eoz+QoKPwVYtIzyN+kko/rUytABwaKZHYfU6dRcPXP45cA0QEeOlBk9Eek0PKanxBy
 6my81VUko30tDN4tQNZSZ7c2CpCNGrEc2KtPy/LbAl0HzcY1UWbiGuX8SZERuNQbyfRh
 G27BESrmXySBb2nVxyNkR7gcpXhJyiy2ST29yp0pFudr1vX+ejxlOGeztkuZQc19u076
 X1mf4/zmOHPqbhi89Gyy8/+S7q35+wUAOPJ4Gy62LtI52W9vKW6A7HrqZop/gz3w5aaw
 IZOyloSqH+NxPOpk3qi116jdJsqvkrx0Aq5+ya/g1aNHeeV01f22z0zj1eB+B2HhkUuO
 wkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=luvd+UP3jCAK1fqMQ9RZ/AhsBaSOSUd4P7/V0q6x1Qw=;
 b=kEVWpt3WEUJ3YMrJygOgV+SDEqsleCfNqOmlMAbns1iCya/+/k4YjLkGUj/WNpTE0s
 42NvgiR9gL5GbnbpOkdrmI0ZMj6V11AIUmHzi4z1AsdGGn9rxCRqVXSvuptSf5Va//ml
 RkHDhsCL61YJV74kOzvIlcE6C0/xlxAuaUcoPmEHeAmpjf+Ue0WUTBFXqZNByfGMObhl
 P6ZWQp/G8Vr6NhKMDu9VVxLckUKttp/hspHTTyh1Pz/qGrksjt9NevpUtnH1HCEdsPuB
 NrIQchS6gCnUhy2HYTc/ySRgP4GiPmoA/O/gQEwGfAATUxW4Lz67hxUq+OgKRvcTV6Ao
 X0Xg==
X-Gm-Message-State: APjAAAWw+cuq5DT2ZGeH/zq3Bj9BwY5IcC4uXYv02Jj+vKJbz4d38e6U
 qdC20QYEYy3vERizoRLWZUOgiKkdAIC0knydUtk=
X-Google-Smtp-Source: APXvYqyslxfCKRPwjkwAzQb4ONo9IE4S7WhMsRUfIB7bEY5M1hio3YhkbvYYjRsTOUyFuJ6W7IISCCCzA2QdEuGAO28=
X-Received: by 2002:a2e:880c:: with SMTP id x12mr7910803ljh.44.1575646769325; 
 Fri, 06 Dec 2019 07:39:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
 <938dbf7c3a083ec050c16729805f4ce5f3f2891f.1573840474.git.rosbrookn@ainfosec.com>
 <cabd32fd-7c1e-ad7a-c4ce-1ae716894746@citrix.com>
 <d4061074-0825-d4ad-4ece-4da0d3c9049c@citrix.com>
 <CAEBZRScC3J6-6F79Cw3_SN=z-VguCkt3dM5YWer2pm8gfTrTww@mail.gmail.com>
 <a6f04edb-4889-0047-31b8-663394ed2196@citrix.com>
 <CAEBZRSeXWcdVEiReG1Y44jLe=krxhKMFaL4xLx+hrFCCT+LKyA@mail.gmail.com>
 <9b73fb89-7ab9-2377-9547-d70e404cf873@citrix.com>
In-Reply-To: <9b73fb89-7ab9-2377-9547-d70e404cf873@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 6 Dec 2019 10:39:18 -0500
Message-ID: <CAEBZRSdftnw3Osqm20+-ZGv=pNjRf7EKKd-Gc-rgrgKjmyiG-Q@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 16/22] golang/xenlight: implement keyed
 union C to Go marshaling
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPSy4gIEZZSSBJJ20gZ29pbmcgdG8gaGF2ZSB0byBzdG9wIHJldmlld2luZyBoZXJlIGZvciBh
IGJpdDsgaWYgeW91Cj4gcmUtc2VuZCB0aGUgc2VyaWVzIHdpdGggdGhlIGNvbW1lbnRzIG9uIDEt
MTYgYWRkcmVzc2VkIHRob3VnaCwgSSdsbCBza2ltCj4gdGhyb3VnaCBhbmQgY2hlY2sgaXQgaW4g
aWYgaXQgbG9va3MgZ29vZC4KCk9rYXksIHRoYW5rcyBmb3IgdGhlIGhlYWRzIHVwLiBJJ20gaG9w
aW5nIHRvIHNlbmQgdjMgaW4gdGhlIG5leHQgZmV3IGRheXMuCgotTlIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
