From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xentrace: handle sparse cpu ids correctly
 in xen trace buffer handling
Date: Thu, 30 Aug 2018 02:26:58 -0600
Message-ID: <5B87AA5202000078001E3677@prv1-mh.provo.novell.com>
References: <20180830075214.11807-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wyq4=ln=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fvIIA-00009n-Cf
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 08:27:02 +0000
In-Reply-To: <20180830075214.11807-1-jgross@suse.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA4LjE4IGF0IDA5OjUyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
MjAyLDcgKzIwMiw3IEBAIHN0YXRpYyBpbnQgYWxsb2NfdHJhY2VfYnVmcyh1bnNpZ25lZCBpbnQg
cGFnZXMpCj4gICAgICAgKiBBbGxvY2F0ZSBidWZmZXJzIGZvciBhbGwgb2YgdGhlIGNwdXMuCj4g
ICAgICAgKiBJZiBhbnkgZmFpbHMsIGRlYWxsb2NhdGUgd2hhdCB5b3UgaGF2ZSBzbyBmYXIgYW5k
IGV4aXQuCj4gICAgICAgKi8KPiAtICAgIGZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQo+ICsgICAg
Zm9yX2VhY2hfcHJlc2VudF9jcHUoY3B1KQo+ICAgICAgewo+ICAgICAgICAgIG9mZnNldCA9IHRf
aW5mb19maXJzdF9vZmZzZXQgKyAoY3B1ICogcGFnZXMpOwo+ICAgICAgICAgIHRfaW5mby0+bWZu
X29mZnNldFtjcHVdID0gb2Zmc2V0OwoKRG9lc24ndCB0aGlzIGdvIGEgbGl0dGxlIHRvbyBmYXI/
IFdoeSB3b3VsZCB5b3UgYWxsb2NhdGUgYnVmZmVycyBmb3IgQ1BVcwp3aGljaCBjYW4gbmV2ZXIg
YmUgYnJvdWdodCBvbmxpbmU/IFRoZXJlIG91Z2h0IHRvIGJlIGEgbWlkZGxlIGdyb3VuZCwKd2hl
cmUgb25saW5lLWFibGUgQ1BVcyBoYXZlIGJ1ZmZlcnMgYWxsb2NhdGVkLCBidXQgbm9uLW9ubGlu
ZS1hYmxlIG9uZXMKd29uJ3QuIE9uIGxhcmdlciBzeXN0ZW1zIEkgZ3Vlc3MgdGhlIGRpZmZlcmVu
Y2UgbWF5IGJlIHF1aXRlIG5vdGljYWJsZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
