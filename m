Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D439DE99074
	for <xen-devel@archiver.kernel.org>; Fri, 10 Apr 2026 10:07:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1278627.1563392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8lF-00061s-99; Fri, 10 Apr 2026 10:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278627.1563392; Fri, 10 Apr 2026 10:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8lF-00061l-5T; Fri, 10 Apr 2026 10:06:49 +0000
Received: by outflank-mailman (input) for mailman id 1278627;
 Fri, 10 Apr 2026 10:06:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wB8lE-00061f-5P
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:06:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB8lD-00E48T-D9
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:06:47 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69d8cbb2-bab6-0a2a0a5309dd-0a2a45039446-24
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:06:47 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69d8cbb7-02b3-0a2a45030019-a237832fa6c2-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:06:47 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id D271D4EE3D1A;
 Fri, 10 Apr 2026 12:06:46 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1775815607;
	b=MjdY4/JVIuAW9N36xCD3YXm3JotM3V+RfEQt+4MziYEvN3e07ypH3uL2PS6tRREgPlrh
	 eFgNSqpj0cFZszk/EYt3w+spZnkqYb0xtfH4bYb8Al6KRLp0iDn9/G6mgli7yYdyv7Xlx
	 9n8VMNGEkH/66VjLita3reZoMxBeSUX/ee72S0qQpcayF7QSx+yUBmzqBmEoRwEv4qUsT
	 F9hVA/Ckp6O2BDKpCq15pnPFqc6aNIYCoW77+t34/diJIn7ls71oezMVWks24x/r6L+nE
	 zHfqxZReahftdzo/7YmKBOStHNPBwxH2zm6bKgQ3Pk6WgCgdEBilPocP+7fG9eXiDE3uc
	 f7oGk50b/4p+wvrYevGaQh5MVoS3Vvz6fBUULWsoq40Bn/DXsysE52a+dsqf52huG3f9Q
	 emMM9isp+9Y2uDeeJfYZsF9tvmJSW9xajTXZw/m02EBpsJSY5b5QYZm5kNd2WC5UHEaQx
	 +Wb9Wg+d3Kche3Ig0TRbdpsELuO6JR1DuDDzRAat5NIU5BjUbtVHF2y1ap/P1xyeDFGNG
	 g+wHznknrWKFQ1eMLsRhsaYYYB9SqClBmHRqIO/KNhjUye0SiQ1f8cHOAMStNcKzssRdY
	 lNFpNAzcKujryKs4TxupYSl7dwwcYdzpz48RKGdBpiQ+AZbHyc7Idztyk0XTEZI=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1775815607;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=AthjxD6bIMJJOd71BX/xR7xA5ig717DgsSmNBAcifVk=;
	b=p6/i966JC5eohSNNJHNMFqvLHODPP0jTYVQ2tMzma/LuQHu3yT3TONHOe+FMD5GqNS2I
	 DycIguteQVprseFuqRXk/7o+JFEWkCZSry+CZu2vdU+8/VHRrIgZQnKWHWohY59EWv9rv
	 FnsjN3Xi8irTxVeLctxsbMB5Apppflv4QwpsmjzN1BjbyFuVWctVY48dlwYbBDEli1AE9
	 ufSWhHN8Iq38NX7LUMJTi4N0dT//s4fMnAQ5cdqGfKm2HDbIXxTmnxQhrWinml9/GSEKo
	 dn/kHsqNIIdiY2dg4ZJjGv91WVF6mUGEhJ4ui5aGzhiyzZTYJIvEyc3ATBKYKoXykn120
	 y4kE7imA9xSm7BfHEu4cFUewSVWBGlPnQS/o3/bEJc9la2ueRnKsNOCw6xQCUziwIQFDV
	 jCKQvA20GE4ccrZPg75HV98ba6Oav5Rpjp1gKkj9dFyzFxhRjxU34TyNdfiPCDuuJ1MyF
	 FLambikrRCFlik5WYeSdYY23MF/m2v7+IpGoFAgn6fFzUM0GbmzXkhpKBUntwmA4tXvOB
	 5FRt2evvljrLp0SwuPUVzRytfpgPPX92FO+8i1zKj/33zE4ZKZfVygl7xsoyRCRNBzsHR
	 6SIlTCaxeE9LrblsYESUmkiX6jdHiR+e/zZenwqpN98KTO3AAb2wKN4Ybj1wL24=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 10 Apr 2026 12:06:46 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Gyujeong Jin <wlsrbwjd7232@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>
