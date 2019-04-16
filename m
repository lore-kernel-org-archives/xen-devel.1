Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADE5C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 08:11:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0F70206BA
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 08:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0F70206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=durham.ac.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGJBa-0005HT-57; Tue, 16 Apr 2019 08:11:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TLMa=SS=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hGJBY-0005HO-Va
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 08:11:21 +0000
X-Inumbo-ID: 36330bfa-601f-11e9-92d7-bc764e045a96
Received: from hermes2.dur.ac.uk (unknown [129.234.7.139])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 36330bfa-601f-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 08:11:19 +0000 (UTC)
Received: from smtphost4.dur.ac.uk (smtphost4.dur.ac.uk [129.234.7.146])
 by hermes2.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x3G8B3cP039940;
 Tue, 16 Apr 2019 09:11:07 +0100
Received: from algedi.dur.ac.uk (algedi.dur.ac.uk [129.234.2.28])
 by smtphost4.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x3G8AtMx029594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 16 Apr 2019 09:10:55 +0100
Received: by algedi.dur.ac.uk (Postfix, from userid 2742)
 id 4D8DD2822FC; Tue, 16 Apr 2019 09:10:50 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
 by algedi.dur.ac.uk (Postfix) with ESMTP id 38115281FF1;
 Tue, 16 Apr 2019 09:10:50 +0100 (BST)
Date: Tue, 16 Apr 2019 09:10:50 +0100 (BST)
From: M A Young <m.a.young@durham.ac.uk>
To: Pry Mar <pryorm09@gmail.com>
In-Reply-To: <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.1904160904450.4952@algedi.dur.ac.uk>
References: <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-DurhamAcUk-MailScanner: Found to be clean, Found to be clean
X-DurhamAcUk-MailScanner-ID: x3G8B3cP039940
Subject: Re: [Xen-devel] booting domU guest as pvh works in xen-4.11.1 but
 fails in 4.12
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416081050.bsgWtaf-N7OKoeqC6fLLttENWCGRSdY3UzotUg6R3Mg@z>

