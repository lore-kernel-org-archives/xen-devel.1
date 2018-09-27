From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: assert MBI is large enough in
 pvh-boot.c
Date: Thu, 27 Sep 2018 17:06:33 +0100
Message-ID: <20180927160633.on662jxxkqhs6x65@zion.uk.xensource.com>
References: <20180926110000.9764-1-wei.liu2@citrix.com>
 <717a420a-718f-7167-2f2e-74327cfa731a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ygxm=mj=citrix.com=prvs=801769520=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5YoH-0004ET-CE
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 16:06:37 +0000
Content-Disposition: inline
In-Reply-To: <717a420a-718f-7167-2f2e-74327cfa731a@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMjYsIDIwMTggYXQgMTI6MDU6MDVQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNi8wOS8xOCAxMjowMCwgV2VpIExpdSB3cm90ZToKPiA+IFRoZSByZWxvY2F0
aW9uIGNvZGUgaW4gX19zdGFydF94ZW4gcmVxdWlyZXMgb25lIGV4dHJhIGVsZW1lbnQgaW4gdGhl
Cj4gPiBNQkkgc3RydWN0dXJlLiBCeSB0aGUgbG9va3Mgb2YgaXQgdGhlIHRlbXBvcmFyeSBNQkkg
YXJyYXkgaXMgYWxyZWFkeQo+ID4gbGFyZ2UgZW5vdWdoLiBBZGQgYW4gYXNzZXJ0aW9uIHRvIGNh
dGNoIGFueSBpc3N1ZSBpbiB0aGUgZnV0dXJlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gV2hpbGUgdGhpcyBpcyBhbGwgd2VsbCBhbmQg
Z29vZCwgdGhlIEFTU0VSVCgpIG5ldmVyIGFjdHVhbGx5IGdldHMgb3V0Cj4gb250byB0aGUgY29u
c29sZS7CoCBUaGlzIGlzIGJlY2F1c2UsIHdoZW4gYSBmYWlsdXJlIG9jY3VycywgdGhlIGNvbnNv
bGUKPiBoYXNuJ3QgYmVlbiBjb25maWd1cmVkIHlldC4KPiAKPiBGb3IgZGV2ZWxvcG1lbnQgcHVy
cG9zZXMgSSB1c2U6Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5j
IGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPiBpbmRleCBlNDgwMzlkLi42NGZlYmZhIDEw
MDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4gKysrIGIveGVuL2RyaXZl
cnMvY2hhci9jb25zb2xlLmMKPiBAQCAtOTEsNyArOTEsNyBAQCBzdGF0aWMgdWludDMyX3QgY29u
cmluZ2MsIGNvbnJpbmdwOwo+IMKgc3RhdGljIGludCBfX3JlYWRfbW9zdGx5IHNlcmNvbl9oYW5k
bGUgPSAtMTsKPiDCoAo+IMKgI2lmZGVmIENPTkZJR19YODYKPiAtc3RhdGljIGJvb2wgX19yZWFk
X21vc3RseSBvcHRfY29uc29sZV94ZW47IC8qIGNvbnNvbGU9eGVuICovCj4gK3N0YXRpYyBib29s
IF9fcmVhZF9tb3N0bHkgb3B0X2NvbnNvbGVfeGVuID0gdHJ1ZTsgLyogY29uc29sZT14ZW4gKi8K
PiDCoCNlbmRpZgo+IMKgCj4gwqBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGNvbnNvbGVfbG9jayk7
Cj4gCj4gd2hpY2ggZ2V0cyB0aGUgZGV0YWlscyBvdXQgaW50byB0aGUgTDAgbG9nLgo+IAo+IEFz
IGFuIGFkZGVuZHVtLCBtaWdodCBpdCBiZSB3b3J0aCBoYXZpbmcgb3B0X2NvbnNvbGVfeGVuIGJl
IHRyaXN0YXRlLAo+IGFuZCBlbmFibGVkIGJ5IHRoZSBzdGFydCBvZiB0aGUgUFZIIHBhdGgsIHNv
IGxvZyBtZXNzYWdlcyBiZWZvcmUgdGhlCj4gY29tbWFuZCBsaW5lIGlzIHBhcnNlZCBlbmQgdXAg
YmVpbmcgZW1pdHRlZD8KClRoaXMgaXMgZmluZSBieSBtZS4KCldlaS4KCj4gCj4gfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
