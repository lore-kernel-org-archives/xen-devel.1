Return-Path: <SRS0=08Yz=HF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E11C433DB
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 04:10:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4C0464E24
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 04:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4C0464E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80801.147988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l79V5-0007VD-0Y; Wed, 03 Feb 2021 04:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80801.147988; Wed, 03 Feb 2021 04:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l79V4-0007V6-Sw; Wed, 03 Feb 2021 04:10:42 +0000
Received: by outflank-mailman (input) for mailman id 80801;
 Wed, 03 Feb 2021 04:10:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u1O+=HF=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1l79V4-0007V1-3U
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 04:10:42 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc16e286-c82e-428c-8143-4c6f3b4d622d;
 Wed, 03 Feb 2021 04:10:40 +0000 (UTC)
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
X-Inumbo-ID: dc16e286-c82e-428c-8143-4c6f3b4d622d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612325440;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Iv3CuZMIEwErChhvqgZmbCzl6kWEUQR7ijsEZbz0szs=;
  b=h75r9jhVdgoxH2ZMgxWvF0fwot7e9qQEq5ZdW+copuwdG/+BqCc1uj7V
   4SZ67JQY2x4K90EeqbvUtQsLGOaCPeEzFlr0/M7/XkT69bfYV1iQIt8Hv
   4wlAtrsUmFlhWyYnN6tQ2GqWp+53386wA795aCY3gFcx7TAYo7UQNkfqO
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RqvNpyff6R377OuhA1L2I4fTRSMuHR+8sPxH0bLVhEJ4n8JZMNpkDfC864eUHdhA/oc3nwhMLL
 x6w6mmNmFKSgNjtN7m4yUXT0e8ttrALPNUuYXnzYbr4vJ1qajlU+rXVaVE8Yuvq9OfS0ecPVdy
 PqmivGmb1pCLHeTExe5FC7mlMfL0Gcsh6ZaLQCWV2R4NOg0cliLnKutrkbR86R4J0GDjBii6sO
 TTPU+iOaNbCazzuUTbQdnnZyQqXfudGJcGuMk+QQhFtnEZlI8CHa/Pxg65O3VT09AwsMX1Ytun
 4HQ=
X-SBRS: 4.0
X-MesageID: 36427480
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,397,1602561600"; 
   d="scan'208";a="36427480"
Subject: Re: [PATCH] tools/libxl: only set viridian flags on new domains
To: <xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>, <wl@xen.org>, <anthony.perard@citrix.com>,
	<tamas.k.lengyel@gmail.com>
References: <1612324889-20942-1-git-send-email-igor.druzhinin@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <7ccc0b02-1400-2ef4-3a01-92c2fd765591@citrix.com>
Date: Wed, 3 Feb 2021 04:10:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612324889-20942-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/02/2021 04:01, Igor Druzhinin wrote:
> Domains migrating or restoring should have viridian HVM param key in
> the migration stream already and setting that twice results in Xen
> returing -EEXIST on the second attempt later (during migration stream parsing)
> in case the values don't match. That causes migration/restore operation
> to fail at destination side.
> 
> That issue is now resurfaced by the latest commits (983524671 and 7e5cffcd1e)
> extending default viridian feature set making the values from the previous
> migration streams and those set at domain construction different.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Igor

