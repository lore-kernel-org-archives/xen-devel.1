Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4558EC10F12
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 10:59:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A63E21773
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 10:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A63E21773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGiHH-00015A-5D; Wed, 17 Apr 2019 10:58:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cP2p=ST=citrix.com=prvs=003bda41c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hGiHF-000151-Dl
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 10:58:53 +0000
X-Inumbo-ID: c8332045-60ff-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c8332045-60ff-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 10:58:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,361,1549929600"; d="scan'208";a="88953306"
To: Wei Liu <wei.liu2@citrix.com>
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
 <20190411102843.GE30543@zion.uk.xensource.com>
 <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
 <20190415092358.GM30543@zion.uk.xensource.com>
 <CABwOO=fSCMfqqay_ZD7FjvoLWjW8PUyyVze9d1s43v=KFDFsXA@mail.gmail.com>
 <20190417095657.GQ30543@zion.uk.xensource.com>
 <20190417104136.GR30543@zion.uk.xensource.com>
 <4487fafe-cee9-4c3b-3059-5073c4a9ce69@citrix.com>
 <20190417105729.GS30543@zion.uk.xensource.com>
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
Message-ID: <cda91b28-50c4-308a-30d8-6cecceb973c6@citrix.com>
Date: Wed, 17 Apr 2019 11:58:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417105729.GS30543@zion.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Hypervisor build can't work without `python` (Was:
 Re: Xen commit 9b0bc91b3 possibly removed too much info from README)
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417105849.pvs4xvuSzAwnA8gHIrUfFFYs9LmhTbxBjG8jDZjDMVQ@z>

