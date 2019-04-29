From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Mon, 29 Apr 2019 09:01:48 -0600
Message-ID: <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL7n1-0004Oh-JJ
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:01:55 +0000
In-Reply-To: <20190426172138.14669-1-tamas@tklengyel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA0LjE5IGF0IDE5OjIxLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
QEAgLTk5OSw2ICs5OTYsMTAgQEAgc3RhdGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWlu
ICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRsZV90IHNoLAo+ICAgICAgbWVtX3NoYXJpbmdfcGFn
ZV91bmxvY2soc2Vjb25kcGcpOwo+ICAgICAgbWVtX3NoYXJpbmdfcGFnZV91bmxvY2soZmlyc3Rw
Zyk7Cj4gIAo+ICsgICAgQlVHX09OKCFwdXRfY291bnQpOwo+ICsgICAgd2hpbGUgKCBwdXRfY291
bnQtLSApCj4gKyAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUoY3BhZ2UpOwo+ICsKPiAgICAgIC8q
IEZyZWUgdGhlIGNsaWVudCBwYWdlICovCj4gICAgICBpZih0ZXN0X2FuZF9jbGVhcl9iaXQoX1BH
Q19hbGxvY2F0ZWQsICZjcGFnZS0+Y291bnRfaW5mbykpCj4gICAgICAgICAgcHV0X3BhZ2UoY3Bh
Z2UpOwoKSWYgdGhpcyB3YXMgdG8gaGFwcGVuIGJlZm9yZSBhbGwgdGhlIHB1dF9wYWdlX2FuZF90
eXBlKCkgY2FsbHMsCndvdWxkbid0IGl0IHJlbmRlciB1bm5lY2Vzc2FyeSB0aGUgZXh0cmEgZ2V0
X3BhZ2UoKS9wdXRfcGFnZSgpCmFyb3VuZCB0aGlzIGNvZGUgcmVnaW9uPwoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
