Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4DF606A323
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 11:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=rQS0QNsZ
Received: from list by lists.xenproject.org with outflank-mailman.1463153.1674129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM27J-0007iH-Cm; Wed, 28 Oct 2026 11:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463153.1674129; Wed, 28 Oct 2026 11:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM27J-0007iA-9A; Wed, 28 Oct 2026 11:46:53 +0000
Received: by outflank-mailman (input) for mailman id 1463153;
 Wed, 28 Oct 2026 11:46:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM27I-0007hk-1O
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 11:46:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM27H-00Aufp-A7
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 12:46:51 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1825590b6000f79f@swg.vates.tech>)
 id 6ae1e0a2-8faa-0a2a0a5109dd-0a2a45039dc8-34
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 12:46:51 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1825590b6000f79f@swg.vates.tech>)
 id 6ae1e0aa-fae8-0a2a45030019-b9ff1c1293f7-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 12:46:51 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1825590b6000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Oct 2026 11:46:48 +0000
Received: from [192.168.1.61] (142.220.66.37.rev.sfr.net [37.66.220.142])
 (Authenticated sender: ngoc-tu.dinh@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5E55582C62;
 Wed, 28 Oct 2026 12:46:47 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=8LhirgX8r53rafbUvtgDISlH8AXpATTq32fwJlc4G2Y=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=rQS0QNsZ6DTcBQ3EQ8JUCjv29sbb9kqKoZRogElPqbWy1fn/6Xs2VEACVTheA92PvGjWGnUv/
 EpsR3G7GWOplB7vJI3zQh3qfoeL4yheK75k+GgHipIhUnZvADqn5tzk9kquzFPgaUCjoz+s0mBp
 lKe10X2w/XHFy3du1sYrc3qjBDJ6Jox2wY45qDz/Z4HE1NIBLVr9Lhga6vAsi3cj1jP6xw5MY28
 hVjgpx3K1z5EG8FZR3U1TgDK3a2c8GgH2KArtULE3SUydRx0b4uxXOIu/ONAuDn9n+oBJUWsOVB
 Nny7N62Y2NwrlJWZNHtlfoz3D7rk29Y0sHJiPj90KNEw==
X-Zone-Loop: f7550b081fbb518ca708cfed0b706b83324fc4f54f13
x-campaign-type: default
x-transaction-id: 58914819-cdbc-4c1b-8480-2d44f4b35178
x-swg-uid: 01-cddde208-5d85-411e-9ab1-787f1201e6d9
X-Mailer: Sweego
Message-ID:
 <1793188008.8631fc262581453bbf619ec5b2062170.1a1825590b6000f79f@vates.tech>
x-swg-bid: 1793188008.8631fc262581453bbf619ec5b2062170.1a1825590b6000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Wed, 28 Oct 2026 12:46:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vpt: Validate timer object with generation number
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1792717952.8631fc262581453bbf619ec5b2062170.1a166511467000f79f@vates.tech>
 <f4aa49b0-985b-43b2-ad1f-8ddf073fdb61@suse.com>
From: Tu Dinh <ngoc-tu.dinh@vates.tech>
In-Reply-To: <f4aa49b0-985b-43b2-ad1f-8ddf073fdb61@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.289.d38e611745819b3.1a182558e2c.8ee8a2f71509cc74=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793188007468
X-purgate-ID: tlsNG-33051d/1793188011-6D8D54E9-CE0E3308/10/78276251493
X-purgate-type: spam
X-purgate-size: 2557
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.289.d38e611745819b3.1a182558e2c.8ee8a2f71509cc74=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28/10/2026 12:31, Jan Beulich wrote:
> On 23=2E10=2E2026 03:12, Tu Dinh wrote:
>> The remote completion path of pt_update_irq removes timers from tm_list
>> by checking that their addresses match the previous iteration=2E Howeve=
r,
>> if the guest rearms a timer during the gap between two list iterations,
>> the resulting timer object is no longer the same, even if their
>> addresses match=2E Removing the timer from the list will then lose the
>> armed timer object=2E
>>
>> Record a generation number in each timer object upon arming, and check
>> that the generation number matches before removing it from the list=2E
>=20
> Fixes: 0bcbc971feaa ("x86/vpt: add support for level interrupts")
>=20
>> Signed-off-by: Tu Dinh <ngoc-tu=2Edinh@vates=2Etech>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse=2Ecom>

Thank you very much for the review=2E

> preferably with =2E=2E=2E
>=20
>> --- a/xen/arch/x86/hvm/vpt=2Ec
>> +++ b/xen/arch/x86/hvm/vpt=2Ec
>> @@ -318,6 +318,7 @@ int pt_update_irq(struct vcpu *v)
>>       struct list_head *head =3D &v->arch=2Ehvm=2Etm_list;
>>       struct periodic_time *pt, *temp, *earliest_pt;
>>       uint64_t max_lag;
>> +    uint64_t generation;
>=20
> =2E=2E=2E this folded with the earlier line=2E
>=20
>> --- a/xen/arch/x86/include/asm/hvm/vpt=2Eh
>> +++ b/xen/arch/x86/include/asm/hvm/vpt=2Eh
>> @@ -34,6 +34,7 @@ struct periodic_time {
>>       u8 irq;
>>       struct vcpu *vcpu;          /* vcpu timer interrupt delivers to *=
/
>>       u32 pending_intr_nr;        /* pending timer interrupts */
>> +    u64 generation;             /* distinguish two armings of the same=
 timer */
>>       u64 period;                 /* frequency in ns */
>>       s_time_t scheduled;         /* scheduled timer interrupt */
>>       u64 last_plt_gtime;         /* platform time when last IRQ is inj=
ected */
>=20
> Also, no matter that adjacent lines use u<N>, it wants to be uint<N>_t f=
or
> new fields=2E Otherwise we will never get rid of the remaining u<N>=2E
>=20
> I can make these adjustments while committing, no need to send a v2 just=
 for
> that=2E
>=20

Yes, please go ahead and make the adjustments=2E

> Jan



-- 
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.289.d38e611745819b3.1a182558e2c.8ee8a2f71509cc74=---

