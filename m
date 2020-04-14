Return-Path: <SRS0=0Wix=56=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850D5C2BA19
	for <xen-devel@archiver.kernel.org>; Tue, 14 Apr 2020 13:07:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529EF2087E
	for <xen-devel@archiver.kernel.org>; Tue, 14 Apr 2020 13:07:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="heIfEm/A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529EF2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOLHj-0007Dn-IP; Tue, 14 Apr 2020 13:07:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JNOL=56=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOLHh-0007Di-LN
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 13:07:25 +0000
X-Inumbo-ID: e0c2d7b3-7e50-11ea-892e-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0c2d7b3-7e50-11ea-892e-12813bfff9fa;
 Tue, 14 Apr 2020 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586869645;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hoNkXjS6jleFTB4sL/rGguV5OQjChQ/VkNSP8PJgq/Q=;
 b=heIfEm/AnyI5tPKRsSQ3cbNgXkGYnZ+Ys+vB2ONuB1v1MQj/ttytjHA7
 5bqp1clwZfKUDNN2rjdO3kUD3Uh8mOc6QY5jIFp2KarRtkia+lXi9m1EH
 5ONKE7gQzJb7iDjy6tJznkGnleHBK90YQPIkrH/MM2R3Bl5Nrfugy0yOF s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: b+VXqnigfZ13+AFzOc+xTHiZwBFgqHUYUPgBGQX2nKR9zIKbhG3y2L0ISFxKn30loNcGXs1+7j
 1Nr5e3ZZ2fOk9myNlNK/oPirYBDRT3oU5HH9QNHX/z2GxVzPg0e7eEcIryu3gNEXkCOVWVISO3
 iPVp19bqZipPxYqmhLuDDFVZ9loY4t47EIudqvh3BwRI9UIj2dDh7eKrQm8PMd4NhnlRHrRf+4
 J+Q27y5kOrkeTB8VzImjptWN6m3TwSI7XSOvWVRzJgMBzLNyx0dufjtU3hvLKZsMO9WGvvC3Wj
 qHQ=
X-SBRS: 2.7
X-MesageID: 15656226
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,382,1580792400"; d="scan'208";a="15656226"
Subject: Re: preparations for 4.13.1 and 4.12.3
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <dbce2a2e-4cfd-9838-564d-710e5f10ab53@citrix.com>
Date: Tue, 14 Apr 2020 14:07:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09/04/2020 08:41, Jan Beulich wrote:
> All,
>
> the releases are due in a week or two. Please point out backports
> you find missing from the respective staging branches, but which
> you consider relevant. (Ian, I notice there haven't been any
> tools side backports at all so far. Julien, Stefano - same for
> Arm.)

540d4d60378c "cpu: sync any remaining RCU callbacks before CPU up/down"
which fixes crashes after vcpu hotplug in shim.

It looks to depend on 53ddfc80a84a, a9b6dacf88fe, c301211a5111 and
53594c7bd197 which are other RCU bugfixes.

~Andrew

