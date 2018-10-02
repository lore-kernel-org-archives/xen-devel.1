From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 2/2] xen/arm: vgic-v3: Don't create empty
 re-distributor regions
Date: Tue, 2 Oct 2018 18:07:16 +0100
Message-ID: <aba298c3-4b8b-9d6e-dda5-e35a4a0c05ea@arm.com>
References: <20181001164227.6562-1-julien.grall@arm.com>
 <20181001164227.6562-3-julien.grall@arm.com>
 <alpine.DEB.2.10.1810011354490.25821@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gf1e=mo=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g7O8m-0002q0-E5
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 17:07:20 +0000
In-Reply-To: <alpine.DEB.2.10.1810011354490.25821@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, shameerali.kolothum.thodi@huawei.com, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMS8xMC8yMDE4IDIxOjU1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
TW9uLCAxIE9jdCAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6CiAgPiBSZXZpZXdlZC1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKVGhhbmsgeW91ISBJIGhh
dmUgY29tbWl0dGVkIGJvdGggcGF0Y2hlcy4gQ2FuIHlvdSBxdWV1ZSB0aGVtIGZvciBiYWNrcG9y
dD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
