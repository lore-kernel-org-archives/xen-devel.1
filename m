Return-Path: <SRS0=3NK1=YR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF08CA9EAF
	for <xen-devel@archiver.kernel.org>; Thu, 24 Oct 2019 16:19:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6455620650
	for <xen-devel@archiver.kernel.org>; Thu, 24 Oct 2019 16:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6455620650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dornerworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNfps-0002Pb-TL; Thu, 24 Oct 2019 16:19:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+QwF=YR=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iNfps-0002PS-3O
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 16:19:40 +0000
X-Inumbo-ID: 0e983d88-f67a-11e9-beca-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0e983d88-f67a-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 16:19:31 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Julien Grall <julien.grall@arm.com>, Jeff Kubascik
 <Jeff.Kubascik@dornerworks.com>, Wei Liu <wl@xen.org>, George Dunlap
 <george.dunlap@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] MAINTAINERS: Add DornerWorks maintainers
 email
Thread-Index: AQHVWbxmXQNXs9ajs06C5NLVZ0/4racTui+AgFHbE4CAAAPtAIAEzi8AgAAIToD//+j5sA==
Date: Thu, 24 Oct 2019 16:19:41 +0000
Message-ID: <1d83c610133c47c1b213a06ded88c043@dornerworks.com>
References: <20190823140855.4222-1-jeff.kubascik@dornerworks.com>
 <20190830092837.nmsnmelmwryzxyta@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <5bf66876-8b09-bb34-bc4f-046d6e1e4205@citrix.com>
 <20191021114348.kynwzrkbl4xbnfky@debian>
 <dabf9641-4c16-767f-1623-7082f4be84ee@dornerworks.com>
 <b504a758-bf6b-c4fa-0981-1c444a525cc4@arm.com>
In-Reply-To: <b504a758-bf6b-c4fa-0981-1c444a525cc4@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.13.254]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add DornerWorks maintainers
 email
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
Cc: xen-devel <xen-devel@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Robert
 VanVossen <Robert.VanVossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Josh Whitehead <Josh.Whitehead@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1cnNkYXksIE9jdG9iZXIgMjQsIDIwMTkgOTozNyBBTSwgSnVsaWVuIEdyYWxsIHdyb3Rl
Og0KPkhpLA0KPg0KPkp1bXBpbmcgaW50byB0aGUgY29udmVyc2F0aW9uLg0KPg0KPk9uIDI0LzEw
LzIwMTkgMTQ6MDYsIEplZmYgS3ViYXNjaWsgd3JvdGU6DQo+PiBXZSB3b3VsZCBsaWtlIHRvIHJl
bW92ZSBvdXIgY3VycmVudCB0d28gZGV2ZWxvcGVycyB3aG8gYXJlIGxpc3RlZCBhcyBNOiBmb3Ig
dGhlDQo+PiBBUklOQzY1MyBzY2hlZHVsZXIgY29kZS4gU2luY2UgTTogaXMganVzdCBhICJNYWls
IHBhdGNoZXMgdG8iIGRlc2lnbmF0aW9uLCBJJ20NCj4+IG5vdyBsZWFuaW5nIHRvd2FyZHMgdGhl
IEw6IGRlc2lnbmF0aW9uLCBhcyB0aGUgdHdvIGFwcGVhciByb3VnaGx5IGVxdWl2YWxlbnQgaW4N
Cj4+IHRoZWlyIHJvbGUuIERvZXMgdGhhdCBzb3VuZCByZWFzb25hYmxlPw0KPg0KPkkgZG9uJ3Qg
dGhpbmsgeW91IGNhbiB0cmVhdCAiTDoiIGFuZCAiTToiIHRoZSBzYW1lIHdheS4NCj4NCj4iTToi
IGlzIGEgc2luZ2xlIHBlcnNvbiB0aGF0IHdlIGtub3cuDQo+DQo+Ikw6IiBpcyBhIGxpc3Qgb2Yg
cGVyc29uIHRoYXQgd2UgZG9uJ3Qga25vdy4NCj4NCj54ZW4tZGV2ZWxAZG9ybmVyd29ya3MuY29t
IGRlZmluaXRlbHkgZmFsbHMgaW50byB0aGUgIkw6IiBjYXRlZ29yeS4gVGhhdCBjbGVhcmx5DQo+
cmFpc2VzIGEgZmV3IHF1ZXN0aW9ucyBoZXJlLg0KPg0KPiAgICAgICAgLSBIb3cgZG8gd2Uga25v
dyB3aGVuIHRoZSBsaXN0IG9mIHBlcnNvbiBjaGFuZ2U/DQo+ICAgICAgICAtIEhvdyBhY2tlZC1i
eS9yZXZpZXdlZC1ieSB3aWxsIGJlIGRvbmU/IFdpbGwgaXQgYmUgQWNrZWQtYnkgIkRvcm5lcndv
cmtzDQo+PC4uLi4+Ij8gSWYgbm90LCB0aGVuIHdlIHN0aWxsIG5lZWQgIk06IiBhcm91bmQgdG8g
d2hpY2ggYWNrZWQtYnkgaXMgc3VmZmljaWVudC4NCj5JZiB5ZXMsIGhvdyBkbyB3ZSBrbm93IGFs
bCB0aGUgcGVyc29uIG9uIHRoYXQgbGlzdCBjYW4gYmUgdHJ1c3RlZD8NCg0KVGhlIHJhdGlvbmFs
ZSBmb3IgcmVtb3ZpbmcgUm9iYmllIGFuZCBKb3NoIGlzIHRoYXQgdGhleSBhcmUgY3VycmVudGx5
IA0KYWN0aXZlIG9uIG90aGVyIHByb2plY3RzIHRoYXQgZG9uJ3QgaW52b2x2ZSBYZW4uIEknbSBp
bnZvbHZlZCB3aXRoIFhlbg0KYW5kIEknbSB0aGUgdGVjaCBsZWFkIGZvciBvdXIgcHJvZHVjdCB0
aGF0IGFjdHVhbGx5IHVzZXMgdGhlIEFSSU5DIDY1Mw0Kc2NoZWR1bGVyLCBzbyBJJ2xsIHZvbHVu
dGVlciBteXNlbGYgdG8gcmVwbGFjZSBSb2JiaWUgYW5kIEpvc2guIFRoaXMNCndheSB3ZSB3aWxs
IHN0aWxsIGhhdmUgYSByZWFsIHBlcnNvbiB3aXRoIGFuIE06IGZvciB0aGUgQVJJTkMgNjUzDQpz
Y2hlZHVsZXIgaW4gTUFOVEFJTkVSUy4NCg0KV2Ugd291bGQgc3RpbGwgbGlrZSB0byBhZGQgb3Vy
IGludGVybmFsIGxpc3QuIEl0IHNlZW1zIEw6IGlzIGEgZmFpcmx5DQphZ3JlZWFibGUgZGVzaWdu
YXRpb24gZm9yIHRoZSBsaXN0Lg0KDQpMOiAgICAgICAgRG9ybmVyV29ya3MgWGVuLURldmVsIDx4
ZW4tZGV2ZWxAZG9ybmVyd29ya3MuY29tPg0KDQpUaGFua3MsDQpTdGV3DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
