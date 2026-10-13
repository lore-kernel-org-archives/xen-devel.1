Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A7ACC6B19
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 16:27:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448181.1664245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfL6-00053t-IJ; Tue, 13 Oct 2026 16:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448181.1664245; Tue, 13 Oct 2026 16:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfL6-00053m-Fc; Tue, 13 Oct 2026 16:26:56 +0000
Received: by outflank-mailman (input) for mailman id 1448181;
 Tue, 13 Oct 2026 16:26:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGfL4-00053g-OK
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:26:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGfL4-00G4P5-5I
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 18:26:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5bc9-e002-0a2a0a5209dd-0a2a450bb0c4-8
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:26:54 +0200
Received: from [209.85.128.181] (helo=mail-yw1-f181.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5bcd-b7e8-0a2a450b0019-d15580b5ac3f-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:26:53 +0200
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-8726acc5eadso24297607b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:26:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1791908812; cv=none;
        d=google.com; s=arc-20260327;
        b=ATbktG6+tw+meNWDiT1JJIaiBsg1SnUCURcbYeKkpYNbzckOmfFJMPF2HhnfwG1gpW
         wxhZxHhCbZX3TYceshSqa4o8KG1N2ErURmfIOBgkW+hNyIzlrTzeK+laocwKgU6v84PJ
         ik2tIoo7etis8wsIeQvBqNSHIYAE/YhRARcp5ZZdB+ElGBqlc7PO0Km3fs4U/nCzgWvJ
         1WcXeyA+XXycLxMEmGVpRNNASshIxB8DzpO1TDhR8iVYCISjmsV0juH+ZrBLhkRAREUn
         5lprpetpWVunPEm/l9DeWkLtFcqXKLkN9hbefgFo2iiO0Av8S0fq/wnJbLFG6bcKqNM1
         9/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lfW0nUOSaRUIuZAH3PPaoOxVv0uganAcfQGMmdwJiqI=;
        fh=9VMul4XEbI4AZThU/pUXmxEzBjQG999I7MjlUiUptPs=;
        b=GMEDKwkl8zMfWRj5DpDxXSFdsFg4T83BRkcMiyDyE1xDvgW5qbl/AmmVzucq1FfFWA
         KWz3yyFeI0Dm2N19xiOLbxRLzcLXml/5M9G1sLavBvekxXsxH5Mc6HpMm3klwcKWPGDx
         tJD/ffATRDRJYACBqBQdjSPylPmgpg2BCDEaLQThH8Y+IYAr4szX7lXB+LgazrXoKZYr
         fF/UkOi/qV1CdefUpLSVCL+AJZ9N14u1zTQUCheJlfpxerMvv1GJfVNQWzFfTuvmiyX1
         XXgOhT1RWgLvcGV5WQmTaUx1mt64Pez6SBDgM3RXUUJRDnLZvVKLSsdRtUaOs/PFtpKu
         HsPQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791908812; x=1792513612; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfW0nUOSaRUIuZAH3PPaoOxVv0uganAcfQGMmdwJiqI=;
        b=kNovbmlIm13kSlVsqTlGmVbVYdLMA6Q7xxWlpI8vjjOV4A4Y1D1ldCGSCgJOANmYbH
         AR2Ix6FoaS69GIlPl5JUmofIBDOi9++gCpXWAcWhVfRuxW2Nu9xK3b0dx1lese1jEvIv
         /HSRaCbFVsg2n2iGUPg5UkYDFE/L1jCze8ciXJz4aQ4m7pHG/pBnH6VVkHjZXWguld4D
         Zg12SqrjGhdEJV7I7lpOjtp8jcP1zeeN7I2VAHy6MeQQnEJF9ikaHHi1R53FDShwdW7p
         Gw6mg/8Ecbzhonnj5GZWBYr86NH3hY//SZbfyiLEaULCqvJuIfoFGTs+wqnQDiUwwpzD
         ZmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908812; x=1792513612;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lfW0nUOSaRUIuZAH3PPaoOxVv0uganAcfQGMmdwJiqI=;
        b=Z0cCT36ejORszgOwRa/TJDe9SwF8MEYJd7dEVKHsn/R3huSPVq6nfXn5kldo9M9O4k
         5KI9Ku12LRuhxOpu6ZDXW4YfzVaWoj7YMkN7nSzc8bUeIJccNx0pC35ayjj8ejzrQJUh
         2tJMmHfIBJwL7OHtcdhSt1hYvt4IO58Z+CWwT5AGcil5ffnunumHvtay9C+9X0OSb3h9
         JKTNqWYrG6vjHdCMnlcGYxVvvcYCDdp67hFr3SUWnaZ3PvMwCppKNVnhRie4REhbqnrm
         p+fqZ5M2Q9v9Rf3Q5PLD/ooeIfmdFsuKzV2GKJ/30Iuifo5y7mxXyfuAARH9xDYYcKFn
         mmuA==
X-Forwarded-Encrypted: i=1; AKwUvBzb14xX7/y92GUTF0HhVbbzFWBHYpY5uZtxpBXTAJUgxawkoDKSWCK5+wwo2QSD/lD6/MsLToRcZxY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL7Sea5Za3+D7i/YYNwSMpM6vt7P/sEKJX81RO5jK9DU66Va5U7
	Xaqw5Abd3wXB/u1cPI9LbymEJOiu+pgCZKMeIZRdnjOcytd2e07fL3FGatY+ZL1bJGxlQUAt9Nr
	RlU1ePa2/We7/6Xcbz6UiMqgIqfMzKjZ6+sPmMLg4NQ==
X-Gm-Gg: AYBFou3gkaO/3JpBG2ceEtxU7eQ7hP7WZOlc+LMDcqfp2C4me8b7qGu7/2G6XxexoVj
	6xnQTJeG9kqP/Y5fZL4TcBdg6BxbOR9910CXioK86tYvhkS/+ZhdWVTei/G+LjdprF94pYYPPcN
	mtE+BASbIoNk5so62biAozAXWC65ue/ja/rQryR5PB2Z2n6jOqxRLziRKNROyy+rkv2Zcy6TG5d
	0frfBwKmH/Ks/X7drOXLa6AQEgRV9M4ANGUWpqO8T80qIlxCAOpjj5YdfpL6NzJ/tgZEvZno6HV
	XkBBGS6k3l26Im3YHL9LDrXF8OLFSrWA6X9h0TU4E0rA0tr6wlm+sa1GHX1qjTzrNCx9K4P3xPD
	h/oVtw/KnW00brqmvfWuS8IphmBY9xHFVzPR6C4o=
X-Received: by 2002:a05:690c:e3cd:b0:8b0:ad62:19aa with SMTP id
 00721157ae682-8b0ad6230f0mr19157117b3.33.1791908812379; Tue, 13 Oct 2026
 09:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-21-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-21-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 17:26:41 +0100
X-Gm-Features: AclHuK9LMqtW-CAAZ3xrwGlJrfDwYU71aDjAnimvRogO_6sdanZdfIn2PpOI6Zc
Message-ID: <CAFEAcA-BxUQAg6uVPn7EMP=xJ_J7oa6FD6hxZFrmQJmf=-VhoQ@mail.gmail.com>
Subject: Re: [PATCH 20/22] i8259.c: switch isa_pic from I8259CommonState to I8259PICState
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-42698a/1791908814-1AEDE9EA-5F644D85/0/0
X-purgate-type: clean
X-purgate-size: 964

On Wed, 16 Sept 2026 at 11:49, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> The isa_pic variable exists to allow the output to be fetched or read (fetched
> and acknowledged) from the x86 PIC. Since this can also contain a cascaded
> interrupt from a slave i8259, switch isa_pic from I8259CommonState to
> I8259PICState and update both pic_get_output() and pic_read_irq() accordingly.
>
> This has the advantage that a i8259-based PIC device contains its own internal
> reference to both the primary and secondary i8259s, and therefore it becomes
> possible to completely remove the slave_pic variable.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(That isa_pic global is kind of ugly; in an ideal world the callers
would have a pointer to the PIC they cared about rather than relying
on there being exactly one in the system...)

thanks
-- PMM

