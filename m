Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E29FC43458
	for <xen-devel@archiver.kernel.org>; Sun, 28 Jun 2026 16:10:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347021.1604980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wds4e-00046K-Nv; Sun, 28 Jun 2026 16:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347021.1604980; Sun, 28 Jun 2026 16:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wds4e-000460-HT; Sun, 28 Jun 2026 16:09:36 +0000
Received: by outflank-mailman (input) for mailman id 1347021;
 Sun, 28 Jun 2026 16:09:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wds4c-00045u-Rc
 for xen-devel@lists.xenproject.org; Sun, 28 Jun 2026 16:09:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wds4c-00CKvn-0u
 for xen-devel@lists.xenproject.org; Sun, 28 Jun 2026 18:09:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a4146c6-bab6-0a2a0a5309dd-0a2a4502d77a-16
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jun 2026 18:09:33 +0200
Received: from [178.33.251.19] (helo=14.mo581.mail-out.ovh.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a41473d-5a27-0a2a45020019-b221fb13a513-3
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jun 2026 18:09:33 +0200
Received: from director6.ghost.mail-out.ovh.net (unknown [10.110.43.172])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4gpDrF0Gv5z5x0p
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jun 2026 16:09:32 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-vj844 (unknown [10.111.174.17])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C568A80195;
 Sun, 28 Jun 2026 16:09:31 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.112])
 by ghost-submission-7d8d68f679-vj844 with ESMTPSA
 id Gei7GjtHQWr13QQAAvAMOA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 28 Jun 2026 16:09:31 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ovhmo3617313-selector1 header.d=3mdeb.com header.i="@3mdeb.com" header.h=From
Authentication-Results:garm.ovh; auth=pass (GARM-112S00625008ee3-b8ac-4c7a-aab1-050b9b589588,
                    F30B6CF3A1EB02EF81B2D257C2D50E391784B5AC) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.183.249
Date: Sun, 28 Jun 2026 19:09:24 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 10/22] x86/tpm.c: code for early hashing and extending
 PCRs (for TPM1.2)
Message-ID: <akFHNFIuGGALeaw4@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <0c249037eeda4809b565a55c6473bb21cdd0304e.1748611041.git.sergii.dmytruk@3mdeb.com>
 <45ad9ee7-e4a4-4f31-b8d0-723a97d7f45b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45ad9ee7-e4a4-4f31-b8d0-723a97d7f45b@suse.com>
x-ovh-tracer-id: 5132977677708436956
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEuKw4bPc6CkhqtFY7u3KiWiLJTQBhAQeHah/xYhif2o363wsmlzYbYPov482CGV7zuDmsNI6k/OydnzeHioz0pyt/h333iGp1pxoAmvY5ETAU/pQbv8Ku9pBupVY51IT4fWsvFiQKxuaZH65y9rjqklLia+3zUMixyifLDg6VjS9n3A47tevFkmgdsWqoGi800IET9spP65ZZNeuMwuWMO0yeyVrdBe25hvPwFHc928p6fMv4/VB9cQrLt67/Ldo6R7We6b5SFRxG98EF56Havdzkb6BsEknlPtNub9XpqWx4ugBz+R0K4bzvtZtkViuYs4Xs5qTSwKxAU0uLfx3DNr3KznokLRPV2bX6WkPSN6tHUEbnX313X6Q4k1ibxEw3kQpaBMQBhOTCZcMX94hOpnFaAKh7UOiV3tSmMZiCh7y+f7NRxhEMwLapgz534ROesZc4mDDIS3pXqZMUwuEVmpquyPawBuO+BabpfWUbNwlOKe00vz2NY4I4FdaFohCG7bdFsFwLQDjvcQlJevrOpJ0SCGkoVqX/Gp2ZJ6AvOGR0FeJXp2p07SR4m9Xq6KiRDrGyj6C818aoqKSWhtRUZkUaPNmL7aMZLq/70SOiX9VHpVQrhNiQ5j6/FvgTROMOK+PXgJPSaMOEjsfn8G5+nCUfbSkXus9e09C2J3kFQwA
DKIM-Signature: a=rsa-sha256; bh=Cm4QNnE09bT/cx71YTnM0FRHZKt0ocHAbs5bEJ/Zv8M=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1782662973; v=1;
 b=SZS3m2Ka1BkVDV2qQLyYhlYEDT/VXh2O5kh9XAHltARZ9rUdRf9jwE7Yw5c2mclSFfZyCmos
 jIl5/sCZ69gne1d98XC4qQEWapviVRq7XbyvDajUztMThiJtrSFeacP4Sa+BxMmRhKrn/QLHPSK
 WahICNEHasAyTd7Mq0GldAgzIDO6VEyVu7wfv7b9ziClECS4sDDtPRtIzILEZWEwWvHy7nQvbEM
 WgS16LPHKIDj6IdgosZB+4K7dxbSXEFvwQ+Ih/zk5ZIOqYDJFmbUv9ag7ewUBIYwAlmL7NlXpi9
 xeh7Kg3fHUASXYeIgZWDUHt9ku1htBU3sMq4OHoQ7OAvA==
