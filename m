Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7B0C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 19:59:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F50320850
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 19:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F50320850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hF2K1-0004tw-8q; Fri, 12 Apr 2019 19:58:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04/T=SO=citrix.com=prvs=998838f76=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hF2Jz-0004tq-Mj
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 19:58:47 +0000
X-Inumbo-ID: 61574573-5d5d-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 61574573-5d5d-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 19:58:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,342,1549929600"; d="scan'208";a="88780083"
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20190412163932.2087-1-tamas@tklengyel.com>
 <29b00ef0-aee5-cd14-9d77-40c846a33cd7@citrix.com>
 <CABfawhkipGg-ba49gpX-A1AfJJtU_P5-3PRLUanKUniBw-zp+A@mail.gmail.com>
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
Message-ID: <3b51018a-f1c0-0fba-1aed-5403cd228cc5@citrix.com>
Date: Fri, 12 Apr 2019 20:58:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABfawhkipGg-ba49gpX-A1AfJJtU_P5-3PRLUanKUniBw-zp+A@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/altp2m: cleanup p2m_altp2m_lazy_copy
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412195842.NeS3gyywEm7hjL5CzxaeYP8kwuvBlaWM0FbYF1bohQ4@z>

T24gMTIvMDQvMjAxOSAyMDo0OSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIEZyaSwgQXBy
IDEyLCAyMDE5IGF0IDE6NDQgUE0gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gd3JvdGU6Cj4+PiArICAgIHAybV9sb2NrKGFwMm0pOwo+Pj4KPj4+IC0gICAgbWZuID0g
Z2V0X2dmbl90eXBlX2FjY2VzcyhocDJtLCBnZm5feChnZm4pLCAmcDJtdCwgJnAybWEsCj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUDJNX0FMTE9DLCAmcGFnZV9vcmRlcik7Cj4+
PiAtICAgIF9fcHV0X2dmbihocDJtLCBnZm5feChnZm4pKTsKPj4+ICsgICAgYW1mbiA9IF9fZ2V0
X2dmbl90eXBlX2FjY2VzcyhhcDJtLCBnZm5fbCwgJmFwMm10LCAmYXAybWEsCj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgTlVMTCwgZmFsc2UpOwo+Pj4KPj4+IC0gICAg
aWYgKCBtZm5fZXEobWZuLCBJTlZBTElEX01GTikgKQo+Pj4gKyAgICAvKiBCYWlsIGlmIGVudHJ5
IGlzIGFscmVhZHkgaW4gYWx0cDJtIG9yIHRoZXJlIGlzIG5vIGVudHJ5IGlzIGhvc3RwMm0gKi8K
Pj4gVGhpcyBjb21tZW50IHRoZW4gcmVkdWNlcyB0bzoKPj4KPj4gLyogRW50cnkgYWxyZWFkeSBw
cmVzZW50IGluIGFwMm0/ICBDYWxsZXIgc2hvdWxkIGhhbmRsZSB0aGUgZmF1bHQuICovCj4+Cj4+
PiArICAgIGlmICggIW1mbl9lcShhbWZuLCBJTlZBTElEX01GTikgfHwgbWZuX2VxKGhtZm4sIElO
VkFMSURfTUZOKSApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIHAybV91bmxvY2soYXAybSk7Cj4+
PiAgICAgICAgICByZXR1cm4gMDsKPj4+IC0KPj4+IC0gICAgcDJtX2xvY2soKmFwMm0pOwo+Pj4g
KyAgICB9Cj4+Pgo+Pj4gICAgICAvKgo+Pj4gICAgICAgKiBJZiB0aGlzIGlzIGEgc3VwZXJwYWdl
IG1hcHBpbmcsIHJvdW5kIGRvd24gYm90aCBmcmFtZSBudW1iZXJzCj4+PiAgICAgICAqIHRvIHRo
ZSBzdGFydCBvZiB0aGUgc3VwZXJwYWdlLgo+Pj4gICAgICAgKi8KPj4+ICAgICAgbWFzayA9IH4o
KDFVTCA8PCBwYWdlX29yZGVyKSAtIDEpOwo+Pj4gLSAgICBtZm4gPSBfbWZuKG1mbl94KG1mbikg
JiBtYXNrKTsKPj4+IC0gICAgZ2ZuID0gX2dmbihnZm5feChnZm4pICYgbWFzayk7Cj4+PiArICAg
IGhtZm4gPSBfbWZuKG1mbl94KGhtZm4pICYgbWFzayk7Cj4+PiArICAgIGdmbiA9IF9nZm4oZ2Zu
X2wgJiBtYXNrKTsKPj4+Cj4+PiAtICAgIHJ2ID0gcDJtX3NldF9lbnRyeSgqYXAybSwgZ2ZuLCBt
Zm4sIHBhZ2Vfb3JkZXIsIHAybXQsIHAybWEpOwo+Pj4gLSAgICBwMm1fdW5sb2NrKCphcDJtKTsK
Pj4+ICsgICAgcnYgPSBwMm1fc2V0X2VudHJ5KGFwMm0sIGdmbiwgaG1mbiwgcGFnZV9vcmRlciwg
aHAybXQsIGhwMm1hKTsKPj4+ICsgICAgcDJtX3VubG9jayhhcDJtKTsKPj4+Cj4+PiAgICAgIGlm
ICggcnYgKQo+Pj4gICAgICB7Cj4+PiAgICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLAo+Pj4g
LSAgICAgICAgICJmYWlsZWQgdG8gc2V0IGVudHJ5IGZvciAlIyJQUkl4NjQiIC0+ICUjIlBSSXg2
NCIgcDJtICUjIlBSSXg2NCJcbiIsCj4+PiAtICAgICAgICAgZ2ZuX3goZ2ZuKSwgbWZuX3gobWZu
KSwgKHVuc2lnbmVkIGxvbmcpKmFwMm0pOwo+Pj4gLSAgICAgICAgZG9tYWluX2NyYXNoKGhwMm0t
PmRvbWFpbik7Cj4+PiArICAgICAgICAiZmFpbGVkIHRvIHNldCBlbnRyeSBmb3IgJSMiUFJJeDY0
IiAtPiAlIyJQUkl4NjQiIHAybSAlIyJQUkl4NjQiXG4iLAo+Pj4gKyAgICAgICAgZ2ZuX2wsIG1m
bl94KGhtZm4pLCAodW5zaWduZWQgbG9uZylhcDJtKTsKPj4gVGhpcyBzaG91bGQgYmUgYSBncHJp
bnRrKCksIG5vdCBhIGdkcHJpbnRrKCksIGJlY2F1c2UgdGhlcmUgaXMgbm90aGluZwo+PiBtb3Jl
IGluZnVyaWF0aW5nIGluIHJlbGVhc2UgYnVpbGRzIHRoYW4gYSBkb21haW5fY3Jhc2goKSB3aXRo
IG5vCj4+IHF1YWxpZmljYXRpb24uCj4+Cj4+IFByaW50aW5nIHRoZSB2aXJ0dWFsIGFkZHJlc3Mg
b2YgdGhlIGFwMm0gaXMgYWxzbyB1c2VsZXNzIGFzIGZhciBhcwo+PiBkaWFnbm9zdGljcyBnby4g
IEhvdyBhYm91dCBzb21ldGhpbmcgbGlrZToKPj4KPj4gIkZhaWxlZCB0byBsYXp5IGNvcHkgZ2Zu
ICUiUFJJX2dmbiIgLT4gJSJQUklfbWZuIiAodHlwZSAldSwgYWNjZXNzICV1LAo+PiBvcmRlciAl
dSkgZm9yIHZpZXcgJXVcbiIKPj4KPj4gaWYgdGhlcmUgaXMgYW4gZWFzeSB3YXkgdG8gYWNjZXNz
IHRoZSB2aWV3IGlkLiAgVGhpcyBhdCBsZWFzdCBzdGFuZHMgYQo+PiBjaGFuY2Ugb2YgYmVpbmcg
dXNlZnVsIHdoZW4gZGVidWdnaW5nLgo+IFllYXAsIG1ha2VzIHNlbnNlLgoKT2gsIGFuZCB3aXRo
IHJ2IGFzIHdlbGwgc28gd2UgY2FuIGdldCBzb21lIGhpbnQgYXMgdG8gd2h5IHRoZQpzZXRfZW50
cnkoKSBmYWlsZWQuCgpBcyB5b3UncmUgdG91Y2hpbmcgZXZlcnkgc2l0ZSwgaG93IGFib3V0IHJl
bmFtaW5nIGl0IHRvIHJldCBvciByYyBmb3IKY29uc2lzdGVuY3k/Cgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
