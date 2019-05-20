Return-Path: <SRS0=/voU=TU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800D0C04AAC
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 11:09:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5492220675
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 11:09:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYDMkR7o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5492220675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSgAb-0004tg-NZ; Mon, 20 May 2019 11:09:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z/e/=TU=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hSgAa-0004sw-LZ
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 11:09:28 +0000
X-Inumbo-ID: bb768f7e-7aef-11e9-8980-bc764e045a96
Received: from mail-it1-x12b.google.com (unknown [2607:f8b0:4864:20::12b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bb768f7e-7aef-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 11:09:27 +0000 (UTC)
Received: by mail-it1-x12b.google.com with SMTP id e184so22443721ite.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 04:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j+dkwLbavckiyrM81pEdw05iHl1/oSnNbQ2AunoJk/E=;
 b=RYDMkR7oVh1qUPQAcaSSlvoyTm13G8F59UUn2eRgqKNfyzhRA8pu+hlgxDp6XY+YAc
 H15KK1cQY6+DT+0W9xMgLZCnkWHhRM3dqargWm2Q9imWlCgG4csfvV5/a3KcIO+vse/r
 UPZsvvH5buzHQ7r6a0rrH4JBbhlQP/6r7Rlyjv3wX8ucmdCWMbPqDJligUipwuFNoUUB
 xzhJbLV3cavoCdvwr5nisT7JQdGuv3oFdlERwWWqGQgoS1+RwLXqi92XUJBaimEK7S4O
 vBzLzGwc/06ARc2TIlA3Eqa8HXyt4+5OoyrPEVrCjjabdD+3Eqmz1M0hKmd6XSSwwX8/
 v/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j+dkwLbavckiyrM81pEdw05iHl1/oSnNbQ2AunoJk/E=;
 b=e0rGPdGT8G23nMdCXl1EnBX7dC7Ub5KHg+quDE4w8PHsU8kY1XActA4hXwPMnZalMP
 pkKHUeGV02z+l7/+eWzd0rZtp6/YCF+K4wlOcAzhGVedkkTwzvvA1NLqwgDwoUkiNfF1
 OjdRaz6NCiyer23uhVyIerwAQJck9vFSJN3ztNMSLOFbMIA4uNp3GpfvjVW/rhHSODVh
 DV3gc/RmLNKhmM7p0yq8jv3cQArcCGAmiPcX0z5fcMD3gDD8s9nD2qv4mqWfL8SAS03i
 EHIzK6//mqSVBMFfDoEIC1h0Xk6SLuFFJx9SpRA5sru94Dl9TWfklzsf0k8ZXfvy1vS8
 Rd1Q==
X-Gm-Message-State: APjAAAWYVAsfk/CIkdO5s2He6UeoYlhpJ8MYBFP2VFggRZVqbjtvW4gK
 2nJTMOEgrojXmCp1rQ+sSch2CrM4ItKGSiOCpVg=
X-Google-Smtp-Source: APXvYqy3aSfzBzvmiqctEhX5e1MOYila1+lM3DQ1++J9wgm7gvcUzirAJ8rrTiEZB1fTSrbhrgEhIyzp+RSIyofPXd4=
X-Received: by 2002:a24:ac52:: with SMTP id m18mr21925910iti.146.1558350566876; 
 Mon, 20 May 2019 04:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190516132016.8032-1-viktor.mitin.19@gmail.com>
 <37a3a6c6-7de4-e496-5619-00f31e8e338f@arm.com>
 <20190517064745.GA14853@localhost>
 <9bc2b400-c65d-3761-869d-4cad2d8959c4@arm.com>
In-Reply-To: <9bc2b400-c65d-3761-869d-4cad2d8959c4@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Mon, 20 May 2019 14:09:15 +0300
Message-ID:
 <CAOcoXZbePVees-YE2gnb2ghOzix-qN8uo6F=NRiowguuVb7WQA@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH v2] coverage: filter out libfdt.o and
 libelf.o
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190520110915.5brF4gX_ZVjdmaqV-BUlZG0gBO2HlZjppZsL42yrs7c@z>

PiA+IFRoYW5rIHlvdSBmb3IgZGV0YWlsZWQgZGVzY3JpcHRpb24gcHJvdmlkZWQuCj4gPiBXaWxs
IHRha2UgaW50byBjb25zaWRlcmF0aW9uIGFsbCB0aGUgbm90ZXMuCj4KPiBEb2VzIGl0IG1lYW4g
eW91IGFyZSBoYXBweSB3aXRoIHRoZSBjb21taXQgbWVzc2FnZSBJIHN1Z2dlc3RlZD8KClllcywg
SSdtIGhhcHB5IHdpdGggdGhlIGNvbW1pdCBtZXNzYWdlIHlvdSBzdWdnZXN0ZWQuClBsZWFzZSBs
ZXQgbWUga25vdyBpZiBJIHNob3VsZCByZXNlbmQgdGhlIHVwZGF0ZWQgcGF0Y2guCgpUaGFua3MK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
