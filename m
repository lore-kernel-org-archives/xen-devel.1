From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/3] xen: introduce
 parse_size_and_unit_or_int
Date: Thu, 06 Dec 2018 02:50:06 -0700
Message-ID: <5C08F0CE0200007800203751@prv1-mh.provo.novell.com>
References: <20181206080639.32603-1-jgross@suse.com>
 <20181206080639.32603-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fsyp=op=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUqIO-0002bN-2e
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 09:50:12 +0000
In-Reply-To: <20181206080639.32603-2-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjEyLjE4IGF0IDA5OjA2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
NDc3LDcgKzQ3OCw4IEBAIHVuc2lnbmVkIGxvbmcgbG9uZyBwYXJzZV9zaXplX2FuZF91bml0KGNv
bnN0IGNoYXIgKnMsIGNvbnN0IGNoYXIgKipwcykKPiAgICAgICAgICBzMSsrOwo+ICAgICAgICAg
IGJyZWFrOwo+ICAgICAgZGVmYXVsdDoKPiAtICAgICAgICByZXQgPDw9IDEwOyAvKiBkZWZhdWx0
IHRvIGtCICovCj4gKyAgICAgICAgaWYgKCAqczEgJiYgKnMxICE9IG5vX3NpemUgKQo+ICsgICAg
ICAgICAgICByZXQgPDw9IDEwOyAvKiBkZWZhdWx0IHRvIGtCICovCj4gICAgICAgICAgYnJlYWs7
CgpTbyBkaWQgeW91IGZpZ3VyZSBhbnl0aGluZyB3cm9uZyB3aXRoIHNpbXBseSBzcGVjaWFsIGNh
c2luZyAnJScKaGVyZT8gJyUnIGlzIGEgZm9ybSBvZiAidW5pdCIsIGFmdGVyIGFsbC4gUGVyaGFw
cyBkZW1hbmRpbmcgInBzIgp0byBiZSBub24tTlVMTCAodG8gaGF2ZSBzb21lIGZvcm0gb2YgaW5k
aWNhdGlvbiB0aGUgY2FsbGVyIHdpbGwKY2hlY2sgdGhlIHN1ZmZpeCBjaGFyKSBtaWdodCBiZSBy
ZWFzb25hYmxlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
