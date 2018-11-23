From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/1] tools/ocaml: cleanup to reduce compiler
 warnings [and 1 more messages]
Date: Fri, 23 Nov 2018 15:00:08 +0000
Message-ID: <20181123150008.ep6xpx3rci66tk5e@zion.uk.xensource.com>
References: <20181114110650.7179-1-christian.lindig@citrix.com>
 <82c8c19d-088c-65d7-ff76-a7017db204bd@citrix.com>
 <20181114113611.r7s7mofncp53mvfb@zion.uk.xensource.com>
 <23544.5439.358683.926752@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k4Pk=OC=citrix.com=prvs=858f4146b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gQCwM-0003td-R5
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 15:00:18 +0000
Content-Disposition: inline
In-Reply-To: <23544.5439.358683.926752@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Christian Lindig <christian.lindig@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDI6NTc6MDNQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIDEvMV0gdG9vbHMvb2NhbWw6IGNsZWFu
dXAgdG8gcmVkdWNlIGNvbXBpbGVyIHdhcm5pbmdzIik6Cj4gPiBPbiBXZWQsIE5vdiAxNCwgMjAx
OCBhdCAxMTowNjo0OUFNICswMDAwLCBDaHJpc3RpYW4gTGluZGlnIHdyb3RlOgo+ID4gPiBUaGlz
IGNvbW1pdCBjbGVhbnMgdXAgY29kZSB0byByZWR1Y2UgY29tcGlsZXIgd2FybmluZ3M6Cj4gLi4u
Cj4gPiBBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IAo+ID4gVmVy
eSBuaWNlIQo+IAo+IENocmlzdGlhbiBMaW5kaWcgd3JpdGVzICgiUmU6IFtQQVRDSCAxLzFdIHRv
b2xzL29jYW1sOiBjbGVhbnVwIHRvIHJlZHVjZSBjb21waWxlciB3YXJuaW5ncyIpOgo+ID4gUGlu
Zy4gQW55IGNoYW5jZSBnZXR0aW5nIHRoaXMgaW4sIElhbj8KPiAKPiBUaGFua3MgZm9yIHRoZSBw
aW5nLgo+IAo+IEkgdHJpZWQgdG8gY29tbWl0IHRoaXMgcGF0Y2ggYnV0Cj4gCj4gbWFyaW5lcjp4
ZW4uZ2l0PiBnaXQtYW0gfi9OZXdzL3QKPiBBcHBseWluZzogdG9vbHMvb2NhbWw6IGNsZWFudXAg
dG8gcmVkdWNlIGNvbXBpbGVyIHdhcm5pbmdzCj4gZXJyb3I6IHBhdGNoIGZhaWxlZDogdG9vbHMv
b2NhbWwvbGlicy94Yi94Yi5tbDo2OQo+IGVycm9yOiB0b29scy9vY2FtbC9saWJzL3hiL3hiLm1s
OiBwYXRjaCBkb2VzIG5vdCBhcHBseQo+IGVycm9yOiBwYXRjaCBmYWlsZWQ6IHRvb2xzL29jYW1s
L3Rlc3QvZG1lc2cubWw6MQo+IGVycm9yOiB0b29scy9vY2FtbC90ZXN0L2RtZXNnLm1sOiBwYXRj
aCBkb2VzIG5vdCBhcHBseQo+IC4uLgo+IAo+IFRoYXQncyB3aXRoIGEgY29weSBvZiB0aGUgcGF0
Y2ggZmlzaGVkIGZyb20gbXkgcGVyc29uYWwgY29sbyBzZXJ2ZXIncwo+IHZpZXcgb2YgeGVuLWRl
dmVsLgo+IAo+IEkgdGhpbmsgZWl0aGVyIHRoZSBtZXNzYWdlIG11c3QgaGF2ZSBiZWVuIG1hbmds
ZWQgYnkgQ2l0cml4J3MgbWFpbAo+IHN5c3RlbSBvbiB0aGUgd2F5IG91dCBvZiBDaXRyaXgsIG9y
IHRoZSBwYXRjaCBubyBsb25nZXIgYXBwbGllcy4KPiAKPiBDYW4geW91IGRvdWJsZSBjaGVjayBh
bmQgbWF5YmUgcHJvdmlkZSB0aGUgcGF0Y2ggYXMgYW4gYXR0YWNobWVudCBvciBhCj4gZ2l0IGJy
YW5jaCBvciBzb21ldGhpbmcgPwo+IAoKVGhpcyBwYXRjaCBpcyBhbHJlYWR5IGFwcGxpZWQuCgpX
ZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
