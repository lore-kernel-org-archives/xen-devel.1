Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F099C88E40
	for <xen-devel@archiver.kernel.org>; Sun, 13 Sep 2026 05:37:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1419538.1646645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5ctD-0003rX-U8; Sun, 13 Sep 2026 05:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1419538.1646645; Sun, 13 Sep 2026 05:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5ctD-0003rQ-QJ; Sun, 13 Sep 2026 05:36:31 +0000
Received: by outflank-mailman (input) for mailman id 1419538;
 Sun, 13 Sep 2026 05:36:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x5ctC-0003rK-Vh
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 05:36:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5ctC-00FLur-1l
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 07:36:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aa6365d-e002-0a2a0a5209dd-0a2a4503c1dc-2
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 07:36:29 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aa6365d-fae8-0a2a45030019-4a7de48ce250-3
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 07:36:29 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c2940ef15d3so151912466b.2
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 22:36:29 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2966066b75sm264030566b.29.2026.09.12.22.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 22:36:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1789277789; x=1789882589; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x33SXcGKJZwybp329vf09l/E4GjWsK3N79Z1GJxL4P0=;
        b=LlYXKMk/jIRgTfafyLrBI6QkNqAAcF7wAOGxwRFzB7dAXdyF/WdHvGgj6SPKLh7/dy
         RKVRO2XSLO5uYmV6IdbJJdsoB8mo7KGF7fILyUT3Ik0xMDnbQVcgthFf91LOQqGMaQVY
         3DDDeRexrmUqntGE3NEH42QFtKRZYHiyxK1i66hqdiwLQCo6mobpjz8Vu1PYf1xq2vq7
         EiliRxUSNcQU5u7pJ+qIjEKIaBPEEJVlI0JqiNJVt96NYgW/2qj6VRpQ2Hbc2Dw8E0pd
         INiQhJL5UQwGKbbFGvO52AVe6m1CRjUSLJ9hlmhdETgxYSwaB4zm7U+YYY2d0S7HdOJT
         pycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789277789; x=1789882589;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x33SXcGKJZwybp329vf09l/E4GjWsK3N79Z1GJxL4P0=;
        b=L7ODPhtBNp6aq15x+h0fQ++JcvTvsBUBWV0Zud5aLxuYsWLugEOBcnO8cE1o4uVe4P
         3ey71ZceSYPgIjJjpEBl8r/usXC+B4LjC+8BJha5Noxb721k8mnVsNh6GXNyhZ28pMP5
         ODSw3zTW2+YHN4AHwaAZoUMsA5F+7oOJc8BLVwyH7bcV+CS0eTeGatxEMypKBRTTyKFG
         z5b6Mduz7bfpGP7HBK98ILiRkI4r0UV2L3GDqWpJYMkBqbL9Z3EG6D8jlJNPkDWwVyHA
         OlUbyAK5McQJXIi1q8M12SCQHVNJvJQ0pMPxCYAhwsU8XmvB3knA/KOn4cvSywyG616i
         JOCA==
X-Forwarded-Encrypted: i=1; AKwUvBzOlB8bGDC4Xn7WV1yKdWxu4AO6mwqgTDn9Cjg3NCvdBwTA6fwWLFvulOm92qCK+y4EYatqnBft+hc=@lists.xenproject.org
X-Gm-Message-State: AFuF++mkPmLH+R8kAL9YuHOAZ1pQiCKcHE7azQv/uBKHGPddpYG3a1vu
	Qj3kYqSff9vK+4aYKJi9/1MLXQkyuhXFhSJWZP0iuQgI+HP+mUg3uXUDbrEteTokqD0=
