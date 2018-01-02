From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH -next] xen/pvcalls: use GFP_ATOMIC under
	spin lock
Date: Tue, 2 Jan 2018 13:26:33 -0500
Message-ID: <275fff97-e81d-2dd2-544f-f64137b63c70__29374.2388058037$1514917353$gmane$org@oracle.com>
References: <1514432808-129158-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=swgl=d5=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eWRDj-00085x-Vc
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 18:23:28 +0000
In-Reply-To: <1514432808-129158-1-git-send-email-weiyongjun1@huawei.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Yongjun <weiyongjun1@huawei.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <stefano@aporeto.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMjcvMjAxNyAxMDo0NiBQTSwgV2VpIFlvbmdqdW4gd3JvdGU6Cj4gQSBzcGluIGxvY2sg
aXMgdGFrZW4gaGVyZSBzbyB3ZSBzaG91bGQgdXNlIEdGUF9BVE9NSUMuCj4KPiBGaXhlczogOTc3
NGM2Y2NhMjY2ICgieGVuL3B2Y2FsbHM6IGltcGxlbWVudCBhY2NlcHQgY29tbWFuZCIpCj4gU2ln
bmVkLW9mZi1ieTogV2VpIFlvbmdqdW4gPHdlaXlvbmdqdW4xQGh1YXdlaS5jb20+CgpBcHBsaWVk
IHRvIGZvci1saW51cy00LjE1CgotYm9yaXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
