Return-Path: <SRS0=OoRj=ZL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC88C432C0
	for <xen-devel@archiver.kernel.org>; Tue, 19 Nov 2019 07:31:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEFBC2230E
	for <xen-devel@archiver.kernel.org>; Tue, 19 Nov 2019 07:31:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKYpN/Q2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEFBC2230E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWxyq-00054c-4w; Tue, 19 Nov 2019 07:31:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VpiK=ZL=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1iWxyo-00054V-Bf
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 07:31:18 +0000
X-Inumbo-ID: 92a31868-0a9e-11ea-984a-bc764e2007e4
Received: from mail-io1-xd2d.google.com (unknown [2607:f8b0:4864:20::d2d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92a31868-0a9e-11ea-984a-bc764e2007e4;
 Tue, 19 Nov 2019 07:31:17 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id j13so22082022ioe.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2019 23:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:message-id:date
 :cc:to; bh=y68GACKByylZjYQNKRTauYnJCkfMeiTlUQnlmJ5LmC8=;
 b=MKYpN/Q2yxTj5SjIqpYImARCUGo0K77XlBbENIJgphXxMg5RE8NnyL5tm8FN1Z40Qq
 ovRviZUbzjUMiz61bSBLWMo8RlmB4ZIflBJQBp9nacqyeoFiATjcZ6T36SoLBgac2w85
 Gags0lxTMU15boOl0WwPiyvn6JHcIaYBzDtDxR96sL7PldZPzeGoexcGwN0MDNVggtEi
 TPmH1lu3buROGQ/MrHxTkkEw7uD6uh/W+Ywz1M1MNVJ/Ze9AbOATVLh43k4Jl0+VCrXb
 KsvOKu1KUL/lcSB8DrIH/t5V27DQ3JDA/LYC1Ld/5gnDMYTLvS9RkmY7OV9Y/km3yvwd
 dHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:message-id:date:cc:to;
 bh=y68GACKByylZjYQNKRTauYnJCkfMeiTlUQnlmJ5LmC8=;
 b=H6v6QOJ8bSQN8Byh64CidMVtsR+5s3I0tB/6kjfR/yN1OtWIfbm4+foX5/KyEjHEBg
 wCtnqO8hEFzy7UxpiiOu6mD5x3Ffwbz2Kx5XLbkICzbhRMsA5RhDe4LKmHZmHh3r2qmv
 1vHn8zpZ8R0m0lqEVPVXUIDRlXKpFygEABH+sRy2lbNmZZSZrWhsYndVAbgcedhQgJQv
 hugyU2V5cSIox4aUhIBCdlO1+fMZZ44J35UOTHKj/6oN3EuSmgZ9zdMIvB8vXMtkKQpC
 7qeaOBcYFZtsho3TFoB0b6TkEEEjaTmH7TJjcelgru3WPgOKAJYnxxCqgcVHy7mdEC1B
 RYOQ==
X-Gm-Message-State: APjAAAVLJGX+FXx2q8ko9/Pwg5rTKcb/psN9wQBMYaI4Ug+pogIGfgDv
 2vcU4jKVrNkL0MegwPS/WYs=
X-Google-Smtp-Source: APXvYqyYJNvArckGXmQ0SjSFTj3tjh+FFuLjUrFOFY1rsk4p58gP4HS8iZgcQn0dncfCCqSbH/l0yQ==
X-Received: by 2002:a5e:8519:: with SMTP id i25mr16663385ioj.180.1574148676459; 
 Mon, 18 Nov 2019 23:31:16 -0800 (PST)
Received: from [100.64.72.189] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id c22sm3992191ioa.23.2019.11.18.23.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2019 23:31:15 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <CF777A91-F2D3-4489-B1CB-FB08D55FCD01@gmail.com>
Date: Tue, 19 Nov 2019 02:31:15 -0500
To: Roman Shaposhnik <roman@zededa.com>
X-Mailer: iPhone Mail (17B111)
Subject: Re: [Xen-devel] Likely regression in efi=no-rs option
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
Cc: xen-devel@lists.xenproject.org, =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

77u/T24gTm92IDE5LCAyMDE5LCBhdCAwMjoxMywgUm9tYW4gU2hhcG9zaG5payA8cm9tYW5AemVk
ZWRhLmNvbT4gd3JvdGU6Cj4gCj4g77u/T2ssIHRvIHN1bSB1cCAtLSB0aGVyZSdzIGRlZmluaXRl
bHkgYSBwcmV0dHkgbWFqb3IgcmVncmVzc2lvbiBvbiBhbGwKPiB0aGlzIGhhcmR3YXJlIHdpdGgg
WGVuIDQuMTMgUkMyOgo+ICAgaHR0cHM6Ly93d3cuZGVsbC5jb20vZW4tdXMvd29yay9zaG9wL2dh
dGV3YXlzLWVtYmVkZGVkLWNvbXB1dGluZy9zYy9nYXRld2F5cy1lbWJlZGRlZC1wY3MvZWRnZS1n
YXRld2F5P35jaz1idAo+IAo+IFdpdGhvdXQgZWZpPW5vLXJzIG9wdGlvbiBYZW4gcGFuaWNzIG9u
IGJvb3QgKHNvcnJ5IGZvciBhdHRhY2hpbmcgdGhlCj4gc2NyZWVuc2hvdCAtLSBJIGtub3cgaXQg
aXMgbm90IHN1cGVyIGhlbHBmdWwgYnV0IGl0IGdldHMgdGhlIHBvaW50Cj4gYWNyb3NzKQoKSSBk
b24ndCB0aGluayB0aGUgc2NyZWVuc2hvdCBjYW1lIHRocm91Z2guLgoKQnkgIndpdGhvdXQgZWZp
PW5vLXJzIiBkbyB5b3UgbWVhbiAiZWZpPXJzIiBvciBubyBleHBsaWNpdCB2YWx1ZSBmb3IgZWZp
IG9uIHRoZSBYZW4gY29tbWFuZCBsaW5lPwoKPiBXaXRoIGVmaT1uby1ycyBYZW4gYm9vdHMgZmlu
ZSwgYnV0IERvbTAgY2FuJ3QgY29tZSB1cC4KCklzIHRoYXQgd2l0aCBSQzIsIG9yIFJDMiArIHRo
ZSByZWNlbnQgcGF0Y2ggZnJvbSBNYXJlayBmb3IgZWZpPW5vLXJzPyAgQW55IHNlcmlhbCBsb2dz
IGZyb20gZG9tMCBib290PyAgQ2FuIHlvdSBzaGFyZSB0aGUgZG9tMCBrZXJuZWwgY29tbWFuZCBs
aW5lIHdpdGggYWxsIG9wdGlvbnM/CgpUaGFua3MsClJpY2gKCj4gQW5kLCBvbmNlIGFnYWluLCB0
aGlzIGlzIGNsZWFybHkgYSByZWdyZXNzaW9uIGZyb20gUkMxIChqdXN0IHZlcmlmaWVkKS4KPiAK
PiBUaGFua3MsCj4gUm9tYW4uCj4gCj4+Pj4gT24gU2F0LCBOb3YgMTYsIDIwMTkgYXQgMTI6NDcg
UE0gUmljaCBQZXJzYXVkIDxwZXJzYXVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEkgZG9uJ3Qga25v
dyBpZiB0aGVyZSdzIGEgY2hhbmdlIGluIGVmaT1uby1ycyBiZWhhdmlvciwgYnV0IHNvbWUgRUZJ
IGZpeGVzIHdlcmUgbWVyZ2VkIG9uIDEwLzI1LCB3aGljaCAob24gc29tZSBtYWNoaW5lcykgaGF2
ZSByZWR1Y2VkIHRoZSBuZWVkIHRvIGRpc2FibGUgVUVGSSBydW50aW1lIHNlcnZpY2VzIHRvIHdv
cmsgYXJvdW5kIG5vbi1zcGVjIFVFRkkgZmlybXdhcmUuICBUaGlzIHNob3VsZCBpbmNyZWFzZSBo
YXJkd2FyZSBjb21wYXRpYmlsaXR5IHdpdGggWGVuLiAgT2YgY291cnNlLCB0aGVyZSBjb3VsZCBz
dGlsbCBiZSBvdGhlciByZWFzb25zIHRvIGRpc2FibGUgVUVGSSBydW50aW1lIHNlcnZpY2VzLgo+
PiBDb3VsZCB5b3UgdHJ5IGJvb3RpbmcgdGhlIGFmZmVjdGVkIHN5c3RlbXMgd2l0aCBlZmk9cnM/
Cj4+IFJpY2gKPj4+PiBPbiBOb3YgMTYsIDIwMTksIGF0IDAwOjI3LCBSb21hbiBTaGFwb3Nobmlr
IDxyb21hbkB6ZWRlZGEuY29tPiB3cm90ZToKPj4+IO+7v0hpIQo+Pj4gYXMgSSd2ZSByZXBvcnRl
ZCBlYXJsaWVyIC0tIHBhcnQgb2YgbXkgdGVzdGluZyBvZiBYZW4gNC4xMyBSQzIgZmFpbGVkCj4+
PiBpbiBhIG1hc3NpdmUgd2F5IHdpdGggRG9tMCBuZXZlciBjb21pbmcgdXAuIEkndmUgdHJhY2Vk
IHRoYXQgcHJvYmxlbQo+Pj4gdG8gdGhlIG9wdGlvbiB0aGF0IHdlJ3JlIHVzaW5nIHRvIGJvb3Qg
WGVuOgo+Pj4gZWZpPW5vLXJzCj4+PiBXZSd2ZSBiZWVuIHVzaW5nIHRoaXMgb3B0aW9uIGZvciBx
dWl0ZSBzb21ldGltZSBhbmQgWGVuIDQuMTMgUkMyCj4+PiBpcyB0aGUgZmlyc3Qgb25lIHRoYXQg
c2VlbXMgdG8gbWFrZSBEb20wIGJvb3QgZmFpbCB3aXRoIHRoaXMgb3B0aW9uCj4+PiBwcmVzZW50
IChub3RlIHRoYXQgUkMxIHdhcyBmaW5lKS4KPj4+IEkgd2FzIHdvbmRlcmluZyB3aGV0aGVyIHRo
ZXJlIHdlcmUgYW55IGNoYW5nZXMgaW4gdGhlIGFyZWFzIHJlbGF0ZWQKPj4+IHRvIFVFRkkgaW4g
WGVuIHRoYXQgbWF5IGhhdmUgdHJpZ2dlcmVkIHRoaXMuCj4+PiBIZXJlJ3MgdGhlIGJvb3QgbGlu
ZSB0aGF0IHdvcmtzIHdpdGggUkMyOgo+Pj4gZG9tMF9tZW09MTAyNE0sbWF4OjEwMjRNIGRvbTBf
bWF4X3ZjcHVzPTEgZG9tMF92Y3B1c19waW4gc210PWZhbHNlCj4+PiBhZGRpbmcgZWZpPW5vLXJz
IG1ha2UgRG9tMCBib290IHByb2Nlc3MgZmFpbDoKPj4+IGVmaT1uby1ycyBkb20wX21lbT0xMDI0
TSxtYXg6MTAyNE0gZG9tMF9tYXhfdmNwdXM9MSBkb20wX3ZjcHVzX3BpbiBzbXQ9ZmFsc2UKPj4+
IEF0dGFjaGluZyB4bCBpbmZvIGFuZCBkbWVzZyBqdXN0IGluIGNhc2UKPj4+IFRoYW5rcywKPj4+
IFJvbWFuLgo+Pj4gPGRtZXNnLnR4dD4KPj4+IDxpbmZvLnR4dD4KPj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Cj4+PiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