X-Gm-Gg: AYBFou0bsELL05th6or69o09e7BuLfqakoicB1RQEdzY3cKd5ydQrVtf4GP1YIMgNcA
	VXQeTkWlrc2CZoRsRQdCyd0COldpFeMGQ1AZrehP4cugCvBqV4Io4HGZTFWAv7V8/keZrwj+KMt
	ETEkmOmlTfOw5G0y6MSpxwoXDg3206bkk55bgxKwzsE6mjhPpGLjKPCCjsJCkyggRK5buqyBDER
	YcOAm26M6FzoS0v6SBVVaSbYDOXPHjTjoix0HDrkJXUUYHPkPrm+DSLgXF/x4wa1wiDDLfp8AMI
	pH0DDkRcAX0/Me+kS2WDjgNaz8h83fsJ0aIGGszpQ0amRfA4dzPOyrauhKdAuhO5M7RB5QLqSMS
	0vr9itaewo/kNHq8clR6waAhe5fb7quCtN00dG3Gszv6AGp2VuQYkUukCqg/H8ctTwwjgmhv9LD
	QBCPI81BM22//dI2vPf2tHFgOpb5kfLmMA4Tdc8tF1qbu2SkVqITZ80FP59IBprpGjPA7TxNPrg
	gyAyC5L4+SZvFTy6j71C/scVEpYFajNlOTVnjWqNbDblNnsScddhb/MwL1218W4oyD+mEZWJyLi
	mSLRwF2MItWyqaAEwuhAoTmA
X-Received: by 2002:a17:907:e895:b0:c20:1bc5:7002 with SMTP id a640c23a62f3a-c29665414f1mr1041706166b.3.1789277789216;
        Sat, 12 Sep 2026 22:36:29 -0700 (PDT)
Message-ID: <170d06eb-5cc7-41f0-a0e0-0eeca77307c7@suse.com>
Date: Sun, 13 Sep 2026 07:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/13] treewide: convert rdmsrq() from a macro to an
 inline function
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux.dev,
 linux-edac@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Pu Wen <puwen@hygon.cn>, Tony Luck <tony.luck@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Babu Moger <babu.moger@amd.com>, Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Len Brown <lenb@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, David Airlie <airlied@redhat.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Viresh Kumar <viresh.kumar@linaro.org>,
 Huang Rui <ray.huang@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Perry Yuan <perry.yuan@amd.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Ashok Raj <ashok.raj.linux@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 Xi Pardee <xi.pardee@linux.intel.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Helge Deller <deller@gmx.de>,
 xen-devel@lists.xenproject.org, linux-geode@lists.infradead.org,
 Michael Kelley <mhklinux@outlook.com>
References: <20260911074530.3140830-1-jgross@suse.com>
 <20260911074530.3140830-13-jgross@suse.com>
 <b2baa471-0f6b-84e8-bda1-ae0964b72b04@linux.intel.com>
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
In-Reply-To: <b2baa471-0f6b-84e8-bda1-ae0964b72b04@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eaM1imaen800kHMvvuISziE6"
X-purgate-ID: tlsNG-33051d/1789277789-6EACC4E9-536B3C0B/0/0
X-purgate-type: clean
X-purgate-size: 10620

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eaM1imaen800kHMvvuISziE6
Content-Type: multipart/mixed; boundary="------------NEp702byBysSRAjr2vYU7iXA";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux.dev,
 linux-edac@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Pu Wen <puwen@hygon.cn>, Tony Luck <tony.luck@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Babu Moger <babu.moger@amd.com>, Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Len Brown <lenb@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, David Airlie <airlied@redhat.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Viresh Kumar <viresh.kumar@linaro.org>,
 Huang Rui <ray.huang@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Perry Yuan <perry.yuan@amd.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Ashok Raj <ashok.raj.linux@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 Xi Pardee <xi.pardee@linux.intel.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Helge Deller <deller@gmx.de>,
 xen-devel@lists.xenproject.org, linux-geode@lists.infradead.org,
 Michael Kelley <mhklinux@outlook.com>
Message-ID: <170d06eb-5cc7-41f0-a0e0-0eeca77307c7@suse.com>
Subject: Re: [PATCH v3 12/13] treewide: convert rdmsrq() from a macro to an
 inline function
References: <20260911074530.3140830-1-jgross@suse.com>
 <20260911074530.3140830-13-jgross@suse.com>
 <b2baa471-0f6b-84e8-bda1-ae0964b72b04@linux.intel.com>
