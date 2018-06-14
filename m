From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 5/9] xen/gntdev: Allow mappings for DMA
 buffers
Date: Thu, 14 Jun 2018 10:00:22 +0300
Message-ID: <58836503-87be-2693-4665-4b0a55a170d3__6760.10564570806$1528959572$gmane$org@epam.com>
References: <20180612134200.17456-1-andr2000@gmail.com>
 <20180612134200.17456-6-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fdvk=ja=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1fTMFM-0001uE-Eg
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 07:00:40 +0000
In-Reply-To: <20180612134200.17456-6-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com
List-Id: xen-devel@lists.xenproject.org

QEAgLTU0OCw2ICs2MzIsMTcgQEAgc3RhdGljIGludCBnbnRkZXZfb3BlbihzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCBzdHJ1Y3QgCmZpbGUgKmZsaXApCj4gICAJfQo+ICAgCj4gICAJZmxpcC0+cHJpdmF0
ZV9kYXRhID0gcHJpdjsKPiArI2lmZGVmIENPTkZJR19YRU5fR1JBTlRfRE1BX0FMTE9DCj4gKwlw
cml2LT5kbWFfZGV2ID0gZ250ZGV2X21pc2NkZXYudGhpc19kZXZpY2U7Cj4gKwo+ICsJLyoKPiAr
CSAqIFRoZSBkZXZpY2UgaXMgbm90IHNwYXduIGZyb20gYSBkZXZpY2UgdHJlZSwgc28gYXJjaF9z
ZXR1cF9kbWFfb3BzCj4gKwkgKiBpcyBub3QgY2FsbGVkLCB0aHVzIGxlYXZpbmcgdGhlIGRldmlj
ZSB3aXRoIGR1bW15IERNQSBvcHMuCj4gKwkgKiBGaXggdGhpcyBjYWxsIG9mX2RtYV9jb25maWd1
cmUoKSB3aXRoIGEgTlVMTCBub2RlIHRvIHNldAo+ICsJICogZGVmYXVsdCBETUEgb3BzLgo+ICsJ
ICovCj4gKwlvZl9kbWFfY29uZmlndXJlKHByaXYtPmRtYV9kZXYsIE5VTEwpOwpQbGVhc2Ugbm90
ZSwgdGhhdCB0aGUgY29kZSBhYm92ZSB3aWxsIG5lZWQgYSBjaGFuZ2Ugd2hpbGUKYXBwbHlpbmcg
dG8gdGhlIG1haW5saW5lIGtlcm5lbCBiZWNhdXNlIG9mIEFQSSBjaGFuZ2VzIFsxXS4KVW5mb3J0
dW5hdGVseSwgY3VycmVudCBYZW4gdGlwIGtlcm5lbCB0cmVlIGlzIHY0LjE3LXJjNSBiYXNlZCwK
c28gSSBjYW5ub3QgbWFrZSB0aGUgY2hhbmdlIGluIHRoaXMgcGF0Y2ggbm93LgoKVGhlIGNoYW5n
ZSBpcyB0cml2aWFsIGFuZCByZXF1aXJlczoKLW9mX2RtYV9jb25maWd1cmUocHJpdi0+ZG1hX2Rl
diwgTlVMTCk7CitvZl9kbWFfY29uZmlndXJlKHByaXYtPmRtYV9kZXYsIE5VTEwsIHRydWUpOwo+
ICsjZW5kaWYKPiAgIAlwcl9kZWJ1ZygicHJpdiAlcFxuIiwgcHJpdik7Cj4gICAKPiAgIAlyZXR1
cm4gMDsKPgpbMV0gCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTNkNmNlODZlZTc5NDY1ZTFiMWI2ZTI4
N2Y4ZWEyNmI1NTNmYzc2OGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
