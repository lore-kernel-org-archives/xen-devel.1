From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v6 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Wed, 30 Jan 2019 20:15:06 -0800
Message-ID: <CACMJ4Gbkiv-1pMmyJRHpP+-6mchMUwdpY=bm8MNT8AJjutf6Uw@mail.gmail.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
 <1548295503-15946-5-git-send-email-christopher.w.clark@gmail.com>
 <5C4EE49F0200007800211A95@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8IWo=QH=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gp3l2-00060G-7C
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 04:15:20 +0000
Received: by mail-lf1-x143.google.com with SMTP id v5so1258684lfe.7
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jan 2019 20:15:18 -0800 (PST)
In-Reply-To: <5C4EE49F0200007800211A95@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjgsIDIwMTkgYXQgMzoxNiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI0LjAxLjE5IGF0IDAzOjA0LCA8Y2hyaXN0b3BoZXIu
dy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGxhdC5sc3QK
PiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hsYXQubHN0Cj4gPiBAQCAtMTQ4LDMgKzE0OCw1IEBACj4g
PiAgPyAgICBmbGFza19zZXRlbmZvcmNlICAgICAgICAgICAgICAgIHhzbS9mbGFza19vcC5oCj4g
PiAgISAgICBmbGFza19zaWRfY29udGV4dCAgICAgICAgICAgICAgIHhzbS9mbGFza19vcC5oCj4g
PiAgPyAgICBmbGFza190cmFuc2l0aW9uICAgICAgICAgICAgICAgIHhzbS9mbGFza19vcC5oCj4g
PiArPyAgICBhcmdvX2FkZHIgICAgICAgICAgICAgICAgICAgICAgIGFyZ28uaAo+ID4gKz8gICAg
YXJnb19yaW5nICAgICAgICAgICAgICAgICAgICAgICBhcmdvLmgKPgo+IFRoZSBlbnRyaWVzIGlu
IHRoaXMgZmlsZSBhcmUgc29ydGVkIGFscGhhYmV0aWNhbGx5IGJ5IGhlYWRlciBuYW1lCj4gZmly
c3QsIHdpdGggdGhlIGV4Y2VwdGlvbiBvZiB0aGUgbWFpbiB4ZW4uaCB3aGljaCBpcyBhdCB0aGUg
dG9wIG9mCj4gdGhpcyBmaWxlLiBQbGVhc2UgbW92ZSB5b3VyIGFkZGl0aW9ucyB1cCBpbW1lZGlh
dGVseSBwYXN0IHRoZQo+IGFyY2gtc3BlY2lmaWMgb25lcy4KCmFjaywgZG9uZS4gdGhhbmtzCgpD
aHJpc3RvcGhlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