In-Reply-To: <b2baa471-0f6b-84e8-bda1-ae0964b72b04@linux.intel.com>

--------------NEp702byBysSRAjr2vYU7iXA
Content-Type: multipart/mixed; boundary="------------JHou3VyeAHLBdBUp1ZKQPjhy"

--------------JHou3VyeAHLBdBUp1ZKQPjhy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDkuMjYgMTE6MzcsIElscG8gSsOkcnZpbmVuIHdyb3RlOg0KPiBPbiBGcmksIDEx
IFNlcCAyMDI2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPiANCj4+IFRvZGF5IHJkbXNycSgp
IGlzIGEgbWFjcm8gdXNpbmcgaXRzIHNlY29uZCBwYXJhbWV0ZXIgYXMgdGhlIHRhcmdldCBm
b3INCj4+IHN0b3JpbmcgdGhlIHJlYWQgTVNSIHZhbHVlLg0KPj4NCj4+IENvbnZlcnQgcmRt
c3JxKCkgdG8gYW4gaW5saW5lIGZ1bmN0aW9uIHJldHVybmluZyB0aGUgTVNSIHZhbHVlLg0K
Pj4NCj4+IFRoZSB1c2VycyBoYXZlIGJlZW4gY29udmVydGVkIHVzaW5nIHRoZSBmb2xsb3dp
bmcgc2VtYW50aWMgcGF0Y2g6DQo+Pg0KPj4gICAgLy8gT3B0aW9uczogLS1pbmNsdWRlLWhl
YWRlcnMNCj4+DQo+PiAgICB2aXJ0dWFsIHBhdGNoDQo+PiAgICB2aXJ0dWFsIHJlcG9ydA0K
Pj4NCj4+ICAgIEBADQo+PiAgICBleHByZXNzaW9uIG1zciwgdmFsOw0KPj4gICAgQEANCj4+
ICAgICgNCj4+ICAgIC0gcmRtc3JxKG1zcix2YWwpDQo+PiAgICArIHZhbCA9IHJkbXNycSht
c3IpDQo+PiAgICApDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPg0KPj4gQWNrZWQtYnk6IERhbWllbiBMZSBNb2FsIDxkbGVtb2FsQGtl
cm5lbC5vcmc+ICAgICAgIyBBVEENCj4gDQo+IEFja2VkLWJ5OiBJbHBvIErDpHJ2aW5lbiA8
aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+CQkjIHBkeDg2DQo+IA0KPiBXaGF0IGlz
IHRoZSBwbGFuIGZvciBtZXJnaW5nIHRoaXM/DQoNCkluZ28gd2FudGVkIHRvIHRha2UgdGhl
IHdob2xlIHNlcmllcyB2aWEgdGhlIHRpcCB0cmVlLg0KDQoNCkp1ZXJnZW4NCg==
--------------JHou3VyeAHLBdBUp1ZKQPjhy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------JHou3VyeAHLBdBUp1ZKQPjhy--

--------------NEp702byBysSRAjr2vYU7iXA--

--------------eaM1imaen800kHMvvuISziE6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqmNlsFAwAAAAAACgkQsN6d1ii/Ey+b
zwf+OzaU6Petyp2h+7lmUlJdSjc0eGdEi1rB0ocVzj1kZHlAYaJJchfEYlr+cy0jrRbAJUqhocOe
c/DNBw8RSCwubb6xG6QmMEUtKIZLM+wjc/7U/S+ijRfm4cSHAnOr3Vh6jffSSW0G96X5SzsCpC5v
vC2SBDQjyP+kgsXS4vGBrhBzRC4SXsIHwOmVNJWDkTlpnzTh0joIXofqOrNHKQMcGuBpxJCHDYSL
NkUzegBFSRDKWDqtEOP5DrbpgeJEve03txe84l6HRyCVozjsba1pS2fehrmMh9+xRi40lMnxGRKq
EiFbizqDTM71Fgp15B9MKWAg+6FGtcM7TKtwsc/reQ==
=agVt
-----END PGP SIGNATURE-----

--------------eaM1imaen800kHMvvuISziE6--

