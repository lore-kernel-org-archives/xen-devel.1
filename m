Return-Path: <SRS0=pwZ6=TG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DFCC04AAA
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 09:27:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE2CD2082F
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 09:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE2CD2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNZtW-0005Y8-6k; Mon, 06 May 2019 09:26:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNZtV-0005Y1-3r
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 09:26:45 +0000
X-Inumbo-ID: 0f971a03-6fe1-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0f971a03-6fe1-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 09:26:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 03:26:42 -0600
Message-Id: <5CCFFDCE020000780022C193@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 03:26:38 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <7AA9A73D020000CCA2327079@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] Fwd: [xen-unstable bisection] complete
 test-amd64-i386-xl-qemut-ws16-amd64
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190506092638.qj4m1CLlGnxqz3bJPVoJwNt1hUEe93ENXUgIIjbfCa8@z>

UGF1bCwKCj4+PiBPbiAwNS4wNS4xOSBhdCAxMjo1NCwgPG9zc3Rlc3QtYWRtaW5AeGVucHJvamVj
dC5vcmc+IHdyb3RlOgo+IGJyYW5jaCB4ZW4tdW5zdGFibGUKPiB4ZW5icmFuY2ggeGVuLXVuc3Rh
YmxlCj4gam9iIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dC13czE2LWFtZDY0Cj4gdGVzdGlkIHdp
bmRvd3MtaW5zdGFsbAo+IAo+IFRyZWU6IGxpbnV4IGdpdDovL3hlbmJpdHMueGVuLm9yZy9saW51
eC1wdm9wcy5naXQKPiBUcmVlOiBsaW51eGZpcm13YXJlIGdpdDovL3hlbmJpdHMueGVuLm9yZy9v
c3N0ZXN0L2xpbnV4LWZpcm13YXJlLmdpdAo+IFRyZWU6IHFlbXUgZ2l0Oi8veGVuYml0cy54ZW4u
b3JnL3FlbXUteGVuLXRyYWRpdGlvbmFsLmdpdAo+IFRyZWU6IHFlbXV1IGdpdDovL3hlbmJpdHMu
eGVuLm9yZy9xZW11LXhlbi5naXQKPiBUcmVlOiB4ZW4gZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3hl
bi5naXQKPiAKPiAqKiogRm91bmQgYW5kIHJlcHJvZHVjZWQgcHJvYmxlbSBjaGFuZ2VzZXQgKioq
Cj4gCj4gICBCdWcgaXMgaW4gdHJlZTogIHhlbiBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcveGVuLmdp
dAo+ICAgQnVnIGludHJvZHVjZWQ6ICAyNmZiYTNjODU1NzEzNTRlY2IxYTFhM2RkZTc3ZmIzODYz
MzUxNWQzCj4gICBCdWcgbm90IHByZXNlbnQ6IGE4NTA4OWQwZWY1N2EwOGZlOTc4NjQ1NzllZTA1
NWMxMmZkOGE5MjgKPiAgIExhc3QgZmFpbCByZXBybzogaHR0cDovL2xvZ3MudGVzdC1sYWIueGVu
cHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNTc0NC8gCj4gCj4gCj4gICBjb21taXQgMjZmYmEz
Yzg1NTcxMzU0ZWNiMWExYTNkZGU3N2ZiMzg2MzM1MTVkMwo+ICAgQXV0aG9yOiBQYXVsIER1cnJh
bnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+ICAgRGF0ZTogICBUdWUgTWFyIDE5IDE2OjI5
OjAwIDIwMTkgKzAxMDAKPiAgIAo+ICAgICAgIHZpcmlkaWFuOiBhZGQgaW1wbGVtZW50YXRpb24g
b2Ygc3ludGhldGljIHRpbWVycwo+ICAgICAgIAo+ICAgICAgIFRoaXMgcGF0Y2ggaW50cm9kdWNl
cyBhbiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgU1RJTUVSMC0xNV9DT05GSUcvQ09VTlQgTVNScwo+
ICAgICAgIGFuZCBoZW5jZSBhIHRoZSBmaXJzdCBTeW5JQyBtZXNzYWdlIHNvdXJjZS4KPiAgICAg
ICAKPiAgICAgICBUaGUgbmV3IChhbmQgZG9jdW1lbnRlZCkgJ3N0aW1lcicgdmlyaWRpYW4gZW5s
aWdodGVubWVudCBncm91cCBtYXkgYmUKPiAgICAgICBzcGVjaWZpZWQgdG8gZW5hYmxlIHRoaXMg
ZmVhdHVyZS4KPiAgICAgICAKPiAgICAgICBXaGlsZSBpbiB0aGUgbmVpZ2hib3VyaG9vZCwgdGhp
cyBwYXRjaCBhZGRzIGEgbWlzc2luZyBjaGVjayBmb3IgYW4KPiAgICAgICBhdHRlbXB0IHRvIHdy
aXRlIHRoZSB0aW1lIHJlZmVyZW5jZSBjb3VudCBNU1IsIHdoaWNoIHNob3VsZCByZXN1bHQgaW4g
YW4KPiAgICAgICBleGNlcHRpb24gKGJ1dCBub3QgYmUgcmVwb3J0ZWQgYXMgYW4gdW5pbXBsZW1l
bnRlZCBNU1IpLgo+ICAgICAgIAo+ICAgICAgIE5PVEU6IEl0IGlzIG5lY2Vzc2FyeSBmb3IgY29y
cmVjdCBvcGVyYXRpb24gdGhhdCB0aW1lciBleHBpcmF0aW9uIGFuZAo+ICAgICAgICAgICAgIG1l
c3NhZ2UgZGVsaXZlcnkgdGltZS1zdGFtcGluZyB1c2UgdGhlIHNhbWUgdGltZSBzb3VyY2UgYXMg
dGhlIGd1ZXN0Lgo+ICAgICAgICAgICAgIFRoZSBzcGVjaWZpY2F0aW9uIGlzIGFtYmlndW91cyBi
dXQgdGVzdGluZyB3aXRoIGEgV2luZG93cyAxMCAxODAzCj4gICAgICAgICAgICAgZ3Vlc3QgaGFz
IHNob3duIHRoYXQgdXNpbmcgdGhlIHBhcnRpdGlvbiByZWZlcmVuY2UgY291bnRlciBhcyBhCj4g
ICAgICAgICAgICAgc291cmNlIHdoaWxzdCB0aGUgZ3Vlc3QgaXMgdXNpbmcgUkRUU0MgYW5kIHRo
ZSByZWZlcmVuY2UgdHNjIHBhZ2UKPiAgICAgICAgICAgICBkb2VzIG5vdCB3b3JrIGNvcnJlY3Rs
eS4gVGhlcmVmb3JlIHRoZSB0aW1lX25vdygpIGZ1bmN0aW9uIGlzIHVzZWQuCj4gICAgICAgICAg
ICAgVGhpcyBpbXBsZW1lbnRzIHRoZSBhbGdvcml0aG0gZm9yIGFjcXVpcmluZyBwYXJ0aXRpb24g
cmVmZXJlbmNlIHRpbWUKPiAgICAgICAgICAgICB0aGF0IGlzIGRvY3VtZW50ZWQgaW4gdGhlIHNw
ZWNpZmljdGlvbi4KPiAgICAgICAKPiAgICAgICBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+ICAgICAgIEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgo+ICAgICAgIFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgpKdXN0IGluIGNhc2UgeW91J3ZlIG5vdCBub3RpY2VkIHRoaXMuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
