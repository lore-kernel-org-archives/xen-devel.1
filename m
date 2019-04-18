Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE714C10F14
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 11:13:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A71C1214DA
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 11:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A71C1214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH4yp-0007zI-IZ; Thu, 18 Apr 2019 11:13:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z9nG=SU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hH4yo-0007z7-LD
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 11:13:22 +0000
X-Inumbo-ID: f9bf63bc-61ca-11e9-a1e1-276023b270d6
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f9bf63bc-61ca-11e9-a1e1-276023b270d6;
 Thu, 18 Apr 2019 11:13:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D928080D;
 Thu, 18 Apr 2019 04:13:20 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 941253F59C;
 Thu, 18 Apr 2019 04:13:18 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190327184531.30986-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cd881f82-2e30-8517-0c58-395af8c1ec0c@arm.com>
Date: Thu, 18 Apr 2019 12:13:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190327184531.30986-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 00/12] xen/arm: Add support to build with
 clang
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
Cc: Artem_Mygaiev@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr_Tyshchenko@epam.com, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418111317.9tp8d_LCLDAb9Wo2KgnkqhrkjFWyFwL_ke0aEbljOSM@z>

SGksCgpPbiAyNy8wMy8yMDE5IDE4OjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6CgpIaSwKCkkgaGF2
ZSBhcHBsaWVkIHRoZSBmb2xsb3cgcGF0Y2hlcyB0byBteSBicmFuY2ggbmV4dC00LjEzLiBJIHdp
bGwgbWVyZ2UgaXQgdG8gCnVuc3RhYmxlIG9uIHRoZSBjb21taXQgbW9yYXRvcml1bSBpcyBsaWZ0
ZWQuCgo+ICAgIHhlbi9hcm06IHp5bnFtcDogRml4IGhlYWRlciBndWFyZCBmb3IgeGlsaW54LXp5
bnFtcC1lZW1pLmgKPiAgICB4ZW4vYXJtNjQ6IHN5c3JlZzogSW1wbGVtZW50IHRoZSAzMi1iaXQg
aGVscGVycyB1c2luZyB0aGUgNjQtYml0Cj4gICAgICBoZWxwZXJzCj4gICAgeGVuL2FybTogZ3Vl
c3Rfd2FsazogQXZvaWQgdGhlb3JpdGljYWwgdW5pdGlhbGl6ZWQgdmFsdWUgaW4KPiAgICAgIGdl
dF90b3BfYml0Cj4gICAgeGVuL2FybTY0OiBfX2NtcHhjaGcgYW5kIF9fY21weGNoZ19tYiBzaG91
bGQgYWx3YXlzIGJlIGlubGluZQoKSSB3aWxsIHJlc3BpbiB0aGUgcmVzdC4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
