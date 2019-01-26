From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v6 13/15] xsm,
 argo: XSM control for any access to argo by a domain
Date: Fri, 25 Jan 2019 19:07:28 -0800
Message-ID: <CACMJ4GaOu7pwVh7Sehfv4kNqhRhx4OfqNWPZdnN+wSPUWnQAVQ@mail.gmail.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
 <1548295503-15946-14-git-send-email-christopher.w.clark@gmail.com>
 <CABZSBQdCqgTvJrXeXQ1XpyWa3knJ7xm9y3FH=bio-a=g46ZYHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l9mu=QC=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gnEJr-00014Y-Eo
 for xen-devel@lists.xenproject.org; Sat, 26 Jan 2019 03:07:43 +0000
Received: by mail-lf1-x142.google.com with SMTP id b20so8299777lfa.12
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jan 2019 19:07:42 -0800 (PST)
In-Reply-To: <CABZSBQdCqgTvJrXeXQ1XpyWa3knJ7xm9y3FH=bio-a=g46ZYHg@mail.gmail.com>
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

T24gRnJpLCBKYW4gMjUsIDIwMTkgYXQgNTozMiBQTSBDaHJpcyBQYXR0ZXJzb24gPGNqcDI1NkBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgOTowNyBQTSBDaHJp
c3RvcGhlciBDbGFyawo+IDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gV2lsbCBpbmhpYml0IGluaXRpYWxpemF0aW9uIG9mIHRoZSBkb21haW4ncyBhcmdvIGRh
dGEgc3RydWN0dXJlIHRvCj4gPiBwcmV2ZW50IHJlY2VpdmluZyBhbnkgbWVzc2FnZXMgb3Igbm90
aWZpY2F0aW9ucyBhbmQgYWNjZXNzIHRvIGFueSBvZgo+ID4gdGhlIGFyZ28gaHlwZXJjYWxsIG9w
ZXJhdGlvbnMuCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveHNtL3hzbS5oIGIveGVuL2lu
Y2x1ZGUveHNtL3hzbS5oCj4gPiBpbmRleCA3YzY5ZWZlLi44ZGFmZmFlIDEwMDY0NAo+ID4gLS0t
IGEveGVuL2luY2x1ZGUveHNtL3hzbS5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS94c20veHNtLmgK
PiA+IEBAIC0xODIsNiArMTgyLDcgQEAgc3RydWN0IHhzbV9vcGVyYXRpb25zIHsKPiA+ICAgICAg
aW50ICgqeGVuX3ZlcnNpb24pICh1aW50MzJfdCBjbWQpOwo+ID4gICAgICBpbnQgKCpkb21haW5f
cmVzb3VyY2VfbWFwKSAoc3RydWN0IGRvbWFpbiAqZCk7Cj4gPiAgI2lmZGVmIENPTkZJR19BUkdP
Cj4gPiArICAgIGludCAoKmFyZ29fZW5hYmxlKSAoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCk7Cj4g
PiAgICAgIGludCAoKmFyZ29fcmVnaXN0ZXJfc2luZ2xlX3NvdXJjZSkgKGNvbnN0IHN0cnVjdCBk
b21haW4gKmQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBkb21haW4gKnQpOwo+ID4gICAgICBpbnQgKCphcmdvX3JlZ2lzdGVyX2FueV9z
b3VyY2UpIChjb25zdCBzdHJ1Y3QgZG9tYWluICpkKTsKPiA+IEBAIC03MDUsNiArNzA2LDExIEBA
IHN0YXRpYyBpbmxpbmUgaW50IHhzbV9kb21haW5fcmVzb3VyY2VfbWFwKHhzbV9kZWZhdWx0X3Qg
ZGVmLCBzdHJ1Y3QgZG9tYWluICpkKQo+ID4gIH0KPiA+Cj4gPiAgI2lmZGVmIENPTkZJR19BUkdP
Cj4gPiArc3RhdGljIGlubGluZSB4c21fYXJnb19lbmFibGUoY29uc3Qgc3RydWN0IGRvbWFpbiAq
ZCkKPgo+IG1pc3NpbmcgcmV0dXJuIHR5cGUsIGZhaWxzIHRvIGNvbXBpbGUgd2l0aCBYU00gZW5h
YmxlZDoKPiB8IC9ob21lL2NocmlzL2dpdC94ZW4vaW5jbHVkZS94c20veHNtLmg6NzA5OjE1OiBl
cnJvcjogcmV0dXJuIHR5cGUKPiBkZWZhdWx0cyB0byAnaW50JyBbLVdlcnJvcj1pbXBsaWNpdC1p
bnRdCj4gfCAgc3RhdGljIGlubGluZSB4c21fYXJnb19lbmFibGUoY29uc3Qgc3RydWN0IGRvbWFp
biAqZCkKCmFjaywgcmVwcm8nZCBhbmQgZml4ZWQgLS0gdGhhbmtzLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
