From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 3/9] xen/x86: support per-domain flag for
 xpti
Date: Wed, 18 Apr 2018 09:29:57 -0600
Message-ID: <5AD7647502000078001BC6C8@prv1-mh.provo.novell.com>
References: <20180418083051.8334-1-jgross@suse.com>
 <20180418083051.8334-4-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=iali=hh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f8p1x-00039X-OG
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 15:29:57 +0000
In-Reply-To: <20180418083051.8334-4-jgross@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA0LjE4IGF0IDEwOjMwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRpLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0v
c2hhZG93L211bHRpLmMKPiBAQCAtOTY3LDcgKzk2Nyw3IEBAIHN0YXRpYyBpbnQgc2hhZG93X3Nl
dF9sNGUoc3RydWN0IGRvbWFpbiAqZCwKPiAgICAgICAgICBzaF9wdXRfcmVmKGQsIG9zbDNtZm4s
IHBhZGRyKTsKPiAgICAgIH0KPiAgCj4gLSAgICBpZiAoICFjcHVfaGFzX25vX3hwdGkgKQo+ICsg
ICAgaWYgKCBpc19wdl9kb21haW4oZCkgJiYgZC0+YXJjaC5wdl9kb21haW4ueHB0aSApCj4gICAg
ICAgICAgLyoKPiAgICAgICAgICAgKiBMYXp5IGZsdXNoaW5nIGlzIGVub3VnaDogZWl0aGVyIHdl
IGRvIGEgVExCIGZsdXNoIHJpZ2h0IGFmdGVyd2FyZHMKPiAgICAgICAgICAgKiB3aGljaCB3aWxs
IHBpY2sgdXAgdGhlIG5ldyByb290IHBhZ2UgdGFibGUgb24gYWxsIGFmZmVjdGVkIGNwdXMKCkhv
dyBjb21lIHRoZSBpc19wdl9kb21haW4oKSBpcyBhcHBlYXJpbmcgb25seSBoZXJlPwoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
