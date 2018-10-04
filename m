From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 02/12] xen: use a structure to define
 parsing parameters
Date: Thu, 04 Oct 2018 09:40:04 -0600
Message-ID: <5BB6345402000078001EE703@prv1-mh.provo.novell.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <20180918060309.7186-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=z6fo=mq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g85jT-0004ox-9D
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:40:07 +0000
In-Reply-To: <20180918060309.7186-3-jgross@suse.com>
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

Pj4+IE9uIDE4LjA5LjE4IGF0IDA4OjAyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
MTg3LDE0ICsxOTEsMjQgQEAgc3RhdGljIGludCBwYXJzZV9wYXJhbXMoY29uc3QgY2hhciAqY21k
bGluZSwgY29uc3Qgc3RydWN0IGtlcm5lbF9wYXJhbSAqc3RhcnQsCj4gICAgICByZXR1cm4gZmlu
YWxfcmM7Cj4gIH0KPiAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFyc2VfZGF0YSBib290X3Bh
cnNlX2RhdGEgPSB7CgpfX2luaXRjb25zdHJlbAoKV2l0aCB0aGlzCkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CnByb3ZpZGVkIGl0IHdpbGwgY29udGludWUgdG8gYmUg
bmVlZGVkIChpLmUuIEkgd291bGRuJ3Qgd2FudCB0byBzZWUgdGhpcwpnbyBpbiBvbiBpdHMgb3du
KS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
