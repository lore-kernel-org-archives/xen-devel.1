From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [OSSTEST PATCH] Revert "arm64: tolerate host
 allocation failures"
Date: Wed, 1 May 2019 10:38:30 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1905011038220.23881@sstabellini-ThinkPad-X260>
References: <20190501101521.20140-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/tq=TB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hLtBo-0003kA-At
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 17:38:40 +0000
In-Reply-To: <20190501101521.20140-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxIE1heSAyMDE5LCBJYW4gSmFja3NvbiB3cm90ZToKPiBXZSBub3cgaGF2ZSA0IHdv
cmtpbmcgYXJtNjQgYm94ZXMgYW5kIHRoaXMgaXMgcXVpdGUgYW1wbGUgZm9yIG91cgo+IGN1cnJl
bnQgdGVzdCBtYXRyaXguICBXZSBoYXZlIHR3byBraW5kcyBvZiBib3gsIHRvby4gIFNvLCBncmVh
dC4KPiAKPiBUaGlzIHJldmVydHMgY29tbWl0IDA3MDViZWQ5ZTIwZWE0Mzc1ZTdhYzlmODEwOWVm
OTU1ZWJjNmZlOWMuCgpBd2Vzb21lIQoKCj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KPiAtLS0KPiAgYWxsb3cuYWxsIHwgMiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYWxsb3cuYWxsIGIvYWxsb3cuYWxsCj4gaW5kZXggODk0
YjY5ZWEuLjdhMzRhODA5IDEwMDY0NAo+IC0tLSBhL2FsbG93LmFsbAo+ICsrKyBiL2FsbG93LmFs
bAo+IEBAIC0zLDUgKzMsMyBAQCBidWlsZC1AQCAgICAgICAgICAgICAgICAgICAgICAgIGxvZ3Mt
Y2FwdHVyZUBACj4gIHRlc3QtQEAtcGNpcHRAQAo+ICB0ZXN0LUBALXFlbXV1LUBACQlndWVzdC1s
b2NhbG1pZ3JhdGUKPiAgdGVzdC1AQC13aW43LUBACQkJZ3Vlc3Qtc3RvcAo+IC1AQC1hcm02NAkJ
CWhvc3RzLWFsbG9jYXRlCj4gLUBALWFybTY0LUBACQkJaG9zdHMtYWxsb2NhdGUKPiAtLSAKPiAy
LjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
