From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86/PVH/libxl: Check whether Linux guest
 can handle RSDP at 4G boundary
Date: Mon, 9 Apr 2018 15:41:58 +0100
Message-ID: <20180409144158.j43cqo55gd3wlj6v@citrix.com>
References: <20180409142459.2096-1-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3dws=g6=citrix.com=prvs=63055421e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f5Xzg-0000Ds-0p
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 14:42:04 +0000
Content-Disposition: inline
In-Reply-To: <20180409142459.2096-1-boris.ostrovsky@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: jgross@suse.com, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMDksIDIwMTggYXQgMTA6MjQ6NTlBTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IENvbW1pdCA0YTU3MzM3NzFlNmYgKCJsaWJ4bDogcHV0IFJTRFAgZm9yIFBWSCBn
dWVzdCBuZWFyIDRHQiIpIGJyZWFrcwo+IHByZS00LjE3IExpbnV4IGd1ZXN0cyBzaW5jZSB0aGV5
IGRvIG5vdCB1c2Ugc3RhcnRfaW5mbydzIHJzZHBfcGFkZHIKPiBwb2ludGVyIGFuZCBpbnN0cmVh
ZCBzY2FuIEJJT1MgbWVtb3J5IGZvciBSU0RQIHNpZ25hdHVyZS4KPiAKPiBJbnRyb2R1Y2UgWEVO
RkVBVF9yc2RwX3VucmVzdHJpY3RlZCBmZWF0dXJlIGZsYWcgdGhhdCBpbmRpY2F0ZXMgd2hldGhl
cgo+IHRoZSBndWVzdCBjYW4gaGFuZGxlIFJTRFAgYXQgbG9jYXRpb25zIHBvaW50ZWQgdG8gYnkg
cnNkcF9wYWRkci4KPiAKPiBTaW5jZSBvbmx5IExpbnV4IFBWSCBndWVzdHMgc3VmZmVyIGZyb20g
dGhpcyBwcm9ibGVtIChCU0QgaGFzIGFsd2F5cwo+IHJlbGllZCBvbiByc2RwX3BhZGRyKSB3ZSBj
aGVjayB0aGlzIGZsYWcganVzdCBmb3IgdGhvc2UgZ3Vlc3RzLiBJZiB0aGUKPiBmbGFnIGlzIG5v
dCBzZXQgd2UgcGxhY2UgUlNEUCBpbiBCSU9TLCBhcyBiZWZvcmUuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KCkFja2VkLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
