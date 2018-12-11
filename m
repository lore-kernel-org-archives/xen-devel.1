From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH] kprobes/x86/xen: blacklist non-attachable
 xen interrupt functions
Date: Tue, 11 Dec 2018 18:43:00 +0900
Message-ID: <20181211184300.810577f6087339bb0781068c__2894.8123370812$1544521326$gmane$org@kernel.org>
References: <20181210151256.GA1977@Dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ca7i=OU=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1gWeZG-0007f8-LL
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 09:43:06 +0000
In-Reply-To: <20181210151256.GA1977@Dell>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrea Righi <righi.andrea@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxMCBEZWMgMjAxOCAxNjoxMjo1NyArMDEwMApBbmRyZWEgUmlnaGkgPHJpZ2hpLmFu
ZHJlYUBnbWFpbC5jb20+IHdyb3RlOgoKPiBCbGFja2xpc3Qgc3ltYm9scyBpbiBYZW4gcHJvYmUt
cHJvaGliaXRlZCBhcmVhcywgc28gdGhhdCB1c2VyIGNhbiBzZWUKPiB0aGVzZSBwcm9oaWJpdGVk
IHN5bWJvbHMgaW4gZGVidWdmcy4KPiAKPiBTZWUgYWxzbzogYTUwNDgwY2I2ZDYxLgoKTG9va3Mg
Z29vZCB0byBtZSwgdGhhbmtzIQoKQWNrZWQtYnk6IE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0
QGtlcm5lbC5vcmc+Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYSBSaWdoaSA8cmlnaGkuYW5k
cmVhQGdtYWlsLmNvbT4KPiAtLS0KPiAgYXJjaC94ODYveGVuL3hlbi1hc21fNjQuUyB8IDIgKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNo
L3g4Ni94ZW4veGVuLWFzbV82NC5TIGIvYXJjaC94ODYveGVuL3hlbi1hc21fNjQuUwo+IGluZGV4
IGJiMWMyZGEwMzgxZC4uMWU5ZWYwYmEzMGE1IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L3hlbi94
ZW4tYXNtXzY0LlMKPiArKysgYi9hcmNoL3g4Ni94ZW4veGVuLWFzbV82NC5TCj4gQEAgLTEyLDYg
KzEyLDcgQEAKPiAgI2luY2x1ZGUgPGFzbS9zZWdtZW50Lmg+Cj4gICNpbmNsdWRlIDxhc20vYXNt
LW9mZnNldHMuaD4KPiAgI2luY2x1ZGUgPGFzbS90aHJlYWRfaW5mby5oPgo+ICsjaW5jbHVkZSA8
YXNtL2FzbS5oPgo+ICAKPiAgI2luY2x1ZGUgPHhlbi9pbnRlcmZhY2UveGVuLmg+Cj4gIAo+IEBA
IC0yNCw2ICsyNSw3IEBAIEVOVFJZKHhlbl9cbmFtZSkKPiAgCXBvcCAlcjExCj4gIAlqbXAgIFxu
YW1lCj4gIEVORCh4ZW5fXG5hbWUpCj4gK19BU01fTk9LUFJPQkUoeGVuX1xuYW1lKQo+ICAuZW5k
bQo+ICAKPiAgeGVuX3B2X3RyYXAgZGl2aWRlX2Vycm9yCj4gLS0gCj4gMi4xNy4xCj4gCgoKLS0g
Ck1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
