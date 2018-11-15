From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 6/6] PM / Hibernate: exclude all
 PageOffline() pages
Date: Thu, 15 Nov 2018 13:29:44 +0100
Message-ID: <2e94148a-514f-0e18-5103-0e3ae342b3c9__14728.9341585294$1542284919$gmane$org@redhat.com>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-7-david@redhat.com>
 <20181115122302.GR23831@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kCC+=N2=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gNGmS-0006Nm-Cn
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 12:29:56 +0000
In-Reply-To: <20181115122302.GR23831@dhcp22.suse.cz>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Machek <pavel@ucw.cz>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTUuMTEuMTggMTM6MjMsIE1pY2hhbCBIb2NrbyB3cm90ZToKPiBPbiBXZWQgMTQtMTEtMTgg
MjI6MTc6MDQsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IFsuLi5dCj4+IGRpZmYgLS1naXQg
YS9rZXJuZWwvcG93ZXIvc25hcHNob3QuYyBiL2tlcm5lbC9wb3dlci9zbmFwc2hvdC5jCj4+IGlu
ZGV4IGIwMzA4YTJjNjAwMC4uMDFkYjFkMTM0ODFhIDEwMDY0NAo+PiAtLS0gYS9rZXJuZWwvcG93
ZXIvc25hcHNob3QuYwo+PiArKysgYi9rZXJuZWwvcG93ZXIvc25hcHNob3QuYwo+PiBAQCAtMTIy
Miw3ICsxMjIyLDcgQEAgc3RhdGljIHN0cnVjdCBwYWdlICpzYXZlYWJsZV9oaWdobWVtX3BhZ2Uo
c3RydWN0IHpvbmUgKnpvbmUsIHVuc2lnbmVkIGxvbmcgcGZuKQo+PiAgCUJVR19PTighUGFnZUhp
Z2hNZW0ocGFnZSkpOwo+PiAgCj4+ICAJaWYgKHN3c3VzcF9wYWdlX2lzX2ZvcmJpZGRlbihwYWdl
KSB8fCAgc3dzdXNwX3BhZ2VfaXNfZnJlZShwYWdlKSB8fAo+PiAtCSAgICBQYWdlUmVzZXJ2ZWQo
cGFnZSkpCj4+ICsJICAgIFBhZ2VSZXNlcnZlZChwYWdlKSB8fCBQYWdlT2ZmbGluZShwYWdlKSkK
Pj4gIAkJcmV0dXJuIE5VTEw7Cj4+ICAKPj4gIAlpZiAocGFnZV9pc19ndWFyZChwYWdlKSkKPj4g
QEAgLTEyODYsNiArMTI4Niw5IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqc2F2ZWFibGVfcGFnZShz
dHJ1Y3Qgem9uZSAqem9uZSwgdW5zaWduZWQgbG9uZyBwZm4pCj4+ICAJaWYgKHN3c3VzcF9wYWdl
X2lzX2ZvcmJpZGRlbihwYWdlKSB8fCBzd3N1c3BfcGFnZV9pc19mcmVlKHBhZ2UpKQo+PiAgCQly
ZXR1cm4gTlVMTDsKPj4gIAo+PiArCWlmIChQYWdlT2ZmbGluZShwYWdlKSkKPj4gKwkJcmV0dXJu
IE5VTEw7Cj4+ICsKPj4gIAlpZiAoUGFnZVJlc2VydmVkKHBhZ2UpCj4+ICAJICAgICYmICgha2Vy
bmVsX3BhZ2VfcHJlc2VudChwYWdlKSB8fCBwZm5faXNfbm9zYXZlKHBmbikpKQo+PiAgCQlyZXR1
cm4gTlVMTDsKPiAKPiBCdHcuIG5vdyB0aGF0IHlvdSBhcmUgdG91Y2hpbmcgdGhpcyBmaWxlIGNv
dWxkIHlvdSBhbHNvIG1ha2UKPiBzQHBmbl90b19wYWdlQHBmbl90b19vbmxpbmVfcGFnZUAgcGxl
YXNlPyBXZSByZWFsbHkgZG8gbm90IHdhbnQgdG8gdG91Y2gKPiBvZmZsaW5lIHBmbiByYW5nZXMg
aW4gZ2VuZXJhbC4gQSBzZXBhcmF0ZSBwYXRjaCBmb3IgdGhhdCBvZiBjb3Vyc2UuCj4gCj4gVGhh
bmtzIQo+IAoKU3VyZSB0aGluZywgd2lsbCBsb29rIGludG8gdGhhdCEKClRoYW5rcyEKCi0tIAoK
VGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
