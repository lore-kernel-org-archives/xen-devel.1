Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B96606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 16:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=apertussolutions.com header.i=@apertussolutions.com header.a=rsa-sha256 header.s=zoho header.b=eZ13jAgq
Received: from list by lists.xenproject.org with outflank-mailman.1477102.1682859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPMfK-0005LO-0U; Fri, 06 Nov 2026 16:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477102.1682859; Fri, 06 Nov 2026 16:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPMfJ-0005LH-Sr; Fri, 06 Nov 2026 16:19:45 +0000
Received: by outflank-mailman (input) for mailman id 1477102;
 Fri, 06 Nov 2026 16:19:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1xPMfI-0005LA-Qy
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 16:19:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPMfG-002OFU-Jg
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 17:19:42 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6aedfe18-2eae-0a2a0a5409dd-0a2a45079626-16
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 17:19:41 +0100
Received: from [165.173.180.50] (helo=sender6-of-o50.zoho.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6aedfe1b-b4ea-0a2a45070019-a5adb432bfef-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 17:19:41 +0100
Received: by smtp.zohomail.com with SMTPS id 1793981971052886.4401578272528;
 Fri, 6 Nov 2026 08:19:31 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="@apertussolutions.com" header.h="Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To"
ARC-Seal: i=1; a=rsa-sha256; t=1793981974; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mzl7/jp7e9l5MMDmf9jz162/uh8Dthdzg9wZJZKD9VD58ACWZnsfEDBQ6SwuODjonCy5zoUAGy4YJRfwvh764GgqaeLa12JWnHQYjhcVfFKiIZocqMRD37AGtAJ+yM2GO1JPjcYNXa69IMXle8H7eO8Tq7jUd5bqf943h30ZhNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793981974; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Tz+dumTzOkyurKIDuKTXH7Bh5vpMqUu73eS3Xj+UXPk=; 
	b=Z5D3mJk/V36Vzf8oHFZI5Z88X2Ud1pHZfTL2VGUwGSWqYZqgVdDpJyaAfvDvqZxDs0FBpg2jhOrhXulyvPY3duB5QX15nJ+ABgjZBPbSxco/TG3XTdgibecDQKwq7OMhxUJAXbTBZ8uw1yA14CSr//7xbkajS/dngxUhd+KZ/iY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: a=rsa-sha256; b=eZ13jAgqJVf0taaP6LbKoK8AC41rt66n/2wb3/NTRn1FQxVC17p35KW1CyEzOi8t+L6ngEmqSWxJ1RFHo/6T8DE/TjAYI9diXAGHncJ2LKmbvzpCzV/GKwr4q0oTnWKvwihcMSI+nWWD3kRYCdfcOph7e7U9bfbhzhF9BLqCIRk=; c=relaxed/relaxed; s=zoho; d=apertussolutions.com; v=1; bh=Tz+dumTzOkyurKIDuKTXH7Bh5vpMqUu73eS3Xj+UXPk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Message-ID: <51ed28b0-1c41-4e6b-95a9-786e59d4cd9f@apertussolutions.com>
Date: Fri, 6 Nov 2026 11:19:29 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: RFC: Promote FLASK XSM Module to Supported in SUPPORT.md
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-ef75cf/1793981981-A7CD7AE4-C9DB8ECB/0/0
X-purgate-type: clean
X-purgate-size: 4761
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Greetings,

This RFC is intended to start a dialogue following the discussion on the 
November Xen Community Call. It proposes changing the status of the 
FLASK XSM Module (the implementation in `xen/xsm/flask`) from 
Experimental to Supported in SUPPORT.md, while leaving the FLASK default 
policy Experimental.

### Background: XSA-77 and disaggregation guidance

XSA-77 ("Disaggregated domain management security status") documented 
that the majority of management hypercalls (most `XEN_DOMCTL_*` subops, 
all of `__HYPERVISOR_sysctl`, certain memory operations, etc.) were 
originally written only for fully-privileged dom0 and had not been 
reviewed for exposure to semi-privileged, potentially hostile callers.

When XSM/FLASK is used to delegate those interfaces, a compromised 
management domain may be able to cause host-wide denial of service or 
privilege escalation. The security team’s policy (codified in “Security 
Status of dom0 disaggregation” section of `docs/misc/xsm-flask.txt`) is 
that, until the interfaces are reviewed, bugs that merely reduce the 
security of a radically disaggregated system to that of a 
non-disaggregated one will be handled as ordinary public bugs rather 
than under the normal security embargo process. Only a small set of 
subops are treated as safe for disaggregation; the remainder listed in 
that section remain covered by the XSA-77 stance.

SUPPORT.md currently reflects this distinction and the XSA-77 caveat for 
FLASK.

### Current status and the case for change

Today, SUPPORT.md divides XSM support between "XSM Framework", "FLASK 
XSM Module", "FLASK default policy", and "SILO XSM Module", where "XSM 
Framework" and "SILO XSM Module" are marked as Supported, and "FLASK XSM 
Module" and "FLASK default policy" are marked Experimental.

The core concern behind XSA-77 is that it has not been demonstrated 
which fine-grained operation delegations can be done safely. The 
documentation provides guidance on “safe”/covered interfaces precisely 
because of that gap. At its heart, this concern is a policy- and 
configuration-level issue.

Marking the code, "FLASK XSM Module", Experimental primarily because a 
user could write an insecure custom policy feels inconsistent. Many 
other knobs in Xen (and in the Linux kernel) allow an administrator to 
weaken isolation or security guarantees; we do not mark the underlying 
code Experimental solely for that reason. An objection to promoting the 
FLASK module should be rooted in concrete problems with the 
implementation in xen/xsm/flask (in the form of patches or defect 
reports), not in the possibility of misconfiguration or vague aspersions 
about code quality.

Real-world use supports treating the module as mature. OpenXT 
derivatives have deployed FLASK-based configurations on the order of 
multiple hundreds of devices for more than 15 years and have undergone 
multiple private security evaluations. In full disclosure, those 
deployments use variations of the OpenXT FLASK policy, not the upstream 
default.

### Proposed SUPPORT.md text

I would like to propose moving "FLASK XSM Module" to Supported status 
with a clear statement of what is supported, while leaving "FLASK 
default policy" as Experimental with a minor clarification.

```
### FLASK XSM Module

     Status: Supported

Compile time disabled by default.

Using FLASK to delegate various domain control hypercalls
to particular other domains, rather than only permitting use by dom0,
remains specifically excluded from security support for many hypercalls.
Please see XSA-77 and the guidance in docs/misc/xsm-flask.txt
for more details. The Supported status of this module reflects the
maturity of the implementation in xen/xsm/flask; any security guarantees
for a particular policy configuration are the responsibility of the
policy author.

### FLASK default policy

     Status: Experimental

The default policy includes FLASK labels and roles for a "typical" 
Xen-based system
with dom0, driver domains, stub domains, domUs, and so on.
No specific validation claims are made for this policy.
```

### Summary

- Promote the FLASK XSM Module (`xen/xsm/flask`) to Supported.
- Leave the FLASK default policy Experimental, with a minor 
clarification on default policy validation claims.
- Retain the existing note that delegating the XSA-77-covered interfaces 
remains outside security support, consistent with the guidance already 
in `xsm-flask.txt`.

I would value feedback, especially from anyone who has concrete concerns 
about the quality or correctness of the FLASK implementation itself.

-- 
V/r,
Daniel P. Smith
Apertus Solutions, LLC


