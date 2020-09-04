Return-Path: <SRS0=ERFX=CN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0D3C43461
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2020 09:03:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D9A820748
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2020 09:03:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="UmSLeXVW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D9A820748
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE7cP-0000qk-OG; Fri, 04 Sep 2020 09:02:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtGI=CN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kE7cO-0000qf-BQ
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 09:02:48 +0000
X-Inumbo-ID: 91874ec1-439c-4bc4-8c8c-3d8c6ffaaa43
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91874ec1-439c-4bc4-8c8c-3d8c6ffaaa43;
 Fri, 04 Sep 2020 09:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599210167;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=23sp1yoGKqnP7u8ujIXy77/UO9BlANjiFORrMK4LIXA=;
 b=UmSLeXVWq8S8LQopmkhHsMqd0f4G3AU6UPht5GXqvaRvCo57Hnt9YM1O
 qD3Cwq8W9bmAskBKO39YEqdcq9vtWn4syyzZTnaI6bq33G8vrFVRVwoWs
 QNlnn7buv/trzyygNT47ztL2M0b7PpQ7TmE9AZRyovknTQVGxy398Q0gr 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xIFUAb5ifxSZ/QWfUC7NJ1vaXKok9/ztQdKlB72I0Ea4RjBKEjYj49B4qs55hUGp2nHbdhAwoe
 7F/Mvk+h1OWnUPXJw0G30HmDbt1rjJQlkBwnu60cG5hiY6rRoiv4svWdZ/Kr9Pn350xySyhr0A
 sWxwYlLPNKfTbMxkjxIj/Qa+nRro9YQk+twljd6b+YhtiVQEjkVTCYVdnRNbo6R53I+hcj84VR
 nxvLSZsiH196qtRJ6Zzd0rZtlWsWhqwa5UNBlwRujKW7Gz5DR1VteIEDUJLY0WwTbDiokbLzPA
 K9g=
X-SBRS: 2.7
X-MesageID: 26330398
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26330398"
Subject: Re: [PATCH] x86/pv: Rewrite segment context switching from scratch
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andy Lutomirski <luto@kernel.org>, Sarah Newman <srn@prgmr.com>
References: <20200903213625.5372-1-andrew.cooper3@citrix.com>
 <6217b722-cfae-4b68-51aa-6123527fe714@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5a3f456b-6f17-9ae2-6c5e-fab0ba1359cc@citrix.com>
Date: Fri, 4 Sep 2020 10:02:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6217b722-cfae-4b68-51aa-6123527fe714@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/09/2020 07:55, Jan Beulich wrote:
> On 03.09.2020 23:36, Andrew Cooper wrote:
>> There are multiple bugs with the existing implementation, including incorrect
>> comments.
>>
>> On AMD CPUs prior to Zen2, loading a NUL segment selector doesn't clear the
>> segment base, which is a problem for 64bit code which typically expects to use
>> a NUL %fs/%gs selector.
>>
>> On a context switch from any PV vcpu, to a 64bit PV vcpu with an %fs/%gs
>> selector which faults, the fixup logic loads NUL, and the guest is entered at
>> the failsafe callback with the stale base.
>>
>> Alternatively, a PV context switch sequence of 64 (NUL, non-zero base) =>
>> 32 (NUL) => 64 (NUL, zero base) will similarly cause Xen to enter the guest
>> with a stale base.
>>
>> Both of these corner cases manifest as state corruption in the final vcpu.
>> However, damage is limited to to 64bit code expecting to use Thread Local
>> Storage with a base pointer of 0, which doesn't occur by default.
>>
>> The context switch logic is extremely complicated, and is attempting to
>> optimise away loading a NUL selector (which is fast), or writing a 64bit base
>> of 0 (which is rare).  Furthermore, it fails to respect Linux's ABI with
>> userspace, which manifests as userspace state corruption as far as Linux is
>> concerned.
>>
>> Always save and restore all selector and base state, in all cases.
>>
>> Leave a large comment explaining hardware behaviour, and the new ABI
>> expectations.  Update the comments in the public headers.
>>
>> Drop all "segment preloading" to handle the AMD corner case.  It was never
>> anything but a waste of time for %ds/%es, and isn't needed now that %fs/%gs
>> bases are unconditionally written for 64bit PV guests.  In load_segments(),
>> store the result of is_pv_32bit_vcpu() as it is an expensive predicate now,
>> and not used in a way which impacts speculative safety.
>>
>> Reported-by: Andy Lutomirski <luto@kernel.org>
>> Reported-by: Sarah Newman <srn@prgmr.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm afraid I've found further bugs an ABI work to do.  v2 coming shortly.

~Andrew

