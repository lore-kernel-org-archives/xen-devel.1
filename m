From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 05/11] optee: add fast calls handling
Date: Thu, 17 Jan 2019 18:31:59 +0000
Message-ID: <fd3e26a9-6644-06c8-8acd-4e19b36aa5af@arm.com>
References: <20181218211126.6886-1-volodymyr_babchuk@epam.com>
 <20181218211126.6886-6-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HtQs=PZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gkCSv-0004kt-Hh
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 18:32:33 +0000
In-Reply-To: <20181218211126.6886-6-volodymyr_babchuk@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Volodymyr Babchuk <vlad.babchuk@gmail.com>, "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgVm9sb2R5bXlyLAoKT24gMTgvMTIvMjAxOCAyMToxMSwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gRnJvbTogVm9sb2R5bXlyIEJhYmNodWsgPHZsYWQuYmFiY2h1a0BnbWFpbC5jb20+Cj4g
Cj4gU29tZSBmYXN0IFNNQ0NDIGNhbGxzIHRvIE9QLVRFRSBzaG91bGQgYmUgaGFuZGxlZCBpbiBh
IHNwZWNpYWwgd2F5Lgo+IENhcGFiaWxpdGllcyBleGNoYW5nZSBzaG91bGQgYmUgZmlsdGVyZWQg
b3V0LCBzbyBvbmx5IGNhcHMKPiBrbm93biB0byBtZWRpYXRvciBhcmUgdXNlZC4gQWxzbyBtZWRp
YXRvciBkaXNhYmxlcyBzdGF0aWMgU0hNCj4gbWVtb3J5IGNhcGFiaWxpdHksIGJlY2F1c2UgaXQg
Y2FuJ3Qgc2hhcmUgT1AtVEVFIG1lbW9yeSB3aXRoIGEgZG9tYWluLgo+IE9ubHkgZG9tYWluIGNh
biBzaGFyZSBtZW1vcnkgd2l0aCBPUC1URUUsIHNvIGl0IGVuc3VyZXMgdGhhdCBPUC1URUUKPiBz
dXBwb3J0cyBkeW5hbWljIFNITS4KPiAKPiBCYXNpY2FsbHksIHN0YXRpYyBTSE0gaXMgYSByZXNl
cnZlZCBtZW1vcnkgcmVnaW9uIHdoaWNoIGlzIGFsd2F5cwo+IG1hcHBlZCBpbnRvIE9QLVRFRSBh
ZGRyZXNzIHNwYWNlLiBJdCBiZWxvbmdzIHRvIE9QLVRFRS4gTm9ybWFsbHksCj4gTlcgaXMgYWxs
b3dlZCB0byBhY2Nlc3MgdGhlcmUsIHNvIGl0IGNhbiBjb21tdW5pY2F0ZSB3aXRoIE9QLVRFRS4K
PiAKPiBPbiBvdGhlciBoYW5kLCBkeW5hbWljIFNITSBpcyBOVydzIG93biBtZW1vcnksIHdoaWNo
IGl0IGNhbiBzaGFyZQo+IHdpdGggT1AtVEVFLiBPUC1URUUgbWFwcyB0aGlzIG1lbW9yeSBkeW5h
bWljYWxseSwgd2hlbiBpdCB3YW50cyB0bwo+IGFjY2VzcyBpdC4KPiAKPiBCZWNhdXNlIG1lZGlh
dG9yIGNhbid0IHNoYXJlIG9uZSBzdGF0aWMgU0hNIHJlZ2lvbiB3aXRoIGFsbCBndWVzdHMsCj4g
aXQganVzdCBkaXNhYmxlcyBpdCBmb3IgYWxsLgoKSSBoYXZlbid0IHNlZW4gYW4gYW5zd2VyIHRv
IG15IHF1ZXN0aW9uIG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uLiBGb3IgcmVtaW5kZXI6CgpXb3Vs
ZCBpdCBtYWtlIHNlbnNlIHRvIHN0aWxsIGFsbG93IHRoZSBoYXJkd2FyZSBkb21haW4gdG8gYWNj
ZXNzIHN0YXRpYyBTSE0/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
