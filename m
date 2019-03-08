From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/6] x86: remove defunct
 init/load/save_msr() hvm_funcs
Date: Fri, 08 Mar 2019 09:50:24 -0700
Message-ID: <5C829D50020000780021CC67@prv1-mh.provo.novell.com>
References: <20190107120258.17897-1-paul.durrant@citrix.com>
 <20190107120258.17897-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ic8h=RL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h2Iha-00066J-CF
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 16:50:30 +0000
In-Reply-To: <20190107120258.17897-6-paul.durrant@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAxLjE5IGF0IDEzOjAyLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEBAIC0xNDcyLDEwICsxNDY4LDcgQEAgc3RhdGljIGludCBodm1fbG9hZF9jcHVfbXNycyhz
dHJ1Y3QgZG9tYWluICpkLCBodm1fZG9tYWluX2NvbnRleHRfdCAqaCkKPiAgICAgICAgICAgICAg
cmV0dXJuIC1FT1BOT1RTVVBQOwo+ICAgICAgLyogQ2hlY2tpbmcgZmluaXNoZWQgKi8KPiAgCj4g
LSAgICBpZiAoIGh2bV9mdW5jcy5sb2FkX21zciApCj4gLSAgICAgICAgZXJyID0gaHZtX2Z1bmNz
LmxvYWRfbXNyKHYsIGN0eHQpOwo+IC0KPiAtICAgIGZvciAoIGkgPSAwOyAhZXJyICYmIGkgPCBj
dHh0LT5jb3VudDsgKytpICkKPiArICAgIGZvciAoIGkgPSAwOyBpIDwgY3R4dC0+Y291bnQ7ICsr
aSApCj4gICAgICB7Cj4gICAgICAgICAgc3dpdGNoICggY3R4dC0+bXNyW2ldLmluZGV4ICkKPiAg
ICAgICAgICB7CgplcnIgY2FuIGJlY29tZSBzZXQgdG8gbm9uLXplcm8gaW4gdGhlIGxvb3AgYm9k
eSBmdXJ0aGVyIGRvd24gZnJvbSBoZXJlLApzbyBJIGRvbid0IHRoaW5rIHlvdSBzaG91bGQgYWx0
ZXIgdGhlIGxvb3AgaGVhZGVyLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
