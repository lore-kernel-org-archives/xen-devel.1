From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm/viridian: set shutdown_code in
 response to CrashNotify
Date: Fri, 10 Aug 2018 16:56:46 +0100
Message-ID: <afa181cd-d5c7-97ec-b980-1d88ecb266ab@citrix.com>
References: <20180810154342.3296-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0occ=kz=citrix.com=prvs=753c25753=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fo9mU-00047J-MN
 for xen-devel@lists.xenproject.org; Fri, 10 Aug 2018 15:56:50 +0000
In-Reply-To: <20180810154342.3296-1-paul.durrant@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDgvMTggMTY6NDMsIFBhdWwgRHVycmFudCB3cm90ZToKPiBXaGVuIFdpbmRvd3Mgd3Jp
dGVzIHRoZSBDcmFzaE5vdGlmeSBiaXQgaW4gdGhlIENSQVNIX0NUTCBNU1IgdGhlbiB3ZSBrbm93
Cj4gaXQgaXMgY3Jhc2hpbmcsIHNvIHNldCB0aGUgZG9tYWluIHNodXRkb3duIGNvZGUgYXBwcm9w
cmlhdGVseS4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNp
dHJpeC5jb20+Cj4gLS0tCj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBD
YzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiAgeGVu
L2FyY2gveDg2L2h2bS92aXJpZGlhbi5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuLmMg
Yi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuLmMKPiBpbmRleCA0ODYwNjUxODJjLi4yOTRjZjQ4
NmNjIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4uYwo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4uYwo+IEBAIC02NDUsNiArNjQ1LDEwIEBAIGludCB3cm1z
cl92aXJpZGlhbl9yZWdzKHVpbnQzMl90IGlkeCwgdWludDY0X3QgdmFsKQo+ICAgICAgICAgIGlm
ICggIWN0bC51LkNyYXNoTm90aWZ5ICkKPiAgICAgICAgICAgICAgYnJlYWs7Cj4gIAo+ICsgICAg
ICAgIHNwaW5fbG9jaygmZC0+c2h1dGRvd25fbG9jayk7Cj4gKyAgICAgICAgZC0+c2h1dGRvd25f
Y29kZSA9IFNIVVRET1dOX2NyYXNoOwo+ICsgICAgICAgIHNwaW5fdW5sb2NrKCZkLT5zaHV0ZG93
bl9sb2NrKTsKCkhvdyBkb2VzIHRoZSBkb21haW4gZXZlbnR1YWxseSBzaHV0IGRvd24/wqAgSXQg
ZmVlbHMgc2xpZ2h0bHkgb2RkIHRvIGhhdmUKYSBzaHV0ZG93biBjb2RlIGJlZm9yZSB0aGUgZG9t
YWluIGhhcyBmaW5pc2hlZCBleGVjdXRpbmcgY29kZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
