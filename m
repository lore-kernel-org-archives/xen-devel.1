From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86/PVH/libxl: Check whether Linux guest
 can handle RSDP at 4G boundary
Date: Mon, 9 Apr 2018 17:08:41 +0100
Message-ID: <20180409160841.mi3id5wuqwbpxbg2@citrix.com>
References: <20180409142459.2096-1-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3dws=g6=citrix.com=prvs=63055421e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f5ZLa-0007uq-9e
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 16:08:46 +0000
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
cgoKSSByZWFsaXNlIHRoZSBuYW1lIGhlcmUgaXMgbm90IHVwZGF0ZWQuIFRoYXQgY2FuIGJlIGRv
bmUgdXBvbgpjb21taXR0aW5nLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