T24gTW9uLCAxNSBBcHIgMjAxOSwgUHJ5IE1hciB3cm90ZToKCj4gSGVsbG8sCj4gCj4gaHR0cHM6
Ly9wYXN0ZS5kZWJpYW4ubmV0LzEwNzc3MTgvCj4gCj4gSSBnZXQgYSBrZXJuZWwgcGFuaWMgYXMg
c2hvd24gaW4gdGhlIHBhc3RlIGFib3ZlIG5vIG1hdHRlciBob3cgSQo+IGxhdW5jaCBwdmgsIHdp
dGggYm9vdGxvYWRlciAocHlncnViKSwga2VybmVsIGRpcmVjdCAoNC4xOCspLCBvcgo+IHB2Z3J1
YjIgKGkzODYteGVuX3B2aCBzdXBwb3J0KS4KPiAKPiBUaGUgZG9tMCBoZXJlIGlzIHViMTgwNCwg
a2VybmVsLTQuMTgsIGFuZCB4ZW4tNC4xMiB3aXRoIGRlYmlhbgo+IHBhY2thZ2VzIChzZWxmIGJ1
aWx0KS4KPiB+JCBzdWRvIGRwa2cgLWwgfCBncmVwIC1QICd4ZW58cWVtdScgfCBncmVwICdeaWkn
Cj4gaWkgIGxpYnhlbi00LjEyOmFtZDY0ICAgICAgNC4xMi4wLTErdWIxOHUwNC4xICAgICAgICAg
ICAgICAgIGFtZDY0Cj4gICAgUHVibGljIGxpYnMgZm9yIFhlbgo+IGlpICBsaWJ4ZW5zdG9yZTMu
MDphbWQ2NCAgNC4xMi4wLTErdWIxOHUwNC4xICAgICAgICAgICAgICAgIGFtZDY0Cj4gICBYZW5z
dG9yZSBjb21tdW5pY2F0aW9ucyBsaWJyYXJ5IGZvciBYZW4KPiBpaSAgbGlieGVudG9vbGNvcmUx
OmFtZDY0ICA0LjEyLjAtMSt1YjE4dTA0LjEgICAgICAgICAgICAgICAgYW1kNjQKPiAgICBoZWxw
ZXIgZm9yIHFlbXUgJiBsaWJ4ZW5zdG9yZQo+IGlpICBxZW11dSAgICAgMy4xLjAtMSt1YjE4dTA0
LjEgICAgICAgICAgICAgICAgIGFtZDY0Cj4gcWVtdS1zeXN0ZW0taTM4NiAoMy4xLjAveGVuLTQu
MTIpIHdpdGggOXBmcyBzdXBwb3J0Cj4gaWkgIHhlbi1oeXBlcnZpc29yLTQuMTItYW1kNjQgICAg
ICAgICAgICAgNC4xMi4wLTErdWIxOHUwNC4xCj4gICAgICBhbWQ2NCAgICAgICAgWGVuIEh5cGVy
dmlzb3Igb24gQU1ENjQKPiBpaSAgeGVuLXV0aWxzLTQuMTIgICAgICAgICAgICAgICAgICAgICAg
ICA0LjEyLjAtMSt1YjE4dTA0LjEKPiAgICAgIGFtZDY0ICAgICAgICBYRU4gYWRtaW5pc3RyYXRp
dmUgdG9vbHMKPiBpaSAgeGVuLXV0aWxzLWNvbW1vbiAgICAgICAgICAgICAgICAgICAgICA0LjEy
LjAtMSt1YjE4dTA0LjEKPiAgICAgIGFsbCAgICAgICAgICBYZW4gYWRtaW5pc3RyYXRpdmUgdG9v
bHMgLSBjb21tb24gZmlsZXMKPiBpaSAgeGVuLXZpcmJyMCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAwLjEtMgo+ICAgICAgYWxsICAgICAgICAgIFNldHVwIGEgdmlyYnIwIGJyaWRnZSBhbmQg
ZG5zbWFzcSBvbiBhCj4gaWkgIHhlbnN0b3JlLXV0aWxzICAgICAgICAgICAgICAgICAgICAgICAg
NC4xMi4wLTErdWIxOHUwNC4xCj4gICAgICBhbWQ2NCAgICAgICAgWGVuc3RvcmUgY29tbWFuZCBs
aW5lIHV0aWxpdGllcyBmb3IgWGVuCj4gCj4gVGhlIHNhbWUgeGwgY29uZmlnIGFuZCBncnViIGNv
bmZpZyB3b3JrcyBpbiB4ZW4tNC4xMS4xLiBJJ3ZlIHNlYXJjaGVkCj4gZm9yIGFueSBuZXcgb3B0
aW9ucyBpbiB4bC5jZmcgdGhhdCBjb3VsZCBpbmZsdWVuY2UgdGhpcywgYnV0IG5vdGhpbmcKPiBj
YXRjaGVzIG15IGV5ZS4KPiAKPiBJIGdldCB0aGUgc2FtZSBkbWVzZyBpbiBvdGhlciBib290IG1l
dGhvZHMsIGJ1dCB0aGUgaTM4Ni14ZW5fcHZoIHN0eWxlCj4geWllbGRzIG1vcmUgaW5mbyBhdCB0
aGUgZW5kLiBUaGUgKGZpcmUtbWlzc2xlKSBncnViIHNjcmlwdCBpcyBwcm92aWRlZAo+IEhhbnMg
dmFuIEtyYW5lbmJ1cmcgLgo+IAo+IEJlZm9yZSB0aGUgaW5pdHJkIHVucGFja3MgSSBzZWUgbWFu
eSBlcnJvcnMgKGxpbmUgMjAxIG9mIHBhc3RlKToKPiBmdXNlIGluaXQgbW9kcHJvYmUgdHJhcCBp
bnZhbGlkIG9wY29kZSBpcDo3Zjc5N2RjN2JiOTUKPiAKPiBCdXQgbGF0ZXIgdGhlIHhlbl9uZXRm
cm9udCBhbmQgeGVuX2Jsa2Zyb250IGRyaXZlcnMgbG9hZCBmaW5lIGFuZCB0aGVuCj4gdHJvdWJs
ZSBzdGFydHMuCj4gCj4gUHJ5TWFyNTYsCj4gIyN4ZW4tcGFja2FnaW5nIG9uIEZyZWVub2RlIElS
QwoKSSBoYXZlIHNlZW4gYSBzaW1pbGFyIGNyYXNoIG9uIEZlZG9yYSBvbiBhIEYzMCBndWVzdCB0
aGF0IHdvcmtzIHdpdGggUFYgCmJ1dCBjcmFzaGVzIHdpdGggSFZNIG9uIDQuMTIgYnV0IG5vdCBv
biA0LjExLjEuIEkgYW0gc2VlaW5nIHNpbWlsYXIgCmJlaGF2aW91ciBvbiBhIFdpbmRvd3MgMTAg
SFZNIGd1ZXN0LCB0aG91Z2ggdGhhdCBpcyBoYXJkZXIgdG8gZGlhZ25vc2UuCgoJTWljaGFlbCBZ
b3VuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
