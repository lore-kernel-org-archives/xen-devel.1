Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F393C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 09:23:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7874620835
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 09:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7874620835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGglk-0001TH-IJ; Wed, 17 Apr 2019 09:22:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGglj-0001TC-9Z
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 09:22:15 +0000
X-Inumbo-ID: 495d675f-60f2-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 495d675f-60f2-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 09:22:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1491374;
 Wed, 17 Apr 2019 02:22:13 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 830BE3F68F;
 Wed, 17 Apr 2019 02:22:12 -0700 (PDT)
To: Amit Tomer <amittomer25@gmail.com>
References: <CABHD4K_TGznSkuX8T0tuBpqkcJnyyDtxrfa0YHGvz_t0BE3fAQ@mail.gmail.com>
 <6b603d55-5823-b203-45eb-a0dd61ef81ee@arm.com>
 <CABHD4K_tXgNpWT4UChTbCbu4X8C3HjuFSig1Se0WuMrzMV0tyQ@mail.gmail.com>
 <18d6524d-8dd9-2c0b-34b3-bdb7316bebae@arm.com>
 <CABHD4K9rj354gW=8Q_PAtQ02R+pZdUnhzfwrG3Zq=-XmDE8XfA@mail.gmail.com>
 <a1f50f9c-1f14-9816-88f2-2a11dffdf6db@arm.com>
 <CABHD4K9JGxPCV==0zkA80dZKrrsTvNQXqgwt7nenmayT-hN57Q@mail.gmail.com>
 <15bb0374-f1dc-2392-25a8-c13815ef4a0c@arm.com>
 <ca967222-50be-a402-c5ef-f1662e301905@arm.com>
 <CABHD4K_1BRuWLpDJEAWmMxqSYXyyE2ToW_dT754q3co5r1EB9w@mail.gmail.com>
 <CABHD4K_ysgy=_sC2S0Dh83HHykmQYAR9DYk=aRBi=HTBFPUupg@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8e412304-319b-4111-ecf9-e7efe64ac571@arm.com>
Date: Wed, 17 Apr 2019 10:22:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CABHD4K_ysgy=_sC2S0Dh83HHykmQYAR9DYk=aRBi=HTBFPUupg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Arm boot regression with Xen 4.12
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
 peng.fan@nxp.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417092210.cOxoCZtSuCQi2Ep2Deel0JBY0I-pCpGtPmjkdH-5MtA@z>

T24gMTcvMDQvMjAxOSAwOTowMiwgQW1pdCBUb21lciB3cm90ZToKPiBIZWxsbywKCkhpLAoKPiBP
biBGcmksIE1hciAyMiwgMjAxOSBhdCA1OjA1IFBNIEFtaXQgVG9tZXIgPGFtaXR0b21lcjI1QGdt
YWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IEhpLAo+Pgo+Pgo+Pj4gSSBhbSB3b25kZXJpbmcgaWYgeW91
IGhhZCB0aW1lIHRvIGJpc2VjdCB0aGUgaXNzdWU/Cj4+Pgo+Pj4gV2UgYXJlIHJlbGVhc2luZyBY
ZW4gNC4xMiBzb29uIHNvIHdlIG5lZWQgdG8gbWFrZSB0aGUgZGVjaXNpb24gd2hldGhlciB0aGlz
Cj4+PiBzaG91bGQgYmUgZml4ZWQgYWZ0ZXIgKGFuZCBiYWNrcG9ydCBpdCkgb3IgYmVmb3JlLgo+
IAo+IERvbid0IHNlZSB0aGlzIGNyYXNoIGlmIEkgY2hvc2UgdG8gaGF2ZSBkaWZmZXJlbnQgbG9h
ZCBhZGRyZXNzZXMoTG9hZAo+IGtlcm5lbCBhdCAyIE1CIGFsaWduZWQgYWRkcmVzcykuCj4gRm9y
IGluc3RhbmNlLCB1c2luZwo+IAo+ICJzZXRlbnYgeGVuX2FkZHJfciAweDQwNDgwMDAwIDtzZXRl
bnYgZmR0X2FkZHJfciAweDQzMDAwMDAwO3NldGVudgo+IGtlcm5lbF9hZGRyX3IgMHg0MTAwMDAw
MCIKPiAgIGluc3RlYWQgb2YKPiAic2V0ZW52IHhlbl9hZGRyX3IgMHg0MjAwMDAwMCA7c2V0ZW52
IGZkdF9hZGRyX3IgMHg0MzAwMDAwMDtzZXRlbnYKPiBrZXJuZWxfYWRkcl9yIDB4NDA0ODAwMDAi
CgpHbGFkIHRvIGhlYXIgdGhhdCB5b3UgbWFuYWdlIHRvIGJvb3QgWGVuIHdpdGggYSBkaWZmZXJl
bnQgbG9hZCBhZGRyZXNzLiBJIHdvdWxkIApzdGlsbCBsaWtlIHRvIHVuZGVyc3RhbmQgd2hhdCBp
cyB0aGUgZXhhY3QgaXNzdWUgYXMgdGhpcyBtYXkgYmUgYSBidWcgaW4gWGVuLgoKT24gSVJDLCB5
b3UgbWVudGlvbiB0aGUgb2ZmZW5kaW5nIGNvbW1pdCBpcyBmNjA2NThjNmFlICJ4ZW4vYXJtOiBT
dG9wIHJlbG9jYXRpbmcgClhlbiIuIFlvdSBhbHNvIHBvaW50ZWQgb3V0IHRoYXQgaW5pdF9oZWFw
X3BhZ2VzIHdhcyBjYWxsIHdpdGggYSBOVUxMIHBhZ2UuCgpEaWQgeW91IGZpbmQgb3V0IHdoeSBp
dCBpcyBOVUxMPyBXaGF0IHdhcyB0aGUgTUZOIGxvb2tlZCB1cD8KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
