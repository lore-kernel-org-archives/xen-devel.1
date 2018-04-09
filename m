From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/PVH/libxl: Check whether Linux guest
 can handle RSDP at 4G boundary
Date: Mon, 9 Apr 2018 11:03:04 +0100
Message-ID: <76919ebc-474c-3979-89d6-7ef5807ca532@citrix.com>
References: <20180407230332.10641-1-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=h6sx=g6=citrix.com=prvs=630459894=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1f5Tdn-0000Yq-Fn
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 10:03:11 +0000
In-Reply-To: <20180407230332.10641-1-boris.ostrovsky@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Cc: jgross@suse.com, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDgvMjAxOCAxMjowMyBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IENvbW1pdCA0
YTU3MzM3NzFlNmYgKCJsaWJ4bDogcHV0IFJTRFAgZm9yIFBWSCBndWVzdCBuZWFyIDRHQiIpIGJy
ZWFrcwo+IHByZS00LjE3IExpbnV4IGd1ZXN0cyBzaW5jZSB0aGV5IGRvIG5vdCB1c2Ugc3RhcnRf
aW5mbydzIHJzZHBfcGFkZHIKPiBwb2ludGVyIGFuZCBpbnN0cmVhZCBzY2FuIEJJT1MgbWVtb3J5
IGZvciBSU0RQIHNpZ25hdHVyZS4KPiAKPiBJbnRyb2R1Y2UgWEVORkVBVF9yc2RwX3VucmVzdHJp
Y3RlZCBmZWF0dXJlIGZsYWcgdGhhdCBpbmRpY2F0ZXMgd2hldGhlcgo+IHRoZSBndWVzdCBjYW4g
aGFuZGxlIFJTRFAgYXQgbG9jYXRpb25zIHBvaW50ZWQgdG8gYnkgcnNkcF9wYWRkci4KPiAKPiBT
aW5jZSBvbmx5IExpbnV4IFBWSCBndWVzdHMgc3VmZmVyIGZyb20gdGhpcyBwcm9ibGVtIChCU0Qg
aGFzIGFsd2F5cwo+IHJlbGllZCBvbiByc2RwX3BhZGRyKSB3ZSBjaGVjayB0aGlzIGZsYWcganVz
dCBmb3IgdGhvc2UgZ3Vlc3RzLiBJZiB0aGUKPiBmbGFnIGlzIG5vdCBzZXQgd2UgcGxhY2UgUlNE
UCBpbiBCSU9TLCBhcyBiZWZvcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgT3N0cm92c2t5
IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KClRoYW5rcyBndXlzOgoKQWNrZWQtYnk6IEdl
b3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
