From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH v5 12/13] IOMMU/x86: remove indirection from
 certain IOMMU hook accesses
Date: Wed, 14 Nov 2018 17:16:13 +0000
Message-ID: <20181114171609.GA22246@amd.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BE45CB602000078001F9C6A@prv1-mh.provo.novell.com>
 <5BE4614C02000078001F9D19@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oyap=nz=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1gMym1-0005Pf-5J
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 17:16:17 +0000
In-Reply-To: <5BE4614C02000078001F9D19@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <269A95A9FB069E45B84D34212017E48D@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDk6MTY6MTJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlcmUncyBubyBuZWVkIHRvIGdvIHRocm91Z2ggYW4gZXh0cmEgbGV2ZWwgb2YgaW5k
aXJlY3Rpb24uIEluIG9yZGVyIHRvCj4gbGltaXQgY29kZSBjaHVybiwgY2FsbCBzaXRlcyB1c2lu
ZyBzdHJ1Y3QgZG9tYWluX2lvbW11J3MgcGxhdGZvcm1fb3BzCj4gZG9uJ3QgZ2V0IHRvdWNoZWQg
aGVyZSwgaG93ZXZlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpBY2tlZC1ieTogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
