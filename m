Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE16C10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:57:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58343206A3
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58343206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIsAi-0002Xa-UG; Tue, 23 Apr 2019 09:57:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jhle=SZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hIsAi-0002XV-2D
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:57:04 +0000
X-Inumbo-ID: 23321abe-65ae-11e9-9169-2756f2c33e38
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23321abe-65ae-11e9-9169-2756f2c33e38;
 Tue, 23 Apr 2019 09:57:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A781FAD03;
 Tue, 23 Apr 2019 09:56:59 +0000 (UTC)
To: George Dunlap <George.Dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
 <38C4FE16-299B-4726-9BC2-9AC99D6D1F59@citrix.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 mQENBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAG0H0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT6JATkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPuQENBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAGJAR8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHf4kBrQQY
 AQgAIBYhBIUSZ3Lo9gSUpdCX97DendYovxMvBQJa3fDQAhsCAIEJELDendYovxMvdiAEGRYI
 AB0WIQRTLbB6QfY48x44uB6AXGG7T9hjvgUCWt3w0AAKCRCAXGG7T9hjvk2LAP99B/9FenK/
 1lfifxQmsoOrjbZtzCS6OKxPqOLHaY47BgEAqKKn36YAPpbk09d2GTVetoQJwiylx/Z9/mQI
 CUbQMg1pNQf9EjA1bNcMbnzJCgt0P9Q9wWCLwZa01SnQWFz8Z4HEaKldie+5bHBL5CzVBrLv
 81tqX+/j95llpazzCXZW2sdNL3r8gXqrajSox7LR2rYDGdltAhQuISd2BHrbkQVEWD4hs7iV
 1KQHe2uwXbKlguKPhk5ubZxqwsg/uIHw0qZDk+d0vxjTtO2JD5Jv/CeDgaBX4Emgp0NYs8IC
 UIyKXBtnzwiNv4cX9qKlz2Gyq9b+GdcLYZqMlIBjdCz0yJvgeb3WPNsCOanvbjelDhskx9gd
 6YUUFFqgsLtrKpCNyy203a58g2WosU9k9H+LcheS37Ph2vMVTISMszW9W8gyORSgmw==
Message-ID: <14e58f7e-305b-9ed9-9217-2b0b489521c7@suse.com>
Date: Tue, 23 Apr 2019 11:56:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <38C4FE16-299B-4726-9BC2-9AC99D6D1F59@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423095658.hJO8qByFkQ7iImG90MsWcRNYqH7NpfRSUNzt_Sjr31k@z>

T24gMjMvMDQvMjAxOSAxMTo1MCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiAKPiAKPj4gT24gQXBy
IDIwLCAyMDE5LCBhdCA0OjI0IFBNLCBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29t
PiB3cm90ZToKPj4KPj4gSW4gc2NoZWR1bGUoKSwgaWYgd2UgcGljaywgYXMgdGhlIG5leHQgdmNw
dSB0byBydW4gKG5leHQpIHRoZSBzYW1lIG9uZQo+PiB0aGF0IGlzIHJ1bm5pbmcgYWxyZWFkeSAo
cHJldiksIHdlIG5ldmVyIGdldCB0byBjYWxsIGNvbnRleHRfc3dpdGNoKCkuCj4+Cj4+IFdlIGNh
biwgdGhlcmVmb3JlLCBnZXQgcmlkIG9mIGFsbCB0aGUgYGlmYC1zIHRlc3RpbmcgcHJldiBhbmQg
bmV4dCBiZWluZwo+PiBkaWZmZXJlbnQsIHRyYWRpbmcgdGhlbSB3aXRoIGFuIEFTU0VSVCgpIChv
biBBUk0sIHRoZSBBU1NFUlQoKSB3YXMgZXZlbgo+PiBhbHJlYWR5IHRoZXJlISkKPiAKPiBLZWVw
aW5nIGluIG1pbmQgdGhhdCBBU1NFUlQoKSBpcyBtZXJlbHkgYSBkZWJ1Z2dpbmcgYWlkOiBzdXBw
b3NlIHRoYXQgdGVzdGluZyBkaWRu4oCZdCBkaXNjb3ZlciB0aGlzLCBhbmQgYSBidWcgdGhhdCB2
aW9sYXRlZCB0aGlzIGFzc3VtcHRpb24gc2xpcHBlZCBpbnRvIHByb2R1Y3Rpb24uICBXb3VsZCB0
aGUgcGF0Y2hlZCBjb2RlIERUUlQ/CgpUaGUgdW5wYXRjaGVkIGNvZGUgd291bGQgYWxyZWFkeSBk
byBzb21ldGhpbmcgd3Jvbmc6IGl0IHdvdWxkIGNsZWFyCnYtPmlzX3J1bm5pbmcgKHRocm91Z2gg
Y29udGV4dF9zYXZlZCgpKSBmb3IgdGhlIHJ1bm5pbmcgdmNwdSwKcG90ZW50aWFsbHkgbGVhZGlu
ZyB0byBhbGwgc29ydHMgb2Ygd3JvbmcgZGVjaXNpb25zIGluIHRoZSBzY2hlZHVsaW5nCmNvZGUg
bGF0ZXIuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
