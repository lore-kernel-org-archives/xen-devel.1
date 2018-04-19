From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: Re: [Qemu-devel] [PATCH 14/16] os-posix: cleanup:
 Replace fprintf with error_report in remaining call sites
Date: Thu, 19 Apr 2018 17:25:38 -0300
Message-ID: <f594f663-d53c-690e-8797-48cbbe43f8fa__20098.1953334578$1524169492$gmane$org@amsat.org>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-15-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=govf=hi=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1f9G7l-0004KF-MN
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 20:25:45 +0000
Received: by mail-qk0-x242.google.com with SMTP id v2so6696525qkh.10
 for <xen-devel@lists.xenproject.org>; Thu, 19 Apr 2018 13:25:43 -0700 (PDT)
In-Reply-To: <1524156319-11465-15-git-send-email-ian.jackson@eu.citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSWFuLAoKT24gMDQvMTkvMjAxOCAwMTo0NSBQTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ0M6
IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+Cj4gQ0M6IE1hcmt1cyBBcm1icnVz
dGVyIDxhcm1icnVAcmVkaGF0LmNvbT4KPiBDQzogRGFuaWVsIFAuIEJlcnJhbmdlIDxiZXJyYW5n
ZUByZWRoYXQuY29tPgo+IENDOiBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1Pgo+IC0t
LQo+IHY3OiBOZXcgcGF0Y2gKPiAtLS0KPiAgb3MtcG9zaXguYyB8IDQgKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9vcy1wb3NpeC5jIGIvb3MtcG9zaXguYwo+IGluZGV4IDBmNTk1NjYuLmQ0Y2Y0NjYgMTAwNjQ0
Cj4gLS0tIGEvb3MtcG9zaXguYwo+ICsrKyBiL29zLXBvc2l4LmMKPiBAQCAtMTI5LDcgKzEyOSw3
IEBAIHZvaWQgb3Nfc2V0X3Byb2NfbmFtZShjb25zdCBjaGFyICpzKQo+ICAgICAgICAgIGV4aXQo
MSk7Cj4gICAgICB9Cj4gICNlbHNlCj4gLSAgICBmcHJpbnRmKHN0ZGVyciwgIkNoYW5nZSBvZiBw
cm9jZXNzIG5hbWUgbm90IHN1cHBvcnRlZCBieSB5b3VyIE9TXG4iKTsKPiArICAgIGVycm9yX3Jl
cG9ydCgiQ2hhbmdlIG9mIHByb2Nlc3MgbmFtZSBub3Qgc3VwcG9ydGVkIGJ5IHlvdXIgT1NcbiIp
OwoKcmVtb3ZpbmcgdGhlIHRyYWlsaW5nICJcbiI6ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgoKPiAgICAgIGV4aXQoMSk7Cj4gICNlbmRpZgo+
ICB9Cj4gQEAgLTI0Myw3ICsyNDMsNyBAQCBzdGF0aWMgdm9pZCBjaGFuZ2Vfcm9vdCh2b2lkKQo+
ICB7Cj4gICAgICBpZiAoY2hyb290X2Rpcikgewo+ICAgICAgICAgIGlmIChjaHJvb3QoY2hyb290
X2RpcikgPCAwKSB7Cj4gLSAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiY2hyb290IGZhaWxl
ZFxuIik7Cj4gKyAgICAgICAgICAgIGVycm9yX3JlcG9ydCgiY2hyb290IGZhaWxlZCIpOwo+ICAg
ICAgICAgICAgICBleGl0KDEpOwo+ICAgICAgICAgIH0KPiAgICAgICAgICBpZiAoY2hkaXIoIi8i
KSkgewo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
