From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12] xen/arm: psci: Populate
 arm_smccc_res on PSCI_FEATURES call
Date: Mon, 18 Feb 2019 12:33:52 +0100
Message-ID: <cc10563e-1de1-f7a4-8acd-f1e29c9717c5@suse.com>
References: <20190218094227.27176-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gvhBO-0001ca-Pc
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 11:33:58 +0000
In-Reply-To: <20190218094227.27176-1-julien.grall@arm.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDIvMjAxOSAxMDo0MiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENvbW1pdCAwYmM2YTY4
ZGE1ICJ4ZW4vYXJtOiBSZXBsYWNlIGNhbGxfc21jIHdpdGggYXJtX3NtY2NjX3NtYyIKPiBtaXN0
YWtlbmx5IGZvcmdvdCB0byBwb3B1bGF0ZSBhcm1fc21jY2NfcmVzLiBTbyBhIGdhcmJhZ2dlIHZh
bHVlIHdhcwo+IHVzZWQgYXMgcmV0dXJuIHZhbHVlLgo+IAo+IENvdmVyaXR5LUlEOiAxNDc2ODI3
Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJl
bGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
