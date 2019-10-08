Return-Path: <SRS0=Os51=YB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669BDC10F14
	for <xen-devel@archiver.kernel.org>; Tue,  8 Oct 2019 10:42:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36DD3206C2
	for <xen-devel@archiver.kernel.org>; Tue,  8 Oct 2019 10:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36DD3206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHmwo-0005gJ-HO; Tue, 08 Oct 2019 10:42:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=05QO=YB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iHmwn-0005gE-9P
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 10:42:29 +0000
X-Inumbo-ID: 51bee734-e9b8-11e9-97cc-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51bee734-e9b8-11e9-97cc-12813bfff9fa;
 Tue, 08 Oct 2019 10:42:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 21915AFCC;
 Tue,  8 Oct 2019 10:42:26 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <osstest-142383-mainreport@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b155b2f9-9664-7366-cdd0-10fac5c3ab3b@suse.com>
Date: Tue, 8 Oct 2019 12:42:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <osstest-142383-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 142383: regressions - FAIL
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTAuMTkgMjI6NTYsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPiBmbGlnaHQg
MTQyMzgzIHhlbi11bnN0YWJsZSByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDIzODMvCj4gCj4gUmVncmVzc2lvbnMgOi0oCj4g
Cj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVk
aW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4gICB0ZXN0LWFtZDY0LWFtZDY0LWxp
YnZpcnQtcGFpciAyMiBndWVzdC1taWdyYXRlL3NyY19ob3N0L2RzdF9ob3N0IGZhaWwgUkVHUi4g
dnMuIDE0MTgyMgo+ICAgdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQtcGFpciAyMiBndWVzdC1taWdy
YXRlL3NyY19ob3N0L2RzdF9ob3N0IGZhaWwgUkVHUi4gdnMuIDE0MTgyMgoKSG1tLCB0ZXN0IGxv
ZyBzYXlzIHRoZSBndWVzdCBkaWRuJ3Qgc3VzcGVuZC4KCkNvdWxkIHRoYXQgYmUgcmVsYXRlZCB0
byBjb21taXQgYjE4M2UxODBiY2U5MzAzID8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
