From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 for-4.12] arm/p2m: call iommu iotlb flush
 if iommu exists and enabled
Date: Wed, 23 Jan 2019 13:26:56 +0000
Message-ID: <3bb35641-a229-7d5e-8d27-6dcfbdc908bd@arm.com>
References: <1548247807-20400-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MDDu=P7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gmIYa-0003f9-2k
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:27:04 +0000
In-Reply-To: <1548247807-20400-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMy8wMS8yMDE5IDEyOjUwLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEZyb206IEFuZHJp
aSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4gCj4gVGFraW5nIGRlY2lzaW9uIGJ5
IGBuZWVkX2lvbW11X3B0X3N5bmMoKWAgbWFrZSB1cyBuZXZlciBraWNraW5nCj4gYGlvbW11X2lv
dGxiX2ZsdXNoKClgIGZvciBJT01NVXMgd2hpY2ggZG8gc2hhcmUgUDJNIHdpdGggQ1BVLgo+IFNv
IGNoZWNrIGBoYXNfaW9tbXVfcHQoKWAgaW5zdGVhZC4KClBsZWFzZSBtZW50aW9uIHRoZSBidWcg
d2FzIGludHJvZHVjZWQgYnkgY29tbWl0IDkxZDRlY2E3YWQgIm1tIC8gaW9tbXU6IHNwbGl0IApu
ZWVkX2lvbW11KCkgaW50byBoYXNfaW9tbXVfcHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCki
LgoKV2l0aCB0aGF0OgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
