Return-Path: <SRS0=Vyxr=4T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E044C3F2D1
	for <xen-devel@archiver.kernel.org>; Mon,  2 Mar 2020 09:22:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA62A24695
	for <xen-devel@archiver.kernel.org>; Mon,  2 Mar 2020 09:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA62A24695
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8hGd-0003Pg-5b; Mon, 02 Mar 2020 09:21:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xlOq=4T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j8hGc-0003Pb-FC
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 09:21:38 +0000
X-Inumbo-ID: 374dd03c-5c67-11ea-9f10-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 374dd03c-5c67-11ea-9f10-12813bfff9fa;
 Mon, 02 Mar 2020 09:21:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 17355AFD7;
 Mon,  2 Mar 2020 09:21:36 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9b3423b9-6cf1-1cc3-5011-f383979f12aa@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1e2f5c00-9633-96b0-9dc8-7d808cde8c2a@suse.com>
Date: Mon, 2 Mar 2020 10:21:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9b3423b9-6cf1-1cc3-5011-f383979f12aa@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] credit2: avoid NULL deref in
 csched2_res_pick() when tracing
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
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDMuMjAgMDk6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZSBpc3N1ZSBoZXJlIHJl
c3VsdHMgZnJvbSBvbmUgb2YgdGhlIGRvd25zaWRlcyBvZiB1c2luZyBnb3RvOiBUaGUKPiBlYXJs
eSAiZ290byBvdXQiIGFuZCAiZ290byBvdXRfdXAiIGluIHRoZSBmdW5jdGlvbiB2ZXJ5IGNsZWFy
bHkgYnlwYXNzCj4gYW55IHBvc3NpYmxlIGluaXRpYWxpemF0aW9uIG9mIG1pbl9ycWQsIHlldCB0
aGUgdHJhY2luZyBjb2RlIGF0IHRoZSBlbmQKPiBvZiB0aGUgZnVuY3Rpb24gY29uc3VtZXMgdGhl
IHZhbHVlLiBUaGVyZSdzIGV2ZW4gYSBjb21tZW50IHJlZ2FyZGluZyB0aGUKPiB0cmFjZSByZWNv
cmQgbm90IGJlaW5nIGFjY3VyYXRlIGluIHRoaXMgY2FzZS4KPiAKPiBDSUQ6IDE0NjA0MzIKPiBG
aXhlczogOWM4NGJjMDA0NjUzICgic2NoZWQ6IHJld29yayBjcmVkaXQyIHJ1bi1xdWV1ZSBhbGxv
Y2F0aW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
