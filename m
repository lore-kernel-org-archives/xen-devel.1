Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11D5C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 10:51:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B74E52075B
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 10:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B74E52075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=FreeBSD.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGLfx-00026F-FN; Tue, 16 Apr 2019 10:50:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uIRg=SS=freebsd.org=royger@srs-us1.protection.inumbo.net>)
 id 1hGLfw-00026A-H2
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 10:50:52 +0000
X-Inumbo-ID: 7f2d602c-6035-11e9-92d7-bc764e045a96
Received: from mx2.freebsd.org (unknown [8.8.178.116])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7f2d602c-6035-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 10:50:49 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id A6C488B3CF;
 Tue, 16 Apr 2019 10:50:47 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id AB94186AB4;
 Tue, 16 Apr 2019 10:50:46 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from localhost (170.red-83-36-13.dynamicip.rima-tde.net
 [83.36.13.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate) (Authenticated sender: royger)
 by smtp.freebsd.org (Postfix) with ESMTPSA id EF32F12427;
 Tue, 16 Apr 2019 10:50:45 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Date: Tue, 16 Apr 2019 12:50:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <royger@FreeBSD.org>
To: PGNet Dev <pgnet.dev@gmail.com>
Message-ID: <20190416105043.nbvx522kqy3p3svx@Air-de-Roger.citrite.net>
References: <21708669-ac14-d8f8-d513-a7e745c65861@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21708669-ac14-d8f8-d513-a7e745c65861@gmail.com>
User-Agent: NeoMutt/20180716
X-Rspamd-Queue-Id: AB94186AB4
X-Spamd-Bar: --
Authentication-Results: mx1.freebsd.org
X-Spamd-Result: default: False [-2.96 / 15.00]; TAGGED_RCPT(0.00)[];
 local_wl_from(0.00)[FreeBSD.org];
 NEURAL_HAM_SHORT(-0.96)[-0.963,0];
 NEURAL_HAM_MEDIUM(-1.00)[-0.998,0];
 ASN(0.00)[asn:11403, ipnet:96.47.64.0/20, country:US];
 NEURAL_HAM_LONG(-1.00)[-1.000,0]
Subject: Re: [Xen-devel] Xen 4.12.0 Dom0=pvh mode EFI variables 'not
 supported' after boot
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416105043.8DKzrTSFMc2pU7vZOjNepeucAp85lJzFkUARMQR2Vio@z>

QWRkaW5nIHRoZSBMaW51eCBYZW4gbWFpbnRhaW5lcnMsIGluIGNhc2UgdGhleSBjYW4gcHJvdmlk
ZSBzb21lIGluc2lnaHQuCgpPbiBNb24sIEFwciAxNSwgMjAxOSBhdCAwMzoyNzo0M1BNIC0wNzAw
LCBQR05ldCBEZXYgd3JvdGU6Cj4gcmVmOiBmcm9tIGNoYXQgaW4gI3hlbgo+IAo+IAlbMDg6NTNd
IDxyb3lnZXI+IHBnbmQ6IHdvdWxkIGJlIGdvb2QgdG8gc2VuZCBhbiBlbWFpbCBzbyB3ZSBjYW4g
a2VlcCB0cmFjayBvZiB0aGlzIGluIGEgbW9yZSBmb3JtYWwgd2F5Lgo+IAo+IEkndmUgZ290IFhl
biBQViBEb20wIGJvb3RlZCBvbiBhIExpbnV4IFVFRkkgYm94Cj4gCj4gCWRtZXNnIHwgZ3JlcCAt
aSAieGVuIHZlcnNpb24iCj4gCQlbICAgIDEuMTg1OTk2XSBYZW4gdmVyc2lvbjogNC4xMi4wXzA5
LWxwMTUwLjY0MCAocHJlc2VydmUtQUQpCj4gCj4gCXVuYW1lIC1ybQo+IAkJNS4wLjctbHAxNTAu
NS5nMDEyYjVmMS1kZWZhdWx0IHg4Nl82NAo+IAo+IAlsc2JfcmVsZWFzZSAtcmQKPiAJCURlc2Ny
aXB0aW9uOiAgICBvcGVuU1VTRSBMZWFwIDE1LjAKPiAJCVJlbGVhc2U6ICAgICAgICAxNS4wCj4g
Cj4gCXJwbSAtcWEgfCBncmVwIC1pIHFlbXUgfCBlZ3JlcCAic2VhYmlvc3x1LTMiCj4gCQlxZW11
LXNlYWJpb3MtMS4xMi4wLWxwMTUwLjUxMy4xMy5ub2FyY2gKPiAJCXFlbXUtMy4xLjAtbHAxNTAu
NTEzLjEzLng4Nl82NAo+IAo+IAlycG0gLXFhIHwgZ3JlcCAtaSBvdm1mCj4gCQlvdm1mLXRvb2xz
LTIwMTkrZ2l0MTU1MjA1OTg5OS44OTkxMGEzOWRjZmQtbHAxNTAuMTAwLjMueDg2XzY0Cj4gCQlx
ZW11LW92bWYteDg2XzY0LTIwMTkrZ2l0MTU1MjA1OTg5OS44OTkxMGEzOWRjZmQtbHAxNTAuMTAw
LjMubm9hcmNoCj4gCQlvdm1mLTIwMTkrZ2l0MTU1MjA1OTg5OS44OTkxMGEzOWRjZmQtbHAxNTAu
MTAwLjMueDg2XzY0Cj4gCj4gCXJwbSAtcWEgfCBncmVwIGdydWIyIHxlZ3JlcCAieGVufGVmaSIK
PiAJCWdydWIyLXg4Nl82NC1lZmktMi4wMi1scDE1MC42NC4xMC5ub2FyY2gKPiAJCWdydWIyLXg4
Nl82NC14ZW4tMi4wMi1scDE1MC42NC4xMC5ub2FyY2gKPiAmCj4gCj4gCXJwbSAtcWEgfCBncmVw
IC1pIGVmaSB8IGdyZXAgZ2l0IHwgc29ydAo+IAkJZWZpYm9vdG1nci05OTkuZ2l0LjIwMTkwMzA2
LjQzOGJhOTYtbHAxNTAuNy4yMi54ODZfNjQKPiAJCWVmaXZhci1kZXZlbC05OTkuZ2l0LjIwMTkw
MzA1LjgzNjQ2MWUtbHAxNTAuNi4yMS54ODZfNjQKPiAJCWxpYmVmaXZhcjEtOTk5LmdpdC4yMDE5
MDMwNS44MzY0NjFlLWxwMTUwLjYuMjEueDg2XzY0Cj4gCj4gbm90ZSB0aGVzZV5eIEVGSSogdG9v
bHMgLS0gc3JjIGZyb20gZWZpIG1hc3RlciBicmFuY2gsIHBrZ3MgYXZhaWxhYmxlIGhlcmUsCj4g
Cj4gCWh0dHBzOi8vYnVpbGQub3BlbnN1c2Uub3JnL3BhY2thZ2Uvc2hvdy9ob21lOnBnbmQ6S2Vy
bmVsOnN0YWJsZS9lZml2YXIKPiAJaHR0cHM6Ly9idWlsZC5vcGVuc3VzZS5vcmcvcGFja2FnZS9z
aG93L2hvbWU6cGduZDpLZXJuZWw6c3RhYmxlL2VmaWJvb3RtZ3IKPiAKPiAtLSB3ZXJlIG5lZWRl
ZCwgYXMgZGlzdHJvIHBhY2thZ2VkIHZlcnNpb25zJyB3ZXJlIG9sZC9wcm9ibGVtYXRpYyAuLi4K
PiAKPiBXaXRoIHRoaXNeXiBjb25maWcsIGFsbCdzIHdlbGwKPiAKPiAJc2VyaWFsIGJvb3QgbG9n
Cj4gCQkuLi4KPiAJCVsgICAgMC4wMDAwMDBdIGVmaTogRUZJIHYyLjMxIGJ5IEFtZXJpY2FuIE1l
Z2F0cmVuZHMKPiAJCVsgICAgMC4wMDAwMDBdIGVmaTogIEVTUlQ9MHg5ZWY4ZDk5OCAgQUNQSSAy
LjA9MHg5ZTgxOTAwMCAgQUNQST0weDllODE5MDAwICBTTUJJT1M9MHhmMDRjMCAgTVBTPTB4ZmQ0
OTAKPiAJCVsgICAgMC4wMDAwMDBdIFNNQklPUyAyLjcgcHJlc2VudC4KPiAJCVsgICAgMC4wMDAw
MDBdIEh5cGVydmlzb3IgZGV0ZWN0ZWQ6IFhlbiBQVgo+IAkJWyAgICAwLjAwMDAwMF0gWGVuIHZl
cnNpb24gNC4xMi4KPiAJCS4uLgo+IAo+IGF0IHNoZWxsIHByb21wdCwKPiAKPiAJeGwgbGlzdAo+
IAkJTmFtZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJRCAgIE1lbSBW
Q1BVcyAgICAgIFN0YXRlICAgVGltZShzKQo+IAkJRG9tYWluLTAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMCAgNDAxNiAgICAgNCAgICAgci0tLS0tICAgIDU5NDkuNgo+IAkJ
WGVuc3RvcmUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMSAgICAzMSAgICAg
MSAgICAgLWItLS0tICAgICAgIDAuMgo+IAo+IAllZmlib290bWdyIC12Cj4gCQlCb290Q3VycmVu
dDogMDAwMAo+IAkJVGltZW91dDogMSBzZWNvbmRzCj4gCQlCb290T3JkZXI6IDAwMDAKPiAJCUJv
b3QwMDAwKiBvcGVuU1VTRS1wZ25YRU4gSEQoMixHUFQsOTgwMjYyMjMtZjExZC0zYzY4LThkMzAt
M2Y5ODU2YzhjMjFlLDB4MTAwMCwweDk2MDAwKS9GaWxlKFxFRklcb3BlbnN1c2VcZ3J1Yng2NC5l
ZmkpCj4gCQkgICAgICBkcDogMDQgMDEgMmEgLi4uIDA0IDAwCj4gCj4gZW5hYmxpbmcgUFZIIERv
bTAsIGFkZGluZyB0byBncnViIGNvbmZpZ3MsCj4gCj4gCUdSVUJfQ01ETElORV9MSU5VWF9YRU5f
UkVQTEFDRT0iLi4uIGludGVsX2lvbW11PW9uIC4uLiIKPiAJR1JVQl9DTURMSU5FX1hFTj0iLi4u
IGRvbTA9cHZoIGRvbTAtaW9tbXU9bWFwLXJlc2VydmVkIC4uLiIKPiAKPiB0aGVuIG1raW5pdHJk
ICYgZ3J1YiByZWNvbmZpZywKPiAKPiAJc2VyaWFsIGJvb3QgbG9nCj4gCQlYZW4gNC4xMi4wXzA5
LWxwMTUwLjY0MCAoYy9zICkgRUZJIGxvYWRlcgo+IAkJLi4uCj4gCQkoWEVOKSBbMDAwMDAwMjdk
Y2RlZDQ0ZV0gQm9vdGxvYWRlcjogRUZJCj4gCQkuLi4KPiAJCVVzaW5nIGNvbmZpZ3VyYXRpb24g
ZmlsZSAneGVuLTQuMTIuMF8wOS1scDE1MC42NDAuY2ZnJwo+IAkJLi4uCj4gCQlbICAgIDAuMDAw
MDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMTAwMDAwMDAwLTB4MDAwMDAwMDE2YTJhY2Zm
Zl0gdXNhYmxlCj4gCQlbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMTZh
MmFkMDAwLTB4MDAwMDAwMDg1ZGZmZmZmZl0gdW51c2FibGUKPiAJCVsgICAgMC4wMDAwMDBdIE5Y
IChFeGVjdXRlIERpc2FibGUpIHByb3RlY3Rpb246IGFjdGl2ZQo+IAkJWyAgICAwLjAwMDAwMF0g
U01CSU9TIDIuNyBwcmVzZW50Lgo+IAkJWyAgICAwLjAwMDAwMF0gSHlwZXJ2aXNvciBkZXRlY3Rl
ZDogWGVuIEhWTQo+IAkJWyAgICAwLjAwMDAwMF0gWGVuIHZlcnNpb24gNC4xMi4KPiAJCS4uLgo+
IAo+IE5vdGUsIHRoZXJlIGlzIE5PICJlZmk6IC4uLiIgbG9nIGNvbnRlbnQsIGFzIGluIHRoZSBw
cmlvciwgUFYgbW9kZSBleGFtcGxlLgo+IAo+IGF0IHNoZWxsIHByb21wdCwKPiAKPiAJeGwgbGlz
dAo+IAkJTmFtZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJRCAgIE1l
bSBWQ1BVcyAgICAgIFN0YXRlICAgVGltZShzKQo+IAkJRG9tYWluLTAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMCAgNDAxNSAgICAgNCAgICAgci0tLS0tICAgICA1NjMuMAo+
IAkJWGVuc3RvcmUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMSAgICAzMSAg
ICAgMSAgICAgLWItLS0tICAgICAgIDAuMAo+IAo+IGJ1dCwgaW4gdGhpcyBEb20wPXB2aCBtb2Rl
LAo+IAo+IAllZmlib290bWdyIC12Cj4gCQlFRkkgdmFyaWFibGVzIGFyZSBub3Qgc3VwcG9ydGVk
IG9uIHRoaXMgc3lzdGVtLgoKU28gYm9vdCB3b3JrcyBhcyBleHBlY3RlZCwgaXQncyBqdXN0IGlu
dGVyYWN0aW9uIHdpdGggdGhlIEVGSSBmaXJtd2FyZQpieSBkb20wIHRoYXQgc2VlbXMgdG8gYmUg
YnJva2VuLiBJJ20gY3VycmVudGx5IHNldHRpbmcgdXAgYSBMaW51eCBFRkkKYm94IHRvIHRlc3Qg
dGhpcywgdGhhbmtzIGZvciB0aGUgcmVwb3J0LgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
