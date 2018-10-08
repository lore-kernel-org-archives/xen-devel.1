From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/hvm: make sure
 HVM_PARAM_[BUF]IOREQ_PFN can only be set once
Date: Mon, 08 Oct 2018 07:16:17 -0600
Message-ID: <5BBB58A102000078001EF969@prv1-mh.provo.novell.com>
References: <20181005134334.2645-1-paul.durrant@citrix.com>
 <20181005134334.2645-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bw27=mu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g9VOY-0002Xz-M8
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 13:16:22 +0000
In-Reply-To: <20181005134334.2645-2-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEwLjE4IGF0IDE1OjQzLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoZXNlIHBhcmFtZXRlcnMgc2hvdWxkIGhhdmUgYWx3YXlzIGJlZW4gaW4gdGhlICdzZXQg
b25jZScgY2F0ZWdvcnkKPiBidXQgdGhpcyBoYXMsIHNvIGZhciwgbm90IGJlZW4gZW5mb3JjZWQu
CgpCdXQgbm93IHRoYXQgd2UncmUgbm90IGV2ZW4gaGFuZGxpbmcgdGhlc2UgYW55bW9yZSwgd2h5
IGlzIHRoZXJlIGEKbmVlZCB0byBzdGFydCBkb2luZyBzbz8gSWYgYW55dGhpbmcgd291bGRuJ3Qg
aXQgYmUgYmV0dGVyIHRvIGFkZCB0aGVtCnRvIHRoZSBkZXByZWNhdGVkIGdyb3VwIGluIHRoYXQg
c2FtZSBmdW5jdGlvbiAoYW5kIG1heWJlIGFsc28gaXRzCiJnZXQiIGNvdW50ZXJwYXJ0KT8KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
