From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2 for-4.12] arm/p2m: call iommu iotlb flush
 if iommu exists and enabled
Date: Wed, 23 Jan 2019 15:32:28 +0200
Message-ID: <d597dfca-58b7-1657-21ee-3debd890b451@gmail.com>
References: <1548247807-20400-1-git-send-email-andrii.anisov@gmail.com>
 <3bb35641-a229-7d5e-8d27-6dcfbdc908bd@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5y24=P7=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gmIdt-0004Yr-T4
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:32:33 +0000
Received: by mail-lf1-x141.google.com with SMTP id f5so1552096lfc.13
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 05:32:32 -0800 (PST)
In-Reply-To: <3bb35641-a229-7d5e-8d27-6dcfbdc908bd@arm.com>
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

SnVlcmdlbiwKCk9uIDIzLjAxLjE5IDE1OjI2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gUGxlYXNl
IG1lbnRpb24gdGhlIGJ1ZyB3YXMgaW50cm9kdWNlZCBieSBjb21taXQgOTFkNGVjYTdhZCAibW0g
LyBpb21tdTogc3BsaXQgbmVlZF9pb21tdSgpIGludG8gaGFzX2lvbW11X3B0KCkgYW5kIG5lZWRf
aW9tbXVfcHRfc3luYygpIi4KU2hvdWxkIEkgc2VuZCB2Mz8uCgo+IFdpdGggdGhhdDoKPiAKPiBB
Y2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tIApTaW5jZXJl
bHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