X-purgate-ID: tlsNG-720697/1782662973-4FB1F7C5-5A5438FC/0/0
X-purgate-type: clean
X-purgate-size: 6295

On Wed, Oct 22, 2025 at 04:07:35PM +0200, Jan Beulich wrote:
> > +void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
> > +                     unsigned size, uint32_t type, const uint8_t *log_data,
> > +                     unsigned log_data_size);
>
> Here and elsewhere: We prefer "unsigned int" over just "unsigned".

Will update.

> > +    while ( (tis_read8(TPM_ACCESS_(loc)) & ACCESS_ACTIVE_LOCALITY) == 0 );
>
> Here and below - please put such semicolons on a separate line, to make more
> recognizable that no loop body follows. Also generally we prefer ! over == 0
> for such checks.

OK.

> > +static void send_cmd(unsigned loc, uint8_t *buf, unsigned i_size,
> > +                     unsigned *o_size)
> > +{
> > +    /*
> > +     * Value of "data available" bit counts only when "valid" field is set as
> > +     * well.
> > +     */
> > +    const unsigned data_avail = STS_VALID | STS_DATA_AVAIL;
> > +
> > +    unsigned i;
> > +
> > +    /* Make sure TPM can accept a command. */
> > +    if ( (tis_read8(TPM_STS_(loc)) & STS_COMMAND_READY) == 0 )
> > +    {
> > +        /* Abort current command. */
> > +        tis_write8(TPM_STS_(loc), STS_COMMAND_READY);
> > +        /* Wait until TPM is ready for a new one. */
> > +        while ( (tis_read8(TPM_STS_(loc)) & STS_COMMAND_READY) == 0 );
> > +    }
> > +
> > +    for ( i = 0; i < i_size; i++ )
> > +        tis_write8(TPM_DATA_FIFO_(loc), buf[i]);
> > +
> > +    tis_write8(TPM_STS_(loc), STS_TPM_GO);
> > +
> > +    /* Wait for the first byte of response. */
> > +    while ( (tis_read8(TPM_STS_(loc)) & data_avail) != data_avail);
>
> Here you properly follow the comment at the top of the function, while ...
>
> > +    for ( i = 0; i < *o_size && tis_read8(TPM_STS_(loc)) & data_avail; i++ )
>
> ... here you don't. Why?

Right, `== data_avail` was missing here.  Likely a remnant from an
earlier version.

> > +        buf[i] = tis_read8(TPM_DATA_FIFO_(loc));
> > +
> > +    if ( i < *o_size )
> > +        *o_size = i;
>
> Is there any real need for this assignment to be conditional?

There isn't, as far as I can tell, will be unconditional.

> > +    uint32_t intf_version = tis_read32(TPM_INTF_CAPABILITY_(0))
> > +                          & INTF_VERSION_MASK;
>
> Nit: The & wants to move to the previous line and indentation of the
> continuation line wants to increase by 2.

OK.

> > +    cmd_rsp.start_c = (struct sha1_start_cmd) {
> > +        .h.tag = swap16(TPM_TAG_RQU_COMMAND),
> > +        .h.paramSize = swap32(sizeof(struct sha1_start_cmd)),
>
> While here it may be viewed as on the edge, ...
>
> > +        .h.ordinal = swap32(TPM_ORD_SHA1Start),
> > +    };
> > +
> > +    send_cmd(loc, cmd_rsp.buf, sizeof(struct sha1_start_cmd), &o_size);
>
> ... here and ...
>
> > +    if ( o_size < sizeof(struct sha1_start_rsp) )
>
> ... here (and elsewhere) you would better use sizeof(<expression>), to make
> the connection there more clear.

OK and I'll update send_cmd() to be like in TPM2.0 case which gets rid
of duplicated expressions.

> > +            max_bytes = size & ~(64 - 1);
>
> ROUNDDOWN(size, 64)

Right, didn't see this macro.

> > +        o_size = sizeof(cmd_rsp);
> > +
> > +        cmd_rsp.update_c = (struct sha1_update_cmd){
>
> Please, at least within a single patch, be consistent about whether there is
> a blank between ) and {.

Sure.

> > +error:
>
> Nit: Labels indented by at least one blank please.

OK, didn't see that note about `diff -p` before.

> > +    new_entry = (void *)(((uint8_t *)evt_log) + evt_log->NextEventOffset);
>
>    new_entry = (void *)evt_log + evt_log->NextEventOffset;
>

OK.

> > +    if ( evt_log->NextEventOffset + sizeof(struct TPM12_PCREvent) + data_size
> > +         > evt_log_size )
>
> Nit: Operator placement again.

OK.

> > +        return NULL;
> > +
> > +    evt_log->NextEventOffset += sizeof(struct TPM12_PCREvent) + data_size;
> > +
> > +    new_entry->PCRIndex = pcr;
> > +    new_entry->Type = type;
> > +    new_entry->Size = data_size;
> > +
> > +    if ( data && data_size > 0 )
> > +        memcpy(new_entry->Data, data, data_size);
>
> What about "data && !data_size" or "!data && data_size"? Are these legal
> inputs that are fine to ignore? Otherwise - why the if()?

Not every event has event data, so it can be NULL and/or of zero size.
Will state that in a comment.

> > +void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
> > +                     unsigned size, uint32_t type, const uint8_t *log_data,
> > +                     unsigned log_data_size)
> > +{
> > +    void *evt_log_addr;
> > +    uint32_t evt_log_size;
> > +
> > +    find_evt_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
> > +    evt_log_addr = __va((uintptr_t)evt_log_addr);
> > +
> > +    if ( is_tpm12() )
> > +    {
> > +        uint8_t sha1_digest[SHA1_DIGEST_SIZE];
> > +
> > +        struct txt_ev_log_container_12 *evt_log = evt_log_addr;
> > +        void *entry_digest = create_log_event12(evt_log, evt_log_size, pcr,
> > +                                                type, log_data, log_data_size);
> > +
> > +        /* We still need to write computed hash somewhere. */
> > +        if ( entry_digest == NULL )
> > +            entry_digest = sha1_digest;
> > +
> > +        if ( !tpm12_hash_extend(loc, buf, size, pcr, entry_digest) )
> > +        {
> > +#ifndef __EARLY_SLAUNCH__
> > +            printk(XENLOG_ERR "Extending PCR%u failed\n", pcr);
> > +#endif
> > +        }
> > +    }
>
> And implicitly "else { ignore everything }"?

Yes, but the next version of the patch will return an error instead.

> > +#ifdef __EARLY_SLAUNCH__
> > +void asmlinkage tpm_extend_mbi(uint32_t *mbi, uint32_t slrt_pa)
>
> Pointer to const please, and then make sure ...
>
> > +{
> > +    /* Need this to implement slaunch_get_slrt() for early TPM code. */
> > +    slrt_location = slrt_pa;
> > +
> > +    /* MBI starts with uint32_t total_size. */
> > +    tpm_hash_extend(DRTM_LOC, DRTM_DATA_PCR, (uint8_t *)mbi, *mbi,
>
> ... not to cast away const-ness here.
>
> Jan

Will do.

Regards,
Sergii

