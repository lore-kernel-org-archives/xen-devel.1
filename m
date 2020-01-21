Return-Path: <SRS0=mnwC=3K=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E55DC33CAA
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jan 2020 13:31:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DAB8217F4
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jan 2020 13:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DAB8217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ittcm-0006Ln-4p; Tue, 21 Jan 2020 13:31:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aBqa=3K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ittck-0006LZ-RI
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 13:31:18 +0000
X-Inumbo-ID: 49079c16-3c52-11ea-9fd7-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49079c16-3c52-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 13:31:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p9so2969941wmc.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 05:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tc9NpzD48eBvdFwTx+FlLdZvINJvQKIQle1/cEjOkSI=;
 b=WTSvGXd2b/GpH2Icgx7D1Ftzmx/OQDMwwzMT5cL1qggRWbJGXZkNCZfNjG+kFZ5Qnd
 hwM3b5iCz4sTz1RbKhpSBspAHfmkQmzCQfS+FVPUWE3qVOc5N+AIlnUPYX0jaMOaMHk0
 4nsk/JIfBvbfF78kABWdpQz6qCvDYaXGqRqdj0zbKRfqu52G41zCS/cE++2X5DR5W7Xf
 29FAu+cYS9z2Ivum7YjgXRUb0I6MIVljc24nf6wD3fW30iJnbGF0KIu3wBPwEzqZFC6m
 zaoclgCTUGjNnzb4s3K4mvACjRlIg7+DwaX5ahqkK+hcmSwEuD639jfccTnqCHUlPSSk
 /CqA==
X-Gm-Message-State: APjAAAXTWy16ScG7Q2wKwnqpDwZPq+aAO9xzWBYL6ey6w1ApikkQTbjt
 N5mSGv76oAHaUSNgaxzNoCc=
X-Google-Smtp-Source: APXvYqy3JwbOzAyjplVpyKF9fXncb+aFJjU8sMa15DTrp8vZq56tMpohbCmZjZF914uTbYsAquSY5Q==
X-Received: by 2002:a1c:8116:: with SMTP id c22mr4357508wmd.27.1579613469546; 
 Tue, 21 Jan 2020 05:31:09 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id w19sm3795057wmc.22.2020.01.21.05.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 05:31:08 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-3-jgross@suse.com>
 <f16e7cc7-4fca-8b24-ce12-041a19ca19ae@xen.org>
 <5964014f-3777-ef1e-0929-2b660d2d7502@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d9e3ba5d-8a95-ebec-9f73-af168aba2742@xen.org>
Date: Tue, 21 Jan 2020 13:31:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5964014f-3777-ef1e-0929-2b660d2d7502@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 2/9] xen: split parameter related
 definitions in own header file
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS8wMS8yMDIwIDEzOjI4LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDIxLjAxLjIw
IDE0OjAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIEp1ZXJnZW4sCj4+Cj4+IE9uIDIxLzAx
LzIwMjAgMDg6NDMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBNb3ZlIHRoZSBwYXJhbWV0ZXIg
cmVsYXRlZCBkZWZpbml0aW9ucyBmcm9tIGluaXQuaCBpbnRvIGEgbmV3IGhlYWRlcgo+Pj4gZmls
ZSBwYXJhbS5oLiBUaGlzIHdpbGwgYXZvaWQgaW5jbHVkZSBoZWxsIHdoZW4gbmV3IGRlcGVuZGVu
Y2llcyBhcmUKPj4+IGFkZGVkIHRvIHBhcmFtZXRlciBkZWZpbml0aW9ucy4KPj4KPj4gSG93IGRp
ZCB5b3UgZmluZCBvdXQgdGhlIGxpc3Qgb2YgcGxhY2VzIHdoZXJlIHRoZSBuZXcgZmlsZXMgbmVl
ZCB0byBiZSAKPj4gaW5jbHVkZWQ/Cj4gCj4gSSBkaWQgYSBncmVwIGZvciBhbGwgcGFyYW1ldGVy
IGRlZmluaXRpb25zLgpUaGF0J3Mgd2hhdCBJIHRob3VnaHQgYnV0IHdhbnRlZCB0byBjaGVjayA6
KS4KCj4+Cj4+IEFsc28sIHdhcyBpdCBidWlsZCB0ZXN0IGl0IG9uIEFybT8KPiAKPiBZZXMuCgpU
aGFua3MhCgpGb3IgQXJtICsgY29tbW9uIGNvZGU6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
