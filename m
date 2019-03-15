From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 09/50] x86emul: support AVX512{F,
 BW} integer unpack insns
Date: Fri, 15 Mar 2019 18:21:43 +0000
Message-ID: <4b177bfd-0aa0-5389-b8d4-91278d8a0fc0@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B813F020000780021F164@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OIle=RS=citrix.com=prvs=970d66146=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h4rUM-0001zc-Ae
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 18:23:26 +0000
In-Reply-To: <5C8B813F020000780021F164@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxMDo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTY2ODEsNiArNjY4
MSwxMiBAQCB4ODZfZW11bGF0ZSgKPiAgICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBm
LCAweGY2KTogLyogdnBzYWRidyBbeHl6XW1tL21lbSxbeHl6XW1tLFt4eXpdbW0gKi8KPiAgICAg
ICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoZXZleC5vcG1zaywgRVhDX1VEKTsKPiAgICAgICAg
ICAvKiBmYWxsIHRocm91Z2ggKi8KPiArICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBm
LCAweDYwKTogLyogdnB1bnBja2xidyBbeHl6XW1tL21lbSxbeHl6XW1tLFt4eXpdbW17a30gKi8K
PiArICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmLCAweDYxKTogLyogdnB1bnBja2x3
ZCBbeHl6XW1tL21lbSxbeHl6XW1tLFt4eXpdbW17a30gKi8KPiArICAgIGNhc2UgWDg2RU1VTF9P
UENfRVZFWF82NigweDBmLCAweDY4KTogLyogdnB1bnBja2hidyBbeHl6XW1tL21lbSxbeHl6XW1t
LFt4eXpdbW17a30gKi8KPiArICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmLCAweDY5
KTogLyogdnB1bnBja2h3ZCBbeHl6XW1tL21lbSxbeHl6XW1tLFt4eXpdbW17a30gKi8KPiArICAg
ICAgICBvcF9ieXRlcyA9IDE2IDw8IGV2ZXgubHI7Cj4gKyAgICAgICAgLyogZmFsbCB0aHJvdWdo
ICovCgpJZiB0aGlzIHNldHRpbmcgb2Ygb3BfYnl0ZXMgaXMgc2FmZSB0byBkbyBmb3IgdnBzYWRi
dywgaG93IGRvZXMgdGhlCmVtdWxhdGlvbiBjdXJyZW50bHkgd29yaz8KCn5BbmRyZXcKCj4gICAg
ICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZiwgMHhkMSk6IC8qIHZwc3JsdyB4bW0vbTEy
OCxbeHl6XW1tLFt4eXpdbW17a30gKi8KPiAgICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82Nigw
eDBmLCAweGUxKTogLyogdnBzcmF3IHhtbS9tMTI4LFt4eXpdbW0sW3h5el1tbXtrfSAqLwo+ICAg
ICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYsIDB4ZjEpOiAvKiB2cHNsbHcgeG1tL20x
MjgsW3h5el1tbSxbeHl6XW1te2t9ICovCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
