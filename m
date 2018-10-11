From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] x86/vtd: fix IOMMU share PT destruction
 path
Date: Thu, 11 Oct 2018 09:09:48 +0200
Message-ID: <20181011070948.ltpaakb765zwkow6@mac.bytemobile.com>
References: <20181009145708.23976-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=h+49=mx=citrix.com=prvs=8150a737c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gAV6c-0007YU-VS
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 07:09:58 +0000
Content-Disposition: inline
In-Reply-To: <20181009145708.23976-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>, Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMDksIDIwMTggYXQgMDM6NTc6MDhQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBDb21taXQgMjkxNjk1MWMxICgibW0gLyBpb21tdTogaW5jbHVkZSBuZWVkX2lvbW11KCkgdGVz
dCBpbgo+IGlvbW11X3VzZV9oYXBfcHQoKSIpIGluY2x1ZGVkIG5lZWRfaW9tbXUoKSBpbiBpb21t
dV91c2VfaGFwX3B0IGFuZAo+IDkxZDRlY2E3YWRkICgibW0gLyBpb21tdTogc3BsaXQgbmVlZF9p
b21tdSgpIGludG8gaGFzX2lvbW11X3B0KCkgYW5kCj4gbmVlZF9pb21tdV9wdF9zeW5jKCkiKSBt
YWRlIHRoaW5ncyBmaW5lciBncmFpbiBieSBzcGxpdGluZyBuZWVkX2lvbW11Cj4gaW50byB0aHJl
ZSBzdGF0ZXMuCj4gCj4gVGhlIGRlc3RydWN0aW9uIHBhdGggY2FuJ3QgdXNlIGlvbW11X3VzZV9o
YXBfcHQgYmVjYXVzZSBhdCB0aGUgcG9pbnQKPiBwbGF0Zm9ybSBvcCBpcyBjYWxsZWQsIElPTU1V
IGlzIGVpdGhlciBhbHJlYWR5IHN3aXRjaGVkIHRvIG9yIGhhcwo+IGFsd2F5cyBiZWVuIGluIGRp
c2FibGVkIHN0YXRlLCBhbmQgdGhlIHNoYXJlZCBQVCB0ZXN0IHdvdWxkIGFsd2F5cyBiZQo+IGZh
bHNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpS
ZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGlz
IGlzIGZpbmUgKGFuZCB3aWxsIGZpeCBkZXN0cm95aW5nIEhWTS9QVkggZ3Vlc3RzKSwgYnV0IEkg
d291bGQKc3RpbGwgbGlrZSBkZWFsbG9jYXRlX2lvbW11X3BhZ2VfdGFibGVzIChmcm9tIHBjaV9h
bWRfaW9tbXUuYykgdG8gYmUKZml4ZWQgaW4gb3JkZXIgdG8gYXZvaWQgdGhlIHVzYWdlIG9mIGlv
bW11X3VzZV9oYXBfcHQgdGhlcmUgYWxzby4KCklNTyB0aGUgY2hlY2sgaXRzZWxmIGNvdWxkIGJl
IGNvbnZlcnRlZCBpbnRvCkFTU0VSVCghaW9tbXVfaGFwX3B0X3NoYXJlKSBzaW5jZSBpdCdzIHVu
bGlrZWx5IHRoYXQgQU1EIHdpbGwgaGF2ZQpzdXBwb3J0IGZvciBzaGFyZSBwYWdlIHRhYmxlcyBh
bnl0aW1lIHNvb24uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
