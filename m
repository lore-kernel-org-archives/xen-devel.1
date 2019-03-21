From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v1 1/2] xen/arm: Add Amlogic Meson SoCs
 earlyprintk support
Date: Thu, 21 Mar 2019 10:29:52 +0000
Message-ID: <bd83b0d2-c4b1-efbf-c834-aa6ab2c50d28@arm.com>
References: <1548492831-5785-1-git-send-email-amittomer25@gmail.com>
 <12b7550c-4d4f-4c77-9bf9-76dc12ea1b1b@arm.com>
 <CABHD4K-=wPNnv3m1f1rqdH4_q6seTdpbo8qDOrqoMkBwfNX-2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vhxZ=RY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h6uxQ-00006A-Ci
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2019 10:29:56 +0000
In-Reply-To: <CABHD4K-=wPNnv3m1f1rqdH4_q6seTdpbo8qDOrqoMkBwfNX-2g@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>, =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAzLzIxLzE5IDc6MjAgQU0sIEFtaXQgVG9tZXIgd3JvdGU6Cj4gSGksCkhpLAoKPj4gQXBh
cnQgZnJvbSB0aGlzIGFuZCB0aGUgdW5uZWVkZWQgYWRkaXRpb24gdG8gZWFybHktcHJpbnRrLnR4
dCAod2hpY2gKPj4gSnVsaWVuIG1lbnRpb25lZCBhbHJlYWR5KSB0aGlzIGxvb2tzIG5vdyBjb3Jy
ZWN0IHRvIG1lLgo+IAo+IEkgd2FzIHdvbmRlcmluZywgaWYgaXQncyBhIGdvb2QgaWRlYSB0byBo
YXZlCj4gIkNPTkZJR19FQVJMWV9QUklOVEs9bWVzb24sMHhjODEwMDRjMCIKPiBkb2N1bWVudGVk
IGluIFJ1bGVzLm1rLgo+IAo+IEl0IHdvdWxkIGdpdmUgZmFpciBpZGVhIHRvIHNvbWVvbmUgd2hv
IGlzIG5ldyB0byBYZW4sIGhvdyB0byBjb21waWxlCj4gbWVzb24gd2l0aCBlYXJseSBwcmludGsg
c3VwcG9ydCA/CgpTb21lb25lIG5ldyB0byBYZW4gaXMgdW5saWtlbHkgZ29pbmcgdG8ga25vdyB0
aGF0IGRvY3VtZW50YXRpb24gaXMgaW4gClJ1bGVzLm1rLgoKQnV0LCBkb2N1bWVudGluZyB0aGUg
ZXhhY3QgVUFSVCBhZGRyZXNzIGlzIG5vdCBnb2luZyB0byBoZWxwIGEgdXNlciB3aXRoIAphIHBs
YXRmb3JtIGRpZmZlcmVudCB0aGFuIHlvdXJzLiBJdCBjYW4gYWxzbyBsZWFkIHRoZSB1c2VyIHRv
IHRoaW5rIGhpcyAKYm9hcmQgaXMgbm90IHN1cHBvcnRlZCBieSBYZW4gd2hlbiBvZnRlbiB0aGlz
IGlzIGp1c3QgYSBkaWZmZXJlbnQgYWRkcmVzcy4KClRoaXMgaXMgd2h5IEkgd2FudCB0byBwaGFz
ZSBvdXQgYW55IGFsaWFzIGluIFhlbi4gVGhlIGJlc3QgcGxhY2UgdG8gCmRvY3VtZW50IHRoZSBl
YXJseXByaW50ayBpcyBvbiB0aGUgd2lraSBhbG9uZyB3aXRoIGRvY3VtZW50YXRpb24gdG8gYm9v
dCAKWGVuIG9uIHlvdXIgcGxhdGZvcm0uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
