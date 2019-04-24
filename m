Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4B7C282CE
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:26:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D82218FD
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:26:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGjfP+aY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D82218FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJJmm-0007ag-RR; Wed, 24 Apr 2019 15:26:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aie0=S2=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hJJml-0007ab-5P
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 15:26:11 +0000
X-Inumbo-ID: 48bc11e9-66a5-11e9-92d7-bc764e045a96
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 48bc11e9-66a5-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 15:26:09 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t17so14030247wrr.4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2019 08:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tDkDreRM06Dloch4T1/p50DhspNThaQZBxXE9XvL3bQ=;
 b=ZGjfP+aYrx5K21UWeg7t04lwKzdYMK5//7Bm/5g3ivP10VKIWcgqa/Rkylt4dvnYH7
 tZql1hp+kkshSliVcgWR/xeWDrNjy0NVuRJ7fLm9NDZ4X6ShQXKU8UdCpxs8xvNpVcYz
 K2Q8CRARZqbA5P/8mcI/3zHCiag+WzsdqFmycxX3cBTYcVoLMWUDsp7NnokWtQ3jsjDv
 Ma0KQaczkAz1tFfA2vOpMRrSIxOKx2N7EUgUd5PqLFx0ucHJwKZMoJxTPrGdxyfxwy2Y
 uJt8bUzihQLjmBARWL/prxtn2fsj6ZoC7MBAnwF4airvHbhjJvmqc3Lm6krX6MNtFXGN
 j4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tDkDreRM06Dloch4T1/p50DhspNThaQZBxXE9XvL3bQ=;
 b=onmKrkyNQnI7KatzHhSHkJWcjY99sMf6mM+QMrx995pQAuJk1kcgQ1AzVP0nUpnoZY
 /calMlSDhLLM1ZiVNpg8/+ahE0Wha3FFrb3vfR0pJYXs1i4dB0dP/u3zKHeKlyMS99B/
 43yd6CFw4NpOVtse0RhrG5IO/rPYEUgViZBzwYcyzVKDDMTD535Wpjmgn8mjImd4u413
 XiC1h6RyVrRKLK8R1FOG8bS6yrcAKY6+YDe2UIzUbMQi2JxQCfrrA8m3m1nuMHLDiIAM
 DtW+deFOZRxYCWX3WFL6vA/c/nnrFd7f9QxhZWPAsqgvimuitu1NtO2QE7pwlEzZh/Fe
 AWLQ==
X-Gm-Message-State: APjAAAXEJ4DMTQg4RMezPHG1Laa9FPvaYTITOfmhfxYGo6nykE9SiS2x
 DiOK78x3vBo57qZ3GubXh7fN2lKN7hg3Rqf8ryI=
X-Google-Smtp-Source: APXvYqyH+5wJ9Cy5Jz9c4xoMM8XbL8O9zQGepgNMmlQeJWZvBsUDIPjj8AdGhN3TBrjhJ9A3cSGPjfcEfnikQgmmiq0=
X-Received: by 2002:adf:e4c2:: with SMTP id v2mr21828092wrm.124.1556119567410; 
 Wed, 24 Apr 2019 08:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
 <5c0480bb-24bc-81cf-066b-a66b2e83d51f@bitdefender.com>
 <jYLnqeXXkfLqocyaorTwgUHTTQ7AozmbsPb8X4HGvjuGF2shfDIkAw7G363xoRRWmSZShCUqzriK-bBF3S93QKQkXS_9wUFrlKbdjKr6tUM=@protonmail.com>
In-Reply-To: <jYLnqeXXkfLqocyaorTwgUHTTQ7AozmbsPb8X4HGvjuGF2shfDIkAw7G363xoRRWmSZShCUqzriK-bBF3S93QKQkXS_9wUFrlKbdjKr6tUM=@protonmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 24 Apr 2019 09:25:30 -0600
Message-ID:
 <CABfawhmwxVTK4yq88R87JX78ZNiy5WnBjE_SGCSeUyQcBVMr1w@mail.gmail.com>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: Re: [Xen-devel] VMI: singlestep event not received
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424152530.xiqmadODFSMEyR_65t6Cp-mT9BFsX-p9ItaS2jGtwf4@z>

