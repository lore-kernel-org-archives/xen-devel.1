From: Manish Jaggi <mjaggi@caviumnetworks.com>
Subject: Re: [v2 4/6] xen/iommu: smmu-v3: Add Xen specific code
 to enable the ported driver
Date: Thu, 31 May 2018 09:43:02 +0530
Message-ID: <365f599b-f976-9e3f-5ca8-3e3ef7f69c10@caviumnetworks.com>
References: <20180524004620.23828-1-sameer.goel@linaro.org>
 <20180524004620.23828-5-sameer.goel@linaro.org>
 <d08fe9e3-3f32-8342-00c1-3a457fe14098@caviumnetworks.com>
 <1df9c9aa-bb75-94db-d88f-53229e740e18@linaro.org>
 <9900a2ad-65d4-357f-b54d-01ba76476d1a@caviumnetworks.com>
 <8da742f2-6ba8-327a-6a54-147d1b06d547@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=suzr=is=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1fOExq-0008V3-8S
 for xen-devel@lists.xenproject.org; Thu, 31 May 2018 04:13:26 +0000
In-Reply-To: <8da742f2-6ba8-327a-6a54-147d1b06d547@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sameer Goel <sameer.goel@linaro.org>, xen-devel@lists.xenproject.org, julien.grall@arm.com
Cc: sstabellini@kernel.org, shankerd@codeaurora.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNS8zMS8yMDE4IDA0OjMxIEFNLCBTYW1lZXIgR29lbCB3cm90ZToKPj4+Pj4gKwo+Pj4+
PiArc3RhdGljIGludCBhcm1fc21tdV9pb21tdV9kb21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpk
KQo+Pj4+IFdoZXJlIGlzIGlvbW11X2RvbWFpbiBpbml0aWFsaXplZD8KPj4+PiBUaGUgZnVuY3Rp
b24gZG9lcyBub3QgdXNlIGEgaW9tbXVfZG9tYWluICogdmFyaWFibGUKPiBQbGVhc2UgY2hlY2sg
aW9tbXUuYyAyIGxldmVscyB1cC4KSW4gdGhpcyBmdW5jdGlvbiBkbyB5b3Ugc2VlIGlvbW11X2Rv
bWFpbiBnZXR0aW5nIGFsbG9jYXRlZCBvciBpbml0aWFsaXplZD8KQXMgcGVyIHRoZSBuYW1lIG9m
IGZ1bmN0aW9uIGFybV9zbW11IGlvbW11X2RvbWFpbl9pbml0LgpXaGVyZSBpcyBpbml0IG9mIGlv
bW11X2RvbWFpbiBpbiB0aGlzIGZ1bmN0aW9uPwoKK3N0YXRpYyBpbnQgYXJtX3NtbXVfaW9tbXVf
ZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKK3sKKwlzdHJ1Y3QgYXJtX3NtbXVfeGVuX2Rv
bWFpbiAqeGVuX2RvbWFpbjsKKworCXhlbl9kb21haW4gPSB4emFsbG9jKHN0cnVjdCBhcm1fc21t
dV94ZW5fZG9tYWluKTsKKwlpZiAoIXhlbl9kb21haW4pCisJCXJldHVybiAtRU5PTUVNOworCisJ
c3Bpbl9sb2NrX2luaXQoJnhlbl9kb21haW4tPmxvY2spOworCUlOSVRfTElTVF9IRUFEKCZ4ZW5f
ZG9tYWluLT5jb250ZXh0cyk7CisKKwlkb21faW9tbXUoZCktPmFyY2gucHJpdiA9IHhlbl9kb21h
aW47CisKKwlyZXR1cm4gMDsKK30KKwoKCgo+IFRoYW5rcywKPiBTYW1lZXIKPj4KPj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gWGVuLWRldmVsIG1h
aWxpbmcgbGlzdAo+PiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4gaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
