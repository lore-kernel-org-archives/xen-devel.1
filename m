From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/6] x86: stop handling MSR_IA32_XSS
 save/restore in implementation code
Date: Fri, 08 Mar 2019 09:46:39 -0700
Message-ID: <5C829C6F020000780021CC4C@prv1-mh.provo.novell.com>
References: <20190107120258.17897-1-paul.durrant@citrix.com>
 <20190107120258.17897-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ic8h=RL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h2Idu-0005No-PL
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 16:46:42 +0000
In-Reply-To: <20190107120258.17897-5-paul.durrant@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAxLjE5IGF0IDEzOjAyLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tc3IuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tc3IuYwo+
IEBAIC0xNjQsNiArMTY0LDEzIEBAIGludCBndWVzdF9yZG1zcihzdHJ1Y3QgdmNwdSAqdiwgdWlu
dDMyX3QgbXNyLCB1aW50NjRfdCAqdmFsKQo+ICAKPiAgICAgICAgICBicmVhazsKPiAgCj4gKyAg
ICBjYXNlIE1TUl9JQTMyX1hTUzoKPiArICAgICAgICBpZiAoICFpc19odm1fZG9tYWluKGQpIHx8
ICFjcC0+eHN0YXRlLnhzYXZlcyApCgpXaHkgdGhlIGlzX2h2bV9kb21haW4oKSBjaGVjayBoZXJl
IGFuZCBiZWxvdz8gVGhlIENQVUlEIHBvbGljeSBiaXQKYWxvbmUgc2hvdWxkIHByb3Blcmx5IHJl
ZmxlY3QgdGhpbmdzLCBhbmQgdGhlcmUgc2hvdWxkIGJlIG5vIGNoYW5nZQpuZWVkZWQgaGVyZSBp
ZiB3ZSBkZWNpZGVkIHRvIHN1cHBvcnQgWFNBVkVTIGFsc28gZm9yIFBWIGd1ZXN0cy4gV2l0aAp0
aGVtIGRyb3BwZWQKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
