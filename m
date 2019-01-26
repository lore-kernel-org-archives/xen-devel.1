From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v6 11/15] xsm,
 argo: XSM control for argo register
Date: Fri, 25 Jan 2019 19:08:57 -0800
Message-ID: <CACMJ4GZVsgrnrN1c0qAxuK7ov0hcLt6Kq8EFb7hEXYP8Z0Tngg@mail.gmail.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
 <1548295503-15946-12-git-send-email-christopher.w.clark@gmail.com>
 <CABZSBQfPzwUy4JMTTNqjcHQc0BaF8-MtxB7n4cePM9UiMLhnvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l9mu=QC=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gnELI-0001KD-BL
 for xen-devel@lists.xenproject.org; Sat, 26 Jan 2019 03:09:12 +0000
Received: by mail-lj1-x22d.google.com with SMTP id k19-v6so9960091lji.11
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jan 2019 19:09:11 -0800 (PST)
In-Reply-To: <CABZSBQfPzwUy4JMTTNqjcHQc0BaF8-MtxB7n4cePM9UiMLhnvQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chris Patterson <cjp256@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjUsIDIwMTkgYXQgNTozNCBQTSBDaHJpcyBQYXR0ZXJzb24gPGNqcDI1NkBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgOTowNyBQTSBDaHJp
c3RvcGhlciBDbGFyawo+IDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gWFNNIGNvbnRyb2xzIGZvciBhcmdvIHJpbmcgcmVnaXN0cmF0aW9uIHdpdGggdHdvIGRp
c3RpbmN0IGNhc2VzCgo+ID4gLS0tCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveHNtL3hz
bS5oIGIveGVuL2luY2x1ZGUveHNtL3hzbS5oCj4gPiBpbmRleCAzYjE5MmI1Li5lMzJhNjQ1IDEw
MDY0NAo+ID4gLS0tIGEveGVuL2luY2x1ZGUveHNtL3hzbS5oCj4gPiArKysgYi94ZW4vaW5jbHVk
ZS94c20veHNtLmgKPiA+IEBAIC0xODEsNiArMTgxLDExIEBAIHN0cnVjdCB4c21fb3BlcmF0aW9u
cyB7Cj4gPiAgI2VuZGlmCj4gPiAgICAgIGludCAoKnhlbl92ZXJzaW9uKSAodWludDMyX3QgY21k
KTsKPiA+ICAgICAgaW50ICgqZG9tYWluX3Jlc291cmNlX21hcCkgKHN0cnVjdCBkb21haW4gKmQp
Owo+ID4gKyNpZmRlZiBDT05GSUdfQVJHTwo+ID4gKyAgICBpbnQgKCphcmdvX3JlZ2lzdGVyX3Np
bmdsZV9zb3VyY2UpIChjb25zdCBzdHJ1Y3QgZG9tYWluICpkLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICp0KTsKPiA+ICsg
ICAgaW50ICgqYXJnb19yZWdpc3Rlcl9hbnlfc291cmNlKSAoY29uc3Qgc3RydWN0IGRvbWFpbiAq
ZCk7Cj4gPiArI2VuZGlmCj4gPiAgfTsKPiA+Cj4gPiAgI2lmZGVmIENPTkZJR19YU00KPiA+IEBA
IC02OTgsNiArNzAzLDIwIEBAIHN0YXRpYyBpbmxpbmUgaW50IHhzbV9kb21haW5fcmVzb3VyY2Vf
bWFwKHhzbV9kZWZhdWx0X3QgZGVmLCBzdHJ1Y3QgZG9tYWluICpkKQo+ID4gICAgICByZXR1cm4g
eHNtX29wcy0+ZG9tYWluX3Jlc291cmNlX21hcChkKTsKPiA+ICB9Cj4gPgo+ID4gKyNpZmRlZiBD
T05GSUdfQVJHTwo+ID4gK3N0YXRpYyBpbmxpbmUgeHNtX2FyZ29fcmVnaXN0ZXJfc2luZ2xlX3Nv
dXJjZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICp0KQo+Cj4gbWlzc2lu
ZyByZXR1cm4gdHlwZQoKYWNrCgo+Cj4gPiArewo+ID4gKyAgICByZXR1cm4geHNtX29wcy0+YXJn
b19yZWdpc3Rlcl9zaW5nbGVfc291cmNlKGQsIHQpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMg
aW5saW5lIHhzbV9hcmdvX3JlZ2lzdGVyX2FueV9zb3VyY2UoY29uc3Qgc3RydWN0IGRvbWFpbiAq
ZCkKPgo+IG1pc3NpbmcgcmV0dXJuIHR5cGUKCmFjawoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
