From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 28/50] x86emul: support AVX512F floating
 point manipulation insns
Date: Wed, 29 May 2019 07:15:15 -0600
Message-ID: <5CEE85E3020000780023371C@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B84C5020000780021F242@prv1-mh.provo.novell.com>
 <d516dd65-ed3c-0817-26ec-873315fecce3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVyQJ-0002cP-9q
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 13:15:19 +0000
In-Reply-To: <d516dd65-ed3c-0817-26ec-873315fecce3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA1LjE5IGF0IDE0OjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMDo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC05Njgx
LDYgKzk2OTYsMjEgQEAgeDg2X2VtdWxhdGUoCj4+ICAgICAgICAgIG9wX2J5dGVzID0gNDsKPj4g
ICAgICAgICAgZ290byBzaW1kX2ltbThfem1tOwo+PiAgCj4+ICsgICAgY2FzZSBYODZFTVVMX09Q
Q19FVkVYXzY2KDB4MGYzYSwgMHgyNik6IC8qIHZnZXRtYW50cHtzLGR9ICRpbW04LFt4eXpdbW0v
bWVtLFt4eXpdbW17a30gKi8KPj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjNh
LCAweDU0KTogLyogdmZpeHVwaW1tcHtzLGR9ICRpbW04LFt4eXpdbW0vbWVtLFt4eXpdbW0sW3h5
el1tbXtrfSAqLwo+PiArICAgICAgICBob3N0X2FuZF92Y3B1X211c3RfaGF2ZShhdng1MTJmKTsK
Pj4gKyAgICAgICAgaWYgKCBlYS50eXBlICE9IE9QX1JFRyB8fCAhZXZleC5icnMgKQo+PiArICAg
ICAgICAgICAgYXZ4NTEyX3ZsZW5fY2hlY2soZmFsc2UpOwo+PiArICAgICAgICBnb3RvIHNpbWRf
aW1tOF96bW07Cj4+ICsKPj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjNhLCAw
eDI3KTogLyogdmdldG1hbnRze3MsZH0gJGltbTgseG1tL21lbSx4bW0seG1te2t9ICovCj4+ICsg
ICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYzYSwgMHg1NSk6IC8qIHZmaXh1cGltbXN7
cyxkfSAkaW1tOCx4bW0vbWVtLHhtbSx4bW17a30gKi8KPj4gKyAgICAgICAgaG9zdF9hbmRfdmNw
dV9tdXN0X2hhdmUoYXZ4NTEyZik7Cj4+ICsgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZihl
YS50eXBlICE9IE9QX1JFRyAmJiBldmV4LmJycywgRVhDX1VEKTsKPiAKPiBXaHkgdGhlIGVhLnR5
cGUgIT0gT1BfUkVHIHJlc3RyaWN0aW9uPyAgVGhlc2UgZm91ciBpbnN0cnVjdGlvbnMgZG8gdGFr
ZQo+IG1lbW9yeSBvcGVyYW5kcy4KCkRpZCB5b3UgcGVyaGFwcyByZWFkIHRoZSAmJiBhcyB8fCA/
IFNjYWxhciBvcGVyYXRpb25zIChub3QganVzdCB0aGUKb25lcyBoZXJlKSBkb24ndCBzdXBwb3J0
IGJyb2FkY2FzdCAod2l0aCBhIG1lbW9yeSBvcGVyYW5kKSwgYnV0Cm1heSBzdXBwb3J0IGVtYmVk
ZGVkIHJvdW5kaW5nIChvciwgbGlrZSBoZXJlLCBqdXN0IFNBRTsgd2l0aCBhCnJlZ2lzdGVyIG9w
ZXJhbmQpLiBUaGUgZXhhY3Qgc2FtZSBjb25zdHJ1Y3QgZXhpc3RzIGUuZy4gYXQgdGhlCnNpbWRf
em1tX3NjYWxhcl9zYWUgbGFiZWwgKGFuZCB0aGUgYmxvY2sgb2YgY2FzZSBsYWJlbHMgYWhlYWQg
b2YKaXQgYWN0dWFsbHkgYWxzbyBnZXRzIGFkZGVkIHRvIGJ5IHRoZSBwYXRjaCBoZXJlKS4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
