Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D621C10F0F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:00:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF01F2186A
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:00:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="gkUPzUvK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF01F2186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCPOR-0005HZ-5A; Fri, 05 Apr 2019 14:00:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pDY0=SH=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hCPOP-0005HT-LH
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 14:00:29 +0000
X-Inumbo-ID: 2aa7660d-57ab-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2aa7660d-57ab-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 14:00:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1554472827; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=C2it+wRaB58SG5bO3Tg58+YX4pn25g5LO1fclWQolqY=;
 b=gkUPzUvKesSd8EPvb8rzdsw3lQJCESBS6/4bmDz2fHryh7Ej9Ei2OnV9XlHeUGx+ZoSuhEWX
 kEDUTL3wHf9NOuA/q5o/ByUqq9YShN+xaPUDOsq02tmX9NPNArP7oyzeBb32QJ/hoan+K3iy
 9vi/J9TxrElAex4mYwCLJ6rt3zU=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mxa.mailgun.org with ESMTP id 5ca75f7a.7fca4fb0b470-smtp-out-n03;
 Fri, 05 Apr 2019 14:00:26 -0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id w15so7346483wmc.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2019 07:00:26 -0700 (PDT)
X-Gm-Message-State: APjAAAX3pZSuwQht7vYuxKwvbC2Hqx/DWoXQbrUqL85PA6EXyKN4r+hz
 w4JOgmJ5ftpK/gN+2gYpTTGgTo8a1pWfMZdv4A4=
X-Google-Smtp-Source: APXvYqxAvCVzbXwI+PQdrh43LdQo/aa2I89xdVg9t7LHjIXMx4P1GPH3e3yFJrIclhWNEwTCvZC29lcgoJW5WPME8zg=
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr7852566wmd.84.1554472825239; 
 Fri, 05 Apr 2019 07:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190403142620.1224-1-aisaila@bitdefender.com>
 <5CA4C9F9020000780022450F@prv1-mh.provo.novell.com>
 <aa35ec83-77d2-ffc3-c82a-96c666f97227@bitdefender.com>
 <5CA4D1880200007800224564@prv1-mh.provo.novell.com>
 <0c0c0933-bf70-ac3d-57c8-68c14827bcae@bitdefender.com>
 <7f9d8083-f115-dbb3-676d-547af38eda1c@bitdefender.com>
 <CABfawhnpk8iX=o8cHePOE8DAL+8s85S41DvSXL=DQ=gkc_8ZcA@mail.gmail.com>
 <5CA6166D0200007800224A0B@prv1-mh.provo.novell.com>
 <44BAFC90-7662-4A5C-B781-229712663926@citrix.com>
 <5CA705680200007800224C5D@prv1-mh.provo.novell.com>
In-Reply-To: <5CA705680200007800224C5D@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 5 Apr 2019 07:59:48 -0600
X-Gmail-Original-Message-ID: <CABfawhnXxP68wU2zWXPKYA09ud+aw83w8ez0caWogAUfZ7CFAg@mail.gmail.com>
Message-ID:
 <CABfawhnXxP68wU2zWXPKYA09ud+aw83w8ez0caWogAUfZ7CFAg@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v1] Fix p2m_set_suppress_ve
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
Cc: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405135948.ozr0OuYPUGWzixg3Xj-HIv5t7t_BUtP1yR5mBKHB9NE@z>

