From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/6] xen: add helper for calling
 notifier_call_chain() to common/cpu.c
Date: Tue, 02 Apr 2019 05:54:59 -0600
Message-ID: <5CA34D930200007800223DFF@prv1-mh.provo.novell.com>
References: <20190402053457.24912-1-jgross@suse.com>
 <20190402053457.24912-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBI0M-0000ds-Vk
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 11:55:03 +0000
In-Reply-To: <20190402053457.24912-3-jgross@suse.com>
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

Pj4+IE9uIDAyLjA0LjE5IGF0IDA3OjM0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBBZGQg
YSBoZWxwZXIgY3B1X25vdGlmaWVyX2NhbGxfY2hhaW4oKSB0byBjYWxsIG5vdGlmaWVyX2NhbGxf
Y2hhaW4oKQo+IGZvciBhIGNwdSB3aXRoIGEgc3BlY2lmaWVkIGFjdGlvbiwgcmV0dXJuaW5nIGFu
IGVycm5vIHZhbHVlLgo+IAo+IFRoaXMgYXZvaWRzIGNvZGluZyB0aGUgc2FtZSBwYXR0ZXJuIG11
bHRpcGxlIHRpbWVzLgo+IAo+IFdoaWxlIGF0IGl0IGF2b2lkIHNpZGUgZWZmZWN0cyBmcm9tIHVz
aW5nIEJVR19PTigpIGJ5IG5vdCB1c2luZwo+IGNwdV9vbmxpbmUoY3B1KSBhcyBhIHBhcmFtZXRl
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4g
UmV2aWV3ZWQtYnk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+CgpBY2tlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
