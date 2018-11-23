From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 1/1] tools/ocaml: cleanup to reduce compiler
 warnings [and 1 more messages]
Date: Fri, 23 Nov 2018 14:57:03 +0000
Message-ID: <23544.5439.358683.926752@mariner.uk.xensource.com>
References: <20181114110650.7179-1-christian.lindig@citrix.com>
 <82c8c19d-088c-65d7-ff76-a7017db204bd@citrix.com>
 <20181114113611.r7s7mofncp53mvfb@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=km0k=oc=citrix.com=prvs=858a2a34a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gQCtZ-00031I-LC
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 14:57:25 +0000
In-Reply-To: <20181114113611.r7s7mofncp53mvfb@zion.uk.xensource.com>,
 <82c8c19d-088c-65d7-ff76-a7017db204bd@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIDEvMV0gdG9vbHMvb2NhbWw6IGNsZWFudXAgdG8g
cmVkdWNlIGNvbXBpbGVyIHdhcm5pbmdzIik6Cj4gT24gV2VkLCBOb3YgMTQsIDIwMTggYXQgMTE6
MDY6NDlBTSArMDAwMCwgQ2hyaXN0aWFuIExpbmRpZyB3cm90ZToKPiA+IFRoaXMgY29tbWl0IGNs
ZWFucyB1cCBjb2RlIHRvIHJlZHVjZSBjb21waWxlciB3YXJuaW5nczoKLi4uCj4gQWNrZWQtYnk6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gVmVyeSBuaWNlIQoKQ2hyaXN0aWFu
IExpbmRpZyB3cml0ZXMgKCJSZTogW1BBVENIIDEvMV0gdG9vbHMvb2NhbWw6IGNsZWFudXAgdG8g
cmVkdWNlIGNvbXBpbGVyIHdhcm5pbmdzIik6Cj4gUGluZy4gQW55IGNoYW5jZSBnZXR0aW5nIHRo
aXMgaW4sIElhbj8KClRoYW5rcyBmb3IgdGhlIHBpbmcuCgpJIHRyaWVkIHRvIGNvbW1pdCB0aGlz
IHBhdGNoIGJ1dAoKbWFyaW5lcjp4ZW4uZ2l0PiBnaXQtYW0gfi9OZXdzL3QKQXBwbHlpbmc6IHRv
b2xzL29jYW1sOiBjbGVhbnVwIHRvIHJlZHVjZSBjb21waWxlciB3YXJuaW5ncwplcnJvcjogcGF0
Y2ggZmFpbGVkOiB0b29scy9vY2FtbC9saWJzL3hiL3hiLm1sOjY5CmVycm9yOiB0b29scy9vY2Ft
bC9saWJzL3hiL3hiLm1sOiBwYXRjaCBkb2VzIG5vdCBhcHBseQplcnJvcjogcGF0Y2ggZmFpbGVk
OiB0b29scy9vY2FtbC90ZXN0L2RtZXNnLm1sOjEKZXJyb3I6IHRvb2xzL29jYW1sL3Rlc3QvZG1l
c2cubWw6IHBhdGNoIGRvZXMgbm90IGFwcGx5Ci4uLgoKVGhhdCdzIHdpdGggYSBjb3B5IG9mIHRo
ZSBwYXRjaCBmaXNoZWQgZnJvbSBteSBwZXJzb25hbCBjb2xvIHNlcnZlcidzCnZpZXcgb2YgeGVu
LWRldmVsLgoKSSB0aGluayBlaXRoZXIgdGhlIG1lc3NhZ2UgbXVzdCBoYXZlIGJlZW4gbWFuZ2xl
ZCBieSBDaXRyaXgncyBtYWlsCnN5c3RlbSBvbiB0aGUgd2F5IG91dCBvZiBDaXRyaXgsIG9yIHRo
ZSBwYXRjaCBubyBsb25nZXIgYXBwbGllcy4KCkNhbiB5b3UgZG91YmxlIGNoZWNrIGFuZCBtYXli
ZSBwcm92aWRlIHRoZSBwYXRjaCBhcyBhbiBhdHRhY2htZW50IG9yIGEKZ2l0IGJyYW5jaCBvciBz
b21ldGhpbmcgPwoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
