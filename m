From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 02/11] x86/vmx: Don't clobber %dr6 while
 debugging state is lazy
Date: Tue, 17 Jul 2018 10:28:21 +0100
Message-ID: <7c115a9e-e4ca-a69e-df89-93fcc0c123ce@citrix.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <1528120755-17455-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528120755-17455-3-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDYvMTggMTQ6NTksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gYy9zIDRmMzY0NTJiNjMg
aW50cm9kdWNlZCBhIHdyaXRlIHRvICVkcjYgaW4gdGhlICNEQiBpbnRlcmNlcHQgY2FzZSwgYnV0
IHRoZQo+IGd1ZXN0cyBkZWJ1ZyByZWdpc3RlcnMgbWF5IGJlIGxhenkgYXQgdGhpcyBwb2ludCwg
YXQgd2hpY2ggcG9pbnQgdGhlIGd1ZXN0cwo+IGxhdGVyIGF0dGVtcHQgdG8gcmVhZCAlZHI2IHdp
bGwgZGlzY2FyZCB0aGlzIHZhbHVlIGFuZCB1c2UgdGhlIG9sZGVyIHN0YWxlCj4gdmFsdWUuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+IC0tLQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+IENDOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+
Cj4gQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKUGluZwoKPiAtLS0KPiAg
eGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94
ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+IGluZGV4IDMzZDM5ZjYuLjhkYmU4MzggMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiArKysgYi94ZW4vYXJjaC94ODYv
aHZtL3ZteC92bXguYwo+IEBAIC0zNjk2LDYgKzM2OTYsNyBAQCB2b2lkIHZteF92bWV4aXRfaGFu
ZGxlcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiAgICAgICAgICAgICAgICovCj4gICAg
ICAgICAgICAgIF9fdm1yZWFkKEVYSVRfUVVBTElGSUNBVElPTiwgJmV4aXRfcXVhbGlmaWNhdGlv
bik7Cj4gICAgICAgICAgICAgIEhWTVRSQUNFXzFEKFRSQVBfREVCVUcsIGV4aXRfcXVhbGlmaWNh
dGlvbik7Cj4gKyAgICAgICAgICAgIF9fcmVzdG9yZV9kZWJ1Z19yZWdpc3RlcnModik7Cj4gICAg
ICAgICAgICAgIHdyaXRlX2RlYnVncmVnKDYsIGV4aXRfcXVhbGlmaWNhdGlvbiB8IERSX1NUQVRV
U19SRVNFUlZFRF9PTkUpOwo+ICAgICAgICAgICAgICBpZiAoICF2LT5kb21haW4tPmRlYnVnZ2Vy
X2F0dGFjaGVkICkKPiAgICAgICAgICAgICAgewoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
