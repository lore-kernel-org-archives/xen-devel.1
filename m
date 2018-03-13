From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xl: remove apic option for PVH guests
Date: Tue, 13 Mar 2018 14:23:15 +0000
Message-ID: <20180313142315.tyone2zuhh4ww46f@MacBook-Pro-de-Roger.local>
References: <20180228102053.1838-1-roger.pau@citrix.com>
 <23197.11226.13702.113849@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yz32=gd=citrix.com=prvs=603653d7e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1evkwv-0007CO-1t
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 14:30:45 +0000
Content-Disposition: inline
In-Reply-To: <23197.11226.13702.113849@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMDUsIDIwMTggYXQgMTE6MzY6NThBTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSF0geGw6IHJlbW92ZSBhcGljIG9w
dGlvbiBmb3IgUFZIIGd1ZXN0cyIpOgo+ID4gWFNBLTI1NiBmb3JjZXMgdGhlIGxvY2FsIEFQSUMg
dG8gYWx3YXlzIGJlIGVuYWJsZWQgZm9yIFBWSCBndWVzdHMsIHNvCj4gPiBpZ25vcmUgYW55IGFw
aWMgb3B0aW9uIGZvciBQVkggZ3Vlc3RzLiBVcGRhdGUgdGhlIGRvY3VtZW50YXRpb24KPiA+IGFj
Y29yZGluZ2x5Lgo+IC4uLgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3BhcnNlLmMgYi90
b29scy94bC94bF9wYXJzZS5jCj4gPiBpbmRleCBmNjg0MjU0MGNhLi44Yjk5OTgyNWQyIDEwMDY0
NAo+ID4gLS0tIGEvdG9vbHMveGwveGxfcGFyc2UuYwo+ID4gKysrIGIvdG9vbHMveGwveGxfcGFy
c2UuYwo+ID4gQEAgLTEyMDgsNyArMTIwOCw2IEBAIHZvaWQgcGFyc2VfY29uZmlnX2RhdGEoY29u
c3QgY2hhciAqY29uZmlnX3NvdXJjZSwKPiA+ICAgICAgfQo+ID4gIAo+ID4gICAgICB4bHVfY2Zn
X2dldF9kZWZib29sKGNvbmZpZywgIm5lc3RlZGh2bSIsICZiX2luZm8tPm5lc3RlZF9odm0sIDAp
Owo+ID4gLSAgICB4bHVfY2ZnX2dldF9kZWZib29sKGNvbmZpZywgImFwaWMiLCAmYl9pbmZvLT5h
cGljLCAwKTsKPiAKPiBJcyB0aGlzIGh1bmsgbm90IGluIGEgcGF0aCBhbHNvIHVzZWQgYnkgSFZN
ID8KClllcywgdGhpcyBodW5rIGlzIG1vdmVkIHRvIGEgSFZNLXNwZWNpZmljIHNlY3Rpb24gYSBs
aXR0bGUgYml0IGJlbG93OgoKQEAgLTEyNDMsNiArMTI0Miw3IEBAIHZvaWQgcGFyc2VfY29uZmln
X2RhdGEoY29uc3QgY2hhciAqY29uZmlnX3NvdXJjZSwKICAgICAgICAgeGx1X2NmZ19nZXRfZGVm
Ym9vbChjb25maWcsICJueCIsICZiX2luZm8tPnUuaHZtLm54LCAwKTsKICAgICAgICAgeGx1X2Nm
Z19nZXRfZGVmYm9vbChjb25maWcsICJocGV0IiwgJmJfaW5mby0+dS5odm0uaHBldCwgMCk7CiAg
ICAgICAgIHhsdV9jZmdfZ2V0X2RlZmJvb2woY29uZmlnLCAidnB0X2FsaWduIiwgJmJfaW5mby0+
dS5odm0udnB0X2FsaWduLCAwKTsKKyAgICAgICAgeGx1X2NmZ19nZXRfZGVmYm9vbChjb25maWcs
ICJhcGljIiwgJmJfaW5mby0+YXBpYywgMCk7CgogICAgICAgICBzd2l0Y2ggKHhsdV9jZmdfZ2V0
X2xpc3QoY29uZmlnLCAidmlyaWRpYW4iLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJnZpcmlkaWFuLCAmbnVtX3ZpcmlkaWFuLCAxKSkKClNvIGl0J3Mgb25seSBzZXQgZm9yIEhW
TSwgd2hpY2ggQUZBSUNUIHNob3VsZCBiZSBmaW5lLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
