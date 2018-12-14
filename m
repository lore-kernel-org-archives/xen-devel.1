From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/pciback: Check dev_data before using it
Date: Fri, 14 Dec 2018 08:57:27 -0500
Message-ID: <bc9f8dfb-e36a-2eca-3afc-135843782dbc@oracle.com>
References: <20181214125545.28753-1-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtUr=OX=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gXnyE-0005oV-RQ
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 13:57:38 +0000
In-Reply-To: <20181214125545.28753-1-ross.lagerwall@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTQvMTggNzo1NSBBTSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gSWYgcGNpc3R1Yl9p
bml0X2RldmljZSBmYWlscywgdGhlIHJlbGVhc2UgZnVuY3Rpb24gd2lsbCBiZSBjYWxsZWQgd2l0
aAo+IGRldl9kYXRhIHNldCB0byBOVUxMLiAgQ2hlY2sgaXQgYmVmb3JlIHVzaW5nIGl0IHRvIGF2
b2lkIGEgTlVMTCBwb2ludGVyCj4gZGVyZWZlcmVuY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb3Nz
IExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBCb3Jp
cyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
