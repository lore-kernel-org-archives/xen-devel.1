Return-Path: <SRS0=b7qU=UP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A60C31E50
	for <xen-devel@archiver.kernel.org>; Sun, 16 Jun 2019 20:43:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68BFC20657
	for <xen-devel@archiver.kernel.org>; Sun, 16 Jun 2019 20:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68BFC20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcbzi-0007kP-QK; Sun, 16 Jun 2019 20:43:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jm3+=UP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hcbzh-0007kK-2T
 for xen-devel@lists.xenproject.org; Sun, 16 Jun 2019 20:43:17 +0000
X-Inumbo-ID: 5c36368a-9077-11e9-b032-17ad83d358d2
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c36368a-9077-11e9-b032-17ad83d358d2;
 Sun, 16 Jun 2019 20:43:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m3so7752168wrv.2
 for <xen-devel@lists.xenproject.org>; Sun, 16 Jun 2019 13:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bjjJQki9NSKg52Twx4sUwko32lrHJiRd7ohPEqcw5m4=;
 b=cObBEjbm/kGRZOZpAn88gATIYoSlycJEJaLZVhA+oK6LGSG5m2qFdqsHQDNHwKxO8Z
 Tqb+nta9ZlMaLLKNpiZ5wc2C+kexGa0k6/4pIVC5w/ARTMVGYweQgsUGkafeSogVH0vK
 BDKUUedx0cpts6inrp0cqg6tRO3iVa1TAtFFK7ITfoIU5PYWTV1GJLJfsP4iM3v2CbDI
 ot6746rjWHRFsofTVU8ODqYiwy5Gpd6TIGpjTXg2Q49pJjQz/1nX3a4gnlKgMmeKuKCy
 4SEpeix/Bk1pw4ZK7ZlZ0Ice1WNckWwcFPEnaAvrJavdkW9LjWM4VNq8dlu3+i0ZGqJP
 CHSg==
X-Gm-Message-State: APjAAAW7CmpUPfetXjgoAprE9ryRZvO9lNvPuh/xVOsg+UpZ+wlJm4fb
 nzlKCVZ5iGqHcMQtTDh/7x0=
X-Google-Smtp-Source: APXvYqz8L/WpiZKFWGO3HVyWKi3r39kYhCTcQDQb+mcddXHLP7de5OiXHEck/4VG/BPRV6gPxDP1+A==
X-Received: by 2002:adf:de02:: with SMTP id b2mr87089wrm.349.1560717793122;
 Sun, 16 Jun 2019 13:43:13 -0700 (PDT)
Received: from debian ([213.31.248.216])
 by smtp.gmail.com with ESMTPSA id l8sm30104919wrg.40.2019.06.16.13.43.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 13:43:12 -0700 (PDT)
Date: Sun, 16 Jun 2019 21:43:10 +0100
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190616204310.nn5wuu364uavvuxw@debian>
References: <20190528135918.28216-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528135918.28216-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] support: remove tmem from support.md
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDM6NTk6MThQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBUbWVtIGhhcyBiZWVuIHJlbW92ZWQuIFJlZmxlY3QgdGhhdCBpbiBTVVBQT1JULm1k
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKT29w
cywgZm9yZ290IHRvIHJlbW92ZSB0aGlzIGJpdC4gVGhhbmtzLgoKQWNrZWQtYnk6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
