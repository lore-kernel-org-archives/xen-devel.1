From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/mm/p2m: don't needlessly limit MMIO
 mapping order to 4k
Date: Tue, 16 Oct 2018 17:26:44 +0100
Message-ID: <20181016162644.xtfjulcvpspfkglp@mac.bytemobile.com>
References: <20181016144155.24646-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t41/=m4=citrix.com=prvs=820e2e984=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gCSBJ-0003zf-3m
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 16:26:53 +0000
Content-Disposition: inline
In-Reply-To: <20181016144155.24646-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMTYsIDIwMTggYXQgMDM6NDE6NTVQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBQMk0gY29tbW9uIGNvZGUgY3VycmVudGx5IHJlc3RyaWN0cyB0aGUgTU1JTyBt
YXBwaW5nIG9yZGVyIG9mIGFueQo+IGRvbWFpbiB3aXRoIElPTU1VIG1hcHBpbmdzLCBidXQgdGhh
dCBpcyBub3QgdXNpbmcgc2hhcmVkIHRhYmxlcywgdG8gNGsuCj4gVGhpcyBoYXMgYmVlbiBzaG93
biB0byBoYXZlIGEgaHVnZSBwZXJmb3JtYW5jZSBjb3N0IHdoZW4gcGFzc2luZyB0aHJvdWdoCj4g
YSBQQ0kgZGV2aWNlIHdpdGggYSB2ZXJ5IGxhcmdlIEJBUiAoZS5nLiBOVklESUEgUDQwKSwgaW5j
cmVhc2luZyB0aGUgZ3Vlc3QKPiBib290IHRpbWUgZnJvbSB+MjBzIHRvIHNldmVyYWwgbWludXRl
cyB3aGVuIGlvbW11PW5vLXNoYXJlcHQgaXMgc3BlY2lmaWVkCj4gb24gdGhlIFhlbiBjb21tYW5k
IGxpbmUuCj4gCj4gVGhlIGxpbWl0YXRpb24gd2FzIGFkZGVkIGJ5IGNvbW1pdCBjM2M3NTZiZCAi
eDg2L3AybTogdXNlIGxhcmdlIHBhZ2VzCj4gZm9yIE1NSU8gbWFwcGluZ3MiIGhvd2V2ZXIgdGhl
IHVuZGVybHlpbmcgaW1wbGVtZW50YXRpb25zIG9mIHAybS0+c2V0X2VudHJ5Cj4gZm9yIEludGVs
IGFuZCBBTUQgYXJlIGNvZGVkIHRvIGNvcGUgd2l0aCBtYXBwaW5nIG9yZGVycyBoaWdoZXIgdGhh
biA0aywKPiBldmVuIHRob3VnaCB0aGUgSU9NTVUgbWFwcGluZyBmdW5jdGlvbiBpcyBpdHNlbGYg
Y3VycmVudGx5IGxpbWl0ZWQgdG8gNGssCj4gc28gdGhlcmUgaXMgbm8gcmVhbCBuZWVkIHRvIGxp
bWl0IHRoZSBvcmRlciBwYXNzZWQgaW50byB0aGUgbWV0aG9kLgo+IAo+IFdpdGggdGhpcyBwYXRj
aCBhcHBsaWVkIHRoZSBWTSBib290IHRpbWUgaXMgcmVzdG9yZWQgdG8gc29tZXRoaW5nCj4gcmVh
c29uYWJsZS4gTm90IGFzIGZhc3QgYXMgd2l0aG91dCBpb21tdT1uby1zaGFyZXB0LCBidXQgd2l0
aGluIGEgZmV3Cj4gc2Vjb25kcyBvZiBpdC4KCkkgZ3Vlc3MgdGhlIHdvcnJ5IHdhcyB0aGF0IHRo
ZSBsb29wIGluIGZvciBleGFtcGxlIGVwdF9zZXRfZW50cnkgdG8KcGVyZm9ybSB0aGUgaW9tbXUg
bWFwcGluZ3Mgd291bGQgdGFrZSB0b28gbG9uZyBhbmQgdHJpZ2dlciB0aGUKd2F0Y2hkb2cgaWYg
Zm9yIGV4YW1wbGUgYSAxR0IgcGFnZSBpcyBtYXBwZWQ/CgpJbiBhbnkgY2FzZSB3ZSBhbHJlYWR5
IGFsbG93IHRvIG1hcCBoaWdoZXIgb3JkZXIgbm9uLU1NSU8gcGFnZXMsIHdoaWNoCnNob3VsZCBh
bHNvIHRyaWdnZXIgc3VjaCBpc3N1ZT8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
