Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CE7C982D7
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 09:36:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425058.1649219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7V0e-0005LB-MX; Fri, 18 Sep 2026 09:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425058.1649219; Fri, 18 Sep 2026 09:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7V0e-0005L4-Ju; Fri, 18 Sep 2026 09:35:56 +0000
Received: by outflank-mailman (input) for mailman id 1425058;
 Fri, 18 Sep 2026 09:35:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x7V0d-0005Ky-Ea
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 09:35:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7V0c-00DwtY-QL
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 11:35:54 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aad05f5-bab6-0a2a0a5309dd-0a2a45049cf0-22
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:35:54 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aad05fa-b57f-0a2a45040019-4a7de14cb864-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:35:54 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485b1d2874fso171865f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 02:35:54 -0700 (PDT)
Received: from [172.18.138.134] ([185.104.138.149])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc7ce03e7sm44036515e9.3.2026.09.18.02.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 02:35:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1789724154; x=1790328954; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VfRaF/hsbUyxrZV7v2ViXYuo1EVlbPXCSn+xARdM3vY=;
        b=OS4H/R+3977XsM5ddJhiTcJWgSli42Zh1955AwnVtTEtKJNa1NAXBpxqwTgC0HuyN7
         QEJGi2y4ed6jFV8ws0gJLbRvwflrfrbJqv7cz3GOH4B7/WP8jpBSFFXTE9o5Dsqjqit1
         pYJE/DhZ0hIsymzih1o5VOaxcomnDzHZQh3esFK1xLkt7IzknVH9xnW+mEW9PMiesdSk
         nCrOJrwZaS6bjvWoCi4doaB+eYsirGzMaJ6YqGRe0kfidvATfkdZYEExoxLWVGiH0EEr
         0WK0Yq2RITMuyK3vumeVTIuMuTfy1jn8CVzIKscBQ4TKkp0mI9pJgeYDOlQc8ke3++Cd
         vDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789724154; x=1790328954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfRaF/hsbUyxrZV7v2ViXYuo1EVlbPXCSn+xARdM3vY=;
        b=jBj1JQ76wvX7JKH1cVA8TGQDe8freo72W1jBmInf57CSlA2OW/NxDHKPaSphBVSePD
         hoJndRpHxQMVjls+L8wsfD3V+9fameNozLfbmFqm9DGQeVjlmRadjR5GYoNeCmRFhYpA
         mZVQ1i7W55VgmQGamPcUceTclx920ZzR/OIZqqOXrz8ECVcLrWUiTgLvjnX8sns/PHSo
         Kxk7SM/uqolcyjVXJxTEzgRjxddmIls/XH5OboLdsTkEoBq6tjGz0Q0IMfxRqXo+WhRh
         mmKQGuHm9nluHr2cx5yrFK8sL41MIqtgnvBOYBS7Gzd99f1gCWAUVKcyR5PLdk3tTvdu
         pbvg==
X-Forwarded-Encrypted: i=1; AKwUvBwi8rwA0NgEk96Dha9E+EHB+UdOlHxeWDc/jLMKpgUXE826RJnfmhGMhypZYVRBw61YRl1UvyX65XE=@lists.xenproject.org
X-Gm-Message-State: AFuF++kU+v3ofjCaKImCc8eoo7vUCAykiOzJEgFXqQawlr4QSuzefwXN
	0cAXjG90oxMIHN4ncaitECaNU/nwo/lx2rVgMCkkDV0u1vDOC4DWgDhLqdEjDOIq9w==
X-Gm-Gg: AYBFou39H0DHkB6kYLNmml5e2RFiNndon49yrvUyx5qrqFeBM4mPiB29IaRP1OZGG9v
	ViK4gf2xhiVfAfNaGHqc0e16znsZwM69bLKjt2Dqixx5Y0LIr6y8g+7Q+o7VcHt0zWIfUOb06vE
	Lc59ji3SoPh/bx7gi2fz56/F3hJEWbNd5cvIRytrjMBqbazx9l1EQGtkmWkH8seWuBdmwQ6SDWI
	KblGpVjZ1QHSkcSMFKn8/obAO4O+zOMAo2RnB534Zpskxa4cbvF0fBlBqgmBXrySEFp/eW2iQ5z
	mC7OSlSygedZ4DjXWAh6EtkOkmRMcKelE+r156PTshlyoj1v9psdWBGEh+a3A+Olf1KPREEE7SE
	tKcH3FJ2aLi1BRzETw3Rqtwyp1K+SFZzhXUS6PhFpWW6aRs0NGlMp/zX0euVbvgQhNH4ZYVsv6p
	Va9gR/dGLkfAOKJ/B8zHJr/l3wPFhMgeoHQfc5hKnM+0zsqmXnq+P9CuLkMypmh9NJXGUya4frM
	qTgVYC0/3I=
X-Received: by 2002:a05:600c:37c3:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fc4f8528cmr25463345e9.4.1789724154107;
        Fri, 18 Sep 2026 02:35:54 -0700 (PDT)
Message-ID: <12da547c-a67a-4f46-bee5-666cc26fc976@suse.com>
Date: Fri, 18 Sep 2026 11:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: clarify tag sequence in sending-patches
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260918065614.11003-1-jgross@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20260918065614.11003-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1789724154-583C0B50-580795D2/0/0
X-purgate-type: clean
X-purgate-size: 407

On 18.09.2026 08:56, Juergen Gross wrote:
> Make clear what an "Assisted-by: tag tag relates to in
> sending-patches.pandoc.

I guess when committing I'll take the liberty to replace the redundant
"tag" with the missing closing double quote.

> Add the possibility to clarify how AI was used.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

