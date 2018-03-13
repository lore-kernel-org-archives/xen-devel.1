From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xl: remove apic option for PVH guests
Date: Tue, 13 Mar 2018 16:13:40 +0000
Message-ID: <20180313161340.vxoh4w2mjvyo7bya@citrix.com>
References: <20180228102053.1838-1-roger.pau@citrix.com>
 <23197.11226.13702.113849@mariner.uk.xensource.com>
 <20180313142315.tyone2zuhh4ww46f@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tsbs=gd=citrix.com=prvs=6030d9854=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1evn1H-00011j-NL
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 16:43:23 +0000
Content-Disposition: inline
In-Reply-To: <20180313142315.tyone2zuhh4ww46f@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDI6MjM6MTVQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIE1hciAwNSwgMjAxOCBhdCAxMTozNjo1OEFNICswMDAwLCBJYW4g
SmFja3NvbiB3cm90ZToKPiA+IFJvZ2VyIFBhdSBNb25uZSB3cml0ZXMgKCJbUEFUQ0hdIHhsOiBy
ZW1vdmUgYXBpYyBvcHRpb24gZm9yIFBWSCBndWVzdHMiKToKPiA+ID4gWFNBLTI1NiBmb3JjZXMg
dGhlIGxvY2FsIEFQSUMgdG8gYWx3YXlzIGJlIGVuYWJsZWQgZm9yIFBWSCBndWVzdHMsIHNvCj4g
PiA+IGlnbm9yZSBhbnkgYXBpYyBvcHRpb24gZm9yIFBWSCBndWVzdHMuIFVwZGF0ZSB0aGUgZG9j
dW1lbnRhdGlvbgo+ID4gPiBhY2NvcmRpbmdseS4KPiA+IC4uLgo+ID4gPiBkaWZmIC0tZ2l0IGEv
dG9vbHMveGwveGxfcGFyc2UuYyBiL3Rvb2xzL3hsL3hsX3BhcnNlLmMKPiA+ID4gaW5kZXggZjY4
NDI1NDBjYS4uOGI5OTk4MjVkMiAxMDA2NDQKPiA+ID4gLS0tIGEvdG9vbHMveGwveGxfcGFyc2Uu
Ywo+ID4gPiArKysgYi90b29scy94bC94bF9wYXJzZS5jCj4gPiA+IEBAIC0xMjA4LDcgKzEyMDgs
NiBAQCB2b2lkIHBhcnNlX2NvbmZpZ19kYXRhKGNvbnN0IGNoYXIgKmNvbmZpZ19zb3VyY2UsCj4g
PiA+ICAgICAgfQo+ID4gPiAgCj4gPiA+ICAgICAgeGx1X2NmZ19nZXRfZGVmYm9vbChjb25maWcs
ICJuZXN0ZWRodm0iLCAmYl9pbmZvLT5uZXN0ZWRfaHZtLCAwKTsKPiA+ID4gLSAgICB4bHVfY2Zn
X2dldF9kZWZib29sKGNvbmZpZywgImFwaWMiLCAmYl9pbmZvLT5hcGljLCAwKTsKPiA+IAo+ID4g
SXMgdGhpcyBodW5rIG5vdCBpbiBhIHBhdGggYWxzbyB1c2VkIGJ5IEhWTSA/Cj4gCj4gWWVzLCB0
aGlzIGh1bmsgaXMgbW92ZWQgdG8gYSBIVk0tc3BlY2lmaWMgc2VjdGlvbiBhIGxpdHRsZSBiaXQg
YmVsb3c6Cj4gCj4gQEAgLTEyNDMsNiArMTI0Miw3IEBAIHZvaWQgcGFyc2VfY29uZmlnX2RhdGEo
Y29uc3QgY2hhciAqY29uZmlnX3NvdXJjZSwKPiAgICAgICAgICB4bHVfY2ZnX2dldF9kZWZib29s
KGNvbmZpZywgIm54IiwgJmJfaW5mby0+dS5odm0ubngsIDApOwo+ICAgICAgICAgIHhsdV9jZmdf
Z2V0X2RlZmJvb2woY29uZmlnLCAiaHBldCIsICZiX2luZm8tPnUuaHZtLmhwZXQsIDApOwo+ICAg
ICAgICAgIHhsdV9jZmdfZ2V0X2RlZmJvb2woY29uZmlnLCAidnB0X2FsaWduIiwgJmJfaW5mby0+
dS5odm0udnB0X2FsaWduLCAwKTsKPiArICAgICAgICB4bHVfY2ZnX2dldF9kZWZib29sKGNvbmZp
ZywgImFwaWMiLCAmYl9pbmZvLT5hcGljLCAwKTsKPiAKPiAgICAgICAgICBzd2l0Y2ggKHhsdV9j
ZmdfZ2V0X2xpc3QoY29uZmlnLCAidmlyaWRpYW4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmdmlyaWRpYW4sICZudW1fdmlyaWRpYW4sIDEpKQo+IAo+IFNvIGl0J3Mgb25s
eSBzZXQgZm9yIEhWTSwgd2hpY2ggQUZBSUNUIHNob3VsZCBiZSBmaW5lLgo+IAoKSSB0cmllZCB0
byBhcHBseSB0aGlzIHBhdGNoIHRvIHN0YWdpbmcgYnV0IGl0IGZhaWxlZC4KCldlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
