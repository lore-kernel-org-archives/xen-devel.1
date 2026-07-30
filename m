Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BFEC54FDF
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 10:30:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377376.1623519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpO1h-0004rW-RU; Thu, 30 Jul 2026 10:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377376.1623519; Thu, 30 Jul 2026 10:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpO1h-0004rP-P0; Thu, 30 Jul 2026 10:30:09 +0000
Received: by outflank-mailman (input) for mailman id 1377376;
 Thu, 30 Jul 2026 09:36:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yannick.martin@okazoo.eu>) id 1wpNC4-00082u-GO
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 09:36:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpNC3-008RUv-Sy
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 11:36:47 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yannick.martin@okazoo.eu>)
 id 6a6b1b24-2eae-0a2a0a5409dd-0a2a4502cd24-28
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 11:36:47 +0200
Received: from [62.210.211.125] (helo=yop24.okazoo.eu)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yannick.martin@okazoo.eu>)
 id 6a6b1b2f-6ca4-0a2a45020019-3ed2d37dccf6-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 11:36:47 +0200
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=yop20250924 header.d=okazoo.eu header.i="@okazoo.eu" header.h="Content-Type:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To"
Authentication-Results: yop24.okazoo.eu; arc=none smtp.remote-ip="2001:861:81:ab03:a8da:71bb:ac4c:8efe"
ARC-Seal: i=1; d=okazoo.eu; s=_arc_yop20260218; a=rsa-sha256; cv=none;
	t=1785404207;
	b=U7E6nRuEKu5gH0YdoAMZuc+jwsPWpXB9w1C90boZ+J9EOR7+7My0cqN21SDkO9YEJqwA
	 vOWHLmq05gXt4i+NhD8qpZzo1EShRev4eRQl0PLqpqZCw96Rkyswfn7lgXtwNqV9DefTx
	 5WmikfKD5KUaYzpkcIcyXkug5aGUIjmyB9PcufsEIpoWXV1mKIAGnheIQCifF28Rd7G1E
	 RQwYvNl5ihz/N5G1CBn9q4CotYvqf8mVzL9C5E7unWWlHpHaYqG+UEP8DsSI87sbKJDuA
	 2agk6gQU44h6XHa03GkZSFCWYikBiLGlex7aSz2FIoEUN6eIYhuPqFsjqVkP3Pv8FrA==
ARC-Message-Signature: i=1; d=okazoo.eu; s=_arc_yop20260218; a=rsa-sha256;
	c=relaxed/relaxed; t=1785404207;
	h=DKIM-Signature:Content-Type:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To;
	bh=sQRMRRFPnLwRU9VpwRbZlfnzUOMkA2Be4k9DBLnfosU=;
	b=cJ7hNsdpSIIXXEdQJaG8HiWfNTm37glBjrVYoOS3DSDzLbLQbyMzOvN8RW7o4R0SKimF
	 GNa+TOLC9Kea3D0Z9KqYBW/7qflo73jt4NrY1XQZWGCB6AWSV4n4LI7p25EONyHa3nttH
	 bwICtyhVKSdvuPZrUG89GzzmGGkQb5Be/kD8OAVIAsL+OWkTPfxaOJNdXHiH46Rp7iXNl
	 3ptvBdRIR+Xn+ecqdHq9f8N/c2Thvj4FRXqRzM1aCeBvGLWpIiqM7Vxt5OSvxGvPljKas
	 xBFgeND0Tmr4AJ50LGhU1SOb56EWDlwskcdnXp3c7BGzYCF7q9blaB2FDX5haMsDn1w==
ARC-Authentication-Results: i=1; yop24.okazoo.eu; arc=none smtp.remote-ip="2001:861:81:ab03:a8da:71bb:ac4c:8efe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=okazoo.eu;
	s=yop20250924; t=1785404207; r=y;
	bh=sQRMRRFPnLwRU9VpwRbZlfnzUOMkA2Be4k9DBLnfosU=;
	h=Content-Type:Message-ID:Date:MIME-Version:User-Agent:Subject:From:
	 To:Cc:References:Content-Language:In-Reply-To;
	b=HcnsHe4w4J3KAy3NaMHMeEQ9yji5d55JNKqYqG+wBNiUOs2ejIpf+D5z4L1QttXzP
	 E0ut7xp5sEXwcturRxo7KjrgQ1iwfgSaW5Ch5XGor2CS9+FWyPWOy5HqxAPWLQrUep
	 9L5pSOMqFukd4RedmVnXidxd/f7G9KfKY4gZleMp1eSGlxu2b8940mQahjh0jxDbJ6
	 TjyzDLXApCY5GPoffewyhL0XTG+UgSyoAl5Xs5+/iDlbIjT1yaTu2BqwmyEe4x6hmp
	 NaKUuud/+0k49Oa+W11Bmom60zPmegEl8CCPa2y+1HYHuu618Bez4QFDyhHLRahl3N
	 I0I0mwtkjiGvQ==