T24gRnJpLCBBcHIgNSwgMjAxOSBhdCAxOjM2IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDQuMDQuMTkgYXQgMTY6NTQsIDxHZW9yZ2UuRHVubGFw
QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+IE9uIEFwciA0LCAyMDE5LCBhdCAzOjM2IFBNLCBKYW4g
QmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Pj4+IE9uIDA0LjA0LjE5IGF0
IDE1OjA5LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4gPj4+IEkgYWdyZWUgdGhhdCBp
dCBpcyBjb25mdXNpbmcuIEl0IHdvdWxkIGJlIGZpbmUgdG8gVU5TSEFSRSBoZXJlIGFzIHdlbGwK
PiA+Pj4gdG8ga2VlcCB0aGluZ3MgY29uc2lzdGVudCBidXQgb3RoZXJ3aXNlIGl0J3Mgbm90IHJl
YWxseSBhbiBpc3N1ZSBhcwo+ID4+PiB0aGUgZW50cnkgdHlwZSBpcyBjaGVja2VkIGxhdGVyIHRv
IGVuc3VyZSB0aGF0IHRoaXMgaXMgYSBwMm1fcmFtX3J3Cj4gPj4+IGVudHJ5LiBXZSBhcmUgc2lt
cGx5IHRyeWluZyB0byBrZWVwIG1lbV9zaGFyaW5nIGFuZCBfbW9kaWZpZWRfIGFsdHAybQo+ID4+
PiBlbnRyaWVzIGV4Y2x1c2l2ZS4gU28gaXQgaXMgZmluZSB0byBoYXZlIG1lbV9zaGFyZWQgZW50
cmllcyBpbiB0aGUKPiA+Pj4gaG9zdHAybSBhbmQgaGF2ZSB0aG9zZSBlbnRyaWVzIGJlIGNvcGll
ZCBpbnRvIGFsdHAybSB0YWJsZXMgbGF6aWx5LAo+ID4+PiBidXQgZm9yIGFsdHAybSBlbnRyaWVz
IHRoYXQgaGF2ZSBjaGFuZ2VkIG1lbV9hY2Nlc3MgcGVybWlzc2lvbnMgb3IgYXJlCj4gPj4+IHJl
bWFwcGVkIHdlIHdhbnQgdGhlIGVudHJpZXMgaW4gdGhlIGhvc3RwMm0gdG8gYmUgb2YgcmVndWxh
ciB0eXBlLgo+ID4+PiBUaGlzIGlzIG5vdCBuZWNlc3NhcmlseSBhIHRlY2huaWNhbCByZXF1aXJl
bWVudCwgaXQncyBtb3N0bHkganVzdCB0bwo+ID4+PiByZWR1Y2UgY29tcGxleGl0eS4gU28gaXQg
d291bGQgYmUgZmluZSB0byBhZGQgVU5TSEFSRSBoZXJlIGFzIHdlbGwsIEkKPiA+Pj4gZ3Vlc3Mg
dGhlIG9ubHkgcmVhc29uIHdoeSBJIGhhdmVuJ3QgZG9uZSB0aGF0IGlzIGJlY2F1c2UgSSBhbHJl
YWR5Cj4gPj4+IHRyaWdnZXIgdGhlIHVuc2hhcmUgYW5kIGNvcHktdG8tYWx0cDJtIGJlZm9yZSBy
ZW1hcHBpbmcgYnkgc2V0dGluZwo+ID4+PiBkdW1teSBtZW1fYWNjZXNzIHBlcm1pc3Npb24gb24g
dGhlIGVudHJpZXMuCj4gPj4KPiA+PiBJJ20gYWZyYWlkIEkgZG9uJ3QgYWdyZWUgd2l0aCB0aGlz
IGp1c3RpZmljYXRpb246IG1lbS1zaGFyaW5nIGlzIGFib3V0Cj4gPj4gY29udGVudHMgb2YgcGFn
ZXMsIHdoZXJlYXMgYWx0cDJtIGlzIGFib3V0IG1ldGEgZGF0YSAocGVybWlzc2lvbnMKPiA+PiBl
dGMpLiBJIGRvbid0IHNlZSB3aHkgb25lIHdvdWxkIHdhbnQgdG8gdW5zaGFyZSBiZWNhdXNlIG9m
IGEgbWV0YQo+ID4+IGRhdGEgYWRqdXN0bWVudCBvdGhlciB0aGFuIGEgcGFnZSBiZWNvbWluZyBu
b24tQ29XLXdyaXRhYmxlLgo+ID4+IEVhZ2VybHkgdW4tc2hhcmluZyBpbiB0aGUgZW5kIHVuZGVy
bWluZXMgdGhlIGludGVudGlvbnMgb2Ygc2hhcmluZy4KPiA+Cj4gPiBSZW1lbWJlciBhbHNvIHRo
YXQgYWx0cDJtcyBhbGxvdyBzb21lb25lIHRvIHNldCBub3QganVzdCBhbHRlcm5hdGUgdmlld3MK
PiA+IHdpdGggZGlmZmVyZW50IHBlcm1pc3Npb25zLCBidXQgYWxzbyBhbHRlcm5hdGUgdmlld3Mg
d2l0aCBkaWZmZXJlbnQgYmFja2luZwo+ID4gbWZucy4gIENvbWJpbmluZyBzaGFyZWQgbWZucyB3
aXRoIGFsdGVybmF0ZSB2aWV3cyB3aXRoIGRpZmZlcmVudCBtZm5zIG9uIHRoZQo+ID4gc2FtZSBn
Zm4gbWVhbnMgdGhhdCB5b3UgaGF2ZSB0byBiZSB2ZXJ5IGNhcmVmdWwgbm90IHRvIGVuZCB1cCBn
aXZpbmcgd3JpdGUKPiA+IHBlcm1pc3Npb24gdG8gdGhlIHNoYXJlZCBwYWdlLCB3aGljaCB3b3Vs
ZCBiZSBhIHNlY3VyaXR5IGlzc3VlLiAgVW5zaGFyaW5nCj4gPiB3aGVuIGNyZWF0aW5nIGFuIGFs
dHAybSBlbnRyeSBtZWFucyB0aGF0IGFueSBnaXZlbiBnZm4gaXMgKmVpdGhlciogc2hhcmVkCj4g
PiAqb3IqIGR1cGxpY2F0ZWQgYWNyb3NzIGFsdHAybXMsIGJ1dCBub3QgYm90aDsgdGhpcyBzaW1w
bGlmaWVzIHRoZSByZWFzb25pbmcuCj4KPiBIbW0sIHllcywgSSBjYW4gc2VlIGhvdyB0aGlzIGdl
dHMgY29tcGxpY2F0ZWQuIEJ1dCBpcyB0aGlzIGJlaGF2aW9yCj4gc3ltbWV0cmljPyBJLmUuIHdp
bGwgYXR0ZW1wdHMgdG8gc2hhcmUgYSBHRk4gZmFpbCB3aGVuIGl0IGhhcyBhIG5vbi0KPiBkZWZh
dWx0IHNldHRpbmcgaW4gb25lIG9mIHRoZSBhbHRlcm5hdGUgdmlld3M/IExvb2tpbmcgYXQgdGhl
IGNvZGUgSQo+IGNhbid0IHNlZW0gdG8gcmVjb2duaXplIHN1Y2ggYmVoYXZpb3IuCgpUaGVyZSBh
cmUgY2hlY2tzIGluIHBsYWNlIGZvciB0aGF0LiBUYWtlIGEgbG9vayBhdCB0aGUgbm9taW5hdGVf
cGFnZQpmdW5jdGlvbiBpbiBtbS9tZW1fc2hhcmluZy5jLgoKPgo+IEZ1cnRoZXJtb3JlIEknbSBw
dXp6bGVkIGJ5IHAybV9hbHRwMm1fcHJvcGFnYXRlX2NoYW5nZSgpCj4gYXBwYXJlbnRseSBibGlu
ZGx5IG92ZXJ3cml0aW5nIChhbG1vc3QpIGV2ZXJ5dGhpbmcuIElzIGl0IHJlYWxseQo+IGludGVu
ZGVkIGluIGFsbW9zdCBjYXNlcyAodGhlcmUgbG9va3MgdG8gYmUgYW4gZXhjZXB0aW9uIHdoZW4K
PiB0aGUgb2xkIGVudHJ5IGhvbGRzIElOVkFMSURfTUZOOyBJIHdvbmRlciB0aG91Z2ggd2hldGhl
ciBpdHMKPiBjb25kaXRpb24gaXNuJ3QgaW52ZXJ0ZWQpIHRvIGRpc2NhcmQgc3BlY2lhbCBhY2Nl
c3MgYW5kL29yIE1GTnMgaW4KPiBhbHRlcm5hdGUgdmlld3Mgd2hlbiB0aGUgaG9zdCBwMm0ncyBy
ZXNwZWN0aXZlIHNsb3QgY2hhbmdlcz8KPgo+IExvb2tpbmcgYXQgdGhlIGZ1bmN0aW9uIEkgYWxz
byB3b25kZXIgd2hldGhlciBpdCBkb2Vzbid0Cj4gcG9pbnRsZXNzbHkgY2FsbCBwMm1fcmVzZXRf
YWx0cDJtKCkgd2hlbiBvbGQgYW5kIG5ldyBlbnRyeQo+IGJvdGggaG9sZCBJTlZBTElEX01GTi4K
Ckl0J3Mgbm90IGlkZWFsIGZvciBzdXJlLiBCb3RoIHRoYXQgYW5kIHRoZSByZXNldHRpbmcgb2Yg
YWxsIGFsdHAybQp2aWV3cyBjb21wbGV0ZWx5IHdoZW4gdGhlIGhvc3RwMm0gY2hhbmdlcyBhcmUg
dHJvdWJsaW5nIGJlaGF2aW9ycyB0aGF0CmxpbWl0IHdoZW4gYWx0cDJtIGNhbiBiZSB1c2VkLiBJ
dCdzIHVwIGZvciBkZWJhdGUgdGhvdWdoIGhvdyBob3N0cDJtCmNoYW5nZXMgc2hvdWxkIGJlIGhh
bmRsZWQsIGFuZCBoYW5kbGVkIHNhZmVseS4gSSB0aGluayB0aGUgY3VycmVudAppbXBsZW1lbnRh
dGlvbiBqdXN0IHRhYmxlZCB0aG9zZSBoYXJkIHF1ZXN0aW9ucyBieSByZXNldHRpbmcKZXZlcnl0
aGluZy4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
