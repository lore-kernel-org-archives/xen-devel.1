Return-Path: <SRS0=vmDZ=5I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07012C10F26
	for <xen-devel@archiver.kernel.org>; Mon, 23 Mar 2020 07:50:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C5C20409
	for <xen-devel@archiver.kernel.org>; Mon, 23 Mar 2020 07:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2C5C20409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGHqI-0001jt-0E; Mon, 23 Mar 2020 07:49:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGHqG-0001jo-ET
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 07:49:48 +0000
X-Inumbo-ID: dda5ff12-6cda-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dda5ff12-6cda-11ea-b34e-bc764e2007e4;
 Mon, 23 Mar 2020 07:49:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB401AC11;
 Mon, 23 Mar 2020 07:49:45 +0000 (UTC)
To: Yan Yankovskyi <yyankovskyi@gmail.com>
References: <20200323053503.GA1406@kbp1-lhp-F74019>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b5c165b-aee3-7dde-f9f1-3a3de2e357a7@suse.com>
Date: Mon, 23 Mar 2020 08:49:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200323053503.GA1406@kbp1-lhp-F74019>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] evtchn: Change evtchn port type to
 evtchn_port_t
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDMuMjAyMCAwNjozNSwgWWFuIFlhbmtvdnNreWkgd3JvdGU6Cj4gc3RydWN0IGV2dGNo
bl9zZXRfcHJpb3JpdHkgdXNlcyB1aW50MzJfdCB0eXBlIGZvciBldmVudCBjaGFubmVsIHBvcnQu
Cj4gUmVwbGFjZSB0aGUgdHlwZSB3aXRoIGV2dGNobl9wb3J0X3QuIFN1Y2ggY2hhbmdlIGlzIGFs
c28gZG9uZSBpbiBMaW51eC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW4gWWFua292c2t5aSA8eXlh
bmtvdnNreWlAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCkFzIGEgZ2VuZXJhbCByZW1hcmssIHRoZSBvcmRlciBvZiBjaGFuZ2VzIHdvdWxk
IGJldHRlciBiZSB0aGUgb3RoZXIgd2F5CmFyb3VuZDogVGhlIGNhbm9uaWNhbCBoZWFkZXIgaW4g
dGhlIFhlbiByZXBvIGJlIGFkanVzdGVkIGZpcnN0LCBhbmQgdGhlCmNoYW5nZSB0aGVuIHByb3Bh
Z2F0ZWQgdG8gcmVwb3MgY2FycnlpbmcgY2xvbmVzLgoKVGhhbmtzLCBKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
