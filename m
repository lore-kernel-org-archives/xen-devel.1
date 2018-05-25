From: Julien Grall <julien.grall@arm.com>
Subject: Re: [v2 4/6] xen/iommu: smmu-v3: Add Xen specific code
 to enable the ported driver
Date: Fri, 25 May 2018 09:45:42 +0100
Message-ID: <3ff48bc8-8d38-db9e-8833-320a6acbcb17@arm.com>
References: <20180524004620.23828-1-sameer.goel@linaro.org>
 <20180524004620.23828-5-sameer.goel@linaro.org>
 <d08fe9e3-3f32-8342-00c1-3a457fe14098@caviumnetworks.com>
 <1df9c9aa-bb75-94db-d88f-53229e740e18@linaro.org>
 <9900a2ad-65d4-357f-b54d-01ba76476d1a@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jndo=im=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fM8M7-00016H-UH
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 08:45:47 +0000
In-Reply-To: <9900a2ad-65d4-357f-b54d-01ba76476d1a@caviumnetworks.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <mjaggi@caviumnetworks.com>, Sameer Goel <sameer.goel@linaro.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, shankerd@codeaurora.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNS8wNS8xOCAwNTo0MSwgTWFuaXNoIEphZ2dpIHdyb3RlOgo+IAo+IAo+IE9uIDA1
LzI1LzIwMTggMDE6NTkgQU0sIFNhbWVlciBHb2VsIHdyb3RlOgo+Pgo+Pgo+PiBPbiAwNS8yMy8y
MDE4IDEwOjQ4IFBNLCBNYW5pc2ggSmFnZ2kgd3JvdGU6Cj4+PiBIaSBTYW1lZXIsCj4+Pgo+Pj4g
R2VuZXJhbCBDb21tZW50LCBwbGVhc2UgdXNlIGFwcHJvcHJpYXRlIHZhcmlhYmxlIG5hbWVzIGZv
ciBYWFhfZG9tYWluIAo+Pj4gc3RydWN0dXJlcyBpbiBjb2RlIHdoaWNoIGlzIHhlbiBzcGVjaWZp
Yy4KPj4gSSB0aG91Z2h0IHRoYXQgd2UgaGFkIGRpc2N1c3NlZCB0aGlzIGJlZm9yZSBvbiBvbmUg
b2YgdGhlIFJGQ3MuCj4gWWVzIGFuZCBubyBvbmUgcmVwbGllZCB0byBteSBsYXN0IGNvbW1lbnQg
dGhhdCB0aGUgdmFyIG5hbWVzIGhhdmUgdG8gYmUgCj4gbm9uIGNvbmZ1c2luZyBpbiBYZW4gc3Bl
Y2lmaWMgY29kZS4KClJhdGhlciB0aGFuIGp1c3Qgc2F5aW5nICJ5b3UgaGF2ZW4ndCByZXBsaWVk
IHRvIG15IGxhc3QgY29tbWVudCIsIGhvdyAKYWJvdXQgZ2l2aW5nIGEgcG9pbnRlciB0byB0aGF0
IGUtbWFpbD8KCkFGQUlDVCwgdGhlIGxhc3QgYW5zd2VyIHdhcyBhIHJlcGx5IGZyb20gbWUgdG8g
eW91ciBlLW1haWwuIEFzIEkgd3JvdGUgCnRoZXJlIGlmIGl0IGlzIHVzZWQgYnkgWGVuIG9ubHkg
Y29kZSwgdGhlbiBpdCBzaG91bGQgYmUgYWxyaWdodC4gQnV0IApMaW51eCBjb2RlICpzaG91bGQg
bm90KiBiZSBjaGFuZ2VkLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
