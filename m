Return-Path: <SRS0=JUJE=CT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21BFC433E2
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2020 20:30:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56481206E9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2020 20:30:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="GmLbKGpI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56481206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGTD8-0006dm-28; Thu, 10 Sep 2020 20:30:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP7I=CT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kGTD6-0006dh-03
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:30:24 +0000
X-Inumbo-ID: 4d636d77-c1bb-47ba-aacf-57402b3783bb
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d636d77-c1bb-47ba-aacf-57402b3783bb;
 Thu, 10 Sep 2020 20:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599769816;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EgWKmF+f7/oSCKYBxzbptZye/FDkEN9bK/pMPEjNcWo=;
 b=GmLbKGpIlydSsJFwM5/O0Ad2KE0wmBLqw3lFnrSry5+A+RLzXo6rmXAu
 iooO4lN/UNGZmVA30gQ/qXuwc57EQvp9oVWOfWNfZ2key6sSsYyNgEIfq
 Ev1/9/KJlyp8t8BoPJZMNbxREoR+Kc/Efg3v6FAJmY7DCZhqV3TNWWvcW 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6Csud8we96+LZIYvIWoetNeiQJHtcWgfbJliSY/vYVDzegMWk6rDHYKNo+RCMNYOvPc8KnPMfn
 bDhTt75WyeSU43JZOiJJnRQseRZcbVXj5DyvA9bqoexWEzHyxtVg59V1DQVL0H6Pvf4ECKlsaC
 uVi4W5Ox9Sf/yYNW3/r3V2+cL9IX2oQJ/3xaNoPAwDxqjFr64dbI8uiBDO3zqZ8K3gTFYrtOMe
 6hNCniagnUIbWapBQGjVBzboImXceGfTobtVk0DZ0//fY3SX5cGWXjWcBHt/lsDkcAk0W5nBXO
 LYU=
X-SBRS: 2.7
X-MesageID: 26741685
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,413,1592884800"; d="scan'208";a="26741685"
Subject: Re: [PATCH 3/5] x86/pv: Optimise prefetching in svm_load_segs()
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
 <20200909095920.25495-4-andrew.cooper3@citrix.com>
 <b014b917-f6ca-bbc0-22f6-14993aa84c8d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d1a9c80a-df6e-ebe4-1720-3f6f2eeffee0@citrix.com>
Date: Thu, 10 Sep 2020 21:30:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b014b917-f6ca-bbc0-22f6-14993aa84c8d@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On 10/09/2020 15:57, Jan Beulich wrote:
> On 09.09.2020 11:59, Andrew Cooper wrote:
>> Split into two functions.  Passing a load of zeros in results in somewhat poor
>> register scheduling in __context_switch().
> I'm afraid I don't understand why this would be, no matter that
> I trust you having observed this being the case: The registers
> used for passing parameters are all call-clobbered anyway, so
> the compiler can't use them for anything across the call. And
> it would look pretty poor code generation wise if the XORs to
> clear them (which effectively have no latency at all) would be
> scheduled far ahead of the call, especially when there's better
> use for the registers. The observation wasn't possibly from
> before your recent dropping of two of the parameters, when they
> couldn't all be passed in registers (albeit even then it would
> be odd, as the change then should merely have lead to a slightly
> smaller stack frame of the function)?

Hmm yes.  I wrote this patch before I did the assertion fix, and it the
comment didn't rebase very well.

Back then, one of the zeros was on the stack, which was definitely an
unwanted property.  Even though the XORs are mostly free, they're not
totally free, as they cost decode bandwidth and instruction cache space
(Trivial amounts, but still...).

In general, LTO's inter-procedural-analysis can figure out that
svm_load_segs_prefetch() doesn't use many registers, and the caller can
be optimised based on the fact that some registers aren't actually
clobbered.  (Then again, in this case with a sole caller, LTO really
ought to be able to inline and delete the function.)

How about "results in unnecessary caller setup code" ?

~Andrew

