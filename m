Return-Path: <SRS0=r6zo=T4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D17FC04AB6
	for <xen-devel@archiver.kernel.org>; Tue, 28 May 2019 09:24:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E302A2075B
	for <xen-devel@archiver.kernel.org>; Tue, 28 May 2019 09:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E302A2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVYKm-0006r5-Pc; Tue, 28 May 2019 09:23:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ExCW=T4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hVYKl-0006r0-3p
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 09:23:51 +0000
X-Inumbo-ID: 4d94d00c-812a-11e9-a2d2-e78017b294de
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4d94d00c-812a-11e9-a2d2-e78017b294de;
 Tue, 28 May 2019 09:23:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E488D341;
 Tue, 28 May 2019 02:23:49 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22BBB3F59C;
 Tue, 28 May 2019 02:23:47 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <c31fb2f8-1703-61db-fd7d-f41db6a137d8@arm.com>
 <d94e7186-5f5d-1d93-4462-af18ba7da018@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <bb5aa1e6-f927-5f96-dbd7-1582da1733f3@arm.com>
Date: Tue, 28 May 2019 10:23:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d94e7186-5f5d-1d93-4462-af18ba7da018@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC 2] [DO NOT APPLY] introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wei.liu2@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190528092346.xGFs2T6evZsgsbv6Q4_3CJsC-mFtsYTcKguVHHiUq0k@z>

CgpPbiAyOC8wNS8yMDE5IDEwOjE3LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKPiAKPiBPbiAyOC4wNS4xOSAxMTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBJIGFtIG5v
dCBhbnN3ZXJpbmcgb24gdGhlIGNvbnRlbnQgeWV0LCBJIHdpbGwgZG8gdGhhdCBzZXBhcmF0ZWx5
LiBUaGUgCj4+IHRocmVhZGluZyBmb3IgdGhpcyBzZXJpZXMgbG9va3MgcXVpdGUgY29uZnVzaW5n
LiBUaGUgaGVhZCBvZiB0aGUgdGhyZWFkIGlzIAo+PiB0aGlzIHBhdGNoIChpLmUgUkZDIDIpIGJ1
dCB0aGVuIHlvdSBoYXZlIGEgY292ZXIgbGV0dGVyIHdpdGhpbiB0aGUgdGhyZWFkIAo+PiB0YWdn
ZWQgIlYzIi4KPiAKPiBBY3R1YWxseSBJJ3ZlIG5vdGljZWQgdGhlIG1hbmdsZWQgdGhyZWFkaW5n
LiBCdXQgbm90IHN1cmUgd2h5IGl0IGlzIHNvLiBJIGp1c3QgCj4gcGFzc2VkIGEgZm9sZGVyIHdp
dGggdGhvc2UgcGF0Y2hlcyB0byBnaXQtc2VuZC1tYWlsLgoKSUlSQywgZ2l0LXNlbmQtZW1haWwg
d2lsbCB1c2UgdGhlIGZpcnN0IGUtbWFpbCBpbiB0aGUgYWxwaGFiZXRpY2FsIG9yZGVyIGFzIHRo
ZSAKInRvcCBlLW1haWwiIGFuZCBhbGwgdGhlIG90aGVyIHdpbGwgYmUgc2VuZCAiSW4tUmVwbHkt
VG8iLgoKPiAKPj4gwqBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kLCB0aGUgMiBlLW1haWxzIHRhZ2dl
ZCAiVjMiIGlzIHRoZSBvcmlnaW5hbCB2ZXJzaW9uIAo+PiB3aGVyZSBhcyBSRkMgMiBhbmQgUkZD
IDMgYXJlIHZhcmlhbnRzLiBBbSBJIGNvcnJlY3Q/Cj4gCj4gWWVzLCBzdXJlLgo+IAo+PiBJZiBz
bywgZm9yIG5leHQgdGltZSwgSSB3b3VsZCByZWNvbW1lbmQgdG8gaGF2ZSB0aGUgY292ZXIgbGV0
dGVyIGZpcnN0IGFuZCAKPj4gdGhlbiBhbGwgdGhlIHBhdGNoZXMgc2VuZCAiSW4tUmVwbHktVG8i
IHRoZSBjb3ZlciBsZXR0ZXIuIFRoaXMgbWFrZXMgZWFzaWVyIHRvIAo+PiB0cmFjayBzZXJpZXMu
Cj4gCj4gSXQgbWlnaHQgaGVscC4gQnV0IGJlZm9yZSBpdCB3b3JrZWQgd2VsbCB3aXRob3V0IGFk
ZGl0aW9uYWwgdHJpY2tzLgoKSW4gZ2VuZXJhbCwgYWxsIHRoZSBwYXRjaCBzZW50IGFyZSBzdGFy
dGluZyB3aXRoIGEgbnVtYmVyIGZvbGxvd2VkIGJ5IHRoZSB0aXRsZS4gClRoZSBudW1iZXIgZW5z
dXJlIHRoZSBjb3JyZWN0IG9yZGVyaW5nLiBJZiB5b3UgZG9uJ3QgaGF2ZSBudW1iZXIgdGhlbiwg
eW91IHdpbGwgCmZhbGxiYWNrIHRvIGFscGhhYmV0aWNhbCBvcmRlci4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
