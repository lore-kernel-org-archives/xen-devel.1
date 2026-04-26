Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B877FF885C
	for <xen-devel@archiver.kernel.org>; Sun, 26 Apr 2026 13:31:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1294558.1571337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGzZB-0001bD-45; Sun, 26 Apr 2026 13:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294558.1571337; Sun, 26 Apr 2026 13:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGzZA-0001b5-WF; Sun, 26 Apr 2026 13:30:33 +0000
Received: by outflank-mailman (input) for mailman id 1294558;
 Sun, 26 Apr 2026 13:30:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgg@ziepe.ca>) id 1wGzZ9-0001az-5V
 for xen-devel@lists.xenproject.org; Sun, 26 Apr 2026 13:30:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGzZ6-009you-S5
 for xen-devel@lists.xenproject.org; Sun, 26 Apr 2026 15:30:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgg@ziepe.ca>)
 id 69ee1370-bab6-0a2a0a5309dd-0a2a4506cf36-14
 for <xen-devel@lists.xenproject.org>; Sun, 26 Apr 2026 15:30:30 +0200
Received: from [209.85.160.182] (helo=mail-qt1-f182.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgg@ziepe.ca>)
 id 69ee1375-7371-0a2a45060019-d155a0b6f1f8-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Apr 2026 15:30:30 +0200
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-50d87610513so102256751cf.3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Apr 2026 06:30:29 -0700 (PDT)
Received: from ziepe.ca
 (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net.
 [47.54.130.67]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50e394c1fddsm246449421cf.30.2026.04.26.06.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:30:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1wGzZ5-0000000EnQT-0zsZ;
 Sun, 26 Apr 2026 10:30:27 -0300
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=ziepe.ca header.i="@ziepe.ca" header.h="In-Reply-To:Content-Disposition:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777210229; x=1777815029; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yt3A8pADO9ZJrlnKUWoV4EH8uD2s2dkOvSuk8HhB068=;
        b=HhKLY5wo/5l/t4XOWnJPhloOXYqQLvpCDxrTWCUreEe31Z7mJ8gZYXwu5hwbKWi2vG
         J/v7Y9dWWZSP51g3Me7oq+RzdaYRBpVEppEUAbdBwH5d6NgWaixNZBPBZEtAGSP007m0
         p/616x1DSDeDoAYYYLpa+AW5PlVu2Ic5RB+O2k1tqoJiwch5K0CEBqGTa9qzrSP4BOc5
         hAfeFCRjD7ByYVgZtZw1wwZGGn/5An8+edur5KmE+EbU7DfdQKsORaz76Kf11oH0SBlf
         ecN9MZpr5hzoHBW78TkOJCJe8RtrUYwGWA5oDIBE5ajSCDn3uJwbzwIEMdoeGdf7n6CD
         Rxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777210229; x=1777815029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt3A8pADO9ZJrlnKUWoV4EH8uD2s2dkOvSuk8HhB068=;
        b=d2Ebn0FqUvhEQD6d2xi+FJdO0V3gedNfKC+DRFg/wQIkfNGGebQy0w1KmoWeXHD/iI
         Pzol9lRYWx1ZGxcbMA6cw8HMQjH4QpKRrwV0Mj6S8+5tzd+LkHwypv+UtygU3zTv5PXa
         wj7rqHQkkcj8PKQGzqzdvmyu9beKTeDumQ1ooZCOfwkL7V75S6XhJRg0vMWpdzYt0DTM
         sUO5TMJbnXd1QFughW3aPVd2HSaP4SwWw5YUUz7LKn/M0iNUEhZF6LamJ9UzDb4aCjcI
         eyN1bdkQwkncM96PECRK3EvlRPg+8EELzj7sHy8867Nry78e4fer+P+wSqnf8MFiBfGN
         ZLqA==
X-Forwarded-Encrypted: i=1; AFNElJ+UN1fA5T1Z8IqV2MEs1xrisKeSLfBOGANNfjp02WogjbIG0eCvMSAR9M2Z+E64dA7F0VFe49ZbfEI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysKgG2gPqKfylbxKMNBo6gIRwXr8fpfOiO6Zd0tIk6sJEy548J
	R2J7y+NO3aAco7dAJtugCW0Ghl6kvuDRMqOs9j3YNrsRC6nARQv4UDDaREes5R4jpLA=
X-Gm-Gg: AeBDieu7Yx5ZFgNrBrbdKPuaNYfpgVwlDMK+5lj+mYGgtPzJeYJX3iWyFFcDJl71PsB
	D3F2y3Mhk4JTpl0WQcXq33spLaBXY5DWdExcszlCASwqUkSdN10He5QIVtA3qS+RwgUL+9nUDmO
	89jBPy717Eibr5dbzZMdvqytNM/7R7jIoZz9blXiU6GCyGvCPvpEdoKCtV0ncmZDvlWcE+CMQpR
	7a4GJmqOquSuvrAKCVYrrgX2noomtGmmGHHka4faZTLDbilSEyB6G6jSmOsUNwIiNyo2XFeNqKs
	to0faqOr0ErkvbvGcgPP4jnFB3CVkyOMsQfWuXJXef5WM6eXm1nwH/+yAFLsJeXONgXC7lJfc6F
	MRjPeF4jKICRUPFLaJYuNm0eGIFqthNTsvV3IwL8F3thv53iSJMcU+Nnp3/iRJ5DAt7dvgOT/Gy
	aMGOutfox6hlej7+61MaKCwk+dCdBxhEJE1t3hqNQ8ifG16bhknnovS73pEQ8IDOlYL05lsHfe/
	i9hx+kc0/V6cVw9
X-Received: by 2002:a05:622a:98e:b0:50d:7fe9:aa8a with SMTP id d75a77b69052e-50e36e9c3c8mr604759671cf.31.1777210228752;
        Sun, 26 Apr 2026 06:30:28 -0700 (PDT)
Date: Sun, 26 Apr 2026 10:30:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: How to express "externally managed" IOMMU domains for
 VFIO/IOMMUFD ?
Message-ID: <20260426133027.GB3501894@ziepe.ca>
References: <1776873531.8631fc262581453bbf619ec5b2062170.19db5ea67ab000f373@vates.tech>
 <BN9PR11MB5276B3A829AD624A7E1AB4408C2A2@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276B3A829AD624A7E1AB4408C2A2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-purgate-ID: tlsNG-16d1c6/1777210230-51F6BD75-66902853/0/0
X-purgate-type: clean
X-purgate-size: 970

On Thu, Apr 23, 2026 at 08:01:50AM +0000, Tian, Kevin wrote:
> > On Xen, we have a dedicated hypercalls for moving a device into another
> > guest (so it no longer belongs in Dom0, at far as DMA is concerned).
> > 
> > But it looks like there are no way to describe that idea of "attach that
> > device to this VM" nor "the device is in a VM"; which makes that
> > impracticable.
> > 
> > There may be things that could be done with the vIOMMU objects, but
> > there would be no "parent domain" in such case, as said earlier it
> > doesn't exist in the IOMMU subsystem.
> > 
> > What is expected to be done instead ?
> > 
> > Teddy
> > 
> > [1] https://www.youtube.com/watch?v=pLMGRgEJ-Eg
> > 
> 
> It'd be much easier to collect comments if you can put plain words
> to explain the problem rather than expecting other folks to watch
> the video first...

It sounds like CC and pkvm to me so I think it should re-use those
mechanisms..

Jason

