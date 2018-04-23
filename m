From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 16/16] configure: do_compiler: Dump some
 extra info under bash
Date: Mon, 23 Apr 2018 17:21:42 +0100
Message-ID: <20180423162142.GG1980@perard>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-17-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l+ue=hm=citrix.com=prvs=644fc49e2=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fAeDr-0007sh-K6
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 16:21:47 +0000
Content-Disposition: inline
In-Reply-To: <1524156319-11465-17-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Janosch Frank <frankja@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, "Kent R. Spillner" <kspillner@acm.org>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTksIDIwMTggYXQgMDU6NDU6MTlQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhpcyBtYWtlcyBpdCBtdWNoIGVhc2llciB0byBmaW5kIGEgcGFydGljdWxhciB0aGlu
ZyBpbiBjb25maWcubG9nLgo+IAo+IFRoZSBpbmZvcm1hdGlvbiBtYXkgYmUgbGFja2luZyBpbiBv
dGhlciBzaGVsbHMsIHJlc3VsdGluZyBpbiBoYXJtbGVzcwo+IGVtcHR5IG91dHB1dC4gIChUaGlz
IGlzIHdoeSB3ZSBkb24ndCB1c2UgdGhlIHByb3BlciAke0ZVTkNOQU1FWypdfQo+IGFycmF5IHN5
bnRheCAtIG90aGVyIHNoZWxscyB3aWxsIGNob2tlIG9uIHRoYXQuKQo+IAo+IFRoZSBleHRyYSBv
dXRwdXQgaXMgb25seSBwcmludGVkIGlmIGNvbmZpZ3VyZSBpcyBydW4gd2l0aCBiYXNoLiAgT24K
PiBzeXN0ZW1zIHdoZXJlIC9iaW4vc2ggaXMgbm90IGJhc2gsIGl0IGlzIG5lY2Vzc2FyeSB0byBz
YXkgYmFzaAo+IC4vY29uZmlndXJlIHRvIGdldCB0aGUgZXh0cmEgZGVidWcgaW5mbyBpbiB0aGUg
bG9nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRy
aXguY29tPgo+IC0tLQo+ICBjb25maWd1cmUgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUKPiBp
bmRleCBkNTQzNWZmLi5hNGM1MjkyIDEwMDc1NQo+IC0tLSBhL2NvbmZpZ3VyZQo+ICsrKyBiL2Nv
bmZpZ3VyZQo+IEBAIC02MCw2ICs2MCwxMCBAQCBkb19jb21waWxlcigpIHsKPiAgICAgICMgaXMg
Y29tcGlsZXIgYmluYXJ5IHRvIGV4ZWN1dGUuCj4gICAgICBsb2NhbCBjb21waWxlcj0iJDEiCj4g
ICAgICBzaGlmdAo+ICsgICAgZWNobyA+PmNvbmZpZy5sb2cgIgo+ICtmdW5jczogJHtGVU5DTkFN
RX0KPiArbGluZXM6ICR7QkFTSF9MSU5FTk99Cj4gK2ZpbGVzOiAke0JBU0hfU09VUkNFfSIKPiAg
ICAgIGVjaG8gJGNvbXBpbGVyICIkQCIgPj4gY29uZmlnLmxvZwo+ICAgICAgJGNvbXBpbGVyICIk
QCIgPj4gY29uZmlnLmxvZyAyPiYxIHx8IHJldHVybiAkPwo+ICAgICAgIyBUZXN0IHBhc3NlZC4g
SWYgdGhpcyBpcyBhbiAtLWVuYWJsZS13ZXJyb3IgYnVpbGQsIHJlcnVuCgpIb3cgaXMgdGhpcyB1
c2VmdWxsPyBBbGwgSSBoYXZlIGluIG15IGNvbmZpZy5sb2cgaXMgYSBsb3Qgb2Y6CiAgZnVuY3M6
IGRvX2NvbXBpbGVyCiAgbGluZXM6IDkxCiAgZmlsZXM6IC4vY29uZmlndXJlCgpBbmQgb25lOgog
IGZ1bmNzOiBkb19jb21waWxlcgogIGxpbmVzOiA5NQogIGZpbGVzOiAuL2NvbmZpZ3VyZQoKSXQg
c3RpbGwgZG9uJ3QgdGVsbCBtZSB3aGljaCB0ZXN0IGhhZCBydW5uZWQuCgpSZWdhcmRzLAoKLS0g
CkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
