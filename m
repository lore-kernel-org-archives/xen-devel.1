Return-Path: <SRS0=xX5W=CX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E3DC43461
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 16:07:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B09BD20715
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 16:07:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="WMe1Rxg+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B09BD20715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHr0E-0006IV-B8; Mon, 14 Sep 2020 16:06:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lZiK=CX=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kHr0D-0006IQ-F1
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 16:06:49 +0000
X-Inumbo-ID: f1773e9c-b433-40b8-b997-775c26db95e7
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1773e9c-b433-40b8-b997-775c26db95e7;
 Mon, 14 Sep 2020 16:06:47 +0000 (UTC)
Date: Mon, 14 Sep 2020 15:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600099605;
 bh=AEusmFNmA1vjPjDixEwukHa2mjAITRP5t0r2ZuFFkhk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=WMe1Rxg+Wg9ZAkb6rK7iPRu6LIpvVdYe/YtkLp2qgfwq/LPgPGTB0Zf4z6zASuHl3
 pYT65aLKQUsFggecdOl6NUWccfY7oMDgsg8CWLSlDSO0h7yGdnXC4jSN6IW/c3kIOd
 Om9YIXy/DYlX0YGjtp7XNR4Moua3z5l575E1llR4=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] efi: const correct EFI functions
Message-ID: <k1CeZGAJquzeIZ1QQgwjPptA5Of3tFvfAE7cUeOvP5D8Th9j55kbwhM410STM91F_ys-HvUZ4WRwch4-gY12EG7cx7u8LEQBxroiwhj8T5Q=@trmm.net>
In-Reply-To: <d94fdbee-7e41-99db-13f8-16394a288318@suse.com>
References: <20200914142528.897639-1-hudson@trmm.net>
 <c83fa179-253b-29ba-57d7-c2b5a9b0daee@suse.com>
 <GzkAuTpoKeYXGDsEJtlgfK50xky_Z3ipeYUpbKvW9Fu-0uJamNpsRVMR8fIUYpIzoJlzowf-j7pbcoDAmL8qgYRjE2UwZ2wKma0Xm7U5PpQ=@trmm.net>
 <d94fdbee-7e41-99db-13f8-16394a288318@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Monday, September 14, 2020 10:55 AM, Jan Beulich <jbeulich@suse.com> wro=
te:
> On 14.09.2020 16:46, Trammell Hudson wrote:
> > Option 3 would be to write wrappers for the few functions that are
> > used in the EFI boot path that cast-away the constness of their
> > arguments (while also silently cursing the UEFI forum for not
> > writing const-correct code).
>
> This would be kind of a last resort fallback (except for the
> cursing, which of course we can do at any time).

Since you didn't like the time travel option, I checked to see
which functions would need to be wrapped.  It is a surprisingly
small number:

#define PrintStr(s) StdOut->OutputString(StdOut, (CHAR16 *)(s))
#define PrintErr(s) StdErr->OutputString(StdErr, (CHAR16 *)(s))
#define efi_file_open(file,handle,name,mode,attr) \
  (file)->Open(file, handle, (CHAR16 *)(name), mode, attr)
#define shim_verify(shim, ptr, len) \
  (shim)->Verify((void *)(ptr), len)

--
Trammell

