Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7BDCA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 13:27:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446325.1662437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGG3r-0004Uo-W8; Mon, 12 Oct 2026 13:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446325.1662437; Mon, 12 Oct 2026 13:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGG3r-0004Uh-T0; Mon, 12 Oct 2026 13:27:27 +0000
Received: by outflank-mailman (input) for mailman id 1446325;
 Mon, 12 Oct 2026 13:27:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1304beaaa00080d7@swg.vates.tech>)
 id 1xGG3r-0004UZ-25
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:27:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGG3q-00FYhN-F7
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:27:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1304beaaa00080d7@swg.vates.tech>)
 id 6acce030-e002-0a2a0a5209dd-0a2a450bd6cc-46
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:27:26 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1304beaaa00080d7@swg.vates.tech>)
 id 6acce03d-b7e8-0a2a450b0019-b9ff1c22b595-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:27:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1304beaaa00080d7.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 12 Oct 2026 13:27:24 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 043E8804EE;
 Mon, 12 Oct 2026 15:27:23 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=EFNKMyIy5Fpjf5Xqfq4As6aZwcB1BCpuczevb8LKC/o=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=MNWiX6hglGuLFEczuspNusLnqKkVdoHc5G44R9stLsNuLpK+RYiKuAufRuFm8ugw34s+wezxB
 2NBf/DOg5RokZVTZ7zsCQdGqCYhf/krgcdlg23mTISzUrYZ53p4vasqskofar2CNbtwcD9pwArL
 cchLMfTRYVPzcY2a0OQmLKlMdhnW4f6iPf1FeVS7y0oanaVhmEFpUY3FaqNqOUE325tQQK6RCva
 8CA4ZtQRqWEnkFSGZtn8Umgi2lrG/5z9Z5pXb6Mt/KBdJnmhB7wWW0ybUKEfZ1uXq85aa4CeeJa
 aiPudvAeH4rXqKFYUrh7tFt/kBB2VWeJmPBMQmP4zApg==
X-Zone-Loop: 441f2a207fcbe493bf92bb392b34d2789b5350fcebb8
x-campaign-type: default
x-transaction-id: 87acc4cc-5b84-491b-8f9c-d6596bbb3585
x-swg-uid: 01-aa6d9334-8ca0-4a5a-b436-d3952a1b240f
X-Mailer: Sweego
Message-ID:
 <1791811644.8631fc262581453bbf619ec5b2062170.1a1304beaaa00080d7@vates.tech>
x-swg-bid: 1791811644.8631fc262581453bbf619ec5b2062170.1a1304beaaa00080d7
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 12 Oct 2026 15:27:22 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/xentop: reject invalid --delay and --iterations
 arguments
References: <20260805135521.790750-1-matthias.goergens@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260805135521.790750-1-matthias.goergens@gmail.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.fd.e2cc01512bd5603f.1a1304be6c6.393d4994110ca2b7=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791811643079
X-purgate-ID: tlsNG-42698a/1791811646-AB4D39EA-7B152B40/0/0
X-purgate-type: clean
X-purgate-size: 2674

---=Part.fd.e2cc01512bd5603f.1a1304be6c6.393d4994110ca2b7=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2026 at 09:55:21PM +0800, Matthias Goergens wrote:
> xentop parses -d/--delay and -i/--iterations with atoi(), so invalid
> input is silently accepted with surprising results: a fractional delay
> such as "-d 2=2E5" is truncated to 2; "-d abc" parses as 0, which in
> batch mode turns the output loop into a busy loop; "-d -1" wraps to an
> effective delay of about 136 years; and "-i 0" (or any unparsable
> iterations count) decrements an unsigned counter from zero, running
> for about 2^32 iterations=2E  atoi() also has undefined behaviour on
> out-of-range input=2E
>=20
> Parse both options with strtoull() instead, and reject anything that
> is not a plain decimal integer in range: a sign, a fractional part,
> trailing junk or overflow now produce an error and exit rather than a
> silently wrong value=2E
>=20
> Compatibility considerations: "--delay 0" remains accepted, since
> updating as fast as possible is a plausible deliberate choice and
> works today; "--iterations 0" is rejected, since running the loop
> 2^32 times cannot be what the caller meant=2E  The interactive 'D'
> prompt already validates its input and is unchanged=2E  The only
> previously useful invocation this breaks is a fractional delay, which
> now fails loudly instead of silently rounding down - which is the
> point of the change=2E
>=20
> A patch documenting the --delay truncation was posted in 2010 but
> never applied:
> Link: https://lore=2Ekernel=2Eorg/xen-devel/01ea26d2420e3562eb30=2E12926=
04768@chilopoda=2Euk=2Exensource=2Ecom/
>=20
> Signed-off-by: Matthias Goergens <matthias=2Egoergens@gmail=2Ecom>
> ---
> Tested by compiling with -Wall -Wextra (no new warnings) and by running
> the parse helper, extracted verbatim from the patched file, against a
> 19-case input matrix covering both the accepted and the rejected inputs
> listed above=2E  Not run against a live Xen host: the change is confined
> to command line parsing, ahead of any hypervisor interaction=2E
>=20
> Happy to add a CHANGELOG=2Emd entry under "Changed" if that is wanted fo=
r
> a tools CLI change of this size=2E

No, I don't think it's necessary, this patch is just error handling, and
a bit of clarification I suppose=2E

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.fd.e2cc01512bd5603f.1a1304be6c6.393d4994110ca2b7=---

