From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 v2] arm: gic-v3: deactivate SGI/PPI
 during initialization
Date: Tue, 5 Feb 2019 13:37:48 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902051337300.22962@sstabellini-ThinkPad-X260>
References: <20190130140907.10548-1-peng.fan@nxp.com>
 <6a321d28-f456-8a0f-9336-e2c4f3bf87d3@arm.com>
 <DB7PR04MB4490E7D9351575D0123D096188930@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <b4b8b93c-573e-4b94-683d-96c202945687@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fYof=QM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gr8Pe-0001SA-GO
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 21:37:50 +0000
In-Reply-To: <b4b8b93c-573e-4b94-683d-96c202945687@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peng Fan <peng.fan@nxp.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCAyIEZlYiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gVGhpcyBjaHVuayBsb29r
cyBnb29kLiBJIHdpbGwgYWxzbyB3cml0ZSBhIHBhdGNoIGZvciBHSUN2MiBkb2luZyB0aGUgc2Ft
ZS4KCk5vIHdvcnJpZXMsIEp1bGllbi4gSSdsbCBzZW5kIHRoZSBwYXRjaC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
