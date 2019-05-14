From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v2 1/2] KVM: Start populating
 /sys/hypervisor with KVM entries
Date: Tue, 14 May 2019 18:31:36 +0200
Message-ID: <926fdc5e-8ef2-0995-6a74-77b76af0905e__10864.6477268607$1557851558$gmane$org@de.ibm.com>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-2-git-send-email-sironi@amazon.de>
 <d03f6be5-d8dc-4389-e14c-295f36a68827@de.ibm.com>
 <56DAB9BD-2543-49DA-9886-C9C8F2B814F9@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8fNp=TO=de.ibm.com=borntraeger@srs-us1.protection.inumbo.net>)
 id 1hQaLC-0003TA-Hp
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 16:31:46 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4EGRLME038934
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2019 12:31:43 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sg0gy2aj7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2019 12:31:43 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <borntraeger@de.ibm.com>;
 Tue, 14 May 2019 17:31:40 +0100
In-Reply-To: <56DAB9BD-2543-49DA-9886-C9C8F2B814F9@amazon.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Sironi, Filippo" <sironi@amazon.de>
Cc: KVM list <kvm@vger.kernel.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "cohuck@redhat.com" <cohuck@redhat.com>, LKML <linux-kernel@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "vasu.srinivasan@oracle.com" <vasu.srinivasan@oracle.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNC4wNS4xOSAxODowOSwgU2lyb25pLCBGaWxpcHBvIHdyb3RlOgoKPj4gSXNudCBrdm1f
cGFyYV9hdmFpbGFibGUgYSBmdW5jdGlvbiB0aGF0IGlzIGRlZmluZWQgaW4gdGhlIGNvbnRleHQg
b2YgdGhlIEhPU1QKPj4gYW5kIG5vdCBvZiB0aGUgZ3Vlc3Q/Cj4gCj4gTm8sIGt2bV9wYXJhX2F2
YWlsYWJsZSBpcyBkZWZpbmVkIGluIHRoZSBndWVzdCBjb250ZXh0Lgo+IE9uIHg4NiwgaXQgY2hl
Y2tzIGZvciB0aGUgcHJlc2VuY2Ugb2YgdGhlIEtWTSBDUFVJRCBsZWFmcy4KPiAKClJpZ2h0IHlv
dSBhcmUsIEkgbWl4ZWQgdGhhdCB1cC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
