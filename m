Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC5D606A32E
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 08:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=er6x9oFq
Received: from list by lists.xenproject.org with outflank-mailman.1476304.1682441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPEvd-0006Er-RG; Fri, 06 Nov 2026 08:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476304.1682441; Fri, 06 Nov 2026 08:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPEvd-0006Ek-Oj; Fri, 06 Nov 2026 08:04:05 +0000
Received: by outflank-mailman (input) for mailman id 1476304;
 Fri, 06 Nov 2026 08:04:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xPEvc-0006Ee-RA
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 08:04:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPEvb-005QeP-8R
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 09:04:03 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6aed89ec-e002-0a2a0a5209dd-0a2a450696b8-34
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:04:03 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6aed89ee-195a-0a2a45060019-d155dd33b493-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:03:58 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-492f0a1b685so156304f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 00:03:58 -0800 (PST)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d723222fsm2349606f8f.21.2026.11.06.00.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 00:03:57 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=edera.dev header.i="@edera.dev" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1793952238; x=1794557038; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gnj6whuU7ScmltVkU3YLhRawNQIhK9j4rZLkH0oRuWU=;
        b=er6x9oFqUN0zbBPr12wWxWQoabo4T/fdkW/p0mSaArRvg5cEOVRFqIJrENf5OUokZn
         CXuB0UlI+DLiR6+t1elmJx3S4xAmaD4gSfq8/HRNAcJQOf3X7A6L+ui+hl54ecV+ALWR
         /QW6KRO99QSD7lmw1I3DqqGZVceTMo0dJBnOrwG/l3O96jTXa/+DvAWkIXMKnXJ1jbrA
         OxPZtkFsSFnOZSAMV3YHuyS22L6JSooiHVUi1mAPWMp4TEf+dhhborVKwElyoTRVOIeN
         KHszBhyKeMcQjSeSrM/M1edpNUC7aP0+DsAUTlWsJBZ+r/TDQDJ+yUgWj3p2DqWgKrJx
         91rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952238; x=1794557038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gnj6whuU7ScmltVkU3YLhRawNQIhK9j4rZLkH0oRuWU=;
        b=xPxZqK/c9r/rWifsazXFrH2MWwq9gC0fDzYBubMHbNVj2CDn3RTGXzm3mGG2ayqcA7
         9KU2k+FAWhvl9559mvFcNrHbsJEXXpTXznNZMO1+npeFnf6+cRuoyYT+oex8Gi23CZhu
         ikU4sizLEBUUQzAA4C0DQeWlY+4o0X0hC9XWoo98Q7/1UJYxxRzpBwGamNe502aQFnFI
         ctLdd92tEvQHrNwCOl7ZytVQnVBB9JcsccuYpZMu6Z276/fS6aD+5y5OOvn8H3oyR+DK
         kQTUwcZwqFRpRrSD5pD96w4vRRuWQa79e99Q50Z6+upq7sdn9xuATDwL59mlNNGfpHjD
         Mw4A==
X-Forwarded-Encrypted: i=1; AL+hErE0/lBmfeaech+KGU5z6uGG3NsfykT43lGBc7avXJBON4Q+AAiegz+cxRCniHeT3UzTtLL7unm27O8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/WaibsWqgSEO18a9KaERFeBfPjWzY2gWk0u9aDnK9efVaGM5VG
	D/L+rWAGtgX1xtmP0AW/pmWSV4mCMGKHQtZ+a6JRtS76Rd/Mxy8Dyuee9zuD/HYlvGM=
X-Gm-Gg: AYBFou0SvkVCGSiw4lUFSsAWtww1N66TN66cs9tkQgvkQYQAFfuC34fPF/6NzK80BWo
	P4XfwQkhEF6L4T9cdW1YMY2iQmAuLzxGy5ncvRc+ZK/+WPg+TG0DJyz3lYq6/k+cS11Ppnoyhyp
	pr7os1DxyMA6XgpYZihloIKeScYTiF+AZxWgVhHeG2oV3eaKlPdszsq7+fWvehQNk6zVt8WSM6b
	vVpeC8D8vH9EL69l3crma88w3RrwfabjUsn9ISolbE1+USeMFluq5nDfOwugFy4Eq2WBi5u3AMg
	LfdVeZo0DmoutNyVjfCEtxwsh/tjv+sxe73a5Y3DGXhwHq8Icl4qp9XE2hwdEMIIuoOf8a49R/Y
	j8B7dvCO+h08Vp+cCt988PCtu8N4ifCTRLMxm8Zs8v4bNVho77CQUt7fpOGjyYBsaj82Ox9H9EY
	gOAzrfPXZ7xamee+3jP+jkEcaQ323KlyCUnEj6SMcjZSXi8FiuOm63wkBE5DeyPSGIvb6L2OTFh
	X4+VSsIxsAQHTATHph2Mj4N4UbWZwrbjVTf61tLO7Ap1w3amC+HDZbLg92uIZGxEiSfNUBAfjiZ
	3va/9GIPnsxVyQLDkiwyVNqb+A==
X-Received: by 2002:a05:6000:18a8:b0:48d:e696:8a65 with SMTP id ffacd0b85a97d-49277e91fe3mr3311316f8f.46.1793952237450;
        Fri, 06 Nov 2026 00:03:57 -0800 (PST)
From: Luca Di Maio <luca@edera.dev>
To: Jan Beulich <jbeulich@suse.com>
Cc: Luca Di Maio <luca@edera.dev>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/3] IOMMU: record the flushes skipped under iommu_dont_flush_iotlb
Date: Fri,  6 Nov 2026 09:03:22 +0100
Message-ID: <20261106080324.2145220-1-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2d444072-e4cb-40ff-b2f5-a6e5038e64c9@suse.com>
References: <20261030165031.2560020-1-luca@edera.dev> <20261030165031.2560020-2-luca@edera.dev> <1793444119.8631fc262581453bbf619ec5b2062170.1a1919984c0000403d@vates.tech> <2d444072-e4cb-40ff-b2f5-a6e5038e64c9@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793952243-F7ACA77B-4BC71802/0/0
X-purgate-type: clean
X-purgate-size: 568
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 17:54, Jan Beulich wrote:
> On 31.10.2026 11:55, Teddy Astie wrote:
>> Le 30/10/2026 à 17:53, Luca Di Maio a écrit :
>>> +DEFINE_PER_CPU(uint8_t, iommu_skipped_flush_flags);
>>
>> flush_flags in iotlb_flush is unsigned int in iommu_iotlb_flush(), so I
>> would use it here as well instead of uint8_t.
>
> +1
>
> Also see ./CODING_STYLE on the matter. If not unsigned int, the next choices
> would be unsigned short or unsigned char, not uint8_t.

Thanks for the review, Jan and Teddy.

I'll address your comments in upcoming v2.

L.

