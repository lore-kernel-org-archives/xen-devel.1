From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/6] x86: distinguish CPU offlining from
 CPU removal
Date: Wed, 18 Jul 2018 13:53:04 +0100
Message-ID: <4bcff76d-7e5f-5711-0989-94ca86c361ac@citrix.com>
References: <5B4EF70702000078001D53C7@prv1-mh.provo.novell.com>
 <5B4EF81102000078001D53D4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dg1m=kc=citrix.com=prvs=730a7d111=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fflx6-0004Ch-0W
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 12:53:08 +0000
In-Reply-To: <5B4EF81102000078001D53D4@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDcvMTggMDk6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+IEluIG9yZGVyIHRvIGJlIGFi
bGUgdG8gc2VydmljZSAjTUMgb24gb2ZmbGluZWQgQ1BVcywgdGhlIEdEVCwgSURULAo+IHN0YWNr
LCBhbmQgcGVyLUNQVSBkYXRhICh3aGljaCBpbmNsdWRlcyB0aGUgVFNTKSBuZWVkIHRvIGJlIGtl
cHQKPiBhbGxvY2F0ZWQuIFRoZXkgc2hvdWxkIG9ubHkgYmUgZnJlZWQgdXBvbiBDUFUgcmVtb3Zh
bCAod2hpY2ggd2UKPiBjdXJyZW50bHkgZG9uJ3Qgc3VwcG9ydCwgc28gc29tZSBjb2RlIGlzIGJl
Y29taW5nIGVmZmVjdGl2ZWx5IGRlYWQKPiBmb3IgdGhlIG1vbWVudCkuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
