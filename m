From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v8 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Thu, 6 Dec 2018 17:34:46 -0500
Message-ID: <3b4fdddd-67d8-30d3-2a5d-c4d07b6f31c9__26226.6298094348$1544135768$gmane$org@oracle.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
 <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PAb1=OP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gV2Gs-0000KZ-F8
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 22:37:26 +0000
In-Reply-To: <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, jgross@suse.com
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvNi8xOCA1OjExIFBNLCBQYW9sbyBCb256aW5pIHdyb3RlOgo+IE9uIDA2LzEyLzE4IDA3
OjA0LCBNYXJhbiBXaWxzb24gd3JvdGU6Cj4+ICtjb25maWcgUFZICj4+ICsJYm9vbCAiU3VwcG9y
dCBmb3IgcnVubmluZyBQVkggZ3Vlc3RzIgo+PiArCS0tLWhlbHAtLS0KPj4gKwkgIFRoaXMgb3B0
aW9uIGVuYWJsZXMgdGhlIFBWSCBlbnRyeSBwb2ludCBmb3IgZ3Vlc3QgdmlydHVhbCBtYWNoaW5l
cwo+PiArCSAgYXMgc3BlY2lmaWVkIGluIHRoZSB4ODYvSFZNIGRpcmVjdCBib290IEFCSS4KPj4g
Kwo+IElJVUMgdGhpcyBicmVha3MgIm5vcm1hbCIgYnpJbWFnZSBib290LCBzbyB3ZSBzaG91bGQg
aGF2ZSBzb21ldGhpbmcgbGlrZQo+Cj4gCVRoZSByZXN1bHRpbmcga2VybmVsIHdpbGwgbm90IGJv
b3Qgd2l0aCBtb3N0IHg4NiBib290IGxvYWRlcnMKPiAJc3VjaCBhcyBHUlVCIAoKCkdydWIgc3Vw
cG9ydCBmb3IgUFZIIGd1ZXN0cyAoZm9yIFhlbikgaXMgd2VsbCB1bmRlciB3YXkuCgoKPiBvciBT
WVNMSU5VWC4gIFVubGVzcyB5b3UgcGxhbiB0byBzdGFydCB0aGUga2VybmVsCj4gCXVzaW5nIFFF
TVUgb3IgWGVuLCB5b3UgcHJvYmFibHkgd2FudCB0byBzYXkgTiBoZXJlLgoKSSB0aGluayBQVkgg
c2hvdWxkIG5vdCBiZSB1c2VyLXNlbGVjdGFibGUgYXQgYWxsLiBJdCBzaG91bGQgYmUgc2VsZWN0
ZWQKYnkgZWl0aGVyIFhFTl9QVkggb3IgS1ZNX0dVRVNUX1BWSCAod2hpY2ggeW91IHN1Z2dlc3Rl
ZCB0byBkcm9wKS4KCj4KPiBhbmQgYWxzbwo+Cj4gCWRlcGVuZHMgb24gIUVGSQo+Cj4gYmVjYXVz
ZSBldmVuIHRob3VnaCBpbiBwcmluY2lwbGUgaXQgd291bGQgYmUgcG9zc2libGUgdG8gd3JpdGUg
YSBQVkgKPiBsb2FkZXIgZm9yIFVFRkksIFBWSCdzIHN0YXJ0IGluZm8gZG9lcyBub3Qgc3VwcG9y
dCB0aGUgRUZJIGhhbmRvdmVyCj4gcHJvdG9jb2wuCgpCdXQgd2Ugc2hvdWxkIGJlIGFibGUgdG8g
YnVpbGQgdGhlIGJpbmFyeSB3aXRoIGJvdGggRUZJIGFuZCBQVkg/CgotYm9yaXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
