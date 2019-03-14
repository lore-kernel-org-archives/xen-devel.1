From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 06/49] x86emul: support AVX512{F, BW,
 DQ} integer broadcast insns
Date: Thu, 14 Mar 2019 16:38:36 +0000
Message-ID: <78ead17e-73f7-83a3-164c-023dda9244f0@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C1A52ED0200007800207865@prv1-mh.provo.novell.com>
 <5C1A57DC02000078002078AD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rzje=RR=citrix.com=prvs=969ff7116=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h4Tg6-0002K6-S5
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 16:57:58 +0000
In-Reply-To: <5C1A57DC02000078002078AD@prv1-mh.provo.novell.com>
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

T24gMTkvMTIvMjAxOCAxNDozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTg0NDQsNiArODQ2
NSw0NSBAQCB4ODZfZW11bGF0ZSgKPiAgICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoZWEu
dHlwZSAhPSBPUF9NRU0gfHwgIXZleC5sIHx8IHZleC53LCBFWENfVUQpOwo+ICAgICAgICAgIGdv
dG8gc2ltZF8wZl9hdngyOwo+ICAKPiArICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBm
MzgsIDB4NzgpOiAvKiB2cGJyb2FkY2FzdGIgeG1tL204LFt4eXpdbW17a30gKi8KPiArICAgIGNh
c2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmMzgsIDB4NzkpOiAvKiB2cGJyb2FkY2FzdHcgeG1t
L20xNixbeHl6XW1te2t9ICovCj4gKyAgICAgICAgaG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUoYXZ4
NTEyYncpOwo+ICsgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZihldmV4LncgfHwgZXZleC5i
cnMsIEVYQ19VRCk7Cj4gKyAgICAgICAgb3BfYnl0ZXMgPSBlbGVtX2J5dGVzID0gMSA8PCAoYiAm
IDEpOwo+ICsgICAgICAgIC8qIFNlZSB0aGUgY29tbWVudCBhdCB0aGUgYXZ4NTEyX2Jyb2FkY2Fz
dCBsYWJlbC4gKi8KPiArICAgICAgICBvcF9tYXNrIHw9ICEoYiAmIDEgPyAhKHVpbnQzMl90KW9w
X21hc2sgOiAhb3BfbWFzayk7Cj4gKyAgICAgICAgZ290byBhdng1MTJmX25vX3NhZTsKPiArCj4g
KyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweDdhKTogLyogdnBicm9hZGNh
c3RiIHIzMixbeHl6XW1te2t9ICovCj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgw
ZjM4LCAweDdiKTogLyogdnBicm9hZGNhc3R3IHIzMixbeHl6XW1te2t9ICovCj4gKyAgICAgICAg
aG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUoYXZ4NTEyYncpOwo+ICsgICAgICAgIGdlbmVyYXRlX2V4
Y2VwdGlvbl9pZihldmV4LncsIEVYQ19VRCk7Cj4gKyAgICAgICAgLyogZmFsbCB0aHJvdWdoICov
Cj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweDdjKTogLyogdnBicm9h
ZGNhc3R7ZCxxfSByZWcsW3h5el1tbXtrfSAqLwo+ICsgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlv
bl9pZigoZWEudHlwZSAhPSBPUF9SRUcgfHwgZXZleC5icnMgfHwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGV2ZXgucmVnICE9IDB4ZiB8fCAhZXZleC5SWCksCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEVYQ19VRCk7CgpnZW5lcmF0ZV9leGNlcHRpb25faWYoZWEu
dHlwZSAhPSBPUF9SRUcgfHwgZXZleC5icnMgfHwKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGV2ZXgucmVnICE9IDB4ZiB8fCAhZXZleC5SWCwgRVhDX1VEKTsKCj8K
Ck90aGVyd2lzZSwgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
