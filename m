From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86: fix return value checks of
 set_guest_{machinecheck, nmi}_trapbounce
Date: Wed, 2 May 2018 12:25:28 +0200
Message-ID: <fc6446f8-7dcc-7b03-e0af-50b7029e796c@suse.com>
References: <5AE97E9C02000078001C00D5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jzy7=hv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fDox1-0003Fs-4Q
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 10:25:31 +0000
In-Reply-To: <5AE97E9C02000078001C00D5@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDUvMTggMTE6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbW1pdCAwMTQyMDY0NDIx
ICgieDg2L3RyYXBzOiBtb3ZlIHNldF9ndWVzdF97bWFjaGluZSxubWl9X3RyYXBib3VuY2UiKQo+
IGNvbnZlcnRlZCB0aGUgZnVuY3Rpb25zJyByZXR1cm4gdHlwZXMgZnJvbSBpbnQgdG8gYm9vbCB3
aXRob3V0IGFsc28KPiBjb3JyZWN0aW5nIHRoZSBjaGVja3MgaW4gYXNzZW1ibHkgY29kZTogVGhl
IEFCSSBkb2VzIG5vdCBndWFyYW50ZWUgc3ViLQo+IDMyLWJpdCByZXR1cm4gdmFsdWVzIHRvIGJl
IHByb21vdGVkIHRvIDMyIGJpdHMuCj4gCj4gVGFrZSB0aGUgbGliZXJ0eSBhbmQgYWxzbyBhZGp1
c3QgdGhlIG51bWJlciBvZiBzcGFjZXMgdXNlZCBpbiB0aGUgY29tcGF0Cj4gY29kZSwgc3VjaCB0
aGF0IGJvdGggY29kZSBzZXF1ZW5jZXMgZW5kIHVwIHNpbWlsYXIgKHRoZXkgYWxyZWFkeSBhcmUg
aW4KPiB0aGUgbm9uLWNvbXBhdCBjYXNlKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