Content-Type: multipart/alternative;
 boundary="------------jrC2FWRPAOdkLGqhkPnFxVLj"
Message-ID: <99ef3e01-980f-4bdd-aada-4af4d12d337f@okazoo.eu>
Date: Thu, 30 Jul 2026 11:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] Bug 221745 - PV DomU ballooning driver init issue
From: Yannick Martin <yannick.martin@okazoo.eu>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 yannick.martin+kernelorg@okazoo.eu
References: <f7fe5959-f0c6-430c-8404-927d7944c836@leemhuis.info>
 <ameMgwuUIhZbslHh@macbook.local>
 <519EE50D-9B83-424F-8800-B19DFA81FD79@okazoo.eu>
Content-Language: fr
In-Reply-To: <519EE50D-9B83-424F-8800-B19DFA81FD79@okazoo.eu>
X-purgate-ID: tlsNG-720697/1785404207-670B02AC-CA9DE5E3/37/8813544393-1941467
X-purgate-type: clean
X-purgate-size: 10353

This is a multi-part message in MIME format.
--------------jrC2FWRPAOdkLGqhkPnFxVLj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8NCg0KSXQgd29ya3MgISEhDQoNCnVuYW1lIC1hDQpMaW51eCBzdGF0dXMgNy4yLjAt
cmMzLXhlbmRvbXUgIzEgU01QIFBSRUVNUFQgVGh1IEp1bCAzMCAxMDozOToxMyBDRVNUIA0K
MjAyNiB4ODZfNjQgR05VL0xpbnV4DQoNCiMgcHMgYXV4d3d3ZiB8IGdyZXAgLWkgYmFsbA0K
cm9vdMKgIMKgIMKgIMKgIMKgIDQ4wqAgMC4wwqAgMC4wwqAgwqAgwqAgMMKgIMKgIMKgMCA/
wqAgwqAgwqAgwqAgU8KgIMKgIDExOjMzwqAgwqAwOjAwIFxfIA0KW3hlbi1iYWxsb29uXQ0K
DQpkbWVzZ8KgIHwgZ3JlcCAtaSBiYWxsbw0KW8KgIMKgIDAuNDM2NjU3XSB4ZW46YmFsbG9v
bjogSW5pdGlhbGlzaW5nIGJhbGxvb24gZHJpdmVyDQoNCmRvbVUgbWVtb3J5IHJlc2l6ZSB3
b3JrcywgdGVzdGVkIDEwMjRtIC0+IDEyMDBtIC0+IDEwMDBtLg0KDQpSZWdhcmRzDQoNCg0K
TGUgMjcvMDcvMjAyNiDDoCAxOToxMCwgWWFubmljayBNYXJ0aW4gYSDDqWNyaXTCoDoNCj4g
SGVsbG8NCj4NCj4gSSB3aWxsIHRyeSB0aGlzIHRvbW9ycm93ICENCj4NCj4gUmVnYXJkcw0K
Pg0KPg0KPiBMZSAyNyBqdWlsbGV0IDIwMjYgMTg6NTE6MTUgR01UKzAyOjAwLCAiUm9nZXIg
UGF1IE1vbm7DqSIgDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gYSDDqWNyaXQgOg0KPg0K
PiAgICAgT24gTW9uLCBKdWwgMjcsIDIwMjYgYXQgMTA6NDI6MjVBTSArMDIwMCwgVGhvcnN0
ZW4gTGVlbWh1aXMgd3JvdGU6DQo+DQo+ICAgICAgICAgSGkgUm9nZXIhIEZZSSwgaXQgc2Vl
bXMgeW91ciBjaGFuZ2UgMDk0OWM2NDZkNjQ2OTcgKCJQYXJ0aWFsDQo+ICAgICAgICAgcmV2
ZXJ0ICJ4ODYveGVuOiBmaXggYmFsbG9vbiB0YXJnZXQgaW5pdGlhbGl6YXRpb24gZm9yIFBW
SA0KPiAgICAgICAgIGRvbTAiIikgW3Y3LjAtcmMxXSBjYXVlZCBhIHJlZ3Jlc3Npb24uIEZv
ciBkZXRhaWxzIHNlZQ0KPiAgICAgICAgIGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MjIxNzQ1IFRvIHF1b3RlDQo+ICAgICAgICAgdGhlIGluaXRpYWwg
Y29tbWVudDoNCj4NCj4gICAgICAgICAgICAgU2luY2UgY29tbWl0IGRiOGM0YjEgKFBhcnRp
YWwgcmV2ZXJ0ICJ4ODYveGVuOiBmaXggYmFsbG9vbg0KPiAgICAgICAgICAgICB0YXJnZXQg
aW5pdGlhbGl6YXRpb24gZm9yIFBWSCBkb20wIiksIHhlbiBiYWxsb29uaW5nIGZhaWxzDQo+
ICAgICAgICAgICAgIHRvIGluaXQgY29ycmVjdGx5IG9uIGRvbVUgKG9uIGFtZDY0IGFyY2gp
IHdpdGggdGhlDQo+ICAgICAgICAgICAgIGZvbGxvd2luZyBjb25maWd1cmF0aW9uOiAtLSB4
bC5jZmcgLi4uIG1lbW9yeSA9ICcyMDQ4Jw0KPiAgICAgICAgICAgICBtYXhtZW0gPSAnNDA5
NicgLi4uIC0tIC0tIGRvbVUgYmFsbG9vbiBkbWVzZyAoaW5pdCBmYWlscykNCj4gICAgICAg
ICAgICAgWyAwLjkwODMzN10geGVuOmJhbGxvb246IEluaXRpYWxpc2luZyBiYWxsb29uIGRy
aXZlciBbDQo+ICAgICAgICAgICAgIDAuOTQwNzIxXSBFeHRyYSBwYWdlcyB1bmRlcmZsb3cg
Y3VycmVudCB0YXJnZXQgDQo+DQo+ICAgICBZZWFoLCBJJ20gYWZyYWlkIHRoZSBvcmlnaW5h
bCBmaXggY29tbWl0IGRpZG4ndCBmdWxseSBmaXggdGhlDQo+ICAgICBpc3N1ZXMsIHNvIHRo
ZXJlJ3MgdGhlIGZvbGxvd2luZyBjaGFuZ2UgKGNodW5rIGJlbG93KSB0aGF0J3MNCj4gICAg
IG5lZWRlZCBhZGRpdGlvbmFsbHkgdG8gY29wZSB3aXRoIG1lbW9yeSAhPSBtYXhtZW0gb24g
UFYgZ3Vlc3RzLg0KPiAgICAgSSd2ZSBkb25lIHNvbWUgYmFzaWMgdGVzdGluZyBhbmQgaXQg
c2VlbXMgdG8gc29sdmUgdGhlIGlzc3VlLA0KPiAgICAgY291bGQgeW91IGdpdmUgaXQgYSBz
cGluIGFsc28/IChqdXN0IHRvIG1ha2Ugc3VyZSBJJ20gbm90IG1pc3NpbmcNCj4gICAgIGFu
eXRoaW5nIGVsc2UpLiBUaGFua3MsIFJvZ2VyLg0KPiAgICAgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+ICAgICBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jIGIvZHJpdmVycy94
ZW4vYmFsbG9vbi5jIGluZGV4DQo+ICAgICBlN2YxZDRjYTZkNzUuLmMyMGExZmY4MjkyZCAx
MDA2NDQgLS0tIGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jICsrKw0KPiAgICAgYi9kcml2ZXJz
L3hlbi9iYWxsb29uLmMgQEAgLTcwMywxOSArNzAzLDI2IEBAIHN0YXRpYyBpbnQgX19pbml0
DQo+ICAgICBiYWxsb29uX2FkZF9yZWdpb25zKHZvaWQpIGJhbGxvb25fYXBwZW5kKHBmbl90
b19wYWdlKHBmbikpOyAvKiAtICoNCj4gICAgIEV4dHJhIHJlZ2lvbnMgYXJlIGFjY291bnRl
ZCBmb3IgaW4gdGhlIHBoeXNtYXAsIGJ1dCBuZWVkIC0gKg0KPiAgICAgZGVjcmVhc2luZyBm
cm9tIGN1cnJlbnRfcGFnZXMgYW5kIHRhcmdldF9wYWdlcyB0byBiYWxsb29uIC0gKiBkb3du
DQo+ICAgICB0aGUgaW5pdGlhbCBhbGxvY2F0aW9uLCBiZWNhdXNlIHRoZXkgYXJlIGFscmVh
ZHkgLSAqIGFjY291bnRlZCBmb3INCj4gICAgIGluIHRvdGFsX3BhZ2VzLiArICogRm9yIEhW
TSBkb21haW5zOiBleHRyYSByZWdpb25zIGFyZSBhY2NvdW50ZWQNCj4gICAgIGZvciBpbiB0
aGUgKyAqIHBoeXNtYXAsIGJ1dCBuZWVkIGRlY3JlYXNpbmcgZnJvbSBjdXJyZW50X3BhZ2Vz
IGFuZA0KPiAgICAgKyAqIHRhcmdldF9wYWdlcyB0byBiYWxsb29uIGRvd24gdGhlIGluaXRp
YWwgYWxsb2NhdGlvbiwgYmVjYXVzZSArDQo+ICAgICAqIHRoZXkgYXJlIGFscmVhZHkgYWNj
b3VudGVkIGZvciBpbiB0b3RhbF9wYWdlcy4gKyAqICsgKiBGb3IgUFYNCj4gICAgIGRvbWFp
bnM6IGV4dHJhIHJlZ2lvbnMgYXJlIG5vdCBhY2NvdW50ZWQgZm9yIGluIHRoZSArICogaW5p
dGlhbA0KPiAgICAgbWVtb3J5IHRhcmdldCwgYW5kIGhlbmNlIG5lZWQgYWRkaW5nIHRvIHRo
ZSBzdGF0cyBhcyArICoNCj4gICAgIGFkZGl0aW9uYWwgdW5wb3B1bGF0ZWQgcmVnaW9ucy4g
Ki8gcGFnZXMgPSBleHRyYV9wZm5fZW5kIC0NCj4gICAgIHN0YXJ0X3BmbjsgLSBpZiAocGFn
ZXMgPj0gYmFsbG9vbl9zdGF0cy5jdXJyZW50X3BhZ2VzIHx8IC0gcGFnZXMNCj4gICAgID49
IGJhbGxvb25fc3RhdHMudGFyZ2V0X3BhZ2VzKSB7ICsgaWYgKHhlbl9wdl9kb21haW4oKSkg
eyArDQo+ICAgICBiYWxsb29uX3N0YXRzLnRvdGFsX3BhZ2VzICs9IHBhZ2VzOyArIH0gZWxz
ZSBpZiAocGFnZXMgPj0NCj4gICAgIGJhbGxvb25fc3RhdHMuY3VycmVudF9wYWdlcyB8fCAr
IHBhZ2VzID49DQo+ICAgICBiYWxsb29uX3N0YXRzLnRhcmdldF9wYWdlcykgeyBXQVJOKDEs
ICJFeHRyYSBwYWdlcyB1bmRlcmZsb3cNCj4gICAgIGN1cnJlbnQgdGFyZ2V0Iik7IHJldHVy
biAtRVJBTkdFOyArIH0gZWxzZSB7ICsNCj4gICAgIGJhbGxvb25fc3RhdHMuY3VycmVudF9w
YWdlcyAtPSBwYWdlczsgKyBiYWxsb29uX3N0YXRzLnRhcmdldF9wYWdlcw0KPiAgICAgLT0g
cGFnZXM7IH0gLSBiYWxsb29uX3N0YXRzLmN1cnJlbnRfcGFnZXMgLT0gcGFnZXM7IC0NCj4g
ICAgIGJhbGxvb25fc3RhdHMudGFyZ2V0X3BhZ2VzIC09IHBhZ2VzOyB9IHJldHVybiAwOw0K
Pg0KDQo=
--------------jrC2FWRPAOdkLGqhkPnFxVLj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    Hello<br>
    <br>
    It works !!!<br>
    <br>
    uname -a<br>
    Linux status 7.2.0-rc3-xendomu #1 SMP PREEMPT Thu Jul 30 10:39:13
    CEST 2026 x86_64 GNU/Linux<br>
    <br>
    # ps auxwwwf | grep -i ball<br>
    root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 48=C2=A0 0.0=C2=A0 0.0=C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A00 ?=C2=A0 =C2=A0 =C2=A0 =C2=A0 S=C2=A0 =C2=
