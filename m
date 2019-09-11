Return-Path: <SRS0=cv0X=XG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBA1ECDE20
	for <xen-devel@archiver.kernel.org>; Wed, 11 Sep 2019 09:13:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35E4D206A1
	for <xen-devel@archiver.kernel.org>; Wed, 11 Sep 2019 09:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35E4D206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7yh7-0000o4-PG; Wed, 11 Sep 2019 09:13:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7yh6-0000nz-I0
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 09:13:44 +0000
X-Inumbo-ID: 72a2ef6c-d474-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72a2ef6c-d474-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 09:13:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1FCDFB033;
 Wed, 11 Sep 2019 09:13:41 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
 <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
 <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
 <1695c88d-e5ad-1854-cdef-3cd95c812574@oracle.com>
 <4d3bf854-51de-99e4-9a40-a64c581bdd10@citrix.com>
 <bc3da154-d451-02cf-6154-5e0dc721a6e6@oracle.com>
 <c45b8786-5735-a95d-bc40-61372c326037@citrix.com>
 <43e492ff-f967-7218-65c4-d16581fabea3@oracle.com>
 <416ff4b7-3186-f61a-75fa-bcfc968f8117@citrix.com>
 <df64cd80-d92e-27ad-b1bc-e58184379e50@oracle.com>
 <d281baaf-a6d7-306e-63aa-b84552ac3ea5@citrix.com>
 <9ac1f34b-ea2a-3818-4cbd-a22a9a475dd4@oracle.com>
 <74c9d2cc-a528-2cec-099e-0d803aeace6f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <65b8d74a-2f7b-a257-a750-9dada5206f01@suse.com>
Date: Wed, 11 Sep 2019 11:13:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <74c9d2cc-a528-2cec-099e-0d803aeace6f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAwMzoxNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gQW5vdGhlciB0aGlu
ZyB0aGF0IEkgaW1wbGllZCBieSAibm90IHN1cHBvcnRpbmciIGJ1dCB3YW50IHRvIGV4cGxpY2l0
bHkKPiBjYWxsIG91dCBpcyB0aGF0IGN1cnJlbnRseSBYZW4gd2lsbCByZWZ1c2UgcmVzZXJ2aW5n
IGFueSBNQ0ZHIGFyZWEKPiB1bmxlc3MgaXQgYWN0dWFsbHkgZXhpc3RlZCBpbiBNQ0ZHIHRhYmxl
IGF0IGJvb3QuIEkgZG9uJ3QgY2xlYXJseQo+IHVuZGVyc3RhbmQgcmVhc29uaW5nIGJlaGluZCBp
dCBidXQgaXQgbWlnaHQgYmUgd29ydGggcmVsYXhpbmcgYXQgbGVhc3QKPiBzaXplIG1hdGNoaW5n
IHJlc3RyaWN0aW9uIG9uIFhlbiBzaWRlIG5vdyB3aXRoIHRoaXMgY2hhbmdlLgoKSSBndWVzcyBp
dCdzIGJlY2F1c2Ugbm8tb25lIGhhZCBhIHN5c3RlbSB3ZXJlIGl0IHdvdWxkIGJlIG5lZWRlZCwK
YW5kIGhlbmNlIGNvdWxkIGJlIHRlc3RlZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
