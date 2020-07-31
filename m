Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24574C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 14:54:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAEED206DA
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 14:54:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="brbW3z3P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAEED206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1WPu-0007Zs-Qx; Fri, 31 Jul 2020 14:53:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG5j=BK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1WPt-0007Zn-8h
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:53:49 +0000
X-Inumbo-ID: a380f05c-d33d-11ea-8e51-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a380f05c-d33d-11ea-8e51-bc764e2007e4;
 Fri, 31 Jul 2020 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596207228;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=mAMItb8aga74v8Fv2WlGk8PQj935jkqVfiNNiANhB4k=;
 b=brbW3z3PLqdE5U6DM7Th5COw1HHWftFm4nMHPBU/nAPAfezvrBlEauRJ
 5JkxBtB3STesZqO5d6/V4YxtuuZt4o+TZnKGEMP70KHP9x3So/41Mc5eT
 1Tzl0mEPpusk+rSPZmg6fnkSGvZJDeep+3bAvsCSiQ8vBC0Sj853vWZ6U A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6uSnCPgpnA/PDsCuMV8EmK9MVc+NGDfnY8CUcSl1E59f0Llt10PDCUFSqBClS+slO59mmUamwg
 XWKPFR1wtLXBrHwYkBTRmd/qkeIz/2zrRb1IyVm6JAES/xeJTOt6NSP4k9kID5D+o0hkXVItPc
 1Z7U5Rlt/WwPkHpDdb8W3hDUCWfbZYOIXRgIc4+M77ZlxEKWULjNqncTdZqUfZYdVgBBDH0Fbj
 y3GXQWNgw1ncw9AvQhH5j34mDMsoEJBP4gYwPyur7sCSIPk07EFmVnU8dsBa5cLzr7k84Jz4VN
 ptI=
X-SBRS: 3.7
X-MesageID: 24511857
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="24511857"
Subject: Re: [PATCH 4/5] xen/memory: Fix acquire_resource size semantics
To: Jan Beulich <jbeulich@suse.com>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-5-andrew.cooper3@citrix.com>
 <75a7761f-45c6-5642-ea46-1b92072914b1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bbe456ce-9fcb-9934-6526-9e968c2ea24e@citrix.com>
Date: Fri, 31 Jul 2020 15:53:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <75a7761f-45c6-5642-ea46-1b92072914b1@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31/07/2020 15:44, Jan Beulich wrote:
> On 28.07.2020 13:37, Andrew Cooper wrote:
>> @@ -1026,19 +1047,6 @@ static int acquire_resource(
>>      if ( xmar.pad != 0 )
>>          return -EINVAL;
>>  
>> -    if ( guest_handle_is_null(xmar.frame_list) )
>> -    {
>> -        if ( xmar.nr_frames )
>> -            return -EINVAL;
>> -
>> -        xmar.nr_frames = ARRAY_SIZE(mfn_list);
>> -
>> -        if ( __copy_field_to_guest(arg, &xmar, nr_frames) )
>> -            return -EFAULT;
>> -
>> -        return 0;
>> -    }
>> -
>>      if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
>>          return -E2BIG;
> While arguably minor, the error code in the null-handle case
> would imo better be the same, no matter how big xmar.nr_frames
> is.

This clause doesn't survive the fixes to batching.

Given how broken this infrastructure is, I'm not concerned with
transient differences in error codes for users which will ultimately
fail anyway.

~Andrew

