From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/netfront: remove unnecessary wmb
Date: Fri, 9 Nov 2018 07:58:04 +0100
Message-ID: <4d1558bb-59be-6b2c-a3de-93981ec53f8e__47494.2266977907$1541746609$gmane$org@suse.com>
References: <20181109065359.14900-1-jian.w.wen@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mbz9=nu=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gL0k3-00035L-GW
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 06:58:07 +0000
In-Reply-To: <20181109065359.14900-1-jian.w.wen@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jacob Wen <jian.w.wen@oracle.com>, netdev@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTEvMjAxOCAwNzo1MywgSmFjb2IgV2VuIHdyb3RlOgo+IFJJTkdfUFVTSF9SRVFVRVNU
U19BTkRfQ0hFQ0tfTk9USUZZIGlzIGFscmVhZHkgYWJsZSB0byBtYWtlIHN1cmUgYmFja2VuZCBz
ZWVzCj4gcmVxdWVzdHMgYmVmb3JlIHJlcV9wcm9kIGlzIHVwZGF0ZWQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmFjb2IgV2VuIDxqaWFuLncud2VuQG9yYWNsZS5jb20+CgpSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
