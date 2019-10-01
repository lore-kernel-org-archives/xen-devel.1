Return-Path: <SRS0=k/ot=X2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0E2C352AA
	for <xen-devel@archiver.kernel.org>; Tue,  1 Oct 2019 12:02:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1277220700
	for <xen-devel@archiver.kernel.org>; Tue,  1 Oct 2019 12:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1277220700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFGqp-0004kM-M4; Tue, 01 Oct 2019 12:01:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFGqo-0004kH-Pn
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 12:01:54 +0000
X-Inumbo-ID: 41d83477-e443-11e9-96f9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 41d83477-e443-11e9-96f9-12813bfff9fa;
 Tue, 01 Oct 2019 12:01:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E27CAAC26;
 Tue,  1 Oct 2019 12:01:52 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191001082818.34233-1-paul.durrant@citrix.com>
 <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
 <115d4e7e-610c-842b-49ac-ab735f7e85df@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <703a0450-4b62-91b9-eb0e-cc93a956cd89@suse.com>
Date: Tue, 1 Oct 2019 14:01:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <115d4e7e-610c-842b-49ac-ab735f7e85df@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxMzowOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8xMC8yMDE5
IDA5OjQ2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDEuMTAuMjAxOSAxMDoyOCwgUGF1bCBE
dXJyYW50IHdyb3RlOgo+Pj4gTm93IHRoYXQgeGwuY2ZnIGhhcyBhbiBvcHRpb24gdG8gZXhwbGlj
aXRseSBlbmFibGUgSU9NTVUgbWFwcGluZ3MgZm9yIGEKPj4+IGRvbWFpbiwgbWlncmF0aW9uIG1h
eSBiZSBuZWVkbGVzc2x5IHZldG9lZCBkdWUgdG8gdGhlIGNoZWNrIG9mCj4+PiBpc19pb21tdV9l
bmFibGVkKCkgaW4gcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUoKS4KPj4+IFRoZXJlIGlzIGFjdHVh
bGx5IG5vIG5lZWQgdG8gcHJldmVudCBsb2dkaXJ0eSBmcm9tIGJlaW5nIGVuYWJsZWQgdW5sZXNz
Cj4+PiBkZXZpY2VzIGFyZSBhc3NpZ25lZCB0byBhIGRvbWFpbiBhbmQgdGhhdCBkb21haW4gaXMg
c2hhcmluZyBIQVAgbWFwcGluZ3MKPj4+IHdpdGggdGhlIElPTU1VIChpbiB3aGljaCBjYXNlIGRp
c2FibGluZyB3cml0ZSBwZXJtaXNzaW9ucyBpbiB0aGUgUDJNIG1heQo+Pj4gY2F1c2UgRE1BIGZh
dWx0cykuCj4+IEJ1dCB0aGF0J3MgdGFraW5nIGludG8gYWNjb3VudCBvbmx5IGhhbGYgb2YgdGhl
IHJlYXNvbiBvZiB0aGUKPj4gZXhjbHVzaW9uLiBUaGUgb3RoZXIgaGFsZiBpcyB0aGF0IGFzc2ln
bmVkIGRldmljZXMgbWF5IGNhdXNlIHBhZ2VzCj4+IHRvIGJlIGRpcnRpZWQgYmVoaW5kIHRoZSBi
YWNrIG9mIHRoZSBsb2ctZGlydHkgbG9naWMuCj4gCj4gTm8uwqAgVmVyeSBzcGVjaWZpY2FsbHkg
bm90Lgo+IAo+IFhlbiBjYW5ub3QgY29ycmVjdGx5IGV2YWx1YXRlIHdoZXRoZXIgYSBkb21haW4g
aXMgbWlncmF0ZWFibGUgb3Igbm90LAo+IGFuZCB0aGVyZWZvcmUgaXMgdW5hYmxlIHRvIG1ha2Ug
YSBjb3JyZWN0IHZldG8gZGVjaXNpb24uCgpUaGVuIGl0IHNob3VsZCBiZSBwdXQgaW4gdGhlIHBv
c2l0aW9uLCBzaG91bGRuJ3QgaXQ/IExpa2Ugd2l0aCB0aGUKc3VnZ2VzdGVkIHJlcG9ydGluZyBv
ZiB3aGF0IGRldmljZXMgaGF2ZSBsb2ctZGlydHkgaGFuZGxpbmcgdGFrZW4gY2FyZQpvZiAod2hp
Y2gsIHRvIHRha2UgaW50byBhY2NvdW50IGEgcmVtYXJrIGJ5IFBhdWwsIEkgdGhpbmsgc2hvdWxk
IGdvCndpdGhvdXQgc2F5aW5nIGZvciBlbXVsYXRlZCBkZXZpY2VzKS4KCj4gVGhlIGV4aXN0aW5n
IERPTUNUTF9kaXNhYmxlX21pZ3JhdGUgaXMgYm9ndXMgYW5kIEknbSBpbiB0aGUgcHJvY2VzcyBv
Zgo+IHB1cmdpbmcgaXQgZnJvbSBYZW4uCgpUaGF0IGRvbWN0bCBpcyBwcmV0dHkgbXVjaCBvcnRo
b2dvbmFsIEkgdGhpbmsuCgo+IEFsc28sIEkgc2VlbSB0byByZWNhbGwgbmFja2luZyB0aGlzIGNo
YW5nZSBvcmlnaW5hbGx5LCBzcGVjaWZpY2FsbHkgb24KPiB0aGUgYmFzaXMgdGhhdCBpdCBicmVh
a3MgbGl2ZSBtaWdyYXRpb24gd2l0aCBHUFVzLCBzbyBJJ20gcmF0aGVyCj4gY29uZnVzZWQgdG8g
ZmluZCB0aGUgY29kZSBwcmVzZW50Li4uCgpJJ3ZlIGdvbmUgYW5kIGNoZWNrZWQgLSB0aGVyZSdz
IG5vIHJlc3BvbnNlIGJ5IHlvdSB0aGF0IEkgY291bGQgZmluZCBpbgp0aGUgbGlzdCBhcmNoaXZl
cyBvbiBhbnkgb2YgdGhlIHYyIHRocm91Z2ggdjQgc3VibWlzc2lvbnMgYnkgUm9nZXIgKGluCnRo
ZSBBcHJpbC1KdW5lIDIwMTQgdGltZSBmcmFtZTsgdjEgbG9va3MgdG8gbm90IGhhdmUgaGFkIHRo
aXMgY2hhbmdlIHlldCkuCkhlbmNlIGl0IGJlY2FtZSBjb21taXQgMzcyMDFjNjIwMy4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
