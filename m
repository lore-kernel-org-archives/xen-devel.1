From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH -next] xen/pvcalls: use GFP_ATOMIC under
	spin lock
Date: Tue, 2 Jan 2018 09:35:54 +0100
Message-ID: <07f48d11-1a68-c351-fd16-b1a7e2cc4a2c__1384.31147574938$1514882095$gmane$org@suse.com>
References: <1514432808-129158-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dfvk=d5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eWI3D-0007TJ-3K
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 08:35:59 +0000
In-Reply-To: <1514432808-129158-1-git-send-email-weiyongjun1@huawei.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Yongjun <weiyongjun1@huawei.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <stefano@aporeto.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMTIvMTcgMDQ6NDYsIFdlaSBZb25nanVuIHdyb3RlOgo+IEEgc3BpbiBsb2NrIGlzIHRh
a2VuIGhlcmUgc28gd2Ugc2hvdWxkIHVzZSBHRlBfQVRPTUlDLgo+IAo+IEZpeGVzOiA5Nzc0YzZj
Y2EyNjYgKCJ4ZW4vcHZjYWxsczogaW1wbGVtZW50IGFjY2VwdCBjb21tYW5kIikKPiBTaWduZWQt
b2ZmLWJ5OiBXZWkgWW9uZ2p1biA8d2VpeW9uZ2p1bjFAaHVhd2VpLmNvbT4KClJldmlld2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
