From: Sameer Goel <sameer.goel@linaro.org>
Subject: Re: [v2 4/6] xen/iommu: smmu-v3: Add Xen specific code
 to enable the ported driver
Date: Wed, 30 May 2018 17:01:15 -0600
Message-ID: <8da742f2-6ba8-327a-6a54-147d1b06d547@linaro.org>
References: <20180524004620.23828-1-sameer.goel@linaro.org>
 <20180524004620.23828-5-sameer.goel@linaro.org>
 <d08fe9e3-3f32-8342-00c1-3a457fe14098@caviumnetworks.com>
 <1df9c9aa-bb75-94db-d88f-53229e740e18@linaro.org>
 <9900a2ad-65d4-357f-b54d-01ba76476d1a@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=97iu=ir=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1fOA5p-0008Fq-70
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 23:01:21 +0000
Received: by mail-pg0-x235.google.com with SMTP id p9-v6so8786485pgc.9
 for <xen-devel@lists.xenproject.org>; Wed, 30 May 2018 16:01:19 -0700 (PDT)
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
To: Manish Jaggi <mjaggi@caviumnetworks.com>, xen-devel@lists.xenproject.org, julien.grall@arm.com
Cc: sstabellini@kernel.org, shankerd@codeaurora.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgaW50IGFybV9zbW11X2lvbW11X2RvbWFpbl9pbml0KHN0cnVj
dCBkb21haW4gKmQpCj4+PiBXaGVyZSBpcyBpb21tdV9kb21haW4gaW5pdGlhbGl6ZWQ/Cj4+PiBU
aGUgZnVuY3Rpb24gZG9lcyBub3QgdXNlIGEgaW9tbXVfZG9tYWluICogdmFyaWFibGUKUGxlYXNl
IGNoZWNrIGlvbW11LmMgMiBsZXZlbHMgdXAuClRoYW5rcywKU2FtZWVyCj4+Pj4KPj4+Cj4+Cj4K
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVu
LWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
