From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 1/5] x86/p2m: pass the p2m to
 write_p2m_entry handlers
Date: Thu, 28 Feb 2019 17:49:15 +0000
Message-ID: <2a8c170b-a333-4db6-65d6-3ccca03e7bd0@citrix.com>
References: <20190227110905.53512-1-roger.pau@citrix.com>
 <20190227110905.53512-2-roger.pau@citrix.com>
 <CAFLBxZYD4qTyM2jTFq=Ppx0cDgwZLs34WxFrvdjYsdB8+Mc_mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CBPn=RD=citrix.com=prvs=95589b391=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gzPoW-0008Fg-7z
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 17:49:44 +0000
In-Reply-To: <CAFLBxZYD4qTyM2jTFq=Ppx0cDgwZLs34WxFrvdjYsdB8+Mc_mw@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMjAxOSAxNzo0MywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBHYWggLS0gc29ycnks
IEp1ZXJnZW4sIEkgcHVzaGVkIHRoaXMgc2VyaWVzIHRvIHN0YWdpbmcgZXJyb25lb3VzbHk7IGl0
Cj4gd2Fzbid0IHRhcmdldGVkIGZvciA0LjEyIGFuZCBkb2Vzbid0IGhhdmUgeW91ciByZWxlYXNl
IGFjay4KPgo+IFNob3VsZCBJIHJldmVydCBpdD8KCldpdGggYW4geDg2IGhhdCBvbiwgaWYgdGhp
cyBjb2RlIGlzIGluIGEgZ29vZCBzdGF0ZSwgSSdkIHZvdGUgZm9yIGl0IHRvCnN0YXkgaW4uwqAg
QWNjaWRlbnQgYXNpZGUsIGl0IHB1dHMgUFZIIGRvbTAgaW4gYSBmYXIgYmV0dGVyIHN0YXRlIHRo
YW4KYmVmb3JlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
