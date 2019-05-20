Return-Path: <SRS0=/voU=TU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5440C04AAC
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 12:29:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3E0D20675
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 12:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3E0D20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hShPJ-00040e-LV; Mon, 20 May 2019 12:28:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hShPJ-00040Z-2A
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 12:28:45 +0000
X-Inumbo-ID: ce253b98-7afa-11e9-b7e6-fb84c945ae29
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ce253b98-7afa-11e9-b7e6-fb84c945ae29;
 Mon, 20 May 2019 12:28:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBD0380D;
 Mon, 20 May 2019 05:28:42 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 204DF3F5AF;
 Mon, 20 May 2019 05:28:40 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <20190516132016.8032-1-viktor.mitin.19@gmail.com>
 <37a3a6c6-7de4-e496-5619-00f31e8e338f@arm.com>
 <20190517064745.GA14853@localhost>
 <9bc2b400-c65d-3761-869d-4cad2d8959c4@arm.com>
 <CAOcoXZbePVees-YE2gnb2ghOzix-qN8uo6F=NRiowguuVb7WQA@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2df548da-e5c2-ad67-3d7d-bdcf4a867e58@arm.com>
Date: Mon, 20 May 2019 13:28:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOcoXZbePVees-YE2gnb2ghOzix-qN8uo6F=NRiowguuVb7WQA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] coverage: filter out libfdt.o and
 libelf.o
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190520122839.fvz5TcB2KoJfeI18LDKOc2thoS7O0WViWjuA3Di3z8M@z>

SGksCgpPbiAyMC8wNS8yMDE5IDEyOjA5LCBWaWt0b3IgTWl0aW4gd3JvdGU6Cj4+PiBUaGFuayB5
b3UgZm9yIGRldGFpbGVkIGRlc2NyaXB0aW9uIHByb3ZpZGVkLgo+Pj4gV2lsbCB0YWtlIGludG8g
Y29uc2lkZXJhdGlvbiBhbGwgdGhlIG5vdGVzLgo+Pgo+PiBEb2VzIGl0IG1lYW4geW91IGFyZSBo
YXBweSB3aXRoIHRoZSBjb21taXQgbWVzc2FnZSBJIHN1Z2dlc3RlZD8KPiAKPiBZZXMsIEknbSBo
YXBweSB3aXRoIHRoZSBjb21taXQgbWVzc2FnZSB5b3Ugc3VnZ2VzdGVkLgo+IFBsZWFzZSBsZXQg
bWUga25vdyBpZiBJIHNob3VsZCByZXNlbmQgdGhlIHVwZGF0ZWQgcGF0Y2guCgpObyBuZWVkIHRv
IHJlc2VuZCBpdC4gSSB3aWxsIGNvbW1pdCBpdCB3aXRoIHRoZSB1cGRhdGVzIEkgbWVudGlvbmVk
IGluIG15IGUtbWFpbC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
