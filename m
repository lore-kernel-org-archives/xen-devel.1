From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/mm: don't crash on unknown memory types
 in page_get_ram_type
Date: Fri, 21 Sep 2018 06:04:31 -0600
Message-ID: <5BA4DE4F02000078001EA958@prv1-mh.provo.novell.com>
References: <20180921105953.3066-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=q3to=md=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g3KAm-0004J5-1l
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 12:04:36 +0000
In-Reply-To: <20180921105953.3066-1-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA5LjE4IGF0IDEyOjU5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPiBAQCAt
NDY1LDcgKzQ2NSw3IEBAIHVuc2lnbmVkIGludCBwYWdlX2dldF9yYW1fdHlwZShtZm5fdCBtZm4p
Cj4gICAgICAgICAgICAgIGJyZWFrOwo+ICAKPiAgICAgICAgICBkZWZhdWx0Ogo+IC0gICAgICAg
ICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPiArICAgICAgICAgICAgdHlwZSB8PSBSQU1fVFlQ
RV9VTktOT1dOOwo+ICAgICAgICAgIH0KPiAgICAgIH0KClRoZSBsYXRlc3Qgbm93IHRoZXJlIHNo
b3VsZCBiZSBhICJicmVhayIuIEknbSBoYXBweSB0byBhZGQgdGhhdCB3aGlsZQpjb21taXR0aW5n
OyB3aXRoIGl0ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
