Return-Path: <SRS0=/O7i=SW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53CDC282DD
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 23:28:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B8E920859
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 23:28:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JS7u6JEo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B8E920859
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHzOr-00019W-A2; Sat, 20 Apr 2019 23:28:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iki/=SW=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1hHzOp-00019R-L8
 for xen-devel@lists.xenproject.org; Sat, 20 Apr 2019 23:27:59 +0000
X-Inumbo-ID: ee1c7cf0-63c3-11e9-92d7-bc764e045a96
Received: from mail-qk1-x72e.google.com (unknown [2607:f8b0:4864:20::72e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ee1c7cf0-63c3-11e9-92d7-bc764e045a96;
 Sat, 20 Apr 2019 23:27:57 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id k189so4691130qkc.0
 for <xen-devel@lists.xenproject.org>; Sat, 20 Apr 2019 16:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IqAqLXXtfXGouPpR344zAcqcztapTVLCjKX8638W0k0=;
 b=JS7u6JEoyjCPAAz+fx0uUZZcE3D1Zmm52/f08J8wVsjsK6TWVukVXKbt6OKakGzee9
 L/qGVOrh/AQQFwTTJoCkI0qtPtrC2FXorL+7Rj0sdw/mKY3YUNnYbfwyCaDfXW1f1U0i
 Bc6tfnfphbDZzIxhQCMUuSijFqWfwblYCpi9LrKu7UqJqAMDoFI+obOC/YHa0LkUIBLl
 60LtgyVLUcx4Q7plTct9UGXrOiLcH/HPd+B8kIS+/RckvvUs61fWNVymwFcWNPnjxGI8
 XPt1JqJolyXsGO6wzjzeC6B4cMFba2rvpjdB/oANjB2m9Xtdyx4KwoWQ1MUoWWtvptyq
 30wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IqAqLXXtfXGouPpR344zAcqcztapTVLCjKX8638W0k0=;
 b=R7opfksps4umq6rsakT0G8V/T+7IvErs0tk6pbnIiPx3vJJJvD6NhOWj3MkMPF74tk
 BrkmFTqgMQRFa7BF9UJm2Xv/7EkxfFSgo7h6pnpt32JaXAtgbPYemxWVthmqav5JpFtK
 MQ3E7T94cUPr2xx1CJ4BStZkTfBb1tUI/hNn3V7msCLqE0BxKWxlVYcXqDq3WYMVGz3D
 3pctr3uDTEWpTCz71QeJaA8jQxztNHsdqImEZtrKrLgcfuudACgpi3hBKA/C+FFw0pmj
 Br3gDbONckMfK41UtpgDcye2o4xxcok/NTHK56ViDXr1lFAJbUgokBUhbqR8VAkr9Ifq
 rMrA==
X-Gm-Message-State: APjAAAW9yJVlTubWSSwzerozxHlDrOsDeSbBXy03FHkTyiMh29FSf2NL
 t8sK+FMSFOWX8WW0WIxlusA=
X-Google-Smtp-Source: APXvYqw87ZlpH5pAzwGbj6Ys1Lj1hJoQWT5+wOJY2wDx2JWzbQxpUkJG1Zr8056rzK8f7klhd1yVJw==
X-Received: by 2002:a05:620a:13ee:: with SMTP id
 h14mr8999233qkl.171.1555802877310; 
 Sat, 20 Apr 2019 16:27:57 -0700 (PDT)
Received: from [10.10.1.4] (c-73-129-199-244.hsd1.md.comcast.net.
 [73.129.199.244])
 by smtp.gmail.com with ESMTPSA id t35sm5207849qtc.10.2019.04.20.16.27.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Apr 2019 16:27:56 -0700 (PDT)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20190418015203.1636-1-dpsmith@apertussolutions.com>
 <1cf0e5e9-2109-9517-49d9-88c5251cf156@citrix.com>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Message-ID: <6561d58b-3f57-66cd-362e-42c7131825d0@gmail.com>
Date: Sat, 20 Apr 2019 19:27:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1cf0e5e9-2109-9517-49d9-88c5251cf156@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Fixing compilation for go
 1.11
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190420232755.HpfSc576-flhm0UiV_vFLcSlGHce33XtsetgMubbQ-M@z>

T24gNC8xOC8xOSA5OjExIEFNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDQvMTgvMTkgMjo1
MiBBTSwgRGFuaWVsIFAuIFNtaXRoIHdyb3RlOgo+PiBUaGlzIGRlYWxzIHdpdGggdHdvIGNhc3Rp
bmcgaXNzdWVzIGZvciBjb21waWxpbmcgdW5kZXIgZ28gMS4xMToKPj4gLSBleHBsaWNpdGx5IGNh
c3QgdG8gKkMueGVudG9vbGxvZ19sb2dnZXIgZm9yIEN0eC5sb2dnZXIgcG9pbnRlcgo+PiAtIGFk
ZCBjYXN0IHRvIHVuc2FmZS5Qb2ludGVyIGZvciB0aGUgQyBzdHJpbmcgY3BhdGgKPj4KPj4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29t
Pgo+IAo+IFJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+Cj4gCj4gQlRXLCBkbyB5b3Uga25vdyBpZiB0aGlzIHdpbGwgY29tcGlsZSBmb3Igb2xkZXIg
dmVyc2lvbnMgb2YgZ28/CgpQZXIgdGhlIHN1Z2dlc3Rpb24gb24gSVJDLCBJIGRpZCBhIHRlc3Qg
Y29tcGlsZSB3aXRoIGdvbGFuZyAxLjEwLjggYXMKdGhlIHZlcnNpb24gYXZhaWxhYmxlIHdpdGgg
VWJ1bnR1IDE4LjA0IHdhcyAxLjEwLjEuIFNpbmNlIHRoaXMgbWF0dGVycywKdGhlIGVudmlyb25t
ZW50IHdhcyBzZXR1cCB3aXRoIFhlbiA0LjEyIHRvb2xzLiBJZiB0aGVyZSBhcmUgYWRkaXRpb25h
bAp2YXJpYXRpb25zIHlvdSB3b3VsZCBsaWtlIHRvIHNlZSwgcGxlYXNlIGxldCBtZSBrbm93IGFz
IEkgYW0gdXNpbmcgYQpkb2NrZXIgY29udGFpbmVyIHNldHVwIGZvciByZXByb2R1Y2libGUgYnVp
bGQgZW52aXJvbm1lbnRzIGFuZCBzaG91bGQgYmUKYWJsZSB0byBzcGluIHVwIGRpZmZlcmVudCB2
YXJpYXRpb25zIGZhaXJseSBlYXNpbHkuCgo+IFRoaXMgc2hvdWxkIGJlIGNvbnNpZGVyZWQgZm9y
IGJhY2twb3J0IGFzIHdlbGwgKGNjJ2luZyBKYW4pLgo+IAoKQWNrIGFuZCB0aGFuayB5b3UuCgpW
L3IsCkRhbmllbCBQLiBTbWl0aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
