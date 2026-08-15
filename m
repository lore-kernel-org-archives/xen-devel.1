Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3890C5AD5A
	for <xen-devel@archiver.kernel.org>; Sat, 15 Aug 2026 07:03:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391641.1631304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wv8QE-0006lo-Hz; Sat, 15 Aug 2026 07:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391641.1631304; Sat, 15 Aug 2026 07:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wv8QE-0006lh-Eq; Sat, 15 Aug 2026 07:03:14 +0000
Received: by outflank-mailman (input) for mailman id 1391641;
 Sat, 15 Aug 2026 07:03:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+eb7931f7a775907bc3a1+8392+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wv8QA-0006lb-7J
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2026 07:03:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wv8Q8-00BTdy-SL; Sat, 15 Aug 2026 09:03:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+eb7931f7a775907bc3a1+8392+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a800f22-bab6-0a2a0a5309dd-0a2a45098f72-12
 for <multiple-recipients>; Sat, 15 Aug 2026 09:03:08 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+eb7931f7a775907bc3a1+8392+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a800f2b-be1a-0a2a45090019-5a9b5cc7802c-3
 for <multiple-recipients>; Sat, 15 Aug 2026 09:03:07 +0200
Received: from [2001:8b0:10b:5:7c22:1ec7:eff1:386] (helo=ehlo.thunderbird.net)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat
 Linux)) id 1wv8Pq-0000000HLvs-34jQ; Sat, 15 Aug 2026 07:02:51 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vFwW/KzeZkxEAcxvRpsV5UXDgsa9npf+qs5mLhHNQNY=; b=TsD1aUT9ojH/4Tct9skCWNvTNK
	44l/zqLlBlmWFlgdrwDQL+FMgjnMoP0yx3NOB7d9rJBr53GW31p08+qK+W2brToWlxephG84Sc8M5
	H6FypLYnkl7SD9j8MaG/fk02wZd8XFEHuVGH1LWuVpp7W0mFejD8hMadvmTujPJJcWI4j7zUWt3+S
	XXWdfZOILX8K2+HYBXOhHPRton/Ccb6kh4LYCx5btBO/6krUhpL7kG/PAjChXLP6/O3NylmzF/A6p
	IQSlksnb0p5VogSmZYY9d6HdgEb/LBK8cSzoJnOUmOjf1nmcxPz0T652yJzGp7G1US43ALjYn90F5
	h58OfAcw==;
Date: Sat, 15 Aug 2026 08:02:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Sascha Bischoff <Sascha.Bischoff@arm.com>, Marc Zyngier <maz@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>,
 Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v7_17/36=5D_KVM=3A_x86=3A_Allow_KVM_master?=
 =?US-ASCII?Q?_clock_mode_when_TSCs_are_offset_from_each_other?=
User-Agent: K-9 Mail for Android
In-Reply-To: <an9WVBHSsy5W0PUk@google.com>
References: <antQYJvRxJxOjtut@google.com> <f5dc701cf3319a7b3c8fd1497f26d051aa9fa3ba.camel@infradead.org> <antb01WqOrs-tztm@google.com> <6ab49538675d97f1f4bf01574b1b066aae0bc05c.camel@infradead.org> <ants4VjfAiblaWsl@google.com> <3dc73f745b6abfd1eb53e7d3fce2067eaa3b3c92.camel@infradead.org> <anuYNxD81OE3MrQw@google.com> <5efe7a3914a3610ee00a487379caff84af6aa731.camel@infradead.org> <anusv0DloFhLMMoW@google.com> <c5c532e01309c8c73de2b0f393539b608c495f1f.camel@infradead.org> <an9WVBHSsy5W0PUk@google.com>
Message-ID: <606ECD8E-2EED-48B9-A440-62D2444FBE22@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-bad1c0/1786777388-BE6DA034-CF6530A3/0/0
X-purgate-type: clean
X-purgate-size: 1160

On 14 August 2026 18:54:28 BST, Sean Christopherson <seanjc@google=2Ecom> w=
rote:
>On Fri, Aug 14, 2026, David Woodhouse wrote:
>> On Tue, 2026-08-11 at 16:14 -0700, Sean Christopherson wrote
>> > I'm not totally opposed to a broader GET, but we should definitely ge=
t Paolo's
>> > eyes on this sooner than later=2E
>>=20
>> We've been saying that for two years=2E Shall I bring a net and a whip =
to
>> KVM Forum? Or Plumbers? :)
>
>I pointed at this thread in the "clocks" pull request, so then should be =
now,
>soon=2E  And if that doesn't work, I'll just rename the getter to
>KVM_GET_PAOLO_PAOLO_PAOLO and send a pull request=2E  Either that will ge=
t his
>attention, or we'll have a source of amusement for years to come :-)
>
>Joking aside, this would be a good PUCK topic if we need/want a synchrono=
us
>session to sort things out=2E
>
>[*] https://lore=2Ekernel=2Eorg/all/20260812213206=2E1564354-2-seanjc@goo=
gle=2Ecom

I prefer https://lore=2Ekernel=2Eorg/all/69b0cc5aa1032d708700bd2367b43d623=
8fc4079=2Ecamel@infradead=2Eorg/ as the summary over the one you picked, bu=
t happy to reach a solution either way :)

