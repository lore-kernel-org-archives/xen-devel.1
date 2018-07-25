From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Wed, 25 Jul 2018 08:17:22 +0200
Message-ID: <20180725061722.GT28386__26496.5895018124$1532499369$gmane$org@dhcp22.suse.cz>
References: <20180716115058.5559-1-mhocko@kernel.org>
 <20180720170902.d1137060c23802d55426aa03@linux-foundation.org>
 <20180724141747.GP28386@dhcp22.suse.cz>
 <20180724125307.d6035c447adf46b2d74dfbd7@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sbts=kj=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1fiD6z-00021T-Dj
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 06:17:25 +0000
Content-Disposition: inline
In-Reply-To: <20180724125307.d6035c447adf46b2d74dfbd7@linux-foundation.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Leon Romanovsky <leonro@mellanox.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlIDI0LTA3LTE4IDEyOjUzOjA3LCBBbmRyZXcgTW9ydG9uIHdyb3RlOgpbLi4uXQo+ID4g
T24gdG9wIG9mIHRoYXQgdGhlIHByb3Bvc2VkIGNsZWFudXAgbG9va3MgYXMgZm9sbG93czoKPiA+
IAo+IAo+IExvb2tzIGdvb2QgdG8gbWUuICBTZWVtcyBhIGJpdCBzdHJhbmdlIHRoYXQgd2Ugb21p
dCB0aGUgcHJfaW5mbygpCj4gb3V0cHV0IGlmIHRoZSBtbSB3YXMgcGFydGlhbGx5IHJlYXBlZCAt
IHBlb3BsZSB3b3VsZCBzdGlsbCB3YW50IHRvIGtub3cKPiB0aGlzPyAgIE5vdCB2ZXJ5IGltcG9y
dGFudCB0aG91Z2guCgpJIHRoaW5rIHRoYXQgaGF2aW5nIGEgc2luZ2xlIG91dHB1dCBvbmNlIHdl
IGFyZSBkb25lIGlzIGJldHRlciBidXQgSSBkbwpub3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIG9u
IHRoaXMuCgpCdHcuIGhlcmUgaXMgdGhlIGNoYW5nZWxvZyBmb3IgdGhlIGNsZWFudXAuCgoiCkFu
ZHJldyBoYXMgbm90aWNlZCBzb21laW5jb25zaXN0ZW5jaWVzIGluIG9vbV9yZWFwX3Rhc2tfbW0u
IE5vdGFibHkKIC0gVW5kb2N1bWVudGVkIHJldHVybiB2YWx1ZS4KCiAtIGNvbW1lbnQgImZhaWxl
ZCB0byByZWFwIHBhcnQuLi4iIGlzIG1pc2xlYWRpbmcgLSBzb3VuZHMgbGlrZSBpdCdzCiAgIHJl
ZmVycmluZyB0byBzb21ldGhpbmcgd2hpY2ggaGFwcGVuZWQgaW4gdGhlIHBhc3QsIGlzIGluIGZh
Y3QKICAgcmVmZXJyaW5nIHRvIHNvbWV0aGluZyB3aGljaCBtaWdodCBoYXBwZW4gaW4gdGhlIGZ1
dHVyZS4KCiAtIGZhaWxzIHRvIGNhbGwgdHJhY2VfZmluaXNoX3Rhc2tfcmVhcGluZygpIGluIG9u
ZSBjYXNlCgogLSBjb2RlIGR1cGxpY2F0aW9uLgoKIC0gSW5jcmVhc2VzIG1tYXBfc2VtIGhvbGQg
dGltZSBhIGxpdHRsZSBieSBtb3ZpbmcKICAgdHJhY2VfZmluaXNoX3Rhc2tfcmVhcGluZygpIGlu
c2lkZSB0aGUgbG9ja2VkIHJlZ2lvbi4gIFNvIHN1ZSBtZSA7KQoKIC0gU2hhcmluZyB0aGUgZmlu
aXNoOiBwYXRoIG1lYW5zIHRoYXQgdGhlIHRyYWNlIGV2ZW50IHdvbid0CiAgIGRpc3Rpbmd1aXNo
IGJldHdlZW4gdGhlIHR3byBzb3VyY2VzIG9mIGZpbmlzaGluZy4KCkFkZCBhIHNob3J0IGV4cGxh
bmF0aW9uIGZvciB0aGUgcmV0dXJuIHZhbHVlIGFuZCBmaXggdGhlIHJlc3QgYnkKcmVvcmdhbml6
aW5nIHRoZSBmdW5jdGlvbiBhIGJpdCB0byBoYXZlIHVuaWZpZWQgZnVuY3Rpb24gZXhpdCBwYXRo
cy4KClN1Z2dlc3RlZC1ieTogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9y
Zz4KU2lnbmVkLW9mZi1ieTogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CiIKCi0tIApN
aWNoYWwgSG9ja28KU1VTRSBMYWJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
