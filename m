From: Juergen Gross <jgross@suse.com>
Subject: Re: PLEASE REVERT URGENTLY: Re: [PATCH v5 2/3]
 x86/boot: add acpi rsdp address to setup_header
Date: Sat, 10 Nov 2018 08:02:45 +0100
Message-ID: <5a2f5cb8-7332-f490-eabf-cfcbdcd1abc4__1708.83518080718$1541833305$gmane$org@suse.com>
References: <20181010061456.22238-1-jgross@suse.com>
 <20181010061456.22238-3-jgross@suse.com>
 <f7c78ee7-b548-7f04-24da-7321b6c64c97@zytor.com>
 <bd2d17cd-072c-cad6-94ad-52373700a1c9@suse.com>
 <2934552c-d150-0afb-6fa9-9398cb94d86a@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ffp4=nv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gLNIB-0005qx-34
 for xen-devel@lists.xenproject.org; Sat, 10 Nov 2018 07:02:51 +0000
In-Reply-To: <2934552c-d150-0afb-6fa9-9398cb94d86a@zytor.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, linux-doc@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, boris.ostrovsky@oracle.com, corbet@lwn.net
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTEvMjAxOCAwNzozMiwgSC4gUGV0ZXIgQW52aW4gd3JvdGU6Cj4+Cj4+IFVuZm9ydHVu
YXRlbHkgdGhlcmUgYXJlIG1hbnkgbWFqb3IgZGlzdHJvcyBzaGlwcGluZyBib290IGxvYWRlcnMg
d2hpY2gKPj4gd3JpdGUgY3JhcCBkYXRhIHBhc3QgdGhlIGVuZCBvZiBzZXR1cF9oZWFkZXIuCj4+
Cj4gCj4gWWVzLiBXZSBrbm93IHRoYXQgYW5kIGl0IGlzIHJlc29sdmVkIGJ5Ogo+IAo+IGEpIHRo
ZSBsZW5ndGggZmllbGQgaW4gc2V0dXBfaGVhZGVyOwo+IGIpIHRoZSAic2VudGluZWwiIGZpZWxk
IHdoaWNoIGNhdGNoZXMgbGVnYWN5IG5vbi1jb21wbGlhbnQgYm9vdGxvYWRlcnMuCgpEb2Vzbid0
IGhlbHAgZm9yIGJvb3QgbG9hZGVycyByZWFkaW5nIHN0cnVjdCBzZXR1cF9oZWFkZXIgZnJvbSB0
aGUKa2VybmVsIGltYWdlIGFuZCB0aGVuIHdyaXRpbmcgZS5nLiA1MTIgYnl0ZXMgYmFjayB0byB0
aGUgc2V0dXBfaGVhZGVyCmxvY2F0aW9uLiBUaGUgc2VudGluZWwgaXMgY2xlYXJlZCBhbmQgdGhl
IGxlbmd0aCBmaWVsZCBqdXN0IGlzbid0CnRha2VuIGludG8gYWNjb3VudC4gQW5kIHRoaXMgaXMg
d2hhdCBoYXBwZW5lZC4KCj4gCj4+Pgo+Pj4gVGhpcyBmaWVsZCB0aHVzIGJlbG9uZ3MgaW4gc3Ry
dWN0IGJvb3RfcGFyYW1zLCBub3Qgc3RydWN0IHNldHVwX2hlYWRlci4KPj4KPj4gT2theSwgSSBj
YW4gY2hhbmdlIHRoYXQuIEhvcGluZyB0aGF0IGFsbCBib290IGxvYWRlcnMgcmVhbGx5IHdyaXRl
Cj4+IHplcm9lcyB0byB0aGF0IGZpZWxkIGluIGNhc2UgdGhleSBkb24ndCBrbm93IGl0Lgo+Pgo+
IAo+IFRoaXMgaXMgd2hhdCB3ZSBhZGRlZCB0aGUgc2VudGluZWwgZmllbGQgZm9yOiBib290bG9h
ZGVycyB3aGljaCBkb24ndCB6ZXJvCj4gdW5rbm93biBmaWVsZHMgKHJlYWQ6IEdydWIpIHdpbGwg
dHJpZ2dlciB0aGUgc2VudGluZWwsIGFuZCB3ZSB3aXBlIG1vc3Qgb2YKPiB0aGlzIHN0cnVjdHVy
ZS4KClVuZm9ydHVuYXRlbHkgdGhlIHNlbnRpbmVsIHNlZW1zIHRvIGJlIGNsZWFyZWQgYnkgc2Fp
ZCBicm9rZW4gZ3J1Yi4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
