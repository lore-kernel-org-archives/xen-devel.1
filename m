From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 0/8] x86: Meltdown band-aid overhead
 reduction
Date: Fri, 23 Mar 2018 11:50:32 +0100
Message-ID: <2af4c120-a9dd-d39f-699f-ba5ed95c198c@suse.com>
References: <5AAFC9E202000078001B36F7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9yei=gn=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ezKHN-0000mF-TN
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 10:50:37 +0000
In-Reply-To: <5AAFC9E202000078001B36F7@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDMvMTggMTQ6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IDE6IE5PUCBvdXQgbW9zdCBY
UFRJIGVudHJ5L2V4aXQgY29kZSB3aGVuIGl0J3Mgbm90IGluIHVzZQo+IDI6IGRpc2FibGUgWFBU
SSB3aGVuIFJEQ0xfTk8KPiAzOiB4ODY6IGxvZyBYUFRJIGVuYWJsZWQgc3RhdHVzCj4gNDogdXNl
ICVyMTIgdG8gd3JpdGUgemVybyBpbnRvIHhlbl9jcjMKPiA1OiByZWR1Y2UgLnRleHQuZW50cnkK
PiA2OiBlbmFibGUgaW50ZXJydXB0cyBlYXJsaWVyIHdpdGggWFBUSSBkaXNhYmxlZAo+IDc6IGFs
c28gTk9QIG91dCB4ZW5fY3IzIHJlc3RvcmVzIG9mIFhQVEkKPiA4OiBhdm9pZCBkb3VibGUgQ1Iz
IHJlbG9hZCB3aGVuIHN3aXRjaGluZyB0byBndWVzdCB1c2VyIG1vZGUKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4gdjQ6IE1haW4gY2hh
bmdlIGlzIHRoZSBzcGxpdCBvZiBwYXRjaCAxLgoKQW5kcmV3LCBhbnkgY2hhbmNlIHlvdSBjb3Vs
ZCByZXZpZXcgcGF0Y2hlcyAxIGFuZCA1LTggaW4gb3JkZXIgdG8KdW5ibG9jayB0aGlzIHNlcmll
cyBhbmQgbWluZT8KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
