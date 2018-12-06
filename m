From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/3] xen: introduce
 parse_size_and_unit_or_int
Date: Thu, 6 Dec 2018 11:01:50 +0100
Message-ID: <1da9c664-5933-d68b-12fa-839c4f392707@suse.com>
References: <20181206080639.32603-1-jgross@suse.com>
 <20181206080639.32603-2-jgross@suse.com> <5C08F0CE0200007800203751@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nlhD=OP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gUqTi-0005eT-ES
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 10:01:54 +0000
In-Reply-To: <5C08F0CE0200007800203751@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAxMDo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMTIuMTgg
YXQgMDk6MDYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBAQCAtNDc3LDcgKzQ3OCw4IEBA
IHVuc2lnbmVkIGxvbmcgbG9uZyBwYXJzZV9zaXplX2FuZF91bml0KGNvbnN0IGNoYXIgKnMsIGNv
bnN0IGNoYXIgKipwcykKPj4gICAgICAgICAgczErKzsKPj4gICAgICAgICAgYnJlYWs7Cj4+ICAg
ICAgZGVmYXVsdDoKPj4gLSAgICAgICAgcmV0IDw8PSAxMDsgLyogZGVmYXVsdCB0byBrQiAqLwo+
PiArICAgICAgICBpZiAoICpzMSAmJiAqczEgIT0gbm9fc2l6ZSApCj4+ICsgICAgICAgICAgICBy
ZXQgPDw9IDEwOyAvKiBkZWZhdWx0IHRvIGtCICovCj4+ICAgICAgICAgIGJyZWFrOwo+IAo+IFNv
IGRpZCB5b3UgZmlndXJlIGFueXRoaW5nIHdyb25nIHdpdGggc2ltcGx5IHNwZWNpYWwgY2FzaW5n
ICclJwo+IGhlcmU/ICclJyBpcyBhIGZvcm0gb2YgInVuaXQiLCBhZnRlciBhbGwuIFBlcmhhcHMg
ZGVtYW5kaW5nICJwcyIKPiB0byBiZSBub24tTlVMTCAodG8gaGF2ZSBzb21lIGZvcm0gb2YgaW5k
aWNhdGlvbiB0aGUgY2FsbGVyIHdpbGwKPiBjaGVjayB0aGUgc3VmZml4IGNoYXIpIG1pZ2h0IGJl
IHJlYXNvbmFibGUuCgpJIHRob3VnaHQgYSBtb3JlIGdlbmVyYWwgYXBwcm9hY2ggd291bGQgYmUg
YmV0dGVyLiBJIGNhbiB1c2UgdGhlIHNpbXBsZQonJScgc3BlY2lhbCBjYXNlIHdpdGggdGhlIHBz
IGNoZWNrIGluIGNhc2UgeW91IHByZWZlciB0aGF0LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
