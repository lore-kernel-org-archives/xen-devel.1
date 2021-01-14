Return-Path: <SRS0=mH2p=GR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0BFC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 15:01:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F164423A5E
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 15:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F164423A5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67061.119384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l047x-0004pm-5a; Thu, 14 Jan 2021 15:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67061.119384; Thu, 14 Jan 2021 15:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l047x-0004pe-1e; Thu, 14 Jan 2021 15:01:33 +0000
Received: by outflank-mailman (input) for mailman id 67061;
 Thu, 14 Jan 2021 15:01:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l047w-0004pX-7t
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:01:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a45a211-0265-4956-a453-9974a46b59d3;
 Thu, 14 Jan 2021 15:01:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE6C5AE40;
 Thu, 14 Jan 2021 15:01:30 +0000 (UTC)
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
X-Inumbo-ID: 9a45a211-0265-4956-a453-9974a46b59d3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610636490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2n+wZMkUwcNjFgqbi/OhKsEAaatOFAIAhGZgZxVFlLM=;
	b=UbcyoI6Dn1cvZztfnFqst4aTUtU+mHK8O5c6C6dyITVdQs4r06W7fBTtbWc5GJ+f4WfDHO
	E0cbaxesM4Gp67TOY8hJnEcuv2oRrGmklkoVEwBtibx9XBl60NvqXhVfZ4ikfH2Q9jL3Yd
	zIdSH+KeU7qr1l3Z28T+RWQ2CqYzguU=
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/17] x86/PV: avoid speculation abuse through guest accessors
 plus ...
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Date: Thu, 14 Jan 2021 16:01:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

... shadow adjustments towards not building 2- and 3-level code
when !HVM. While the latter isn't functionally related to the
former, it depends on some of the rearrangements done there.

01: shadow: use __put_user() instead of __copy_to_user()
02: split __{get,put}_user() into "guest" and "unsafe" variants
03: split __copy_{from,to}_user() into "guest" and "unsafe" variants
04: PV: harden guest memory accesses against speculative abuse
05: rename {get,put}_user() to {get,put}_guest()
06: gdbsx: convert "user" to "guest" accesses
07: rename copy_{from,to}_user() to copy_{from,to}_guest_pv()
08: move stac()/clac() from {get,put}_unsafe_asm() ...
09: PV: use get_unsafe() instead of copy_from_unsafe()
10: shadow: use get_unsafe() instead of copy_from_unsafe()
11: shadow: polish shadow_write_entries()
12: shadow: move shadow_set_l<N>e() to their own source file
13: shadow: don't open-code SHF_* shorthands
14: shadow: SH_type_l2h_shadow is PV-only
15: shadow: drop SH_type_l2h_pae_shadow
16: shadow: only 4-level guest code needs building when !HVM
17: shadow: adjust is_pv_*() checks

Jan

