Return-Path: <SRS0=iXbS=7Q=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C65C433DF
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2020 11:45:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5727B20674
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2020 11:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5727B20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgRpt-0002JV-Um; Wed, 03 Jun 2020 11:45:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zj/c=7Q=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jgRpt-0002Ij-Ek
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 11:45:33 +0000
X-Inumbo-ID: bace524e-a58f-11ea-acf0-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bace524e-a58f-11ea-acf0-12813bfff9fa;
 Wed, 03 Jun 2020 11:45:32 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: T1wGLoubHyylm5a0q8mo2I0DXdp536zzAPMoUI0aj5YpdoDYFwW9wj0bNoNs8AEUhx/NCYXZRG
 /Fb6K2MgoYL0h375Nq7pPur5+Mv/Vdsm97NkA8FocLPIQh9K9f2ebDwZrdWC8ub9W8Yb168Pqo
 Edjz24ghYqyrjZQWUeFEX+Rvmb8EAr7Z690+O9nLWFqV8HLFQhxvOagwsAq0yfGlW8l4gSN2wQ
 migTWuQY5UwNR6f1D2em7rh7b6/GGzqKkYdlvM9KrRZ2PGk/yp7wRGr0kXh0mR2Ngeu5YK5ovD
 JA8=
X-SBRS: 2.7
X-MesageID: 19106376
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,467,1583211600"; d="scan'208";a="19106376"
Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT faults
 immediately
To: <paul@xen.org>, 'Jan Beulich' <jbeulich@suse.com>
References: <1591116981-30162-1-git-send-email-igor.druzhinin@citrix.com>
 <37e6e543-564d-2625-b8d9-ccca6106efd2@suse.com>
 <000f01d63991$717b5e80$54721b80$@xen.org>
 <f1157af8-dd61-d9c2-a405-1e7d13615980@suse.com>
 <001e01d6399a$1ac56820$50503860$@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <ee50db9a-3d73-2ed4-579d-983882d13ef3@citrix.com>
Date: Wed, 3 Jun 2020 12:45:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <001e01d6399a$1ac56820$50503860$@xen.org>
Content-Type: text/plain; charset="utf-8"
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 george.dunlap@citrix.com, wl@xen.org, andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/06/2020 12:28, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 03 June 2020 12:22
>> To: paul@xen.org
>> Cc: 'Igor Druzhinin' <igor.druzhinin@citrix.com>; xen-devel@lists.xenproject.org;
>> andrew.cooper3@citrix.com; wl@xen.org; roger.pau@citrix.com; george.dunlap@citrix.com
>> Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT faults immediately
>>
>> On 03.06.2020 12:26, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 03 June 2020 11:03
>>>> To: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>> Cc: xen-devel@lists.xenproject.org; andrew.cooper3@citrix.com; wl@xen.org; roger.pau@citrix.com;
>>>> george.dunlap@citrix.com; Paul Durrant <paul@xen.org>
>>>> Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT faults immediately
>>>>
>>>> On 02.06.2020 18:56, Igor Druzhinin wrote:
>>>>> A recalculation NPT fault doesn't always require additional handling
>>>>> in hvm_hap_nested_page_fault(), moreover in general case if there is no
>>>>> explicit handling done there - the fault is wrongly considered fatal.
>>>>>
>>>>> This covers a specific case of migration with vGPU assigned on AMD:
>>>>> at a moment log-dirty is enabled globally, recalculation is requested
>>>>> for the whole guest memory including directly mapped MMIO regions of vGPU
>>>>> which causes a page fault being raised at the first access to those;
>>>>> but due to MMIO P2M type not having any explicit handling in
>>>>> hvm_hap_nested_page_fault() a domain is erroneously crashed with unhandled
>>>>> SVM violation.
>>>>>
>>>>> Instead of trying to be opportunistic - use safer approach and handle
>>>>> P2M recalculation in a separate NPT fault by attempting to retry after
>>>>> making the necessary adjustments. This is aligned with Intel behavior
>>>>> where there are separate VMEXITs for recalculation and EPT violations
>>>>> (faults) and only faults are handled in hvm_hap_nested_page_fault().
>>>>> Do it by also unifying do_recalc return code with Intel implementation
>>>>> where returning 1 means P2M was actually changed.
>>>>>
>>>>> Since there was no case previously where p2m_pt_handle_deferred_changes()
>>>>> could return a positive value - it's safe to replace ">= 0" with just "== 0"
>>>>> in VMEXIT_NPF handler. finish_type_change() is also not affected by the
>>>>> change as being able to deal with >0 return value of p2m->recalc from
>>>>> EPT implementation.
>>>>>
>>>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>> albeit preferably with ...
>>>>
>>>>> @@ -448,12 +451,14 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
>>>>>              clear_recalc(l1, e);
>>>>>          err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
>>>>>          ASSERT(!err);
>>>>> +
>>>>> +        recalc_done = true;
>>>>>      }
>>>>>
>>>>>   out:
>>>>>      unmap_domain_page(table);
>>>>>
>>>>> -    return err;
>>>>> +    return err ?: (recalc_done ? 1 : 0);
>>>>
>>>> ... this shrunk to
>>>>
>>>>     return err ?: recalc_done;
>>>>
>>>> (easily doable while committing).
>>>>
>>>> Also Cc Paul.
>>>>
>>>
>>> paging_log_dirty_enable() still fails global enable if has_arch_pdevs()
>>> is true, so presumably there's no desperate need for this to go in 4.14?
>>
>> The MMIO case is just the particular situation here. Aiui the same issue
>> could potentially surface with other p2m types. Also given I'd consider
>> this a backporting candidate, while it may not be desperately needed for
>> the release, I think it deserves considering beyond the specific aspect
>> you mention.
>>
> 
> In which case I think the commit message probably ought to be rephrased, since it appears to focus on a case that cannot currently happen.

This can happen without has_arch_pdevs() being true. It's enough to just
directly map some physical memory into a guest to get p2m_direct_mmio
type present in the page tables.

Igor

