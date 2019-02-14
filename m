From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 6/7] x86/mm: handle foreign mappings in
 p2m_entry_modify
Date: Thu, 14 Feb 2019 13:12:31 +0100
Message-ID: <20190214120858.mcytbcbnoef376nd@mac>
References: <20190211174642.38046-1-roger.pau@citrix.com>
 <20190211174642.38046-7-roger.pau@citrix.com>
 <5C65503D0200007800216A49@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gB96=QV=citrix.com=prvs=941d1f7e8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1guFsh-0006eh-Vb
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 12:12:44 +0000
Content-Disposition: inline
In-Reply-To: <5C65503D0200007800216A49@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMTQsIDIwMTkgYXQgMDQ6MjU6NDlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDExLjAyLjE5IGF0IDE4OjQ2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQEAgLTk0OCw2ICs5NTEsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHAybV9lbnRy
eV9tb2RpZnkoc3RydWN0IHAybV9kb21haW4gKnAybSwgcDJtX3R5cGVfdCBudCwKPiA+ICAgICAg
ICAgIHAybS0+aW9yZXEuZW50cnlfY291bnQrKzsKPiA+ICAgICAgICAgIGJyZWFrOwo+ID4gIAo+
ID4gKyAgICBjYXNlIHAybV9tYXBfZm9yZWlnbjoKPiA+ICsgICAgICAgIEJVR19PTighbWZuX3Zh
bGlkKG5mbikgfHwKPiA+ICsgICAgICAgICAgICAgICAhcGFnZV9nZXRfb3duZXJfYW5kX3JlZmVy
ZW5jZShtZm5fdG9fcGFnZShuZm4pKSk7Cj4gPiArICAgICAgICBicmVhazsKPiAKPiBBc3NlcnRp
bmcgdGhhdCB0aGUgcGFzc2VkIGluIE1GTiBpcyB2YWxpZCBpcyBmaW5lLiBBc3NlcnRpbmcgdGhh
dCBhCj4gcmVmZXJlbmNlIGNhbiBiZSBnb3QgaXMgbm90LCBhcyB0aGlzIHNldHMgdXMgdXAgZm9y
IGEgRG9TIGluIGNhc2UKPiBvZiBhIHJlZmNvdW50IG92ZXJmbG93LCBvciB0aGUgcGFnZSBoYXZp
bmcgZ290IGJhbGxvb25lZCBvdXQgYnkKPiBpdHMgb3duZXIuIFRoYXQgaXMsIHRoZSBpc3N1ZSBv
ZiB5b3UgZm9sZGluZyB0aGUgdHdvIG9yaWdpbmFsIGNhbGxzCj4gaW50byBvbmUgaXMgd2lkZXIg
dGhhbiBqdXN0IHRoZSB0d28gZGlzdGluY3QgZXJyb3IgY29kZXMgZ2V0dGluZyBsb3N0Cj4gdGhh
dCB3ZXJlIHByZXZpb3VzbHkgcHJvZHVjZWQgLSB5b3UgY2FuJ3QgKGN1cnJlbnRseSkgcmVwb3J0
IHVwCj4gYW55IGVycm9yIGZyb20gdGhpcyBsb3cgbGF5ZXIuIChBbmQgSSdtIHNvcnJ5LCBJIHNo
b3VsZCBoYXZlIG5vdGljZWQKPiB0aGlzIG9uIHYxIGFscmVhZHkuKQoKV2hhdCBhYm91dCB1c2lu
ZyBzb21ldGhpbmcgbGlrZToKCmNhc2UgcDJtX21hcF9mb3JlaWduOgogICAgQlVHX09OKCFtZm5f
dmFsaWQobmZuKSk7CgogICAgaWYgKCAhcGFnZV9nZXRfb3duZXJfYW5kX3JlZmVyZW5jZShtZm5f
dG9fcGFnZShuZm4pKSApCiAgICB7CiAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CiAgICAg
ICAgcmV0dXJuOwogICAgfQoKICAgIGJyZWFrOwoKSXQncyBub3Qgc3RyaWN0bHkgd29yc2UgdGhh
biB3aGF0J3MgY3VycmVudGx5IGRvbmUgaW4gRVBUIGNvZGUsIGJ1dCBJCmFncmVlIGl0IHNob3Vs
ZCBiZSBpbXByb3ZlZC4KCkltcHJvdmluZyB0aGlzIHdpbGwgbWVhbiBtb2RpZnlpbmcgdGhlIHdy
aXRlX3AybV9lbnRyeSBob29rLCBhbmQgYWxsCnRoZSBjYWxsZXJzLCB0b2dldGhlciB3aXRoIGZp
eGluZyB0aGUgaGFuZGxpbmcgb2YgdGhlIHJldHVybiBjb2RlIGZyb20KYXRvbWljX3dyaXRlX2Vw
dF9lbnRyeSwgd2hpY2ggaXMgY3VycmVudGx5IG9ubHkgYXNzZXJ0ZWQuCgpUaGFua3MsIFJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
