Return-Path: <SRS0=VluW=XT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC715C432C1
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 15:17:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B703220665
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 15:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B703220665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmYg-0005hw-Or; Tue, 24 Sep 2019 15:16:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCmYf-0005ho-2r
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:16:53 +0000
X-Inumbo-ID: 55e92fd5-dede-11e9-9621-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 55e92fd5-dede-11e9-9621-12813bfff9fa;
 Tue, 24 Sep 2019 15:16:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2D837B0E6;
 Tue, 24 Sep 2019 15:16:51 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190924074202.4064-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c711742e-cedf-ce3c-9f0a-86282fba572c@suse.com>
Date: Tue, 24 Sep 2019 17:16:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190924074202.4064-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: don't let XEN_RUNSTATE_UPDATE
 leak into vcpu_runstate_get()
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAwOTo0MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiB2Y3B1X3J1bnN0YXRl
X2dldCgpIHNob3VsZCBuZXZlciByZXR1cm4gYSBzdGF0ZSBlbnRyeSB0aW1lIHdpdGgKPiBYRU5f
UlVOU1RBVEVfVVBEQVRFIHNldC4gVG8gYXZvaWQgdGhpcyBsZXQgdXBkYXRlX3J1bnN0YXRlX2Fy
ZWEoKQo+IG9wZXJhdGUgb24gYSBsb2NhbCBydW5zdGF0ZSBjb3B5Lgo+IAo+IFRoaXMgcHJvYmxl
bSB3YXMgaW50cm9kdWNlZCB3aXRoIGNvbW1pdCAyNTI5Yzg1MGVhNDhmMDM2ICgiYWRkIHVwZGF0
ZQo+IGluZGljYXRvciB0byB2Y3B1X3J1bnN0YXRlX2luZm8iKS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9k
b21haW4uYyB8IDE3ICsrKysrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKSSBoYWQgdGhpcyBjb21taXR0ZWQgYWxyZWFkeSBh
bmQgd2FzIGFib3V0IHRvIHB1c2gsIGJ1dCB0aGlzCmRlZmluaXRlbHkgd2FudHMgYSBzaW1pbGFy
IGNoYW5nZSBmb3IgQXJtLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
