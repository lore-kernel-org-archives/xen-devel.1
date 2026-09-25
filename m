Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A77BC9830E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 10:25:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433682.1654104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA37b-0004FW-MG; Fri, 25 Sep 2026 10:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433682.1654104; Fri, 25 Sep 2026 10:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA37b-0004FP-JW; Fri, 25 Sep 2026 10:25:39 +0000
Received: by outflank-mailman (input) for mailman id 1433682;
 Fri, 25 Sep 2026 10:25:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xA37a-0004FJ-4h
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 10:25:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA37Z-008Qqe-EB
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 12:25:37 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6ab64bf4-bab6-0a2a0a5309dd-0a2a450ce7d0-40
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 12:25:37 +0200
Received: from [74.125.228.98] (helo=mail-ed2-f34.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6ab64c21-f479-0a2a450c0019-4a7de462963c-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 12:25:37 +0200
Received: by mail-ed2-f34.google.com with SMTP id
 4fb4d7f45d1cf-6aae7b7fe22so1039004a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 03:25:37 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aae5dd78e1sm830540a12.18.2026.09.25.03.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 03:25:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790331937; x=1790936737; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZWNYdM3K5LHNSvq4KmxGNNLfg/K9DprEEpObZs9aw3I=;
        b=ToEVOl8oMgyIAiid2cdyKGI1RU4aIAgnM5j6XqUHDX3Xjzq5K2ZpKYagO7QhitcU49
         0S9UAE6ZsktYu0hcc7VMji4d7cV+RsMdOKthcihETLDRs5BC1yi5uLGEd9hrhDefJj+9
         vffs9zjHtsLQ4l4cNpFCDKFf0YlretaSPHh1prycPLJIzorsmbBORJxme0mAU1AEVD1y
         EtsthtaAly1f4yhmJzDsRwjPgIn55W+G3sB5xaaIXZdc+8fvMJD5Qsom8ofNBWQ0WUBr
         7iFfaJ9tKSmRNiVngO0EP7He4JmdYGRNoJgYj2RBF4qTeZf0I2udJvU8u1EFq50KXxGO
         Hf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331937; x=1790936737;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWNYdM3K5LHNSvq4KmxGNNLfg/K9DprEEpObZs9aw3I=;
        b=x34bJNJxNzHAwNV6BZKc2sQwwXjE+IfLJkEVmAa6E88HGWf4WczYm6lchud9syw1Hn
         374RwZv3NcqujWGCgAorQsO0UDyT5YMQKPt8Lg7Su0LuFW+hybr+QqqVyTKArL3Vsu3R
         fQ7BCuds3unQCUkIe1Rb90+vPVW3VLen3CCs/IRNKDkx0+AXVtwW3pEDIY2m9GL9YqpF
         KxQIuAvbSOD6/zbNl7/oW3m2UJGHrNtdT8RH2VdzNeqIT09aoUIjNCnyD0YNGI+YD2HP
         LP4+E+mloNqpmCXJZ2f4AcXA+I/Xw1WdHr8fem+3fKsnOIzWJJvbp3XRnAnIoYsjdPxh
         hBew==
X-Forwarded-Encrypted: i=1; AKwUvBzjq8tME6tZMm2RAqxvdu7BdHNsvwhft4Mxnkfd/+7xrea1SQIJHnXoq+BrvNqxpbXhfVkxf9Uv2Zo=@lists.xenproject.org
X-Gm-Message-State: AFuF++nSm5YbnS/5mmIo6grypnxtBJZFmsKbzXjm2aaiMvveU8re3oGB
	lSHrtSDUQppEy491fda1sgM00QQZPAGwxlmkMLPE4BeSVkLepW5iT14CsjaTiVhg/NE=
X-Gm-Gg: AYBFou3I2uoVutYXtMhL7+YZaTMsdT8zGZywqsGrs5lmtg43ALq4G0jSPNNQUprLR0v
	kg419doQqrXwqU9Nw1PLhMOmZo7IGuvFWe7eSNcMoP4Pufv3kQxxMQoktPob8ptpNf30HPYQ+At
	0OPNBTKDKB3rt7yOdDQlHAGT8L4j0G9Ukrx2cI2ey/u+4kc1KS3NvX8XxvV1biMsKGVcnbNTpIW
	mauinshrARNqDKoy5ubaqYlfUCXSkOfDwe/fCvmjpkvrqlBSWkFrgnT1dFu7aFCHDZJ0IUTRZIE
	RCGosLov4L4vs5f3OOsNFnYgaahVTv9SN6aaHUR5qbB2A+lP6VdF/u46PdllCy9zv3XRUIFjWVK
	ckAH7m/cPxRdjW9lSb2oRfmavy47x+IgYhYpUuLgLutdEPA7jtggQBme+Rn09gfZOlYRrDaDz5Y
	3VekJbwk9mk9lJTWZxiHD6+Fy9jepwdTkdnksSqaPtc7VzlcvWEN3tGZlrWAtYMWUYn7E0NV1Sj
	vlSIjm+20G2UyD7W7LASLk1dOhSLdfMq2z+n55eTi92tzPmPMsM9mq9sU754v86JESf1HKEHKrk
	tqP8mEXH02Y+Pm81/lmWaE2Sj7c0v/3OyBE=
X-Received: by 2002:a05:6402:3251:b0:6aa:a3bd:c6a1 with SMTP id 4fb4d7f45d1cf-6aae8f66ad6mr1177208a12.40.1790331936607;
        Fri, 25 Sep 2026 03:25:36 -0700 (PDT)
Message-ID: <a5c73733-af28-4c74-b7e1-c64b5e3232c4@suse.com>
Date: Fri, 25 Sep 2026 12:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/17] x86/msr: Inline rdmsr/wrmsr instructions
To: Shreshth Srivastava <shreshth.srivastava@intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev,
 kvm@vger.kernel.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, llvm@lists.linux.dev
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, xin@zytor.com,
 nathan@kernel.org, ndesaulniers@google.com, jpoimboe@kernel.org,
 peterz@infradead.org, boris.ostrovsky@oracle.com,
 xen-devel@lists.xenproject.org
