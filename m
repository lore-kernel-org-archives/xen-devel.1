Return-Path: <SRS0=uIqA=3S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86934C33CB2
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jan 2020 11:12:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61F0B207FF
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jan 2020 11:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61F0B207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwlGs-0000tO-Uc; Wed, 29 Jan 2020 11:12:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwlGq-0000tI-Q4
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 11:12:32 +0000
X-Inumbo-ID: 3de7509d-4288-11ea-8884-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3de7509d-4288-11ea-8884-12813bfff9fa;
 Wed, 29 Jan 2020 11:12:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7F54FB1EC;
 Wed, 29 Jan 2020 11:12:31 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200129101643.1394-1-pdurrant@amazon.com>
 <20200129101643.1394-3-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7fb63c3a-3ff1-c660-522b-0062029e252a@suse.com>
Date: Wed, 29 Jan 2020 12:12:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129101643.1394-3-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/4] mm: modify domain_adjust_tot_pages()
 to better handle a zero adjustment
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxMToxNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IEN1cnJlbnRseSB0aGUg
ZnVuY3Rpb24gd2lsbCBwb2ludGxlc3NseSBhY3F1aXJlIGFuZCByZWxlYXNlIHRoZSBnbG9iYWwK
PiAnaGVhcF9sb2NrJyBpbiB0aGlzIGNhc2UuCj4gCj4gTk9URTogTm8gY2FsbGVyIHlldCBjYWxs
cyBkb21haW5fYWRqdXN0X3RvdF9wYWdlcygpIHdpdGggYSB6ZXJvICdwYWdlcycKPiAgICAgICBh
cmd1bWVudCwgYnV0IGEgc3Vic2VxdWVudCBwYXRjaCB3aWxsIG1ha2UgdGhpcyBwb3NzaWJsZS4K
CldpdGggdGhpcyBtZW1vcnlfZXhjaGFuZ2UoKSwgYXMgcHJldmlvdXNseSBpbmRpY2F0ZWQsIG5v
dyBuZWVkbGVzc2x5CnByZXZlbnRzIHRoZSBjYWxsIHdoZW4gIWRlY19jb3VudC4gSSBkbyB0aGlu
aywgYXMgc2FpZCB0aGVyZSwgdGhhdAp0b2dldGhlciB3aXRoIHRoZSBhZGRpdGlvbiBoZXJlIHRo
ZW4gcmVkdW5kYW50IGNoZWNrcyBpbiBjYWxsZXJzCnNob3VsZCBiZSBkcm9wcGVkIChhbmQgYXMg
aXQgbG9va3MgdGhlIG5hbWVkIG9uZSBpcyB0aGUgb25seSBvbmUpLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
