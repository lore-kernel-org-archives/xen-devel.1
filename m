Return-Path: <SRS0=Z/2m=B3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFDAC433DF
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2020 15:20:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE8EA2065C
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2020 15:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE8EA2065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7gw7-0003Uf-Rp; Mon, 17 Aug 2020 15:20:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k7gw6-0003Ua-Eu
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:20:34 +0000
X-Inumbo-ID: 3c2df3a6-55d9-41b8-a13a-5f3cefb2726d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c2df3a6-55d9-41b8-a13a-5f3cefb2726d;
 Mon, 17 Aug 2020 15:20:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0B6F5ADE0;
 Mon, 17 Aug 2020 15:20:58 +0000 (UTC)
Subject: Re: [PATCH v2 1/7] x86/EFI: sanitize build logic
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <07e622b4-bb61-08e8-d96c-e770ec7abc53@suse.com>
 <0a544a9d-edc8-cb71-05a2-77c860050836@citrix.com>
 <6eab1af6-1845-c4b6-5fbb-76d9974404f1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6e079aab-1722-0aae-b553-6ce4eea18bb9@suse.com>
Date: Mon, 17 Aug 2020 17:20:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <6eab1af6-1845-c4b6-5fbb-76d9974404f1@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 10.08.2020 16:38, Andrew Cooper wrote:
> On 07/08/2020 17:33, Andrew Cooper wrote:
>> On 07/08/2020 12:32, Jan Beulich wrote:
>>> With changes done over time and as far as linking goes, the only special
>>> thing about building with EFI support enabled is the need for the dummy
>>> relocations object for xen.gz uniformly in all build stages. All other
>>> efi/*.o can be consumed from the built_in*.o files.
>>>
>>> In efi/Makefile, besides moving relocs-dummy.o to "extra", also properly
>>> split between obj-y and obj-bin-y.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> I'd prefer to see this all in Kconfig, but this is a clear improvement
>> in its own right.
> 
> Actually, it breaks the build with LIVEPATCH enabled.
> 
> make[2]: *** No rule to make target 'efi/buildid.o', needed by
> '/local/security/xen.git/xen/xen.efi'.  Stop.
> make[2]: *** Waiting for unfinished jobs....
> Makefile:355: recipe for target '/local/security/xen.git/xen/xen' failed

There must be more to it than just "with LIVEPATCH enabled", as I definitely
tested a LIVEPATCH-enabled config. I'll see if I can figure out what's wrong
without further details (after my now prolonged "vacation"), but I may need
to come back asking for further detail.

Jan