T24gMTcvMDQvMjAxOSAxMTo1NywgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEFwciAxNywgMjAx
OSBhdCAxMTo0NDozNkFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxNy8wNC8y
MDE5IDExOjQxLCBXZWkgTGl1IHdyb3RlOgo+Pj4gT24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMTA6
NTY6NTdBTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPj4+Pj4gSGVyZSdzIHdoYXQgaSBkaWQgaGF2
aW5nIHB1bGxlZCB0aGUgbWFzdGVyIGF0IGNvbW1pdCBjYjcwYTI2Cj4+Pj4+Cj4+Pj4+IHRhciB4
ZiAvcGF0aC90by94ZW4tY2I3MGEyNi50YXIuZ3oKPj4+Pj4KPj4+Pj4gY2QgeGVuLW1hc3Rlci8K
Pj4+Pj4KPj4+Pj4gUFlUSE9OPS91c3IvYmluL3B5dGhvbjMgLi9jb25maWd1cmUgLS1wcmVmaXg9
L3VzciAgIFwKPj4+Pj4gICAgLS1kaXNhYmxlLXNlYWJpb3MgICBcCj4+Pj4+ICAgIC0tZGlzYWJs
ZS1xZW11LXRyYWRpdGlvbmFsICBcCj4+Pj4+ICAgIC0tZGlzYWJsZS1yb21iaW9zICAgICBcCj4+
Pj4+ICAgIC0tZGlzYWJsZS1zdHViZG9tIDI+JjEgfCB0ZWUgLi4vY29uZmlnLmxvZwo+Pj4+Pgo+
Pj4+PiBtYWtlIEVGSV9ESVI9L3Vzci9saWIvZWZpIHdvcmxkIDI+JjEgfCB0ZWUgLi4vbWFrZV93
b3JsZF8zLm91dAo+Pj4+Pgo+Pj4+Pgo+Pj4+PiAuLi4KPj4+Pj4gZ2NjIC1XcCwtTUQsdG9vbHMv
a2NvbmZpZy8uemNvbmYudGFiLm8uZCAgICAtRF9HTlVfU09VUkNFCj4+Pj4+IC1EX0RFRkFVTFRf
U09VUkNFIC1EQ1VSU0VTX0xPQz0iPG5jdXJzZXMuaD4iIC1ETkNVUlNFU19XSURFQ0hBUj0xCj4+
Pj4+IC1ETE9DQUxFICAtSXRvb2xzL2tjb25maWcgLWMgLW8gdG9vbHMva2NvbmZpZy96Y29uZi50
YWIubwo+Pj4+PiB0b29scy9rY29uZmlnL3pjb25mLnRhYi5jCj4+Pj4+IGdjYyAgLW8gdG9vbHMv
a2NvbmZpZy9jb25mIHRvb2xzL2tjb25maWcvY29uZi5vIHRvb2xzL2tjb25maWcvemNvbmYudGFi
Lm8KPj4+Pj4gdG9vbHMva2NvbmZpZy9jb25mIC1zIC0tc2lsZW50b2xkY29uZmlnIEtjb25maWcK
Pj4+Pj4gbWFrZVszXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVy
L3hlbicKPj4+Pj4gbWFrZSAtZiBSdWxlcy5tayBfaW5zdGFsbAo+Pj4+PiBtYWtlWzNdOiBFbnRl
cmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPj4+Pj4gbWFrZSAt
QyB0b29scwo+Pj4+PiBtYWtlWzRdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94
ZW4tbWFzdGVyL3hlbi90b29scycKPj4+Pj4gbWFrZSBzeW1ib2xzCj4+Pj4+IG1ha2VbNV06IEVu
dGVyaW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+Pj4+
PiBnY2MgLVdhbGwgLVdlcnJvciAtV3N0cmljdC1wcm90b3R5cGVzIC1PMiAtZm9taXQtZnJhbWUt
cG9pbnRlcgo+Pj4+PiAtZm5vLXN0cmljdC1hbGlhc2luZyAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0
YXRlbWVudCAtbyBzeW1ib2xzCj4+Pj4+IHN5bWJvbHMuYwo+Pj4+PiBtYWtlWzVdOiBMZWF2aW5n
IGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+Pj4+PiBtYWtl
WzRdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xz
Jwo+Pj4+PiBtYWtlIC1mIC91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbi9SdWxlcy5tayBpbmNs
dWRlL3hlbi9jb21waWxlLmgKPj4+Pj4gbWFrZVs0XTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvdXNy
L3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4+Pj4+ICBYZW4gNC4xMy11bnN0YWJsZQo+Pj4+PiAv
YmluL3NoOiBweXRob246IGNvbW1hbmQgbm90IGZvdW5kCj4+Pj4+IG1ha2VbNF06ICoqKiBbTWFr
ZWZpbGU6MTY5OiBpbmNsdWRlL3hlbi9jb21waWxlLmhdIEVycm9yIDEyNwo+Pj4+IEhlcmUuIFRo
ZSBQWVRIT04gaW52b2NhdGlvbiBpcyBmcm9tIHRoZSBoeXBlcnZpc29yIGJ1aWxkLCBub3QgdGhl
IHRvb2xzCj4+Pj4gYnVpbGQuCj4+Pj4KPj4+PiBUaGFua3MgZm9yIHRoZSBsb2cuICBJIHdpbGwg
aGF2ZSBhIGNsb3NlciBsb29rLgo+Pj4+Cj4+Pj4+IG1ha2VbNF06IExlYXZpbmcgZGlyZWN0b3J5
ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4+Pj4+IG1ha2VbM106ICoqKiBbTWFrZWZp
bGU6MTM3OiAvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4veGVuXSBFcnJvciAyCj4+Pj4+IG1h
a2VbM106IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4+
Pj4+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6NDU6IGluc3RhbGxdIEVycm9yIDIKPj4+Pj4gbWFr
ZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPj4+
Pj4gbWFrZVsxXTogKioqIFtNYWtlZmlsZToxMjM6IGluc3RhbGwteGVuXSBFcnJvciAyCj4+Pj4+
IG1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3RlcicKPj4+
Pj4gbWFrZTogKioqIFtNYWtlZmlsZToxNjU6IHdvcmxkXSBFcnJvciAyCj4+Pj4+Cj4+Pj4+Cj4+
Pj4+IE5vdGUgdGhlCj4+Pj4+Cj4+Pj4+IC9iaW4vc2g6IHB5dGhvbjogY29tbWFuZCBub3QgZm91
bmQKPj4+Pj4KPj4+IFRoZSBpc3N1ZSBoZXJlIGlzIG9uIExGUyB0aGVyZSBpcyBubyAvdXNyL2Jp
bi9weXRob24uIFNvIHRoZSBoeXBlcnZpc29yCj4+PiBidWlsZCBpcyBicm9rZW4gYmVjYXVzZSB4
ZW4vaW5jbHVkZS9jb21waWxlLmggaW52b2tlcwo+Pj4KPj4+ICBAJChQWVRIT04pIHRvb2xzL2Zp
Zy10by1vY3QucHkgPCAuYmFubmVyID4+ICRALm5ldwo+Pj4KPj4+IFRoZXJlIGFyZSBvdGhlciBh
cHBlYXJhbmNlcyBvZiBQWVRIT04gaW4gaHlwZXJ2aXNvciBidWlsZCwgd2hpY2ggYXJlCj4+PiBl
cXVhbGx5IGJyb2tlbi4KPj4+Cj4+PiBXZSBoYWQgLyBoYXZlIGEgcG9saWN5IHRvIGF2b2lkIG1h
a2luZyBoeXBlcnZpc29yIGJ1aWxkIGRlcGVuZGVudCBvbgo+Pj4gY29uZmlndXJlLiBJIGhhdmUg
Q0MnZWQgbW9yZSBwZW9wbGUgb24gdGhlaXIgb3BpbmlvbnMuCj4+IFdoZXJlIGhhcyAkKFBZVEhP
TikgZ290IGxvc3Q/wqAgSXQgd2FzIHNwZWNpZmllZCBjb3JyZWN0bHkgdG8gYmVnaW4gd2l0aC4K
PiBXaGVyZSBpcyBpdCBzcGVjaWZpZWQ/CgpPaCAtIEkgc2VlIG5vdy4KCkl0IGlzIHNwZWNpZmll
ZCBmb3IgLi9jb25maWd1cmUsIGJ1dCBub3QgZm9yIG1ha2UuCgpIb3cgaGFzIHRoaXMgZXZlciB3
b3JrZWQ/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
