From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 60/60] xen/sched: add scheduling granularity
 enum
Date: Tue, 28 May 2019 05:51:59 -0600
Message-ID: <5CED20DF0200007800233156@prv1-mh.provo.novell.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-61-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVaeD-0001M7-Ol
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 11:52:05 +0000
In-Reply-To: <20190528103313.1343-61-jgross@suse.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA1LjE5IGF0IDEyOjMzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
NjEsNiArNjIsMjMgQEAgdW5zaWduZWQgaW50IHNjaGVkX2dyYW51bGFyaXR5ID0gMTsKPiAgYm9v
bCBzY2hlZF9kaXNhYmxlX3NtdF9zd2l0Y2hpbmc7Cj4gIGNwdW1hc2tfdmFyX3Qgc2NoZWRfcmVz
X21hc2s7Cj4gIAo+ICsjaWZkZWYgQ09ORklHX1g4Ngo+ICtzdGF0aWMgaW50IF9faW5pdCBzY2hl
ZF9zZWxlY3RfZ3JhbnVsYXJpdHkoY29uc3QgY2hhciAqc3RyKQo+ICt7Cj4gKyAgICBpZiAoc3Ry
Y21wKCJjcHUiLCBzdHIpID09IDApCj4gKyAgICAgICAgb3B0X3NjaGVkX2dyYW51bGFyaXR5ID0g
U0NIRURfR1JBTl9jcHU7Cj4gKyAgICBlbHNlIGlmIChzdHJjbXAoImNvcmUiLCBzdHIpID09IDAp
Cj4gKyAgICAgICAgb3B0X3NjaGVkX2dyYW51bGFyaXR5ID0gU0NIRURfR1JBTl9jb3JlOwo+ICsg
ICAgZWxzZSBpZiAoc3RyY21wKCJzb2NrZXQiLCBzdHIpID09IDApCj4gKyAgICAgICAgb3B0X3Nj
aGVkX2dyYW51bGFyaXR5ID0gU0NIRURfR1JBTl9zb2NrZXQ7Cj4gKyAgICBlbHNlCj4gKyAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsgICAgcmV0dXJuIDA7Cj4gK30KPiArY3VzdG9tX3Bh
cmFtKCJzY2hlZC1ncmFuIiwgc2NoZWRfc2VsZWN0X2dyYW51bGFyaXR5KTsKPiArI2VuZGlmCgpJ
J20gc3VycHJpc2VkIGJ5IHRoZSB4ODYgZGVwZW5kZW5jeSBoZXJlOiBJIGRpZG4ndCB0aGluayBI
VCBvciBtdWx0aS0KY29yZSBhcmUgeDg2LW9ubHkgY29uY2VwdHMuIEV2ZW4gaWYgQXJtIG1heSBu
b3Qgd2FudCB0aGlzIHJpZ2h0IG5vdywKSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2
ZSBhIGRlZGljYXRlZCBLY29uZmlnIHNldHRpbmcsIHdoaWNoCmZvciBub3cgb25seSB4ODYgd291
bGQgc2VsZWN0LgoKQWxzbyB0aGVyZSBhcmUgc2V2ZXJhbCBtaXNzaW5nIGJsYW5rcyBoZXJlLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
