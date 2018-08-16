From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm/viridian: set shutdown_code in
 response to CrashNotify
Date: Thu, 16 Aug 2018 10:39:37 +0100
Message-ID: <9560c716-dbfe-72b1-e922-68f99d2be9f8@citrix.com>
References: <20180810154342.3296-1-paul.durrant@citrix.com>
 <afa181cd-d5c7-97ec-b980-1d88ecb266ab@citrix.com>
 <1af7af3a96b94f5f893f7f1ca91e8972@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rytq=k7=citrix.com=prvs=759b2abc3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fqElD-0000SN-2I
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 09:40:07 +0000
In-Reply-To: <1af7af3a96b94f5f893f7f1ca91e8972@AMSPEX02CL03.citrite.net>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDgvMTggMTY6NTksIFBhdWwgRHVycmFudCB3cm90ZToKPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPj4gRnJvbTogQW5kcmV3IENvb3Blcgo+PiBTZW50OiAxMCBBdWd1c3QgMjAx
OCAxNjo1Nwo+PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+PiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ODYvaHZtL3ZpcmlkaWFuOiBzZXQg
c2h1dGRvd25fY29kZSBpbiByZXNwb25zZSB0bwo+PiBDcmFzaE5vdGlmeQo+Pgo+PiBPbiAxMC8w
OC8xOCAxNjo0MywgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gV2hlbiBXaW5kb3dzIHdyaXRlcyB0
aGUgQ3Jhc2hOb3RpZnkgYml0IGluIHRoZSBDUkFTSF9DVEwgTVNSIHRoZW4gd2UKPj4ga25vdwo+
Pj4gaXQgaXMgY3Jhc2hpbmcsIHNvIHNldCB0aGUgZG9tYWluIHNodXRkb3duIGNvZGUgYXBwcm9w
cmlhdGVseS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFu
dEBjaXRyaXguY29tPgo+Pj4gLS0tCj4+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+Pj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+
PiAtLS0KPj4+ICB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuLmMgfCA0ICsrKysKPj4+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9odm0vdmlyaWRpYW4uYyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4uYwo+Pj4gaW5k
ZXggNDg2MDY1MTgyYy4uMjk0Y2Y0ODZjYyAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9o
dm0vdmlyaWRpYW4uYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi5jCj4+PiBA
QCAtNjQ1LDYgKzY0NSwxMCBAQCBpbnQgd3Jtc3JfdmlyaWRpYW5fcmVncyh1aW50MzJfdCBpZHgs
IHVpbnQ2NF90IHZhbCkKPj4+ICAgICAgICAgIGlmICggIWN0bC51LkNyYXNoTm90aWZ5ICkKPj4+
ICAgICAgICAgICAgICBicmVhazsKPj4+Cj4+PiArICAgICAgICBzcGluX2xvY2soJmQtPnNodXRk
b3duX2xvY2spOwo+Pj4gKyAgICAgICAgZC0+c2h1dGRvd25fY29kZSA9IFNIVVRET1dOX2NyYXNo
Owo+Pj4gKyAgICAgICAgc3Bpbl91bmxvY2soJmQtPnNodXRkb3duX2xvY2spOwo+PiBIb3cgZG9l
cyB0aGUgZG9tYWluIGV2ZW50dWFsbHkgc2h1dCBkb3duPwo+IEkgYXNzdW1lIGl0IHNodXRzIGRv
d24gd2hlbiB0aGUgZ3Vlc3Qgd3JpdGVzIHRvIHRoZSBQSUlYLgo+Cj4+IMKgIEl0IGZlZWxzIHNs
aWdodGx5IG9kZCB0byBoYXZlCj4+IGEgc2h1dGRvd24gY29kZSBiZWZvcmUgdGhlIGRvbWFpbiBo
YXMgZmluaXNoZWQgZXhlY3V0aW5nIGNvZGUuCj4+Cj4gVGhhdCdzIHRoZSBub3JtLiBUaGUgUFYg
ZHJpdmVycyAoaWYgdGhleSBhcmUgaW5zdGFsbGVkKSBzZXQgaXQgdmlhIGEgc2NoZWRvcC4gVGhp
cyBqdXN0IG1ha2VzIHN1cmUgaXQgaXMgc2V0IGV2ZW4gaWYgdGhlIFBWIGRyaXZlcnMgYXJlbid0
IHRoZXJlLgoKV2hhdCBoYXBwZW5zIGlmIHRoZSB1c2VyIGhhcyBjb25maWd1cmVkIHdpbmRvd3Mg
dG8gcmVib290IGFmdGVyIGEgY3Jhc2g/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
