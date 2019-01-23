From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 for-4.12] arm/p2m: call iommu iotlb flush
 if iommu exists and enabled
Date: Wed, 23 Jan 2019 13:33:35 +0000
Message-ID: <e81ff45e-ff2c-3f60-44ae-43cc9df4331f@arm.com>
References: <1548247807-20400-1-git-send-email-andrii.anisov@gmail.com>
 <3bb35641-a229-7d5e-8d27-6dcfbdc908bd@arm.com>
 <d597dfca-58b7-1657-21ee-3debd890b451@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MDDu=P7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gmIey-0004de-2I
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:33:40 +0000
In-Reply-To: <d597dfca-58b7-1657-21ee-3debd890b451@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMy8wMS8yMDE5IDEzOjMyLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEp1ZXJnZW4sCj4g
Cj4gT24gMjMuMDEuMTkgMTU6MjYsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gUGxlYXNlIG1lbnRp
b24gdGhlIGJ1ZyB3YXMgaW50cm9kdWNlZCBieSBjb21taXQgOTFkNGVjYTdhZCAibW0gLyBpb21t
dTogc3BsaXQgCj4+IG5lZWRfaW9tbXUoKSBpbnRvIGhhc19pb21tdV9wdCgpIGFuZCBuZWVkX2lv
bW11X3B0X3N5bmMoKSIuCj4gU2hvdWxkIEkgc2VuZCB2Mz8uCgpObyBuZWVkLCBJIHdpbGwgZml4
IGl0IG9uIGNvbW1pdC4KCkNoZWVycywKCj4gCj4+IFdpdGggdGhhdDoKPj4KPj4gQWNrZWQtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
