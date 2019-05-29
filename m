From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] get_maintainer: Improve patch recognition
Date: Wed, 29 May 2019 05:46:23 -0600
Message-ID: <5CEE710F0200007800233646@prv1-mh.provo.novell.com>
References: <20190529113534.23213-1-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVx2N-00033s-G5
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 11:46:31 +0000
In-Reply-To: <20190529113534.23213-1-volodymyr_babchuk@epam.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xypron.glpk@gmx.de, joe@perches.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA1LjE5IGF0IDEzOjM1LCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdy
b3RlOgo+IEZyb206IEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+Cj4gCj4gRnJvbTogSm9l
IFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KPiAKPiBUaGVyZSBhcmUgbW9kZSBjaGFuZ2UgYW5k
IHJlbmFtZSBvbmx5IHBhdGNoZXMgdGhhdCBhcmUgdW5yZWNvZ25pemVkCj4gYnkgdGhlIGdldF9t
YWludGFpbmVyLnBsIHNjcmlwdC4KPiAKPiBSZWNvZ25pemUgdGhlbS4KPiAKPiBSZXBvcnRlZC1i
eTogSGVpbnJpY2ggU2NodWNoYXJkdCA8eHlwcm9uLmdscGtAZ214LmRlPgo+IENDOiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEpvZSBQZXJjaGVz
IDxqb2VAcGVyY2hlcy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZv
bG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKTWVudGlvbmluZyB0aGUgb3JpZ2luYWwgTGludXgg
Y29tbWl0IElEIHdvdWxkIGhhdmUgYmVlbiBuaWNlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
