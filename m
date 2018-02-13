From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/3] pvh/dom0: whitelist PVH Dom0 ACPI tables
Date: Tue, 13 Feb 2018 09:59:06 +0000
Message-ID: <20180213095906.boak3yclhbgcnui7@MacBook-Pro-de-Roger.local>
References: <20180208122539.56095-1-roger.pau@citrix.com>
 <20180208122539.56095-4-roger.pau@citrix.com>
 <5A82BDF402000078001A7391@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4evf=fh=citrix.com=prvs=5759c21e7=roger.pau@srs-us1.protection.inumbo.net>)
 id 1elXMr-0002RA-2g
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 09:59:17 +0000
Content-Disposition: inline
In-Reply-To: <5A82BDF402000078001A7391@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMTMsIDIwMTggYXQgMDI6Mjk6MDhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA4LjAyLjE4IGF0IDEzOjI1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gCj4gQSBjaGFuZ2UgbGlrZSB0aGlzIHNob3VsZCBub3QgY29tZSB3aXRob3V0IGRl
c2NyaXB0aW9uLCBwcm92aWRpbmcgYQo+IHJlYXNvbiBmb3IgdGhlIGNoYW5nZS4gT3RoZXJ3aXNl
IGhvdyB3aWxsIHNvbWVvbmUgd2FudGluZyB0bwo+IHVuZGVyc3RhbmQgdGhlIGNoYW5nZSBpbiBh
IGNvdXBsZSBvZiB5ZWFycyBhY3R1YWxseSBiZSBhYmxlIHRvCj4gbWFrZSBhbnkgc2Vuc2Ugb2Yg
aXQuIFRoaXMgaXMgaW4gcGFydGljdWxhciBiZWNhdXNlIEkgY29udGludWUgdG8gYmUKPiBub3Qg
ZnVsbHkgY29udmluY2VkIHRoYXQgd2hpdGUgbGlzdGluZyBpcyBhcHByb3ByaWF0ZSBpbiB0aGUg
RG9tMAo+IGNhc2UgKGFuZCBmb3IgdGhlIHJlY29yZCBJJ20gc2ltaWxhcmx5IHVuY29udmluY2Vk
IHRoYXQgYmxhY2sgbGlzdGluZwo+IGlzIHRoZSBiZXN0IGNob2ljZSwgeWV0IG9idmlvdXNseSB3
ZSBuZWVkIHRvIHBpY2sgb24gb2YgdGhlIHR3bykuCgpJJ20gc29ycnksIEkgdGhvdWdodCB3ZSBh
Z3JlZWQgYXQgdGhlIHN1bW1pdCB0byBjb252ZXJ0IHRoaXMgdG8Kd2hpdGVsaXN0aW5nIGJlY2F1
c2UgaXQgd2FzIGxpa2VseSBiZXR0ZXIgdG8gc2ltcGx5IG5vdCBleHBvc2UgdW5rbm93bgpBQ1BJ
IHRhYmxlcyB0byBndWVzdHMuCgpJIGd1ZXNzIHRoZSBjb21taXQgbWVzc2FnZSBjb3VsZCBiZSBz
b21ldGhpbmcgbGlrZToKCiJUaGUgZm9sbG93aW5nIGxpc3Qgb2Ygd2hpdGVsaXN0ZWQgQVBJQyB0
YWJsZXMgYXJlIGVpdGhlciBrbm93biB0byB3b3JrCm9yIGRvbid0IHJlcXVpcmUgYW55IHJlc291
cmNlcyB0byBiZSBtYXBwZWQgaW4gZWl0aGVyIHRoZSBJTyBvciB0aGUKbWVtb3J5IHNwYWNlLgoK
VGhpcyBsaXN0IGlzIGV4cGVjdGVkIHRvIGJlIGV4cGFuZGVkIGFzIG1vcmUgdGVzdGluZyBpcyBw
ZXJmb3JtZWQuIgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
