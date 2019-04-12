Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D731FC10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:46:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8F8E20850
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8F8E20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEskd-0005aH-FU; Fri, 12 Apr 2019 09:45:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04/T=SO=citrix.com=prvs=998838f76=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hEskc-0005Z6-0A
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 09:45:38 +0000
X-Inumbo-ID: b83afa1e-5d07-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b83afa1e-5d07-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 09:45:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,340,1549929600"; d="scan'208";a="88750697"
To: Laszlo Ersek <lersek@redhat.com>, <devel@edk2.groups.io>,
 <anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-22-anthony.perard@citrix.com>
 <aa91dd4c-caac-a82e-01a4-fd3de6de6578@redhat.com>
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
Message-ID: <4aab37c6-5eef-8b19-399e-5f9b83a004ef@citrix.com>
Date: Fri, 12 Apr 2019 10:45:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <aa91dd4c-caac-a82e-01a4-fd3de6de6578@redhat.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 21/31]
 OvmfPkg/XenPlatformPei: Get E820 table via hypercall ...
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
 Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412094530.kHGkXrXQNgnYe6yx791LtxrwjChHCA_X0GFDrrTrFEI@z>

T24gMTIvMDQvMjAxOSAxMDozMywgTGFzemxvIEVyc2VrIHdyb3RlOgo+IE9uIDA0LzA5LzE5IDEz
OjA4LCBBbnRob255IFBFUkFSRCB3cm90ZToKPj4gQEAgLTcyLDcgKzgxLDQyIEBAIFhlbkdldEU4
MjBNYXAgKAo+PiAgICAgIHJldHVybiBFRklfU1VDQ0VTUzsKPj4gICAgfQo+PiAgCj4+IC0gIHJl
dHVybiBFRklfTk9UX0ZPVU5EOwo+PiArICAvLwo+PiArICAvLyBPdGhlcndpc2UsIGdldCB0aGUg
RTgyMCB0YWJsZSBmcm9tIHRoZSBYZW4gaHlwZXJ2aXNvcgo+PiArICAvLwo+PiArCj4+ICsgIGlm
IChFODIwRW50cmllc0NvdW50ID4gMCkgewo+PiArICAgICpFbnRyaWVzID0gRTgyMEVudHJpZXM7
Cj4+ICsgICAgKkNvdW50ID0gRTgyMEVudHJpZXNDb3VudDsKPj4gKyAgICByZXR1cm4gRUZJX1NV
Q0NFU1M7Cj4+ICsgIH0KPj4gKwo+PiArICBQYXJhbWV0ZXJzLm5yX2VudHJpZXMgPSAxMjg7Cj4+
ICsgIHNldF94ZW5fZ3Vlc3RfaGFuZGxlIChQYXJhbWV0ZXJzLmJ1ZmZlciwgRTgyMEVudHJpZXMp
Owo+PiArCj4+ICsgIC8vIFJldHVybnMgYSBlcnJubwo+PiArICBSZXR1cm5Db2RlID0gWGVuSHlw
ZXJjYWxsTWVtb3J5T3AgKFhFTk1FTV9tZW1vcnlfbWFwLCAmUGFyYW1ldGVycyk7Cj4+ICsgIEFT
U0VSVCAoUmV0dXJuQ29kZSA9PSAwKTsKPj4gKwo+PiArICBFODIwRW50cmllc0NvdW50ID0gUGFy
YW1ldGVycy5ucl9lbnRyaWVzOwo+PiArCj4+ICsgIC8vCj4+ICsgIC8vIFNvcnQgRTgyMCBlbnRy
aWVzCj4+ICsgIC8vCj4+ICsgIGZvciAoTG9vcEluZGV4ID0gMTsgTG9vcEluZGV4IDwgRTgyMEVu
dHJpZXNDb3VudDsgTG9vcEluZGV4KyspIHsKPj4gKyAgICBmb3IgKEluZGV4ID0gTG9vcEluZGV4
OyBJbmRleCA8IEU4MjBFbnRyaWVzQ291bnQ7IEluZGV4KyspIHsKPj4gKyAgICAgIGlmIChFODIw
RW50cmllc1tJbmRleCAtIDFdLkJhc2VBZGRyID4gRTgyMEVudHJpZXNbSW5kZXhdLkJhc2VBZGRy
KSB7Cj4+ICsgICAgICAgIFRtcEVudHJ5ID0gRTgyMEVudHJpZXNbSW5kZXhdOwo+PiArICAgICAg
ICBFODIwRW50cmllc1tJbmRleF0gPSBFODIwRW50cmllc1tJbmRleCAtIDFdOwo+PiArICAgICAg
ICBFODIwRW50cmllc1tJbmRleCAtIDFdID0gVG1wRW50cnk7Cj4+ICsgICAgICB9Cj4+ICsgICAg
fQo+PiArICB9Cj4+ICsKPj4gKyAgKkNvdW50ID0gRTgyMEVudHJpZXNDb3VudDsKPj4gKyAgKkVu
dHJpZXMgPSBFODIwRW50cmllczsKPj4gKwo+PiArICByZXR1cm4gRUZJX1NVQ0NFU1M7Cj4+ICB9
Cj4+ICAKPj4gIC8qKgo+Pgo+ICJ4ZW5fbWVtb3J5X21hcF90IiBhbmQgInNldF94ZW5fZ3Vlc3Rf
aGFuZGxlIiBsb29rIHJlYWxseSBmb3JlaWduIGluIGVkazIsIGJ1dCBJIGd1ZXNzIHdlJ2xsIGhh
dmUgdG8gbGl2ZSB3aXRoIHRoZW0uCgpGb3IgaGlzdG9yaWNhbCByZWFzb25zLCB0aGUgQUJJIHdh
cyBkZXNjcmliZWQgdXNpbmcgQyBzdHJ1Y3R1cmVzIChhbmQgaW4KaGluZHNpZ2h0LCBhIHZlcnkg
cG9vciBpZGVhLCBzZWVpbmcgYXMgaXQgYWxsIHdlbnQgdG8gcG90IHdoZW4gInVuc2lnbmVkCmxv
bmciIGNoYW5nZWQgc2l6ZSBmb3IgNjRiaXQpLCBhbmQgdGhlIGV4cGVjdGF0aW9uIHdhcyB0aGF0
IGV2ZXJ5CmRvd25zdHJlYW0gcHJvamVjdCB3YW50aW5nIHRvIG1ha2UgaHlwZXJjYWxscyB3b3Vs
ZCBjb3B5IHRoZSAiY2Fub25pY2FsCmNvcHkiIG9mIHRoZSBBQkksIHdoaWNoIHR1cm5zIGl0IGlu
dG8gYSBkZWZhY3RvIEFQSSBhcyB3ZWxsLgoKSG93ZXZlciwgdGhlcmUgaXMgYWJzb2x1dGVseSBu
b3RoaW5nIHN0b3BwaW5nIGEgZG93bnN0cmVhbSBwcm9qZWN0CmRlY2lkaW5nIG5vdCB0byB0YWtl
IHRoaXMgcm91dGUsIGFuZCBoYXZpbmcgWGVuJ3MgQUJJIGV4cHJlc3NlZCBpbiB0aGVpcgpsb2Nh
bCBzdHlsZS7CoCBVbHRpbWF0ZWx5LCB0aGF0IGlzIGRvd24gdG8gdGhlIG1haW50YWluZXJzIG9m
IHRoZSBwcm9qZWN0CnRvIGRlY2lkZSB3aGljaCBhcHByb2FjaCB0aGV5IHdvdWxkIHByZWZlci4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
