From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen/netfront: remove unnecessary wmb
Date: Fri, 9 Nov 2018 10:52:54 +0000
Message-ID: <20181109105254.giy4ilemhw74zg3x__9427.7374716059$1541760705$gmane$org@zion.uk.xensource.com>
References: <20181109065359.14900-1-jian.w.wen@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qqpi=nu=citrix.com=prvs=84494ffbf=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gL4PM-0007Xe-BO
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 10:53:00 +0000
Content-Disposition: inline
In-Reply-To: <20181109065359.14900-1-jian.w.wen@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jacob Wen <jian.w.wen@oracle.com>
Cc: jgross@suse.com, netdev@vger.kernel.org, Wei Liu <wei.liu2@citrix.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMDksIDIwMTggYXQgMDI6NTM6NTlQTSArMDgwMCwgSmFjb2IgV2VuIHdyb3Rl
Ogo+IFJJTkdfUFVTSF9SRVFVRVNUU19BTkRfQ0hFQ0tfTk9USUZZIGlzIGFscmVhZHkgYWJsZSB0
byBtYWtlIHN1cmUgYmFja2VuZCBzZWVzCj4gcmVxdWVzdHMgYmVmb3JlIHJlcV9wcm9kIGlzIHVw
ZGF0ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFjb2IgV2VuIDxqaWFuLncud2VuQG9yYWNsZS5j
b20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
