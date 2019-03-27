From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 2/6] xen: add helper for calling
 notifier_call_chain() to common/cpu.c
Date: Wed, 27 Mar 2019 12:25:50 +0000
Message-ID: <a8539d69-ef3a-4d31-22d7-b4f574653fa2@citrix.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sq4U=R6=citrix.com=prvs=98279bc35=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1h97d3-0000AO-OR
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 12:26:01 +0000
In-Reply-To: <20190318131155.29450-3-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xOC8xOSAxOjExIFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IEFkZCBhIGhlbHBlciBj
cHVfbm90aWZpZXJfY2FsbF9jaGFpbigpIHRvIGNhbGwgbm90aWZpZXJfY2FsbF9jaGFpbigpCj4g
Zm9yIGEgY3B1IHdpdGggYSBzcGVjaWZpZWQgYWN0aW9uLCByZXR1cm5pbmcgYW4gZXJybm8gdmFs
dWUuCj4gCj4gVGhpcyBhdm9pZHMgY29kaW5nIHRoZSBzYW1lIHBhdHRlcm4gbXVsdGlwbGUgdGlt
ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoK
UmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
