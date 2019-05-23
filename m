From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/2] x86: init_hypercall_page() cleanup
Date: Thu, 23 May 2019 11:23:31 +0100
Message-ID: <20190523102331.GC2373@zion.uk.xensource.com>
References: <1558606816-17842-1-git-send-email-andrew.cooper3@citrix.com>
 <1558606816-17842-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TQZZ=TX=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hTksr-0004NW-Mx
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 10:23:37 +0000
Content-Disposition: inline
In-Reply-To: <1558606816-17842-2-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTE6MjA6MTVBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgdmFyaW91cyBwaWVjZXMgb2YgdGhlIGh5cGVyY2FsbCBwYWdlIGluZnJhc3Ry
dWN0dXJlIGhhdmUgZ3Jvd24KPiBvcmdhbmljYWxseSBvdmVyIHRpbWUgYW5kIGVuZGVkIHVwIGlu
IGEgYml0IG9mIGEgbWVzcy4KPiAKPiAgKiBSZW5hbWUgYWxsIGZ1bmN0aW9ucyB0byBiZSBvZiB0
aGUgZm9ybSAqX2luaXRfaHlwZXJjYWxsX3BhZ2UoKS4gIFRoaXMKPiAgICBtYWtlcyB0aGVtIHNv
bWV3aGF0IHNob3J0ZXIsIGFuZCBtZWFucyB0aGV5IGNhbiBhY3R1YWxseSBiZSBncmVwcGVkCj4g
ICAgZm9yIGluIG9uZSBnby4KPiAgKiBNb3ZlIGluaXRfaHlwZXJjYWxsX3BhZ2UoKSB0byBkb21h
aW4uYy4gIFRoZSA2NC1iaXQgdHJhcHMuYyBpc24ndCBhCj4gICAgdGVycmlibHkgYXBwcm9wcmlh
dGUgcGxhY2UgZm9yIGl0IHRvIGxpdmUuCj4gICogRHJvcCBhbiBvYnNvbGV0ZSBjb21tZW50IGZy
b20gaHZtX2luaXRfaHlwZXJjYWxsX3BhZ2UoKSBhbmQgZHJvcCB0aGUKPiAgICBkb21haW4gcGFy
YW1ldGVyIGZyb20gaHZtX2Z1bmNzLmluaXRfaHlwZXJjYWxsX3BhZ2UoKSBhcyBpdCBpc24ndAo+
ICAgIG5lY2Vzc2FyeS4KPiAgKiBSZWFycmFuZ2UgdGhlIGxvZ2ljIGluIHRoZSBlYWNoIGZ1bmN0
aW9uIHRvIGF2b2lkIG5lZWRpbmcgZXh0cmEgbG9jYWwKPiAgICB2YXJpYWJsZXMsIGFuZCB0byB3
cml0ZSB0aGUgcGFnZSBpbiBvbmUgc2luZ2xlIHBhc3MuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
