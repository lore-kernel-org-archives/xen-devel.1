Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0C6C28EA0
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:20:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB86C206BA
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB86C206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJeIO-0006IF-Jk; Thu, 25 Apr 2019 13:20:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PBl1=S3=citrix.com=prvs=0115b8627=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJeIN-0006IA-EL
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:20:11 +0000
X-Inumbo-ID: d8641748-675c-11e9-9af4-87ccdfbbaf60
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8641748-675c-11e9-9af4-87ccdfbbaf60;
 Thu, 25 Apr 2019 13:20:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,393,1549929600"; d="scan'208";a="89283120"
To: <xen-devel@lists.xenproject.org>
References: <1555936799-15675-1-git-send-email-dongli.zhang@oracle.com>
 <d34d784e-9db9-b646-4099-8b787308fef2@citrix.com>
 <fd752460-921f-3e12-214c-029e595f81b3@citrix.com>
 <c55d9f40-ae67-301b-bc80-8d73bbf053ba@citrix.com>
 <5CC1B1D60200007800229124@prv1-mh.provo.novell.com>
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
Message-ID: <272a713a-b200-3b58-b56e-520f9d4d6afd@citrix.com>
Date: Thu, 25 Apr 2019 14:17:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC1B1D60200007800229124@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/1] xen/gnttab: print log at level
 XENLOG_ERR before panic
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425131752.bd8Z1P7OtV0OPonuTAA2urQMH7hI3uFGc6SvUWyshSk@z>

T24gMjUvMDQvMjAxOSAxNDoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDQuMTkg
YXQgMTg6MDAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjMvMDQv
MjAxOSAxMjo0NywgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+IE9uIDQvMjMvMTkgMTE6MzcgQU0s
IEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4gT24gMjIvMDQvMjAxOSAxMzozOSwgRG9uZ2xpIFpo
YW5nIHdyb3RlOgo+Pj4+PiBQcmludCBsb2cgYXQgbGV2ZWwgWEVOTE9HX0VSUiAoaW5zdGVhZCBY
RU5MT0dfSU5GTykgYXMgZG9tYWluX2NyYXNoKCkKPj4+Pj4gaW5kaWNhdGVzIHRoZXJlIGlzIGZh
dGFsIGVycm9yLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEb25nbGkgWmhhbmcgPGRvbmds
aS56aGFuZ0BvcmFjbGUuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gIHhlbi9jb21tb24vZ3JhbnRfdGFi
bGUuYyB8IDIgKy0KPj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
IGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+Pj4+IGluZGV4IDgwNzI4ZWEuLjcyNWM2MTgg
MTAwNjQ0Cj4+Pj4+IC0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+Pj4+PiArKysgYi94
ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPj4+Pj4gQEAgLTEyODIsNyArMTI4Miw3IEBAIHVubWFw
X2NvbW1vbigKPj4+Pj4gICAgICBpZiAoIHVubGlrZWx5KChyZCA9IHJjdV9sb2NrX2RvbWFpbl9i
eV9pZChkb20pKSA9PSBOVUxMKSApCj4+Pj4+ICAgICAgewo+Pj4+PiAgICAgICAgICAvKiBUaGlz
IGNhbiBoYXBwZW4gd2hlbiBhIGdyYW50IGlzIGltcGxpY2l0bHkgdW5tYXBwZWQuICovCj4+Pj4+
IC0gICAgICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLCAiQ291bGQgbm90IGZpbmQgZG9tYWluICVk
XG4iLCBkb20pOwo+Pj4+PiArICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLCAiQ291bGQgbm90
IGZpbmQgZG9tYWluICVkXG4iLCBkb20pOwo+Pj4+IFdoaWxlIEkgYWdyZWUgd2l0aCB0aGUgY2hh
bmdlIGluIHByaW5jaXBsZSwgd2hhdCBkb2VzIHRoaXMgYWN0dWFsbHkgZG8/IAo+Pj4+IFRoZSBl
bnRpcmUgcHJpbnRrKCkgaXMgY29tcGlsZWQgb3V0IGluIHJlbGVhc2UgYnVpbGRzLCBhbmQgZGVi
dWcgYnVpbGRzCj4+Pj4gbG9nIGFsbCBtZXNzYWdlcy4KPj4+IC4uLmJ5IGRlZmF1bHQ7IGJ1dCBw
cmVzdW1hYmx5IHlvdSBjYW4gdHVybiB0aGF0IGRvd24sIHJpZ2h0Pwo+PiBZZXMgeW91IGNhbiwg
YnV0IGEpIG5vb25lIGRvZXMsIGJlY2F1c2UgdGhlc2UgYXJlIGRlYnVnIGJ1aWxkcyBhbmQgYikK
Pj4gdGhhdCBpc24ndCB0aGUgcG9pbnQuICBJZiB3ZSBjYXJlIGFib3V0IHRoaXMgbWVzc2FnZSBi
ZWluZyBwcmludGVkLCBpdAo+PiBtdXN0buKAmXQgYmUgYSBnZHByaW50aygpLgo+Pgo+PiBJdCBl
aXRoZXIgd2FudHMgdG8gdHVybiBpbnRvIGEgZ3ByaW50aygpIGF0IFhFTkxPR19JTkZPLCBvciB3
YW50cwo+PiBkZWxldGluZyBlbnRpcmVseSwgYnV0IHNpbXBseSBzaHVmZmxpbmcgdGhlIGV4YWN0
IGxldmVsIGZvciBhIGdkcHJpbnRrKCkKPj4gaXMgdGFudGFtb3VudCB0byB1c2VsZXNzLgo+IEZX
SVcgSSBhZ3JlZSwgYW5kIEkgdGhpbmsgdGhlcmUgYXJlIHF1aXRlIGEgZmV3IG1vcmUgY2FuZGlk
YXRlcyBvZgo+IGRlYnVnIG1lc3NhZ2VzIHRoYXQgd291bGQgYmV0dGVyIGdvIGF3YXksIGFuZCBz
aG91bGQgcHJvYmFibHkKPiBoYXZlIGJlZW4gc3RyaXBwZWQgb2ZmIGJlZm9yZSB0aGUgb3JpZ2lu
YWwgY29tbWl0IGludHJvZHVjaW5nIHRoZW0uCj4KPiBUaGUgb25lIHJlYXNvbiBub3QgdG8gZHJv
cCB0aGUgbWVzc2FnZSBoZXJlLCBidXQgdG8gc3dpdGNoIHRvCj4gZ3ByaW50aygpLCBpcyB0aGUg
YWRqYWNlbnQgZG9tYWluX2NyYXNoKCkuIFRoaXMsIGhvd2V2ZXIsIHRoZW4gaXMKPiBhIHJlYXNv
biB0byBnaXZlIGl0IGEgbG9nIGxldmVsIGFib3ZlIElORk8uCgpJIHN0aWxsIGhhdmUgYSBzZXJp
ZXMgSSBuZWVkIHRvIHJlZnJlc2ggYW5kIHJlcG9zdCB3aGljaCBjYXVzZXMKZG9tYWluX2NyYXNo
KCkgdG8gdGFrZSBhIFhFTkxPR19HX0VSUiBwcmludCBtZXNzYWdlLCBzcGVjaWZpY2FsbHkgc28g
aXQKaXMgbm90IHBvc3NpYmxlIHRvIGV2ZXIgZ2V0IGEgZG9tYWluX2NyYXNoKCkgd2l0aG91dCBh
dCBsZWFzdCBhIGhpbnQgb2YKd2hhdCB3ZW50IHdyb25nLgoKfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
