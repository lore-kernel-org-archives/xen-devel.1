Return-Path: <SRS0=H5Oh=2I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5577C43603
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 14:45:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D2CA21582
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 14:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D2CA21582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihaZE-00054C-6V; Wed, 18 Dec 2019 14:44:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8BSL=2I=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihaZD-00053t-4W
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 14:44:47 +0000
X-Inumbo-ID: ef43980a-21a4-11ea-909d-12813bfff9fa
Received: from mail-wm1-f54.google.com (unknown [209.85.128.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef43980a-21a4-11ea-909d-12813bfff9fa;
 Wed, 18 Dec 2019 14:44:46 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id u2so2183082wmc.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 06:44:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=k/qHq+sjIp4xE771X8ZV9p4GuuYCBwaugWTooARKSXw=;
 b=InRH+04UrlW+5PKDvMPz5resDS7Ajr1So//ZHm2Hh/jmX/X1BeutjLZc4AJEEVCi4O
 bfiiXI3cVFSCHw20MYc8XaDKuGYmjWkbsaymJbBCnkpvXaI6JG0ethfiHp3/I8MzyyMm
 ibLSzHZi3lmUusbNe5PHolunKXjU3Iu4mcj2Fm6ymepFfUZonhl865MV+//r5+PQm/8J
 0s0hx36yyMk7/uNji5rSXFNjUBfa6wRTqPZm/eqJUsUBcS9NpeKumFq86CPJBM41rRHd
 SikxWY6/wGQFyDgRWIiPVj8xFbqSMo0jZsIj0cTTNKVU5iCtM6GwZavUDLXrt352mEQ/
 6xhw==
X-Gm-Message-State: APjAAAUQF3ysT0tY7TvlcKhMUei0bEKCE2mNpTc60HF2Avy9Xpa/50CX
 DlRbfjMmwjYhxVr20NMGs5Q=
X-Google-Smtp-Source: APXvYqwlVyGlmVO8BHtH+jmhW0SCcHcKgssXKcy54LGrA6UWkAcl0ZCVifA7LkjQ3Y3z9NPdbHmpoA==
X-Received: by 2002:a1c:81c9:: with SMTP id c192mr3754429wmd.44.1576680285716; 
 Wed, 18 Dec 2019 06:44:45 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id j130sm2825994wmb.18.2019.12.18.06.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 06:44:44 -0800 (PST)
Date: Wed, 18 Dec 2019 14:44:43 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191218144443.26bhy2c4czvnvxcx@debian>
References: <20191218135006.4117-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218135006.4117-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/python: Drop test.py
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
 Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgMDE6NTA6MDZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGlzIGZpbGUgaGFzbid0IGJlZW4gdG91Y2hlZCBzaW5jZSBpdCB3YXMgaW50cm9k
dWNlZCBpbiAyMDA1IChjL3MgMGM2ZjM2NjI4KQo+IGFuZCBoYXMgYSB3aWxkbHkgb2Jzb2xldGUg
c2hlYmFuZyBmb3IgUHl0aG9uIDIuMy4gIE1vc3QgaW1wb3J0YW50bHkgZm9yIHVzIGlzCj4gdGhh
dCBpdCBpc24ndCBQeXRob24gMyBjb21wYXRpYmxlLgo+IAo+IERyb3AgdGhlIGZpbGUgZW50aXJl
bHkuICBTaW5jZSB0aGUgMi4zIGRheXMsIGF1dG9tYXRpYyBkaXNjb3Zlcnkgb2YgdGVzdHMgaGFz
Cj4gYmVlbiBpbmNsdWRlZCBpbiBzdGFuZGFyZCBmdW5jdGlvbmFsaXR5LiAgUmV3cml0ZSB0aGUg
dGVzdCBydWxlIHRvIHVzZQo+ICIkKFBZVEhPTikgLW0gdW5pdHRlc3QgZGlzY292ZXIiIHdoaWNo
IGlzIGVxdWl2ZWxlbnQuCj4gCj4gRHJvcHBpbmcgdGVzdC5weSBkcm9wcyB0aGUgb25seSBwaWVj
ZSBvZiBaUEwtMi4wIGNvZGUgaW4gdGhlIHRyZWUuICBEcm9wIHRoZQo+IGFuY2lsbGFyeSBmaWxl
cywgYW5kIGFkanVzdCBDT1BZSU5HIHRvIG1hdGNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8
d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
