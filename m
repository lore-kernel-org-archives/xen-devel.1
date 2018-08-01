From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/altp2m: Allow setting the #VE info page
 for an arbitrary VCPU
Date: Wed, 1 Aug 2018 11:30:57 +0300
Message-ID: <0810182f-37ac-3e1e-e470-a95fbe7090b0@bitdefender.com>
References: <20180725114915.26614-1-apop@bitdefender.com>
 <5B604D9C02000078001D96A6@prv1-mh.provo.novell.com>
 <CABfawhkaCVRrrBJ46U--b3odRztXcQ+_+VBebADAB-aF1uYJXg@mail.gmail.com>
 <5B616E0502000078001D9C0F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=reyz=kq=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fkmXF-0005pf-76
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 08:31:09 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id AB4C7307FB2B
 for <xen-devel@lists.xenproject.org>; Wed,  1 Aug 2018 12:47:23 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 040EA7FC09
 for <xen-devel@lists.xenproject.org>; Wed,  1 Aug 2018 11:31:06 +0300 (EEST)
In-Reply-To: <5B616E0502000078001D9C0F@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDEvMjAxOCAxMToyMyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzEuMDcu
MTggYXQgMTk6MTksIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90ZToKPj4gT24gVHVlLCBKdWwg
MzEsIDIwMTggYXQgNTo1MyBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+Pj4+Pj4gT24gMjUuMDcuMTggYXQgMTM6NDksIDxhcG9wQGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4+Pj4gLSAgICAgICAgdmNwdV9hbHRwMm0oY3VycikudmVpbmZvX2dmbiA9IF9nZm4oYS51
LmVuYWJsZV9ub3RpZnkuZ2ZuKTsKPj4+PiAtICAgICAgICBhbHRwMm1fdmNwdV91cGRhdGVfdm1m
dW5jX3ZlKGN1cnIpOwo+Pj4+ICsgICAgICAgIHZjcHVfYWx0cDJtKHYpLnZlaW5mb19nZm4gPSBf
Z2ZuKGEudS5lbmFibGVfbm90aWZ5Lmdmbik7Cj4+Pj4gKyAgICAgICAgYWx0cDJtX3ZjcHVfdXBk
YXRlX3ZtZnVuY192ZSh2KTsKPj4+Cj4+PiBJJ2QgbGlrZSB5b3UgdG8gb3V0bGluZSBpbiB0aGUg
ZGVzY3JpcHRpb24gaG93IHlvdSBtZWFuIGFuIGV4dGVybmFsCj4+PiBhZ2VudCB0byBjb29yZGlu
YXRlIHRoZSB1c2Ugb2YgdGhpcyBHRk4gd2l0aCB0aGUgZ3Vlc3QgKGFuZCBpbgo+Pj4gcGFydGlj
dWxhciB3aXRob3V0IGluLWd1ZXN0IGFnZW50KS4KPj4KPj4gVXNpbmcgI1ZFIHdpdGhvdXQgYW4g
aW4tZ3Vlc3QgYWdlbnQgaXNuJ3QgcmVhbGx5IHBvc3NpYmxlIHNvIHRoaXMgaXMKPj4gcmVhbGx5
IGp1c3QgYWJvdXQgZGVzaWduYXRpbmcgdGhlIHBhZ2UgZnJvbSBkb20wIGluc3RlYWQgb2YgZG9p
bmcgaXQKPj4gd2l0aCB0aGUgaW4tZ3Vlc3QgYWdlbnQuIFNvbWV0aGluZyBoYXMgdG8gYmUgcHJl
c2VudCBpbiB0aGUgZ3Vlc3QgdG8KPj4gaGFuZGxlIHRoZSBuZXcgaW50ZXJydXB0cyBjb21pbmcg
ZnJvbSAjVkUgYWZ0ZXIgYWxsLgo+IAo+IE5vdCBuZWNlc3NhcmlseSAtIHRoZSBleGNlcHRpb24g
Y291bGQgYWxzbyBiZSBpbnRlcmNlcHRlZCwgYW5kIHRoZQo+IGV4dGVybmFsIGFnZW50IGJlIGlu
Zm9ybWVkLCB3aXRoIGl0IHRha2luZyBhcHByb3ByaWF0ZSBhY3Rpb24uCgpSaWdodCwgYnV0IHRo
ZSBtYWluIGF0dHJhY3Rpb24gb2YgYSBoeXBlcnZpc29yLWxldmVsIGFnZW50IGlzIHRoYXQgaXQK
Y2FuJ3QgYmUgbWFuaXB1bGF0ZWQgYXQgYWxsIGZyb20gd2l0aGluIHRoZSBndWVzdCwgdW5saWtl
IHRyYWRpdGlvbmFsCnNvbHV0aW9ucy4KCldpdGggdGhhdCBpbiBtaW5kLCB0aGUgaW4tZ3Vlc3Qg
YWdlbnQgc2hvdWxkIGJlIGFuIG9wdGltaXphdGlvbi1vbmx5CnRvb2wsIGFuZCBub3QgYWxsb3dl
ZCB0byBtYWtlIGl0cyBvd24gZGVjaXNpb25zIGFib3V0IHRoZSBjb3JlCmludHJvc3BlY3Rpb24g
bG9naWMuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
