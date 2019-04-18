Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3ECC10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 13:31:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBBFE20652
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 13:31:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cardoe.com header.i=@cardoe.com header.b="LFcjsToS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBBFE20652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cardoe.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH77j-0003Ev-Kf; Thu, 18 Apr 2019 13:30:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l666=SU=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1hH77i-0003Eo-TJ
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 13:30:42 +0000
X-Inumbo-ID: 294a2a6d-61de-11e9-92d7-bc764e045a96
Received: from mail-yb1-xb33.google.com (unknown [2607:f8b0:4864:20::b33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 294a2a6d-61de-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 13:30:41 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id u187so822446ybg.11
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2019 06:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cr2KR2WjUfUM34y41JI2FFI49sj07CFq6PFoY8pu3sg=;
 b=LFcjsToSrySNwiLzs/UR5Q80a0alO/wCoDpejAP7c7OhC6pXDYob9/kMSuNXx/dvWe
 CTWHlgzTkQ06Cs/v0i2vgBzswziJA/tlIcmd7NRHNP4UCx2DNicSaLJeg0Nb7qr9X9vb
 fvE88YvXJU5ZDSpLx5hGmrce8TBDJLKhyIjMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=cr2KR2WjUfUM34y41JI2FFI49sj07CFq6PFoY8pu3sg=;
 b=mQOEtbqTr+hM1t4DBabhYo3kLw/1IS/pADN2loj1VC/+ptt0T44r8R0AJoPUlF8TOw
 ZumYmJWV3J3CiCcy/ZF31GC3O3TBaP8zTOaWpaaI2kpkTZzSY4Vj/trgItUUOKTgW8C9
 SKHYo8aVShQv5XFo2ovd/LZm7Nx4rC0JmorltEUVE5or9JGqnb18v4SBu9lUYDaU6OkY
 nz/gcNWG7WDz9F2EG8xKk3/Ceijw6ZUlLfQ/VGzaZtkrQ66CwkHyzPajcOcR/G7BzHtm
 0KmMs3oVHZDg3zuSfvQkwUYh8Fc+kM5LW5MscNDmjb/ge1Bfj+h4zzXEYudkpknumydG
 9KmA==
X-Gm-Message-State: APjAAAUhvT4B+IReAkxQP03rjwc+9hflX6pi6D3CYjl6oh5YpsstCb6j
 urLhTaKACYCVB1tQw7jr8eHZBw==
X-Google-Smtp-Source: APXvYqx6K8/+b/dWdKRl80HVKVHAH/sa1j0KbArKyBWkywdqimQi/XKuR5lYU9u1Xgi20HzBzCd3Og==
X-Received: by 2002:a25:3243:: with SMTP id y64mr76365093yby.31.1555594241161; 
 Thu, 18 Apr 2019 06:30:41 -0700 (PDT)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f0:d0f8:5fd1:4a57:4c31])
 by smtp.gmail.com with ESMTPSA id y70sm857647ywy.86.2019.04.18.06.30.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 06:30:40 -0700 (PDT)
Date: Thu, 18 Apr 2019 08:30:40 -0500
From: Doug Goldstein <cardoe@cardoe.com>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190418133040.su6g4h6eejgnoxdl@doug-macbook.localdomain>
Mail-Followup-To: Wei Liu <wei.liu2@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Committers <committers@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
 <20190418123252.GE30543@zion.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190418123252.GE30543@zion.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] Xen project CI systems and committer workflow
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Committers <committers@xenproject.org>, Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418133040.NwJEykW1th-f-ZX-Lz6RDdEbl42fTaTDUcJPEj0f1TU@z>

T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMDE6MzI6NTJQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBDYyBBbnRob255IGFzIHdlbGwuIEZvcmdvdCB0byBkbyB0aGF0LiBTb3JyeS4KPiAKPiBPbiBU
aHUsIEFwciAxOCwgMjAxOSBhdCAwMTozMTo1OVBNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+ID4g
SGkgYWxsCj4gPiAKPiA+IFdlIG5vdyBoYXZlIEdpdGxhYiBDSSBhcyBhIGNvbXBsZW1lbnRhcnkg
c3lzdGVtIHRvIE9zc3Rlc3QgYW5kIGhhdmUgcGxhbm5lZCB0bwo+ID4gYWRkIGJvdHMuIEl0J3Mg
aGlnaCB0aW1lIHdlIHRoaW5rIGFib3V0IGhvdyB3ZSBpbnRlZ3JhdGUgdGhlbSBhbmQgaG93IGl0
IG1heQo+ID4gaW1wcm92ZSBvdXIgd29ya2Zsb3cuCgpGV0lXLCBJIHBsYW5uZWQgb24gc3VibWl0
dGluZyBvbiBhIHRhbGsgb24gdGhpcy4gSSBwbGFuIG9uIGdpdmluZyBhbgpvdmVydmlldyB0byBl
dmVyeW9uZSBhdCB0aGUgc3VtbWl0IGFuZCBhbGxvd2luZyBmb3IgZGlzY3Vzc2lvbi4KUG90ZW50
aWFsbHkgZXZlbiBob3N0aW5nIGEgQm9GIGlmIHRoZXJlIGlzIGludGVyZXN0IGluIGRpc2N1c3Np
bmcgdGhpcwpmdXJ0aGVyLgoKLS0KRG91ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
