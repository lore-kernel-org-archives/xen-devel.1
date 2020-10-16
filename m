Return-Path: <SRS0=yWKO=DX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367D1C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 13:34:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DEC320848
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 13:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eikelenboom.it header.i=@eikelenboom.it header.b="JaqXdZKV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DEC320848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eikelenboom.it
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.8091.21550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTPs8-0007jb-Vx; Fri, 16 Oct 2020 13:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8091.21550; Fri, 16 Oct 2020 13:34:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTPs8-0007jU-RR; Fri, 16 Oct 2020 13:34:16 +0000
Received: by outflank-mailman (input) for mailman id 8091;
 Fri, 16 Oct 2020 13:34:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sGIs=DX=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1kTPs7-0007jP-Ff
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:34:15 +0000
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2247163-459f-4183-ba54-81c5bd170925;
 Fri, 16 Oct 2020 13:34:13 +0000 (UTC)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:54194
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1kTPuo-0007a8-4Z; Fri, 16 Oct 2020 15:37:02 +0200
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sGIs=DX=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
	id 1kTPs7-0007jP-Ff
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:34:15 +0000
X-Inumbo-ID: b2247163-459f-4183-ba54-81c5bd170925
Received: from server.eikelenboom.it (unknown [91.121.65.215])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b2247163-459f-4183-ba54-81c5bd170925;
	Fri, 16 Oct 2020 13:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+eMXYOxq7wI5J0zUG4bv1bl3oUtIHN3tWi0zuQGQfQE=; b=JaqXdZKVlr8YtMsZjx9HgS3mnT
	yPkYlNhlpIPmWJCKW1fr/LpugwspILSInjs7yerYKMzMsQoeKXIm7hp/pIT3n+DVdaKJu4dnuXcNo
	biQcuhqLdPTcwSDobJeptL9trHYMXqj6Rnh7V4ctJIqtm1XVqeorGSbwSQPNE1RAEKBk=;
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:54194 helo=[172.16.1.50])
	by server.eikelenboom.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <linux@eikelenboom.it>)
	id 1kTPuo-0007a8-4Z; Fri, 16 Oct 2020 15:37:02 +0200
Subject: Re: [PATCH v2] hvmloader: flip "ACPI data" to "ACPI NVS" type for
 ACPI table region
To: Jan Beulich <jbeulich@suse.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, iwj@xenproject.org
References: <1602808763-22396-1-git-send-email-igor.druzhinin@citrix.com>
 <ca9ba430-f5d8-f520-e7db-3e8d41cd7d9b@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <53939fbe-6370-fdf7-9727-398a474b219e@eikelenboom.it>
Date: Fri, 16 Oct 2020 15:34:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ca9ba430-f5d8-f520-e7db-3e8d41cd7d9b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16/10/2020 08:34, Jan Beulich wrote:
> On 16.10.2020 02:39, Igor Druzhinin wrote:
>> ACPI specification contains statements describing memory marked with regular
>> "ACPI data" type as reclaimable by the guest. Although the guest shouldn't
>> really do it if it wants kexec or similar functionality to work, there
>> could still be ambiguities in treating these regions as potentially regular
>> RAM.
>>
>> One such example is SeaBIOS which currently reports "ACPI data" regions as
>> RAM to the guest in its e801 call. Which it might have the right to do as any
>> user of this is expected to be ACPI unaware. But a QEMU bootloader later seems
>> to ignore that fact and is instead using e801 to find a place for initrd which
>> causes the tables to be erased. While arguably QEMU bootloader or SeaBIOS need
>> to be fixed / improved here, that is just one example of the potential problems
>> from using a reclaimable memory type.
>>
>> Flip the type to "ACPI NVS" which doesn't have this ambiguity in it and is
>> described by the spec as non-reclaimable (so cannot ever be treated like RAM).
>>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> 

I don't see any stable and or fixes tags, but I assume this will go to
the stable trees (which have (a backport of)
8efa46516c5f4cf185c8df179812c185d3c27eb6 in their staging branches) ?

(and as reporter it would have been nice to have been CC'ed on the patch)

--
Sander