T24gTW9uLCBBcHIgMjIsIDIwMTkgYXQgNjowMCBQTSBNYXRoaWV1IFRhcnJhbAo8bWF0aGlldS50
YXJyYWxAcHJvdG9ubWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uZGF5IDIyIEFwcmlsIDIwMTkg
MTE6MjIsIFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6
Cj4KPiA+IE9uIDQvMjIvMTkgMToyNiBBTSwgTWF0aGlldSBUYXJyYWwgd3JvdGU6Cj4gPgo+ID4g
PiBUaGUgcHJvYmxlbSBpcyB0aGF0IFJ0bFVzZXJUaHJlYWRTdGFydCBpcyBwYWdlZC1vdXQsIHNv
IGknbSB0cnlpbmcgdG8gcmVhY2ggaXQgdmlhIHNpbmdsZXN0ZXBwaW5nIGFzIGEgYmFja3VwIHNv
bHV0aW9uLgo+ID4KPiA+IEZXSVcsIHlvdSBjYW4ganVzdCB1c2UgeGNfaHZtX2luamVjdF90cmFw
KCkgd2l0aCBhIFRSQVBfcGFnZV9mYXVsdAo+ID4gcGFyYW1ldGVyIHRvIGNhdXNlIHRoZSBPUyB0
byBicmluZyBhIHBhZ2VkIG91dCBwYWdlIGJhY2sgaW50byBtYWluIG1lbW9yeS4KPgo+IFRoZSBw
cm9ibGVtIGlzIHRoYXQgaSdtIGZ1bGx5IGJhc2VkIG9uIExpYlZNSSwgd2hpY2ggZG9lc24ndCBw
cm92aWRlIGFuIEFQSSBmb3IgcGFnZSBpbmplY3Rpb24geWV0Lgo+Cj4gSSB0aGluayBUYW1hcyB3
YXMgd2FpdGluZyBmb3IgYSBmdWxsIHN1cHBvcnQgb2YgcGFnZWZhdWx0IGluamVjdGlvbiBvbiBY
ZW4gYmVmb3JlIG9wZW5pbmcgYW4gQVBJLgo+Cj4gTWF5YmUgd2Ugc2hvdWxkIG9wZW4gYW4gaXNz
dWUgdG8gdHJhY2sgdGhlIHByb2dyZXNzIGFib3V0IGl0Lgo+Cj4gVGhhbmtzIGFueXdheSBmb3Ig
dGhlIHN1Z2dlc3Rpb24gIQoKTm90IGhhdmluZyBhIExpYlZNSSB3cmFwcGVyIHNob3VsZCBub3Qg
cHJldmVudCB5b3UgZnJvbSB1c2luZyBhIGxpYnhjCmZ1bmN0aW9uIGRpcmVjdGx5LiBUaGVyZSBh
cmUgbWFueSBjb3JuZXItY2FzZXMgcmVnYXJkaW5nIHdoZW4gaXQgaXMKc2FmZSB0byBpbmplY3Qg
YSBwYWdlZmF1bHQgaW50byB0aGUgZ3Vlc3QgdG8gYnJpbmcgYmFjayBwYWdlcyBhbmQgdGhhdAps
b2dpYyBpcyBub3QgdHJpdmlhbCBlbm91Z2ggdG8gYmUgaW1wbGVtZW50ZWQgaW4gTGliVk1JLiBJ
dCdzIHdheSB0b28Kc3BlY2lmaWMgdG8gdGhlIHVzZWNhc2UgdG8gZGVjaWRlIHdoZW4gaXQncyBz
YWZlIHRvIGRvIHRoYXQuIFNvIGluCnRoaXMgY2FzZSwgaWYgeW91IGtub3cgeW91IGFyZSBpbiBy
aW5nMyBvZiB5b3VyIHRhcmdldCBwcm9jZXNzIHlvdSBjYW4KanVzdCBjYWxsIHRoZSBsaWJ4YyBm
dW5jdGlvbiBkaXJlY3RseS4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