=A0 11:33=C2=A0 =C2=A00:00=C2=A0
    \_ [xen-balloon]<br>
    <br>
    dmesg=C2=A0 | grep -i ballo<br>
    [=C2=A0 =C2=A0 0.436657] xen:balloon: Initialising balloon driver<br>=

    <br>
    domU memory resize works, tested 1024m -&gt; 1200m -&gt; 1000m.<br>
    <br>
    Regards<br>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">Le 27/07/2026 =C3=A0 19:10, Yannick Ma=
rtin a
      =C3=A9crit=C2=A0:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:519EE50D-9B83-424F-8800-B19DFA81FD79@okazoo.eu">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"auto">Hello<br>
        <br>
        I will try this tomorrow !<br>
        <br>
        Regards</div>
      <br>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"auto">Le 27 juillet 2026 18:51:15 GMT+02:00, "Roger
          Pau Monn=C3=A9" <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a> a =C3=A9crit :<=
/div>
        <blockquote class=3D"gmail_quote"
style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, =
204); padding-left: 1ex;">
          <pre class=3D"com-fsck-k9__plain-text-message-pre"><div
          dir=3D"auto">On Mon, Jul 27, 2026 at 10:42:25AM +0200, Thorsten=
 Leemhuis wrote:
</div><blockquote class=3D"gmail_quote"
style=3D"margin-bottom: 1ex; --com-fsck-k9__blockquote-default-border-col=
or: #729fcf;"><div
          dir=3D"auto">Hi Roger! FYI, it seems your change 0949c646d64697=
 ("Partial revert
"x86/xen: fix balloon target initialization for PVH dom0"") [v7.0-rc1]
caued a regression. For details see
<a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D221745"
          moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https:=
//bugzilla.kernel.org/show_bug.cgi?id=3D221745</a>

To quote the initial comment:

</div><blockquote class=3D"gmail_quote"
style=3D"margin-bottom: 1ex; --com-fsck-k9__blockquote-default-border-col=
or: #ad7fa8;"><div
          dir=3D"auto">Since commit db8c4b1 (Partial revert "x86/xen: fix=
 balloon target initialization for PVH dom0"), xen ballooning fails to in=
it correctly on domU (on amd64 arch) with the following configuration:

-- xl.cfg
=2E..
memory      =3D '2048'
maxmem      =3D '4096'
=2E..
--

-- domU balloon dmesg (init fails)
[    0.908337] xen:balloon: Initialising balloon driver
[    0.940721] Extra pages underflow current target
</div></blockquote></blockquote><div dir=3D"auto">
Yeah, I'm afraid the original fix commit didn't fully fix the issues,
so there's the following change (chunk below) that's needed
additionally to cope with memory !=3D maxmem on PV guests.

I've done some basic testing and it seems to solve the issue, could
you give it a spin also?  (just to make sure I'm not missing anything
else).

Thanks, Roger.<hr>diff --git a/drivers/xen/balloon.c b/drivers/xen/balloo=
n.c
index e7f1d4ca6d75..c20a1ff8292d 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -703,19 +703,26 @@ static int __init balloon_add_regions(void)
 			balloon_append(pfn_to_page(pfn));
=20
 		/*
-		 * Extra regions are accounted for in the physmap, but need
-		 * decreasing from current_pages and target_pages to balloon
-		 * down the initial allocation, because they are already
-		 * accounted for in total_pages.
+		 * For HVM domains: extra regions are accounted for in the
+		 * physmap, but need decreasing from current_pages and
+		 * target_pages to balloon down the initial allocation, because
+		 * they are already accounted for in total_pages.
+		 *
+		 * For PV domains: extra regions are not accounted for in the
+		 * initial memory target, and hence need adding to the stats as
+		 * additional unpopulated regions.
 		 */
 		pages =3D extra_pfn_end - start_pfn;
-		if (pages &gt;=3D balloon_stats.current_pages ||
-		    pages &gt;=3D balloon_stats.target_pages) {
+		if (xen_pv_domain()) {
+			balloon_stats.total_pages +=3D pages;
+		} else if (pages &gt;=3D balloon_stats.current_pages ||
+		           pages &gt;=3D balloon_stats.target_pages) {
 			WARN(1, "Extra pages underflow current target");
 			return -ERANGE;
+		} else {
+			balloon_stats.current_pages -=3D pages;
+			balloon_stats.target_pages -=3D pages;
 		}
-		balloon_stats.current_pages -=3D pages;
-		balloon_stats.target_pages -=3D pages;
 	}
=20
 	return 0;
</div></pre>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------jrC2FWRPAOdkLGqhkPnFxVLj--