References: <20260911084211.3149957-1-jgross@suse.com>
 <20260923193619.1408940-1-shreshth.srivastava@intel.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20260923193619.1408940-1-shreshth.srivastava@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FcahRLIPpkidr0MhRok6l1Ai"
X-purgate-ID: tlsNG-d25034/1790331937-028DDA5B-F021E689/35/110847
X-purgate-type: clean
X-purgate-size: 10662

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FcahRLIPpkidr0MhRok6l1Ai
Content-Type: multipart/mixed; boundary="------------1vAieXh0bKe5ArCEjlp9QPsZ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Shreshth Srivastava <shreshth.srivastava@intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev,
 kvm@vger.kernel.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, llvm@lists.linux.dev
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, xin@zytor.com,
 nathan@kernel.org, ndesaulniers@google.com, jpoimboe@kernel.org,
 peterz@infradead.org, boris.ostrovsky@oracle.com,
 xen-devel@lists.xenproject.org
Message-ID: <a5c73733-af28-4c74-b7e1-c64b5e3232c4@suse.com>
Subject: Re: [PATCH v5 00/17] x86/msr: Inline rdmsr/wrmsr instructions
References: <20260911084211.3149957-1-jgross@suse.com>
 <20260923193619.1408940-1-shreshth.srivastava@intel.com>
In-Reply-To: <20260923193619.1408940-1-shreshth.srivastava@intel.com>

--------------1vAieXh0bKe5ArCEjlp9QPsZ
Content-Type: multipart/mixed; boundary="------------Mkl0Q8jWZxLmkvShEj9On0ww"

