Return-Path: <SRS0=m/e5=XI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2457FC49ED7
	for <xen-devel@archiver.kernel.org>; Fri, 13 Sep 2019 07:16:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3792207FC
	for <xen-devel@archiver.kernel.org>; Fri, 13 Sep 2019 07:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3792207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8foE-0005nD-2Y; Fri, 13 Sep 2019 07:15:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8foD-0005n4-9e
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 07:15:57 +0000
X-Inumbo-ID: 532983c0-d5f6-11e9-95aa-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 532983c0-d5f6-11e9-95aa-12813bfff9fa;
 Fri, 13 Sep 2019 07:15:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2999EAC16;
 Fri, 13 Sep 2019 07:15:54 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-13-git-send-email-chao.gao@intel.com>
 <bce83dad-22f8-7fa1-9801-80a0fce8fd60@suse.com>
 <20190913070128.GB14305@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <54a71b92-980a-0aad-efb5-a94e4a3e275c@suse.com>
Date: Fri, 13 Sep 2019 09:15:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913070128.GB14305@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 12/16] x86/microcode: Synchronize late
 microcode loading
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@suse.de>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAwOTowMSwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gVGh1LCBTZXAgMTIsIDIw
MTkgYXQgMDU6MzI6MjJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEyLjA5LjIw
MTkgMDk6MjIsIENoYW8gR2FvIHdyb3RlOgo+Pj4gK3N0YXRpYyBpbnQgc2Vjb25kYXJ5X3RocmVh
ZF9mbih2b2lkKQo+Pj4gK3sKPj4+ICsgICAgdW5zaWduZWQgaW50IHByaW1hcnkgPSBjcHVtYXNr
X2ZpcnN0KHRoaXNfY3B1KGNwdV9zaWJsaW5nX21hc2spKTsKPj4+ICsKPj4+ICsgICAgaWYgKCAh
d2FpdF9mb3Jfc3RhdGUoTE9BRElOR19DQUxMSU4pICkKPj4+ICsgICAgICAgIHJldHVybiAtRUJV
U1k7Cj4+PiArCj4+PiArICAgIGNwdW1hc2tfc2V0X2NwdShzbXBfcHJvY2Vzc29yX2lkKCksICZj
cHVfY2FsbGluX21hcCk7Cj4+PiArCj4+PiArICAgIGlmICggIXdhaXRfZm9yX3N0YXRlKExPQURJ
TkdfRVhJVCkgKQo+Pj4gKyAgICAgICAgcmV0dXJuIC1FQlVTWTsKPj4KPj4gVGhpcyByZXR1cm4g
bG9va3MgdG8gYmUgdW5yZWFjaGFibGUsIGRvZXNuJ3QgaXQ/Cj4gCj4gWWVzLiBJIHdpbGwgdXNl
IGEgdmFyaWFibGUgdG8gaG9sZCBpdHMgcmV0dXJuIHZhbHVlIGFuZCBhc3NlcnQgdGhlCj4gcmV0
dXJuIHZhbHVlIGlzIGFsd2F5cyB0cnVlLgoKT3Igc2ltcGx5IGFkZCBBU1NFUlRfVU5SRUFDSEFC
TEUoKSB0byB0aGUgaWYoKSdzIGJvZHk/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