Subject: Re: [BUG] Potential double-free in Xen dt-overlay attach/remove error
 path
In-Reply-To: <c4961231-7882-49d8-8c68-c014ca0a5e4f@suse.com>
References: <CANrF8CHA1XacwRzNcw3zt0goEV-7in_=vtEYhLxSjwaV62jrTw@mail.gmail.com>
 <c4961231-7882-49d8-8c68-c014ca0a5e4f@suse.com>
Message-ID: <aaeff4b4915c28a6ac5a7abfa4ab7679@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1775815607-CB126C9A-4606EAD9/0/0
X-purgate-type: clean
X-purgate-size: 3052

On 2026-04-10 08:31, Jan Beulich wrote:
> On 09.04.2026 23:28, Gyujeong Jin wrote:
>> Hello Team, I was advised to report this issue in this way because
>> dt-overlay is currently experimental and not security supported.
>> 
>> I would like to report a potential memory safety issue in Xen related 
>> to
>> the Device Tree overlay handling logic.
>> ------------------------------
>> Problem Description
>> 
>> A double-free / use-after-free condition may occur in the dt-overlay
>> handling path when an overlay attachment fails and the same overlay is
>> later removed.
>> 
>> The issue arises because rangeset objects are freed on the failure 
>> path of
>> handle_attach_overlay_nodes(), but the corresponding pointers are not
>> cleared. Subsequently, handle_remove_overlay_nodes() may operate on 
>> these
>> stale pointers, leading to a second free.
>> Affected Component
>> 
>>    - Xen ARM
>>    - Device Tree overlay subsystem
>>    - File: xen/common/device-tree/dt-overlay.c
>> 
>> Relevant functions:
>> 
>>    - handle_attach_overlay_nodes()
>>    - handle_remove_overlay_nodes()
>> 
>> Impact
>> 
>> This issue may lead to:
>> 
>>    - Double-free of rangeset structures
>>    - Use-after-free when accessing stale pointers
>>    - Potential hypervisor crash (DoS)
>>    - Possible memory corruption depending on allocator behavior
>> 
>> Given that this occurs in the hypervisor context, the impact could 
>> extend
>> beyond a simple crash under certain conditions.
>> Root Cause
>> 
>> The issue originates from inconsistent memory management between the 
>> attach
>> failure path and the remove path.
>> 
>> In handle_attach_overlay_nodes(), the failure path frees rangeset 
>> objects:
>> 
>> static long handle_attach_overlay_nodes(...)
>> {
>>     ...
>> 
>>     if ( entry )
>>     {
>>         rangeset_destroy(entry->irq_ranges);
>>         rangeset_destroy(entry->iomem_ranges);
>>     }
>> 
>>     return rc;
>> }
>> 
>> However, the corresponding pointers (entry->irq_ranges and
>> entry->iomem_ranges) are not set to NULL afterward, leaving dangling
>> pointers in the entry structure.
> 
> Further to this, am I overlooking any check preventing an already 
> created
> pair of rangesets to be replaced by new ones, leaking the original 
> pair?
> 
> And then there's a Misra issue as well: dt_overlay_domctl() has 
> unreachable
> code. Anything other than XEN_DOMCTL_DT_OVERLAY_ATTACH is excluded at 
> the
> top, so the "else" body near the bottom is unreachable. (This in turn 
> makes
> me wonder: How come there's no "detach"?) Yet then, that's probably 
> pretty
> meaningless, as there look to be other issues (Misra and general 
> robustness
> ones) as well.
> 
> Jan

Is it by any chance enabled in *-allcode analyses? I don't see such 
reports for unreachable code on ARM64.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

