From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2 for-4.12] arm/p2m: call iommu iotlb flush
 if iommu exists and enabled
Date: Wed, 23 Jan 2019 15:34:26 +0200
Message-ID: <56aee9a9-89e7-cf06-ab2e-fcbaa8874308@gmail.com>
References: <1548247807-20400-1-git-send-email-andrii.anisov@gmail.com>
 <3bb35641-a229-7d5e-8d27-6dcfbdc908bd@arm.com>
 <d597dfca-58b7-1657-21ee-3debd890b451@gmail.com>
 <e81ff45e-ff2c-3f60-44ae-43cc9df4331f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5y24=P7=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gmIfm-0004ip-OX
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:34:30 +0000
Received: by mail-lj1-x241.google.com with SMTP id g11-v6so1955260ljk.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 05:34:29 -0800 (PST)
In-Reply-To: <e81ff45e-ff2c-3f60-44ae-43cc9df4331f@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMy4wMS4xOSAxNTozMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAyMy4wMS4xOSAx
NToyNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE5vIG5lZWQsIEkgd2lsbCBmaXggaXQgb24gY29t
bWl0LgoKVGhhbmsgeW91LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
