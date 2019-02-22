From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v7 1/9] xen/evtchn: block
 speculative out-of-bound accesses
Date: Fri, 22 Feb 2019 06:00:46 -0700
Message-ID: <5C6FF27E020000780021927D@prv1-mh.provo.novell.com>
References: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
 <1550737003-25779-2-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxARd-0005DV-LB
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 13:00:49 +0000
In-Reply-To: <1550737003-25779-2-git-send-email-nmanthey@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE5IGF0IDA5OjE2LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBA
QCAtODEzLDYgKzgxNyw3IEBAIGludCBzZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcihzdHJ1Y3QgZG9t
YWluICpkLCB1aW50MzJfdCB2aXJxKQo+ICAKPiAgICAgIGlmICh2aXJxID49IE5SX1ZJUlFTKQo+
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiAgICAgIGlmICghdmlycV9pc19nbG9iYWwo
dmlycSkpCj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gIAoKU3RyYXkgKGJ1dCBiZW5pZ24p
IGNoYW5nZS4gRWFzeSBlbm91Z2ggdG8gdGFrZSBvdXQgd2hpbGUgY29tbWl0dGluZy4KV2l0aG91
dCB0aGlzOgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQnR3
LCBpdCB3b3VsZCBoYXZlIGJlZW4gbmljZSBpZiB5b3UgaGFkIGFsc28gZHJvcHBlZCB0aGUgc29t
ZXdoYXQKbWlzbGVhZGluZyBTcGVjdHJlVjEgZnJvbSB0aGUgc3ViamVjdCBsaW5lIHRhZ3Mgb2Yg
dGhlIHNlcmllcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
