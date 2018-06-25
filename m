From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/6] tools: load IPXE from standalone file
Date: Mon, 25 Jun 2018 07:39:58 -0600
Message-ID: <5B30F0AE02000078001CD8CE@prv1-mh.provo.novell.com>
References: <20180625113533.12746-1-wei.liu2@citrix.com>
 <20180625113533.12746-5-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrz=jl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXRit-00017i-HG
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 13:40:03 +0000
In-Reply-To: <20180625113533.12746-5-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: anthony.perard@citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA2LjE4IGF0IDEzOjM1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL2NvbmZpZy5oCj4gKysrIGIvdG9vbHMvZmly
bXdhcmUvaHZtbG9hZGVyL2NvbmZpZy5oCj4gQEAgLTIyLDcgKzIyLDggQEAgc3RydWN0IGJpb3Nf
Y29uZmlnIHsKPiAgICAgIC8qIFJPTVMgKi8KPiAgICAgIHZvaWQgKCpsb2FkX3JvbXMpKHZvaWQp
Owo+ICAKPiAtICAgIHZvaWQgKCpiaW9zX2xvYWQpKGNvbnN0IHN0cnVjdCBiaW9zX2NvbmZpZyAq
Y29uZmlnLCB2b2lkICphZGRyLCB1aW50MzJfdCBzaXplKTsKPiArICAgIHZvaWQgKCpiaW9zX2xv
YWQpKGNvbnN0IHN0cnVjdCBiaW9zX2NvbmZpZyAqY29uZmlnLCB2b2lkICphZGRyLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgdWludDMyX3Qgc2l6ZSwgdm9pZCAqZXh0cmFfYWRkcik7CgpPa2F5
LCB0aGUgbmV3IHBhcmFtZXRlciBpcyBvZiBwb2ludGVyIHR5cGUuCgo+IC0tLSBhL3Rvb2xzL2Zp
cm13YXJlL2h2bWxvYWRlci9odm1sb2FkZXIuYwo+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxv
YWRlci9odm1sb2FkZXIuYwo+IEBAIC0zNjMsMTIgKzM2MywxOCBAQCBpbnQgbWFpbih2b2lkKQo+
ICAgICAgewo+ICAgICAgICAgIHVpbnQzMl90IHBhZGRyID0gYmlvc19tb2R1bGUtPnBhZGRyOwo+
ICAKPiAtICAgICAgICBiaW9zLT5iaW9zX2xvYWQoYmlvcywgKHZvaWQqKXBhZGRyLCBiaW9zX21v
ZHVsZS0+c2l6ZSk7Cj4gKyAgICAgICAgYmlvcy0+Ymlvc19sb2FkKGJpb3MsICh2b2lkKilwYWRk
ciwgYmlvc19tb2R1bGUtPnNpemUsIDApOwoKV2l0aCB0aGF0LCBwbGVhc2UgcGFzcyBOVUxMIGhl
cmUsIGFuZCBwbGVhc2UgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8KYWRkIHRoZSBtaXNzaW5nIGJs
YW5rIGluIHRoZSBjYXN0LgoKPiAgICAgIH0KPiAgI2lmZGVmIEVOQUJMRV9ST01CSU9TCj4gICAg
ICBlbHNlIGlmICggYmlvcyA9PSAmcm9tYmlvc19jb25maWcgKQo+ICAgICAgewo+IC0gICAgICAg
IGJpb3MtPmJpb3NfbG9hZChiaW9zLCBOVUxMLCAwKTsKPiArICAgICAgICBjb25zdCBzdHJ1Y3Qg
aHZtX21vZGxpc3RfZW50cnkgKmlweGU7Cj4gKyAgICAgICAgdWludDMyX3QgcGFkZHIgPSAwOwo+
ICsKPiArICAgICAgICBpcHhlID0gZ2V0X21vZHVsZV9lbnRyeShodm1fc3RhcnRfaW5mbywgImlw
eGUiKTsKPiArICAgICAgICBpZiAoIGlweGUgKQo+ICsgICAgICAgICAgICBwYWRkciA9IGlweGUt
PnBhZGRyOwo+ICsgICAgICAgIGJpb3MtPmJpb3NfbG9hZChiaW9zLCAwLCAwLCAodm9pZCopcGFk
ZHIpOwoKSGVyZSB5b3UgZXZlbiAod3JvbmdseSkgY29udmVydCBOVUxMIHRvIDAgLSBwbGVhc2Ug
ZG9uJ3QsIGFuZCBwbGVhc2UKY29ycmVjdCB0aGUgY2FzdCdzIHN0eWxlLgoKCldpdGggdGhhdCBo
dm1sb2FkZXIgcGFydHMKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
