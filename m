Return-Path: <SRS0=URyG=6M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F30C83000
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 12:32:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 892A6206D9
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 12:32:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9BOqfd2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 892A6206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTPOu-0003VR-1a; Tue, 28 Apr 2020 12:31:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xCBN=6M=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jTPOs-0003VM-VF
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 12:31:47 +0000
X-Inumbo-ID: 39246530-894c-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39246530-894c-11ea-b9cf-bc764e2007e4;
 Tue, 28 Apr 2020 12:31:46 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s10so24459478wrr.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 05:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Y/c/NzUHCK2f/tJUzdiFamW51J/iCZVsYfpiawOF+c4=;
 b=Q9BOqfd2htbpyscDLSZMMqaPOVH1g9dEt2nOgCWr2XAZ6IXZdM1E90C//+qoPdiRGK
 MXN1sCq2xBaBOm5BBayW5kMTY1Lw1loXfYkO5ya1e+f8tmjjNPE+Cbe2RLW4lWjOJlYF
 68CY4Yh5lpTFd+tyME80ov8TyZLnuXS0GDK480bOUv0Uynr+3YLmZRoD9ns9A3YbwEr/
 +XqIirRlm/nWLLgf1K6mcMy/HP67lHCL0IJ8v6fZoUHkz8kF/+Bq8zEhXU+cGdr3ONMx
 lLYUUOq52d6Y2AChgT5JNvQaP2k44f6S4dIdT/kZ5fQw9uGVO7drfmp2O/5blPO9zPmg
 6ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Y/c/NzUHCK2f/tJUzdiFamW51J/iCZVsYfpiawOF+c4=;
 b=GFztkuAaot6xUQFJXInmGp+zZqx0R2ltY4rryxUa+rWsdG3y2JMCMQRRzkr/mmxkvv
 y8dKt5UFkZZsYy7BrKHemYcPmmB4tDyMqGg2kw/ZsnHnU7qVs7mhc9xvZGduQ8E2ChSh
 8z9bjZLrjiT3IBaRCf/19lZRSlbivbS3+NVCc1/CXg9GOdwn48Cyo5GjKSJmRgt77P7l
 drEeZoMJ5HMUIrGj+slynl9EVAd4TtUyCcmi9/3cY3RjT2xv6rp9uN0AqKWeXusjYEkT
 G3lJW1u7qiiX5FuCq4J9cWNU/c64jEC+S2OOLHvtyiSYoTwJx+AXTAv6sSlxghuSz5VM
 vq7w==
X-Gm-Message-State: AGi0Puar+6QjhgYaYZgS4gv9Gwy6g/vTjeQxfCM2e1dtVH5zy9XAL9Ym
 F8aWA0jVdD/tF/bwFGonCnM=
X-Google-Smtp-Source: APiQypL7A0BiNYtq7xE29+cCkkSBWdgJkXVffi0DcJYd7lVnkeMcPcoBerYXdX9cjjB/DxUWRk4wpQ==
X-Received: by 2002:adf:db41:: with SMTP id f1mr31359840wrj.13.1588077105429; 
 Tue, 28 Apr 2020 05:31:45 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id s14sm3274430wme.33.2020.04.28.05.31.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 05:31:44 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <6fddc420-b582-cb2f-92ce-b3e067c420c4@suse.com>
In-Reply-To: <6fddc420-b582-cb2f-92ce-b3e067c420c4@suse.com>
Subject: RE: [PATCH] x86/pass-through: avoid double IRQ unbind during domain
 cleanup
Date: Tue, 28 Apr 2020 13:31:43 +0100
Message-ID: <000801d61d58$fa4c4bc0$eee4e340$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQEjcmVwjE85LwcvcW4bMeoM9/PKGKnzzLaQ
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Varad Gautam' <vrd@amazon.de>,
 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 28 April 2020 13:22
> To: xen-devel@lists.xenproject.org
> Cc: Paul Durrant <paul@xen.org>; Varad Gautam <vrd@amazon.de>; Andrew =
Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Wei Liu <wl@xen.org>
> Subject: [PATCH] x86/pass-through: avoid double IRQ unbind during =
domain cleanup
>=20
> XEN_DOMCTL_destroydomain creates a continuation if domain_kill =
-ERESTARTs.
> In that scenario, it is possible to receive multiple =
_pirq_guest_unbind
> calls for the same pirq from domain_kill, if the pirq has not yet been
> removed from the domain's pirq_tree, as:
>   domain_kill()
>     -> domain_relinquish_resources()
>       -> pci_release_devices()
>         -> pci_clean_dpci_irq()
>           -> pirq_guest_unbind()
>             -> __pirq_guest_unbind()
>=20
> Avoid recurring invocations of pirq_guest_unbind() by removing the =
pIRQ
> from the tree being iterated after the first call there. In case such =
a
> removed entry still has a softirq outstanding, record it and re-check
> upon re-invocation.
>=20
> Reported-by: Varad Gautam <vrd@amazon.de>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Varad Gautam <vrd@amazon.de>

Reviewed-by: Paul Durrant <paul@xen.org>


