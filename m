Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F23DC10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 12:53:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77FE02184E
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 12:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77FE02184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEZCu-0000WW-5U; Thu, 11 Apr 2019 12:53:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YyQZ=SN=citrix.com=prvs=997b111c4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hEZCt-0000Vl-Ay
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 12:53:31 +0000
X-Inumbo-ID: cdf604f2-5c58-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cdf604f2-5c58-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 12:53:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,337,1549929600"; d="scan'208";a="88699676"
To: Anthony PERARD <anthony.perard@citrix.com>, <devel@edk2.groups.io>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-7-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 mQINBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABtClBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPokCOgQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86LkCDQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAYkC
 HwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
Message-ID: <2fbfe0f2-5c34-9faa-bda5-88223770c936@citrix.com>
Date: Thu, 11 Apr 2019 13:52:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-7-anthony.perard@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 06/31] OvmfPkg/XenResetVector: Add new
 entry point for Xen PVH
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>, Laszlo Ersek <lersek@redhat.com>,
 xen-devel@lists.xenproject.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411125227.xL9C-IjNLqWQXFARQWpWGlbw83zkPOGp1mGtCAMC0_M@z>

T24gMDkvMDQvMjAxOSAxMjowOCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gZGlmZiAtLWdpdCBh
L092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbSBiL092bWZQa2cvWGVu
UmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMC4uYzQ4MDJiZjRkMQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Pdm1m
UGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20KPiBAQCAtMCwwICsxLDQ3IEBA
Cj4gKzstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArOyBAZmlsZQo+ICs7IEFuIGVudHJ5IHBvaW50
IHVzZSBieSBYZW4gd2hlbiBhIGd1ZXN0IGlzIHN0YXJ0ZWQgaW4gUFZIIG1vZGUuCj4gKzsKPiAr
OyBDb3B5cmlnaHQgKGMpIDIwMTksIENpdHJpeCBTeXN0ZW1zLCBJbmMuCj4gKzsKPiArOyBUaGlz
IHByb2dyYW0gYW5kIHRoZSBhY2NvbXBhbnlpbmcgbWF0ZXJpYWxzIGFyZSBsaWNlbnNlZCBhbmQg
bWFkZSBhdmFpbGFibGUKPiArOyB1bmRlciB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2YgdGhl
IEJTRCBMaWNlbnNlIHdoaWNoIGFjY29tcGFuaWVzIHRoaXMKPiArOyBkaXN0cmlidXRpb24uICBU
aGUgZnVsbCB0ZXh0IG9mIHRoZSBsaWNlbnNlIG1heSBiZSBmb3VuZCBhdAo+ICs7IGh0dHA6Ly9v
cGVuc291cmNlLm9yZy9saWNlbnNlcy9ic2QtbGljZW5zZS5waHAKPiArOwo+ICs7IFRIRSBQUk9H
UkFNIElTIERJU1RSSUJVVEVEIFVOREVSIFRIRSBCU0QgTElDRU5TRSBPTiBBTiAiQVMgSVMiIEJB
U0lTLCBXSVRIT1VUCj4gKzsgV0FSUkFOVElFUyBPUiBSRVBSRVNFTlRBVElPTlMgT0YgQU5ZIEtJ
TkQsIEVJVEhFUiBFWFBSRVNTIE9SIElNUExJRUQuCj4gKzsKPiArOy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ICsKPiArQklUUyAgICAzMgo+ICsKPiAreGVuUFZITWFpbjoKPiArICAgIG1vdiAgICAg
ZGksICdCUCcKPiArCj4gKyAgICA7IEVTUCAtICBJbml0aWFsIHZhbHVlIG9mIHRoZSBFQVggcmVn
aXN0ZXIgKEJJU1Q6IEJ1aWx0LWluIFNlbGYgVGVzdCkKPiArICAgIG1vdiAgICAgZXNwLCBlYXgK
CldoZXJlIGlzIHRoZSBBQkkgZGVzY3JpYmVkP8KgIFhlbiBoYXMgbm8gQklTVCwgc28gdGhpcyB3
aWxsIGFsd2F5cyBoYXZlCnRoZSB2YWx1ZSAwLiBTdGFzaGluZyBpdCBpbiB0aGUgc3RhY2sgcG9p
bnRlciBzZWVtcyBsaWtlIGEgd2VpcmQgY2hvaWNlLAphbmQgYSByZWNpcGUgZm9yIHN1YnRsZSBi
dWdzLgoKPiArCj4gKyAgICBjbGkKCkludGVycnVwdHMgYXJlIGd1YXJhbnRlZWQgdG8gYmUgb2Zm
IGF0IHRoaXMgcG9pbnQuCgo+ICsKPiArICAgIG1vdiAgICAgZWJ4LCBBRERSX09GKGdkdHIpCj4g
KyAgICBsZ2R0ICAgIFtlYnhdCgpsZ2R0IEFERFJfT0YoZ2R0ciksIHByZXN1bWFibHk/CgpUaGlz
IGlzIDMyYml0IGNvZGUgLSB0aGVyZSBpcyBubyBuZWVkIGZvciBhbnkgaW5kaXJlY3Rpb24gdGhy
b3VnaApyZWdpc3RlcnMgZm9yIG1lbW9yeSBvcGVyYW5kcy4KCj4gKwo+ICsgICAgbW92ICAgICBl
YXgsIFNFQ19ERUZBVUxUX0NSMAo+ICsgICAgbW92ICAgICBjcjAsIGVheAo+ICsKPiArICAgIGpt
cCAgICAgTElORUFSX0NPREVfU0VMOkFERFJfT0YoLmptcFRvTmV3Q29kZVNlZykKPiArLmptcFRv
TmV3Q29kZVNlZzoKPiArCj4gKyAgICBtb3YgICAgIGVheCwgU0VDX0RFRkFVTFRfQ1I0Cj4gKyAg
ICBtb3YgICAgIGNyNCwgZWF4Cj4gKwo+ICsgICAgbW92ICAgICBheCwgTElORUFSX1NFTAo+ICsg
ICAgbW92ICAgICBkcywgYXgKPiArICAgIG1vdiAgICAgZXMsIGF4Cj4gKyAgICBtb3YgICAgIGZz
LCBheAo+ICsgICAgbW92ICAgICBncywgYXgKPiArICAgIG1vdiAgICAgc3MsIGF4Cj4gKwo+ICsg
ICAgOyByZXR1cm4gdG8gdGhlIE1haW4xNgo+ICsgICAgT25lVGltZUNhbGxSZXQgVHJhbnNpdGlv
bkZyb21SZWFsMTZUbzMyQml0RmxhdAoKSXMgdGhlcmUgYW55IGRlc2NyaXB0aW9uIG9mIHdoYXQg
T25lVGltZUNhbGxSZXQgaXMsIGFuZCB3aHkgYSBzaW1wbGUgam1wCndvbnQgZG8/CgpJcnJlc3Bl
Y3RpdmUgb2YgdGhhdCwgeW91J3JlIG1vdmluZyB0byBhIGZ1bmN0aW9uIHdob3NlIG5hbWUgc3Vn
Z2VzdHMgaXQKaXMgaW4gMTZiaXQgbW9kZSwgd2hpbGUgeW91IGFyZSBjdXJyZW50bHkgaW4gMzJi
aXQgZmxhdCBtb2RlLsKgCihTRUNfREVGQVVMVF9DUjAgaGFzIFBFIHNldCwgYW5kIExJTkVBUl9T
RUwgaXMgMzJiaXQgZmxhdC7CoCBUaGlzIGNsZWFybHkKaXNuJ3QgY29ycmVjdCwgYnV0IHN1cmVs
eSB3ZSB3YW50IHRvIHNraXAgYWxsIHRoZSAxNmJpdCBzZXR1cCwgYXMgd2VsbC4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
