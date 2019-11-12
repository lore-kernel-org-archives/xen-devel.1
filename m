Return-Path: <SRS0=/kPz=ZE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C39CC43331
	for <xen-devel@archiver.kernel.org>; Tue, 12 Nov 2019 16:10:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE84120679
	for <xen-devel@archiver.kernel.org>; Tue, 12 Nov 2019 16:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE84120679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUYkS-0002Qx-AA; Tue, 12 Nov 2019 16:10:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ifzZ=ZE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iUYkR-0002Qc-6Y
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 16:10:31 +0000
X-Inumbo-ID: f25addfa-0566-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f25addfa-0566-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 16:10:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9AFF7AE61;
 Tue, 12 Nov 2019 16:10:29 +0000 (UTC)
To: George Dunlap <George.Dunlap@citrix.com>
References: <20191108073837.5797-1-jgross@suse.com>
 <A1DBEE0C-4CE9-41A0-B8C9-B22FE6844D5C@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0ab4de46-0f34-5080-01c5-143eb467a04c@suse.com>
Date: Tue, 12 Nov 2019 17:10:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <A1DBEE0C-4CE9-41A0-B8C9-B22FE6844D5C@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: remove wrong assertions in
 csched2_free_pdata()
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
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTEuMTkgMTY6NTIsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gCj4gCj4+IE9uIE5vdiA4
LCAyMDE5LCBhdCA3OjM4IEFNLCBKdWVyZ2VuIEdyb3NzIDxKR3Jvc3NAc3VzZS5jb20+IHdyb3Rl
Ogo+Pgo+PiBUaGUgYXNzZXJ0aW9ucyBpbiBjc2NoZWQyX2ZyZWVfcGRhdGEoKSBhcmUgd3Jvbmcg
YXMgaW4gY2FzZSBpdCBpcwo+PiBjYWxsZWQgYnkgc2NoZWR1bGVfY3B1X2FkZCgpIGFmdGVyIGEg
ZmFpbHVyZSBvZiBzY2hlZF9hbGxvY191ZGF0YSgpCj4+IHRoZSBpbml0IHBkYXRhIGZ1bmN0aW9u
IHdvbid0IGhhdmUgYmVlbiBjYWxsZWQuCj4gCj4gSeKAmW0gYSBiaXQgY29uZnVzZWQgYnkgdGhp
cywgYXMgdGhlIGNvbW1lbnQgc2F5cyB0aGF0IHRoZSBBU1NFUlQoKXMgc2hvdWxkIGJlIE9LIHdp
dGggdGhhdCBjYXNlOyBpLmUuLCB0aGF0IHRoZXkgc2hvdWxkIGNoZWNrICplaXRoZXIqIHRoYXQg
cGRhdGEgaGFzbuKAmXQgYmVlbiBjYWxsZWQsIG9yIHRoYXQgZGluaXRfcGRhdGEoKSBoYXMgYmVl
biBjYWxsZWQ6Cj4gCj4+IC0gICAgICogeGZyZWUoKSBkb2VzIG5vdCByZWFsbHkgbWluZCwgYnV0
IHdlIHdhbnQgdG8gYmUgc3VyZSB0aGF0IGVpdGhlcgo+PiAtICAgICAqIGluaXRfcGRhdGEgaGFz
IG5ldmVyIGJlZW4gY2FsbGVkLCBvciBkZWluaXRfcGRhdGEgaGFzIGJlZW4gY2FsbGVkCj4+IC0g
ICAgICogYWxyZWFkeS4KPiAKPiBTbyB3aGljaCBvZiB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMg
d2lsbCBmYWlsIGlmIHNjaGVkX2FsbG9jX3VkYXRhKCkgZmFpbHM/ICBJdCBsb29rcyB0byBtZSBs
aWtlIHRoZXkgc2hvdWxkIGJvdGggYmUgZmluZS4KCllvdSBhcmUgcmlnaHQsIHRoaXMgcGF0Y2gg
aXMgbm90IG5lZWRlZC4KClNvcnJ5IGZvciB0aGUgbm9pc2UsCgoKSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
