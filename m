From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86/vtd: fix IOMMU share PT destruction
 path
Date: Thu, 11 Oct 2018 09:27:31 +0100
Message-ID: <20181011082731.2geggfypuq4vquzj@zion.uk.xensource.com>
References: <20181009145708.23976-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pv6e=mx=citrix.com=prvs=815dbdced=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gAWJj-0007DU-MZ
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 08:27:35 +0000
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
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
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
bHNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpL
ZXZpbiwgY2FuIHlvdSBhY2svbmFjayB0aGlzIHBhdGNoPyBTdGFnaW5nIGlzIGN1cnJlbnRseSBi
bG9ja2VkIGJ5IGEKYnVnIHdoaWNoIGlzIGZpeGVkIGJ5IHRoaXMgcGF0Y2guCgpUaGFua3MsCldl
aS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
