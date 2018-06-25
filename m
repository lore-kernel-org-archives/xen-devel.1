From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-next 4/5] tools: load IPXE from
 standalone file
Date: Mon, 25 Jun 2018 09:16:45 +0100
Message-ID: <20180625081645.cyyeaplwitg4ggxx@citrix.com>
References: <20180515182243.3339-1-wei.liu2@citrix.com>
 <20180515182243.3339-5-wei.liu2@citrix.com>
 <20180604134757.GA9256@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w+qx=jl=citrix.com=prvs=7078eb122=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fXMg4-0007uf-Rv
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 08:16:48 +0000
Content-Disposition: inline
In-Reply-To: <20180604134757.GA9256@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdW4gMDQsIDIwMTggYXQgMDI6NDc6NTdQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVHVlLCBNYXkgMTUsIDIwMTggYXQgMDc6MjI6NDJQTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS90b29scy9maXJtd2FyZS9odm1sb2FkZXIvaHZtbG9h
ZGVyLmMgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIvaHZtbG9hZGVyLmMKPiA+IGluZGV4IGY2
MDNmNjhkZWQuLmY1NDZjZmIzYWIgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9maXJtd2FyZS9odm1s
b2FkZXIvaHZtbG9hZGVyLmMKPiA+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9odm1s
b2FkZXIuYwo+ID4gQEAgLTM2OCw3ICszNjgsMTMgQEAgaW50IG1haW4odm9pZCkKPiA+ICAjaWZk
ZWYgRU5BQkxFX1JPTUJJT1MKPiA+ICAgICAgZWxzZSBpZiAoIGJpb3MgPT0gJnJvbWJpb3NfY29u
ZmlnICkKPiA+ICAgICAgewo+ID4gLSAgICAgICAgYmlvcy0+Ymlvc19sb2FkKGJpb3MsIE5VTEws
IDApOwo+ID4gKyAgICAgICAgY29uc3Qgc3RydWN0IGh2bV9tb2RsaXN0X2VudHJ5ICppcHhlOwo+
ID4gKyAgICAgICAgdWludDMyX3QgcGFkZHIgPSAwOwo+ID4gKwo+ID4gKyAgICAgICAgaXB4ZSA9
IGdldF9tb2R1bGVfZW50cnkoaHZtX3N0YXJ0X2luZm8sICJpcHhlIik7Cj4gPiArICAgICAgICBp
ZiAoIGlweGUgKQo+ID4gKyAgICAgICAgICAgIHBhZGRyID0gaXB4ZS0+cGFkZHI7Cj4gPiArICAg
ICAgICBiaW9zLT5iaW9zX2xvYWQoYmlvcywgKHZvaWQqKXBhZGRyLCAwIC8qIHVudXNlZCAqLyk7
Cj4gCj4gSSBkb24ndCB0aGluayBpdCdzIGEgZ29vZCBpZGVhIHRvIGNoYW5nZSB0aGUgbWVhbmlu
ZyBvZiB0aGUgYXJndW1lbnRzIG9mCj4gYmlvc19sb2FkKCkuIEZvciBldmVyeSBvdGhlciB1c2Ug
b2YgYmlvc19sb2FkLCB0aGUgc2Vjb25kIGFyZ3VtZW50IGlzCj4gdXNlZCBhdCB0aGUgYWRkcmVz
cyBvZiB0aGUgZmlybXdhcmUgdG8gbG9hZC4gSGVyZSAiaXB4ZSIgaXMgYW4gZXh0cmEKPiBibG9i
IHRvIGxvYWQuCgpXZSBlaXRoZXIgYWRkIG1vcmUgYXJndW1lbnRzIHRvIGJpb3NfbG9hZCBvciBy
ZXB1cnBvc2UgdGhlIGV4aXN0aW5nCm9uZShzKS4gSSdtIG5vdCB0b28gZnVzc2VkIHdpdGggZWl0
aGVyIG9wdGlvbiByZWFsbHkuCgpKYW4gYW5kIEFuZHJldywgeW91ciBvcGluaW9uPwoKV2VpLgoK
PiAKPiAtLSAKPiBBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
