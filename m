From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: assert MBI is large enough in
 pvh-boot.c
Date: Wed, 26 Sep 2018 12:05:05 +0100
Message-ID: <717a420a-718f-7167-2f2e-74327cfa731a@citrix.com>
References: <20180926110000.9764-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v21l=mi=citrix.com=prvs=800d3b934=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g57da-0002Ir-Ss
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 11:05:46 +0000
In-Reply-To: <20180926110000.9764-1-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDkvMTggMTI6MDAsIFdlaSBMaXUgd3JvdGU6Cj4gVGhlIHJlbG9jYXRpb24gY29kZSBp
biBfX3N0YXJ0X3hlbiByZXF1aXJlcyBvbmUgZXh0cmEgZWxlbWVudCBpbiB0aGUKPiBNQkkgc3Ry
dWN0dXJlLiBCeSB0aGUgbG9va3Mgb2YgaXQgdGhlIHRlbXBvcmFyeSBNQkkgYXJyYXkgaXMgYWxy
ZWFkeQo+IGxhcmdlIGVub3VnaC4gQWRkIGFuIGFzc2VydGlvbiB0byBjYXRjaCBhbnkgaXNzdWUg
aW4gdGhlIGZ1dHVyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+CgpXaGlsZSB0aGlzIGlzIGFsbCB3ZWxsIGFuZCBnb29kLCB0aGUgQVNTRVJUKCkgbmV2
ZXIgYWN0dWFsbHkgZ2V0cyBvdXQKb250byB0aGUgY29uc29sZS7CoCBUaGlzIGlzIGJlY2F1c2Us
IHdoZW4gYSBmYWlsdXJlIG9jY3VycywgdGhlIGNvbnNvbGUKaGFzbid0IGJlZW4gY29uZmlndXJl
ZCB5ZXQuCgpGb3IgZGV2ZWxvcG1lbnQgcHVycG9zZXMgSSB1c2U6CgpkaWZmIC0tZ2l0IGEveGVu
L2RyaXZlcnMvY2hhci9jb25zb2xlLmMgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwppbmRl
eCBlNDgwMzlkLi42NGZlYmZhIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUu
YworKysgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwpAQCAtOTEsNyArOTEsNyBAQCBzdGF0
aWMgdWludDMyX3QgY29ucmluZ2MsIGNvbnJpbmdwOwrCoHN0YXRpYyBpbnQgX19yZWFkX21vc3Rs
eSBzZXJjb25faGFuZGxlID0gLTE7CsKgCsKgI2lmZGVmIENPTkZJR19YODYKLXN0YXRpYyBib29s
IF9fcmVhZF9tb3N0bHkgb3B0X2NvbnNvbGVfeGVuOyAvKiBjb25zb2xlPXhlbiAqLworc3RhdGlj
IGJvb2wgX19yZWFkX21vc3RseSBvcHRfY29uc29sZV94ZW4gPSB0cnVlOyAvKiBjb25zb2xlPXhl
biAqLwrCoCNlbmRpZgrCoArCoHN0YXRpYyBERUZJTkVfU1BJTkxPQ0soY29uc29sZV9sb2NrKTsK
CndoaWNoIGdldHMgdGhlIGRldGFpbHMgb3V0IGludG8gdGhlIEwwIGxvZy4KCkFzIGFuIGFkZGVu
ZHVtLCBtaWdodCBpdCBiZSB3b3J0aCBoYXZpbmcgb3B0X2NvbnNvbGVfeGVuIGJlIHRyaXN0YXRl
LAphbmQgZW5hYmxlZCBieSB0aGUgc3RhcnQgb2YgdGhlIFBWSCBwYXRoLCBzbyBsb2cgbWVzc2Fn
ZXMgYmVmb3JlIHRoZQpjb21tYW5kIGxpbmUgaXMgcGFyc2VkIGVuZCB1cCBiZWluZyBlbWl0dGVk
PwoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