--------------Mkl0Q8jWZxLmkvShEj9On0ww
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDkuMjYgMjE6MzYsIFNocmVzaHRoIFNyaXZhc3RhdmEgd3JvdGU6DQo+IE9uIDEx
LjA5LjI2IDEwOjQxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2hlbiBidWlsZGluZyBh
IGtlcm5lbCB3aXRoIENPTkZJR19QQVJBVklSVF9YWEwgdGhlIHBhcmF2aXJ0DQo+PiBpbmZy
YXN0cnVjdHVyZSB3aWxsIGFsd2F5cyB1c2UgZnVuY3Rpb25zIGZvciByZWFkaW5nIG9yIHdy
aXRpbmcgTVNScywNCj4+IGV2ZW4gd2hlbiBydW5uaW5nIG9uIGJhcmUgbWV0YWwuDQo+IA0K
PiBIaSBKdWVyZ2VuLA0KPiANCj4gVGhpcyBkb2Vzbid0IGJ1aWxkIHdpdGggQ09ORklHX1BB
UkFWSVJUX1hYTD15LiAxNi8xNyBhbmQgMTcvMTcgYXJlIHdoZXJlDQo+IGl0IGJyZWFrcywg
YnV0IHRoZSBjYXVzZSBpcyB0aGUgLmJ5dGUgZmFsbGJhY2tzOiBBU01fV1JNU1JOU19JTU0g
ZnJvbQ0KPiAwOC8xNyBhbmQgQVNNX1JETVNSX0lNTSBmcm9tIDEwLzE3IGRvbid0IGVuZCBp
biBhIHNlcGFyYXRvciwgdW5saWtlIHRoZQ0KPiAuaW5zbiB2YXJpYW50cyBhYm92ZSB0aGVt
Lg0KPiANCj4gICAgI2RlZmluZSBBU01fUkRNU1JfSU1NCQkJCVwNCj4gCSIgLmJ5dGUgMHhj
NCwweGU3LDB4N2IsMHhmNiwweGMwOyAubG9uZyAlY1ttc3JdIg0KPiANCj4gVGhhdCB3b3Jr
ZWQgd2hpbGUgdGhleSB3ZXJlIG9ubHkgZXZlciB0aGUgbGFzdCBhcmd1bWVudCBvZiBhbg0K
PiBBTFRFUk5BVElWRSgpLCB3aGljaCBhcHBlbmRzIGl0cyBvd24gbmV3bGluZS4gMTYvMTcg
Y29uY2F0ZW5hdGVzIHRoZW0NCj4gd2l0aCBBU01fQ0xSRVJSOg0KPiANCj4gCUFTTV9SRE1T
Ul9JTU0gQVNNX0NMUkVSUiwgWDg2X0ZFQVRVUkVfTVNSX0lNTSwJXA0KPiANCj4gc28gdGhl
IC5sb25nIG9wZXJhbmQgcnVucyBpbnRvIHRoZSB4b3IuIEZyb20NCj4gbWFrZSBhcmNoL3g4
Ni9rZXJuZWwvY3B1L2NvbW1vbi5zOg0KPiANCj4gCS5ieXRlIDB4YzQsMHhlNywweDdiLDB4
ZjYsMHhjMDsgLmxvbmcgMjY2eG9yICVyZHgsJXJkeA0KPiANCj4gICAgcGFyYXZpcnQtbXNy
Lmg6MTY1OiBFcnJvcjoganVuayBhdCBlbmQgb2YgbGluZSwgZmlyc3QgdW5yZWNvZ25pemVk
IGNoYXJhY3RlciBpcyBgeCcNCj4gDQo+IGNsYW5nIHJlcG9ydHMgImVycm9yOiB1bmV4cGVj
dGVkIHRva2VuIiBpbiB0aGUgc2FtZSBwbGFjZS4gNzEgb2JqZWN0cw0KPiBmYWlsLCB0aGUg
c2FtZSA3MSBlaXRoZXIgd2F5LCBubyB2bWxpbnV4Lg0KPiANCj4gbXNyLmggY2hvb3NlcyBi
ZXR3ZWVuIHRoZSAuaW5zbiBmb3JtIGFuZCB0aGUgLmJ5dGUgZmFsbGJhY2sgd2l0aDoNCj4g
DQo+IAkjaWYgZGVmaW5lZChDT05GSUdfQVNfSVNfR05VKSAmJiBDT05GSUdfQVNfVkVSU0lP
TiA+PSAyNDEwMA0KPiANCj4gVHdvIGtpbmRzIG9mIHRvb2xjaGFpbiBlbmQgdXAgb24gdGhl
IC5ieXRlIHNpZGUgb2YgdGhhdCB0ZXN0Og0KPiANCj4gICAgLSBHTlUgYXMgb2xkZXIgdGhh
biAyLjQxLiBSSEVMIDkgYW5kIENlbnRPUyBTdHJlYW0gOSBzaGlwIDIuMzUsIGFuZA0KPiAg
ICAgIERvY3VtZW50YXRpb24vcHJvY2Vzcy9jaGFuZ2VzLnJzdCBzZXRzIHRoZSBtaW5pbXVt
IGF0IDIuMzAsIHNvIHRoaXMNCj4gICAgICBpcyBhIHN1cHBvcnRlZCBjb25maWd1cmF0aW9u
IHJhdGhlciB0aGFuIGFuIG9sZCBvdXRsaWVyLg0KPiAgICAtIGNsYW5nLCBhbnkgdmVyc2lv
bi4gQ09ORklHX0FTX0lTX0dOVSBpcyBuZXZlciBzZXQgZm9yIGNsYW5nLCBzbyB0aGUNCj4g
ICAgICAmJiBzaG9ydC1jaXJjdWl0cyBhbmQgdGhlIHZlcnNpb24gY29tcGFyaXNvbiBpcyBu
ZXZlciByZWFjaGVkLiBZb3VyDQo+ICAgICAgMDgvMTcgY29tbWVudCBhbHJlYWR5IG5vdGVz
IHRoYXQgY2xhbmcgaGFzIG5vIC5pbnNuIHN1cHBvcnQuDQo+IA0KPiBnY2Mgd2l0aCBiaW51
dGlscyAyLjQxIG9yIG5ld2VyIHRha2VzIHRoZSAuaW5zbiBwYXRoLCB3aGVyZSBib3RoIG1h
Y3Jvcw0KPiBkbyBlbmQgaW4gYSBzZXBhcmF0b3IsIGFuZCBpcyB1bmFmZmVjdGVkLg0KPiAN
Cj4gUmVwcm9kdWNlZCBvbiB2Ny4zLXJjMiB3aXRoIHlvdXIgdjMgMDAvMTMsIHYyIDAvNSBh
bmQgdjUgMDAvMTcgYXBwbGllZCBpbg0KPiB0aGF0IG9yZGVyLCB4ODZfNjQgZGVmY29uZmln
IHBsdXMgSFlQRVJWSVNPUl9HVUVTVCwgUEFSQVZJUlQsIFhFTiBhbmQNCj4gWEVOX1BWLiBn
Y2MgMTEuNS4wIHdpdGggR05VIGFzIDIuMzUuMiwgYW5kIGNsYW5nIDIxLjEuNy4NCj4gDQo+
IFRlcm1pbmF0aW5nIGJvdGggZmFsbGJhY2tzIGZpeGVzIGl0LCBhbmQgYm90aCB0b29sY2hh
aW5zIHRoZW4gYnVpbGQNCj4gdm1saW51eCB3aXRoIG5vIGVycm9ycyBvciB3YXJuaW5nczoN
Cj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3IuaCBiL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL21zci5oDQo+IGluZGV4IGViYTMyNWVjZmU0Yy4uNTI5YzEzNTUz
YzYzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3IuaA0KPiArKysg
Yi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3IuaA0KPiBAQCAtNzgsOSArNzgsOSBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgZG9fdHJhY2VfcmRwbWModTMyIG1zciwgdTY0IHZhbCwgaW50IGZh
aWxlZCkge30NCj4gICAgKiBmb3JtIE1TUiBhY2Nlc3MgaW5zdHJ1Y3Rpb25zIHJlZmVyZW5j
ZSAlcmF4IGFzIHRoZSByZWdpc3RlciBvcGVyYW5kLg0KPiAgICAqLw0KPiAgICNkZWZpbmUg
QVNNX1JETVNSX0lNTQkJCQlcDQo+IC0JIiAuYnl0ZSAweGM0LDB4ZTcsMHg3YiwweGY2LDB4
YzA7IC5sb25nICVjW21zcl0iDQo+ICsJIiAuYnl0ZSAweGM0LDB4ZTcsMHg3YiwweGY2LDB4
YzA7IC5sb25nICVjW21zcl1cblx0Ig0KPiAgICNkZWZpbmUgQVNNX1dSTVNSTlNfSU1NCQkJ
CVwNCj4gLQkiIC5ieXRlIDB4YzQsMHhlNywweDdhLDB4ZjYsMHhjMDsgLmxvbmcgJWNbbXNy
XSINCj4gKwkiIC5ieXRlIDB4YzQsMHhlNywweDdhLDB4ZjYsMHhjMDsgLmxvbmcgJWNbbXNy
XVxuXHQiDQo+ICAgI2VuZGlmDQo+IA0KPiAgICNkZWZpbmUgUkRNU1JfQU5EX1NBVkVfUkVT
VUxUCQkJXA0KPiANCj4gQVNNX1dSTVNSTlMgbmVlZHMgbm8gY2hhbmdlLCBfQVNNX0JZVEVT
KCkgYWxyZWFkeSBlbWl0cyBhIHNlbWljb2xvbi4NCj4gDQo+IFRoZSBXUk1TUk5TIGxpbmUg
YmVsb25ncyBpbiAwOC8xNyBhbmQgdGhlIFJETVNSIGxpbmUgaW4gMTAvMTcuDQoNClRoYW5r
cywgd2lsbCBiZSBmaXhlZCBpbiBWNi4NCg0KDQpKdWVyZ2VuDQo=
--------------Mkl0Q8jWZxLmkvShEj9On0ww
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Mkl0Q8jWZxLmkvShEj9On0ww--

--------------1vAieXh0bKe5ArCEjlp9QPsZ--

--------------FcahRLIPpkidr0MhRok6l1Ai
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmq2TB4FAwAAAAAACgkQsN6d1ii/Ey91
vAf/VB+YAt/VPKDUyX+XUcDHENA9JuLl63VStLAndnBlPvr4goo4TbR55SP/Qw5MebGF5z9/QwTQ
K/pEituZVgrW3mJueIxCaZ7XKdV1u9wnRnZsnvp08rdk8272iHSVOL+jtRpKzCJPlpSUt86d+nnm
bEvk3ZvR0mz3ZmI9oJ/xFqQMOcZilP72lbGJ31q2ZPsiaG+AUa3lGF9uTIsxPurfiXZ3Xp7EJJFu
zG84GsYboJta2BfMbomQc1hEgXd7sTDienp3bd66xNxIrGwyDuw5/WicTPgEZSqnl6f7eQSRu54G
AKbTona4G4ZvUXLUd3ZffjeBXaAZ1fwMJxrGKDVODw==
=TEAR
-----END PGP SIGNATURE-----

--------------FcahRLIPpkidr0MhRok6l1Ai--

