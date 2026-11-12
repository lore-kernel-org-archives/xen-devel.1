Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA71606A32A
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 15:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=apertussolutions.com header.i=@apertussolutions.com header.a=rsa-sha256 header.s=x header.b=LrxG+MAd
Received: from list by lists.xenproject.org with outflank-mailman.1486080.1689007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRWrh-0004q2-IL; Thu, 12 Nov 2026 15:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486080.1689007; Thu, 12 Nov 2026 15:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRWrh-0004pv-Fn; Thu, 12 Nov 2026 15:37:29 +0000
Received: by outflank-mailman (input) for mailman id 1486080;
 Thu, 12 Nov 2026 15:37:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1xRWrg-0004pn-H1
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 15:37:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRWrf-00DL0O-Gf
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 16:37:27 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6af5dd27-2eae-0a2a0a5409dd-0a2a4504edd8-42
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 16:37:26 +0100
Received: from [136.175.108.158] (helo=mail-108-mta158.mxroute.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6af5dd34-b57f-0a2a45040019-88af6c9e9ec3-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 16:37:25 +0100
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta158.mxroute.com (ZoneMTA) with ESMTPSA id
 1a1d06811ec00031be.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 12 Nov 2026 15:37:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=x header.d=apertussolutions.com header.i="@apertussolutions.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date"
X-Zone-Loop: 80a9a3072fa8cf04b3b644436493f1a20f2057da01ed
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=apertussolutions.com; s=x; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=wKc22FF3phP9Ov06nLoCeufPqCd8h07AtRpDEK98MV0=; b=LrxG+MAdHs0Pe9OwB7AiVUdOGi
	ocWF2y1DHXKVlYZnDPOmTGIf/sLy4jFyz47Ii0JZZQrTOhPqSMQvOnKI0y25vCyyrM6MryUht4rwm
	DVlsZCVah9BGEQLqwRr9qcpJb6AkFs+KSXdgbJePL8Ys5SGI4lcbJyMoqh5z9NJYBjDouO4idbRL/
	3EMuy7wi664SXrxafk/TZvaMbvr3cf+9VNhDrEOZ1sONGoQE6Tm6JFKwuaEwK2xeRl934bSmNobDZ
	4jM62C2b9XxzCGTnack+br+xGnPwDyJsQW3lJKxjkkS5EguSPgpc2QHHzf6k1y/kwSIRG4xPV0y83
	dRRzPAaw==;
Message-ID: <13cd6f79-8831-48c4-9096-82ab105b3adf@apertussolutions.com>
Date: Thu, 12 Nov 2026 10:37:10 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: Promote FLASK XSM Module to Supported in SUPPORT.md
To: Jan Beulich <jbeulich@suse.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <51ed28b0-1c41-4e6b-95a9-786e59d4cd9f@apertussolutions.com>
 <cf3e44aa-f48a-443b-991d-665caded21da@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <cf3e44aa-f48a-443b-991d-665caded21da@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: dpsmith@apertussolutions.com
X-purgate-ID: tlsNG-ebf023/1794497846-C06DAB50-114C24CD/0/0
X-purgate-type: clean
X-purgate-size: 6247
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/9/26 4:32 AM, Jan Beulich wrote:
> On 06.11.2026 17:19, Daniel P. Smith wrote:
>> Greetings,
>>
>> This RFC is intended to start a dialogue following the discussion on the
>> November Xen Community Call. It proposes changing the status of the
>> FLASK XSM Module (the implementation in `xen/xsm/flask`) from
>> Experimental to Supported in SUPPORT.md, while leaving the FLASK default
>> policy Experimental.
>>
>> ### Background: XSA-77 and disaggregation guidance
>>
>> XSA-77 ("Disaggregated domain management security status") documented
>> that the majority of management hypercalls (most `XEN_DOMCTL_*` subops,
>> all of `__HYPERVISOR_sysctl`, certain memory operations, etc.) were
>> originally written only for fully-privileged dom0 and had not been
>> reviewed for exposure to semi-privileged, potentially hostile callers.
>>
>> When XSM/FLASK is used to delegate those interfaces, a compromised
>> management domain may be able to cause host-wide denial of service or
>> privilege escalation. The security team’s policy (codified in “Security
>> Status of dom0 disaggregation” section of `docs/misc/xsm-flask.txt`) is
>> that, until the interfaces are reviewed, bugs that merely reduce the
>> security of a radically disaggregated system to that of a
>> non-disaggregated one will be handled as ordinary public bugs rather
>> than under the normal security embargo process. Only a small set of
>> subops are treated as safe for disaggregation; the remainder listed in
>> that section remain covered by the XSA-77 stance.
>>
>> SUPPORT.md currently reflects this distinction and the XSA-77 caveat for
>> FLASK.
>>
>> ### Current status and the case for change
>>
>> Today, SUPPORT.md divides XSM support between "XSM Framework", "FLASK
>> XSM Module", "FLASK default policy", and "SILO XSM Module", where "XSM
>> Framework" and "SILO XSM Module" are marked as Supported, and "FLASK XSM
>> Module" and "FLASK default policy" are marked Experimental.
>>
>> The core concern behind XSA-77 is that it has not been demonstrated
>> which fine-grained operation delegations can be done safely. The
>> documentation provides guidance on “safe”/covered interfaces precisely
>> because of that gap. At its heart, this concern is a policy- and
>> configuration-level issue.
>>
>> Marking the code, "FLASK XSM Module", Experimental primarily because a
>> user could write an insecure custom policy feels inconsistent.
> 
> My recollection is a different one: There were concerns over code quality.
> For example I seem to recall concerns over there being memory leaks. As a
> result I further recall that the security team said that a full code audit
> may be necessary to actually address those concerns. To possibly soften
> this some, that concern may, to a degree, have been driven by the large
> number of style violations in that part of the code base.
> 
> At the same time, yes, code and what can be done with it by careless
> writing of policies want separating. This looks to be suitably reflected
> in your proposed wording change ...
>

Hi Jan,

Thank you for the reply, and for confirming that the proposed wording
does a reasonable job of separating the maturity of the implementation
from the guarantees (or lack thereof) that any particular policy provides.

I’d like to share a few thoughts on the code-quality and audit points
you raised.

On the idea of a full code audit: I’m not aware of other in-tree
subsystems that have been held at Experimental status pending a complete
audit after bugs were found and fixed in part of the code. Normally
those issues are either fixed or, when appropriate, handled via the
security process. Style differences themselves don’t create functional
defects; they mainly affect readability and review consistency. If the
historical concern was driven largely by style, that feels like a
relatively weak reason to keep the module Experimental.

On the specific issues from that earlier period: the memory-leak fixes
that went in around XSA-84 (and the related work for XSA-85) were
public. If there had been additional material problems at the time that
the security team felt required a broader audit, I would have expected
them to be mentioned alongside those advisories. In the absence of that,
it is hard for me to treat the need for an audit as still open.

 From a practical standpoint, I am not claiming the code is bug-free. I
can say that we have run FLASK in production at scale, on devices that
stay up continuously for long periods, without seeing the kind of
stability or resource issues that significant leaks or similar defects
would typically produce. That experience makes me question whether a
full audit is still a necessary gate for moving the module to Supported,
especially given that the proposed text keeps the XSA-77 limitations
explicit.

On style more generally: my recollection was that code brought in from
Linux (as the FLASK security server largely was) would not be required
to match the Xen coding style, so that later updates from Linux would
remain easier to integrate. MISRA compliance is an understandable
exception; pure stylistic divergence is less so. There is still a fair
amount of code elsewhere in the hypervisor that does not fully follow
the current style guidelines and is nonetheless Supported. I would
prefer we not treat style as a blocking issue for an already-in-tree
component.

That said, I saw your recent patch that removes some of the remaining
Linux-origin style artifacts. If the changes look reasonable and do not
make a future import of newer Linux FLASK code more difficult, I am
happy to provide an Ack on it.

Overall, I still think the proposed wording—Supported for the
implementation in xen/xsm/flask, Experimental for the default policy,
and the existing XSA-77 caveats left in place—is a fair reflection of
the current state. If there are concrete, currently open issues that you
believe should be addressed first, I would be glad to look at them.
Otherwise, I would prefer we not let the older style and audit concerns
stand in the way of the status change.

V/r,
Daniel P. Smith



