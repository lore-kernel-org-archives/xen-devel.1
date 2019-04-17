Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78368C10F12
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 08:03:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41DEF2054F
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 08:03:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="udpM0/BP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41DEF2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGfWs-0003Yj-Aq; Wed, 17 Apr 2019 08:02:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GFY8=ST=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hGfWq-0003Ye-CT
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 08:02:48 +0000
X-Inumbo-ID: 2fe5f88f-60e7-11e9-92d7-bc764e045a96
Received: from mail-ot1-x331.google.com (unknown [2607:f8b0:4864:20::331])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2fe5f88f-60e7-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 08:02:47 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id m10so19967285otp.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2019 01:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KZPy898y3OBBDKWJcCfMrNfhJ77A83KmpcOu3ag78jk=;
 b=udpM0/BP+1Cs0e6Do9AMXkJ8a9v4CE3o96qsMxl39ASnoSRtQ43kxyJgh+CvuciCnm
 4lfjOeeBA+thWHeSDBLYVjah26u24ksG4K4HF5XmQRLoLE0p9ShGsSbln1KIE3thLXl+
 UMdkpaVHMqkwv3oLxPilOrtX5/93UokcJefnYtFNurUASoTE0bUnw2caRqxst5bm6oAS
 q+g6C1DnSdkNwppDX+mtJqZDNf/k+hDKjg+LkLyUc35J6Dcp/VmBSpnoEROZODF7K65B
 G68Cz0HACpu60RrfZuyee9vrCySIgTbab/6eqrjTLvwo+yU+rnySrmek992Pv3M7HKHv
 7k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KZPy898y3OBBDKWJcCfMrNfhJ77A83KmpcOu3ag78jk=;
 b=ELkIaae07aSVVMXrLmYYTRGkC3uRbY3tIW056xZCUGn8kgvBWy8cDtK3yQp+lMkTLJ
 EHUyFD78Hlh3fY2WJ/jA2Rr01ULQ6HTEuhe1WVdlTk9gomzDqUtongmmDZtqfZdqdR1G
 d2rlVuWiax6RKh3vl/NlqBFuiAYeN6ZgFsffK/9+OyE6rO5jasXbJCvQqWbeSlLOjswC
 Vx90It3szqLTQW1T0loQE9inkXf20gif7i20OW5rW+4RTqpmgplc9BFwuzebzHXADGD3
 hxmxzYriDnER4Mn3YMd1CYsx7fSCTo/hqgwhqWHcJOFZuLs4zC5ib+ubzogyq6xSL2RZ
 xUpg==
X-Gm-Message-State: APjAAAXatgwvu76vJtUydinKydTrky76bya09SEUGZMczLXlDQHt8BQB
 iOp3Uu38vyL17/aPyJrpJ6ULt5MWTrDGPnUhhv4=
X-Google-Smtp-Source: APXvYqxXFuUa15HV2tmHjvS2RkQacr0Dc8W4jdq7m+BBdj1bkYCmEcY+XsWy0vlHpnshflcOxxNStkbE+5ArvDVR7mI=
X-Received: by 2002:a05:6830:185:: with SMTP id
 q5mr51903353ota.245.1555488166328; 
 Wed, 17 Apr 2019 01:02:46 -0700 (PDT)
MIME-Version: 1.0
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
In-Reply-To: <CABHD4K_1BRuWLpDJEAWmMxqSYXyyE2ToW_dT754q3co5r1EB9w@mail.gmail.com>
From: Amit Tomer <amittomer25@gmail.com>
Date: Wed, 17 Apr 2019 13:32:33 +0530
Message-ID:
 <CABHD4K_ysgy=_sC2S0Dh83HHykmQYAR9DYk=aRBi=HTBFPUupg@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417080233.QNKTk5lYnybhDSDRwU9TBoyYnB1GVJvGHPYyx2t7bvo@z>

SGVsbG8sCgpPbiBGcmksIE1hciAyMiwgMjAxOSBhdCA1OjA1IFBNIEFtaXQgVG9tZXIgPGFtaXR0
b21lcjI1QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+Cj4gPiBJIGFtIHdvbmRlcmluZyBp
ZiB5b3UgaGFkIHRpbWUgdG8gYmlzZWN0IHRoZSBpc3N1ZT8KPiA+Cj4gPiBXZSBhcmUgcmVsZWFz
aW5nIFhlbiA0LjEyIHNvb24gc28gd2UgbmVlZCB0byBtYWtlIHRoZSBkZWNpc2lvbiB3aGV0aGVy
IHRoaXMKPiA+IHNob3VsZCBiZSBmaXhlZCBhZnRlciAoYW5kIGJhY2twb3J0IGl0KSBvciBiZWZv
cmUuCgpEb24ndCBzZWUgdGhpcyBjcmFzaCBpZiBJIGNob3NlIHRvIGhhdmUgZGlmZmVyZW50IGxv
YWQgYWRkcmVzc2VzKExvYWQKa2VybmVsIGF0IDIgTUIgYWxpZ25lZCBhZGRyZXNzKS4KRm9yIGlu
c3RhbmNlLCB1c2luZwoKInNldGVudiB4ZW5fYWRkcl9yIDB4NDA0ODAwMDAgO3NldGVudiBmZHRf
YWRkcl9yIDB4NDMwMDAwMDA7c2V0ZW52Cmtlcm5lbF9hZGRyX3IgMHg0MTAwMDAwMCIKIGluc3Rl
YWQgb2YKInNldGVudiB4ZW5fYWRkcl9yIDB4NDIwMDAwMDAgO3NldGVudiBmZHRfYWRkcl9yIDB4
NDMwMDAwMDA7c2V0ZW52Cmtlcm5lbF9hZGRyX3IgMHg0MDQ4MDAwMCIKCkFsbG93IGl0IGJvb3Qg
cHJvcGVybHkoVGVzdGVkIGl0IHdpdGggNC4xMykuCgpUaGFua3MKLUFtaXQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
