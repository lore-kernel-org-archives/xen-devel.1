From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [RFC] arm/p2m: call iommu iotlb flush if iommu
 exists and enabled
Date: Wed, 23 Jan 2019 14:40:04 +0200
Message-ID: <5ff8a4ec-dc2f-488e-d462-794e72a942bc@gmail.com>
References: <1548238334-23168-1-git-send-email-andrii.anisov@gmail.com>
 <c861a2f4-25a4-e5a4-f112-42853cba84e3@arm.com>
 <68e806f1d1b7496fb3e948576508bd86@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5y24=P7=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gmHpB-0007jN-A7
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 12:40:09 +0000
Received: by mail-lj1-x235.google.com with SMTP id c19-v6so1798482lja.5
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 04:40:07 -0800 (PST)
In-Reply-To: <68e806f1d1b7496fb3e948576508bd86@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gUGF1bCwKCk9uIDIzLjAxLjE5IDEzOjQ1LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gWWVz
LCB0aGlzIHdhcyBhIG1pc3Rha2Ugd2hlbiBtb3ZpbmcgZnJvbSB0aGUgb2xkIG1hY3JvcyBhbmQg
bmVlZF9pb21tdS4gQW5kcmlpIGlzIGNvcnJlY3QgdGhhdCBuZWVkX2lvbW11X3B0X3N5bmMoKSBp
cyBzdXBwb3NlZCB0byBnYXRlIHdoZXRoZXIgYW4gZXhwbGljaXQgbWFwL3VubWFwIGlzIG5lZWRl
ZC4gVGhlIG5lZWQgZm9yIGZsdXNoIHNob3VsZCBvbmx5IGRlcGVuZCBvbiBoYXNfaW9tbXVfcHQo
KS4KU28gSSBmaXggdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBzZW5kIFYyIGZvciBYRU4gNC4xMi4K
Cj4gVGhlcmUgaXMgYWxzbyBpb21tdV91c2VfaGFwX3B0KCkgd2hpY2ggaXMgYWN0dWFsbHkgZGVm
aW5lZCBhcyBoYXNfaW9tbXVfcHQoKSwgYnV0IEkgd29uZGVyIHdoZXRoZXIgdGhhdCBzaG91bGQg
anVzdCBnbyBhd2F5IGZvciBBUk0gc2luY2UgdGhlIHBhZ2UgdGFibGVzIGFyZSBhbHdheXMgc2hh
cmVkLgpBY3R1YWxseSwgdGhlIG1haW5saW5lIGN1cnJlbnRseSBzdXBwb3J0cyBvbmx5IFNNTVUs
IHdoaWNoIGRvZXMgc2hhcmUgdGhlIHBhZ2UgdGFibGUuCkJ1dCBpdCBpcyBub3QgYWx3YXlzIHRy
dWUsIHdlIGFyZSB1c2luZyBIVywgd2hlcmUgUFQgaXMgbm90IHNoYXJlZC4gQW5kIGdvaW5nIHRv
IHVwc3RyZWFtIHRoYXQgc3VwcG9ydCBvbmUgZGF5LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFu
aXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
