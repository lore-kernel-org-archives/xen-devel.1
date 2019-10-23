Return-Path: <SRS0=in/6=YQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE475CA9EB6
	for <xen-devel@archiver.kernel.org>; Wed, 23 Oct 2019 14:45:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A84F62173B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Oct 2019 14:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A84F62173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNHtE-0002W5-64; Wed, 23 Oct 2019 14:45:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNHtC-0002Vq-J1
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 14:45:30 +0000
X-Inumbo-ID: be4f4bed-f5a3-11e9-9482-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be4f4bed-f5a3-11e9-9482-12813bfff9fa;
 Wed, 23 Oct 2019 14:45:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 63C5EB40D;
 Wed, 23 Oct 2019 14:45:24 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-4-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <071ab7da-6fc8-38e1-3ea7-af1b06c7cdac@suse.com>
Date: Wed, 23 Oct 2019 16:45:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023135812.21348-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/7] xen/nospec: Introduce
 CONFIG_SPECULATIVE_HARDEN_BRANCH
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTU6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gSnVzdCBhcyB3aXRoIENP
TkZJR19TUEVDVUxBVElWRV9IQVJERU5fQVJSQVksIGJyYW5jaCBoYXJkZW5pbmcgc2hvdWxkIGJl
Cj4gY29uZmlndXJhYmxlIGF0IGNvbXBpbGUgdGltZS4KPiAKPiBUaGUgcHJldmlvdXMgQ09ORklH
X0hWTSB3YXMgYSBjb25zZXF1ZW5jZSBvZiB3aGF0IGNvdWxkIGJlIGRpc2N1c3NlZCBwdWJsaWNs
eQo+IGF0IHRoZSB0aW1lIHRoZSBwYXRjaGVzIHdlcmUgc3VibWl0dGVkLCBhbmQgd2Fzbid0IGFj
dHVhbGx5IGNvcnJlY3QuICBMYXRlcgo+IHBhdGNoZXMgd2lsbCBtYWtlIGZ1cnRoZXIgY29ycmVj
dGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
