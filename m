From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/4] x86/e820: do not fixup memmap in
 copy_e820_map
Date: Mon, 07 Jan 2019 09:58:56 -0700
Message-ID: <5C338550020000780020AFB2@prv1-mh.provo.novell.com>
References: <20181228120404.50346-1-roger.pau@citrix.com>
 <20181228120404.50346-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yoBP=PP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ggYEz-0006Fh-3C
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 16:59:05 +0000
In-Reply-To: <20181228120404.50346-3-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjEyLjE4IGF0IDEzOjA0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEBAIC01MTAsNiArNDk2LDEyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCByZXNlcnZlX2RtaV9yZWdp
b24odm9pZCkKPiAgICAgIH0KPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgX19pbml0IHJlc2VydmVf
dmdhX3JlZ2lvbih2b2lkKQo+ICt7Cj4gKyAgICAvKiBSZW1vdmUgYW55IFJBTSByZWdpb25zIGZy
b20gdGhlIFZHQSBob2xlLiAqLwo+ICsgICAgZTgyMF9yZW1vdmVfcmFuZ2UoJmU4MjAsIEtCKDY0
MCksIE1CKDEpIC0gMSwgRTgyMF9SQU0sIHRydWUpOwoKRnJvbSBsb29raW5nIGF0IHBhdGNoIDEg
SSBnb3QgdGhlIGltcHJlc3Npb24gdGhhdCB0aGUgImVuZCIgcGFyYW1ldGVyCmlzIGV4Y2x1c2l2
ZS4gSWYgdGhhdCdzIG5vdCBpbnRlbmRlZCB0byBiZSB0aGF0IHdheSwgdGhlbiB0aGVyZSBtYXkK
YmUgZnVydGhlciBpc3N1ZXMgd2l0aCB0aGUgdXNlIG9mIDwgLyA8PSAvID4gLyA+PSAuCgpJJ20g
YWxzbyB1bmNvbnZpbmNlZCBvZiB0aGlzIGdldHRpbmcgcHV0IGluIGEgc2VwYXJhdGUgZnVuY3Rp
b24uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
