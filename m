From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Implementaiton of cc-option in Config.mk
Date: Thu, 15 Mar 2018 02:45:15 -0600
Message-ID: <5AAA40AB02000078001B1F71@prv-mh.provo.novell.com>
References: <20180314171128.52ln4efljqd56mnu@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewOVo-0004pm-3Z
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 08:45:24 +0000
In-Reply-To: <20180314171128.52ln4efljqd56mnu@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE4IGF0IDE4OjExLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhlIGltcGxlbWVudGF0aW9uIG9mIGNjLW9wdGlvbiAoZ3JlcHBpbmcgdGhlIG9wdGlvbiBiZWlu
ZyB0ZXN0ZWQgaW4KPiBvdXRwdXQpIGluIENvbmZpZy5tayBub3cgbWFrZXMgaXQgbm90IHBvc3Np
YmxlIHRvIGRldGVjdCBpZiAtT2cgaXMKPiBzdXBwb3J0ZWQgYmVjYXVzZSAiLU9nIiBkb2Vzbid0
IGFwcGVhciBpbiB0aGUgb3V0cHV0IGlmIGl0IGlzIG5vdAo+IHN1cHBvcnRlZC4gSSBzdXNwZWN0
IHRoZXJlIHdpbGwgYmUgb3RoZXIgb3B0aW9ucyB0aGF0IGNjLW9wdGlvbiBjYW4ndCB3b3JrCj4g
d2l0aC4KPiAKPiBJdCBpcyBpbXBsZW1lbnRlZCBsaWtlIHRoYXQgYmVjYXVzZSB3ZSB0cnkgdG8g
ZGV0ZWN0IC1Xbm8tKiBvcHRpb24uIEJ1dAo+IHdoeSBpcyB0aGF0IGltcG9ydGFudD8gQ2FuJ3Qg
d2UganVzdCBpZ25vcmUgLVduby0qIGlmIHRoZXkgYXJlbid0Cj4gc3VwcG9ydGVkPwoKV2VsbCwg
dGhlIGV4cGxhbmF0aW9uIGZvciBpdHMgYmVoYXZpb3IgaXMgZ2l2ZW4gaW4gdGhlIGNvbW1lbnQK
bmV4dCB0byBpdHMgZGVmaW5pdGlvbjoKCiMgVGhpcyBpcyBjb21wbGljYXRlZCBieSB0aGUgZmFj
dCB0aGF0IHVucmVjb2duaXNlZCAtV25vLSogb3B0aW9uczoKIyAgIChhKSBhcmUgaWdub3JlZCB1
bmxlc3MgdGhlIGNvbXBpbGF0aW9uIGVtaXRzIGEgd2FybmluZzsgYW5kCiMgICAoYikgZXZlbiB0
aGVuIHByb2R1Y2UgYSB3YXJuaW5nIHJhdGhlciB0aGFuIGFuIGVycm9yCgo+IERvZXMgYW55b25l
IGhhcyBhbiBpZGVhIGhvdyB0byBtYWtlIGNjLW9wdGlvbiB3b3JrIGZvciAtT2cKPiAoYW5kIG90
aGVyIG9wdGlvbnMpPwoKSG93IGFib3V0IHNpbXBseSBleHRlbmRpbmcgaXQgdG8gYWxzbyB1c2Ug
dGhlICJ0ZXN0IGZhaWxlZCIKYWx0ZXJuYXRpdmUgaWYgdGhlIGNvbXBpbGF0aW9uIHByb2R1Y2Vk
IGFuIGVycm9yIHN0YXR1cyAod2hpY2gKaXMgY3VycmVudGx5IGlnbm9yZWQgYnkgd2F5IG9mIHRo
ZSB1c2Ugb2YgYSBwaXBlbGluZSk/IFVudGVzdGVkOgoKY2Mtb3B0aW9uID0gJChzaGVsbCBpZiB0
ZXN0IC16ICJgZWNobyAndm9pZCpwPTE7JyB8IFwKICAgICAgICAgICAgICB7ICQoMSkgJCgyKSAt
UyAtbyAvZGV2L251bGwgLXggYyAtIDI+JjEgfHwgZWNobyAkKDIpOyB9IHwgZ3JlcCAtLSAkKDIp
IC1gIjsgXAogICAgICAgICAgICAgIHRoZW4gZWNobyAiJCgyKSI7IGVsc2UgZWNobyAiJCgzKSI7
IGZpIDspCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
