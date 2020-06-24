Return-Path: <SRS0=ysB/=AF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA03C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2020 23:10:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E74206F7
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2020 23:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1E74206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joEXE-00046Q-Iu; Wed, 24 Jun 2020 23:10:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F80x=AF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1joEXD-00046L-Ai
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 23:10:27 +0000
X-Inumbo-ID: e34d0fee-b66f-11ea-b7bb-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e34d0fee-b66f-11ea-b7bb-bc764e2007e4;
 Wed, 24 Jun 2020 23:10:26 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /J611AyS5qmt/BkGf4dxIg6ZJ0b8Uc8mBBSzpBv+L/0GdcTlmJbVOqTuYERMweHA3s9HK4IgMf
 6YLUNXtcFW/ijHSSLIvdM7lNtZvrHKd4jzvdfBi93aIWuFCsj+XLzLXi1uvxOynOcJuWNf31GJ
 8hVmxVwSwmXqYvTlY6SitV/NBrp8pa17dHU0rt9vKG6xaYuArp+6513bUisIQKshkjyUe5JVg0
 mC1ICDtMf7p3hbjgecJtBAD7FtO5Ql9KuzzOT/iTmJ8GxrqUqLsOK6/0fS0L0kAVY7uc75YR7q
 gtA=
X-SBRS: 2.7
X-MesageID: 20883596
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,276,1589256000"; d="scan'208";a="20883596"
Subject: Re: Proposal: rename xen.git#master (to #trunk, perhaps)
To: Ian Jackson <ian.jackson@citrix.com>, <xen-devel@lists.xenproject.org>
References: <24307.31637.214096.240023@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fbe42e04-2c3d-5410-b202-eae3c21e9e87@citrix.com>
Date: Thu, 25 Jun 2020 00:10:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <24307.31637.214096.240023@mariner.uk.xensource.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: committers@xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/06/2020 17:13, Ian Jackson wrote:
> I think it would be a good idea to rename this branch name.

The tech industry does use some problematic terms, and I fully agree
with taking steps to reduce their use.  However, I disagree that this is
a problematic context.

In the English language, context is paramount.

Terms such as master/slave have an obvious inequality bias in the
context in which they are used.  There are alternatives to these terms,
probably one of which is more suited to the specific scenario in question.

However, the word master is a very overloaded word in terms of its
different meanings.

Describing someone as a "master of their trade/skill/other", is a
totally different context, and it would be excessive to suggest changing
the language used in this way.  So too, in my opinion, is master as in
"master copy", a different context and connotation to master as in
master/slave.


A much more meaningful use of time would be to address:

xen.git$ git grep -i -e slave -e whitelist -e blacklist | wc -l
194

two thirds of which look fairly easy to address, and one third fairly
complicated due to external dependencies.

~Andrew

